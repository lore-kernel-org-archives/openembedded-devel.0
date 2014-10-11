Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-04.prod.phx3.secureserver.net
	(p3plsmtpa09-04.prod.phx3.secureserver.net [173.201.193.233])
	by mail.openembedded.org (Postfix) with ESMTP id C65DF65DA3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 13:53:32 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-04.prod.phx3.secureserver.net with 
	id 1ptY1p00C0BVjqb01ptY4U; Sat, 11 Oct 2014 06:53:33 -0700
Message-ID: <5439365C.2000303@pabigot.com>
Date: Sat, 11 Oct 2014 08:53:32 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1413021995.git.wenzong.fan@windriver.com>	<f6c31764bfe49e6d2791b731c14dc92b94da88c9.1413021995.git.wenzong.fan@windriver.com>
	<54391790.4090007@pabigot.com>
In-Reply-To: <54391790.4090007@pabigot.com>
Subject: Re: [PATCH 1/1 v2][meta-networking] ntp: fix path to drift file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Oct 2014 13:53:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2014 06:42 AM, Peter A. Bigot wrote:
> Thanks for the clarifications.  A couple more comments now that I 
> understand the goal:
>
> On 10/11/2014 05:12 AM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> * fix the path to drift file:
>>
>> The default path of ntp drift file is /etc/ntp.drift, ntp daemon
>> maybe fails to create this file since the user ntp is not always
>> permitted to write /etc.
>>
>> Refer to other distributions such as RedHat, Debian, just moving
>> the file to /var/lib/ntp which the home dir of user ntp.
>>
>> * add tmpfile support:
>>
>> Make sure the /var/lib/ntp is always created by sysvinit/systemd.
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   meta-networking/recipes-support/ntp/ntp.inc |   15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/ntp/ntp.inc 
>> b/meta-networking/recipes-support/ntp/ntp.inc
>> index f55a39a..f685274 100644
>> --- a/meta-networking/recipes-support/ntp/ntp.inc
>> +++ b/meta-networking/recipes-support/ntp/ntp.inc
>> @@ -53,6 +53,7 @@ PACKAGECONFIG[debug] = 
>> "--enable-debugging,--disable-debugging"
>>   do_install_append() {
>>       install -d ${D}${sysconfdir}/init.d
>>       install -m 644 ${WORKDIR}/ntp.conf ${D}${sysconfdir}
>> +    sed -i 's!/etc/ntp.drift!/var/lib/ntp/drift!g' 
>> ${D}${sysconfdir}/ntp.conf
>
> Since ntp.conf is provided by OE in files/ntp.conf, this change should 
> be made there.  Other users may provide their own ntp.conf through a 
> bbappend and will not want it modified during installation.
>
>>       install -m 755 ${WORKDIR}/ntpd ${D}${sysconfdir}/init.d
>>       install -d ${D}${bindir}
>>       install -m 755 ${WORKDIR}/ntpdate ${D}${bindir}/ntpdate-sync
>> @@ -72,6 +73,18 @@ do_install_append() {
>>       install -m 644 ${WORKDIR}/ntpdate.default 
>> ${D}${sysconfdir}/default/ntpdate
>>       install -m 0644 ${WORKDIR}/sntp ${D}${sysconfdir}/default/
>>   +    # Create tmpfiles
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 
>> 'false', d)}; then
>> +        install -d ${D}/${sysconfdir}/default/volatiles
>> +        echo "d ntp ntp 0755 /var/lib/ntp none" \
>> +            > ${D}/${sysconfdir}/default/volatiles/99_ntpd
>> +    fi
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 
>> 'false', d)}; then
>> +        install -d ${D}${sysconfdir}/tmpfiles.d
>> +        echo "d /var/lib/ntp 0755 ntp ntp -" \
>> +            > ${D}${sysconfdir}/tmpfiles.d/99-ntpd.conf
>> +    fi
>> +
>
> ntp.drift is not a tmpfile and should not be considered volatile (its 
> absence will cause NTP to spend the first 15 minutes estimating local 
> oscillator characteristics, which is generally not desirable in a time 
> server).  /var/lib is intended for persistent state so putting the 
> drift file there is perfectly fine, but adding /var/lib/ntp in 
> tmpfiles/volatiles is incorrect.
>
> Since /var/lib/ntp is the ntp user's home directory, surely it's 
> created automatically anyway and nothing need be done.

I see that in fact it is not created automatically, even though the user 
is created.  Ignoring the more fundamental and non-ntp question "why 
not?", adding:

    install -d ${D}/var/lib/ntp

to do_install_append() should cover it.

Peter

>
> Peter
>
>>       install -d ${D}/${sysconfdir}/network/if-up.d
>>       ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
>>   @@ -112,6 +125,8 @@ RSUGGESTS_${PN} = "iana-etc"
>>     FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf 
>> ${sysconfdir}/init.d/ntpd ${libdir} \
>>       ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
>> +    ${sysconfdir}/default/volatiles \
>> +    ${sysconfdir}/tmpfiles.d \
>>   "
>>   FILES_${PN}-tickadj = "${sbindir}/tickadj"
>>   FILES_${PN}-utils = "${sbindir}"
>


