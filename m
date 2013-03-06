Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1UDFW0-0001QT-68
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Mar 2013 15:40:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r26ENnkn012098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Mar 2013 06:23:49 -0800 (PST)
Received: from [128.224.169.133] (128.224.169.133) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 6 Mar 2013 06:22:49 -0800
Message-ID: <5137513C.4020007@windriver.com>
Date: Wed, 6 Mar 2013 16:22:52 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1360834325-22890-1-git-send-email-florin.sarbu@windriver.com>
	<1360834325-22890-2-git-send-email-florin.sarbu@windriver.com>
	<20130214094445.GJ3300@jama> <5136F265.1080603@windriver.com>
	<20130306080035.GB32228@jama.dyndns-home.com>
	<5136F879.3050808@windriver.com>
In-Reply-To: <5136F879.3050808@windriver.com>
Subject: Re: [meta-oe][meta-systemd][] rpcbind: Add ${PN}-systemd to PACKAGES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2013 14:40:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

So no plans to remove the systemd support from meta-openembedded now 
that poky has a systemd.bbclass merged in? My feeling is that this adds 
unneeded overhead now.

On 03/06/2013 10:04 AM, Florin Sarbu wrote:
> Actually no, forgot to mention that. My bad. I am using the systemd 
> class from poky. Now that poky has systemd.bbclass, what is the point 
> of the meta-openembedded systemd class? I thought it would go away and 
> people would rely on the poky features for systemd enabling.
>
> On 03/06/2013 10:00 AM, Martin Jansa wrote:
>> On Wed, Mar 06, 2013 at 09:38:13AM +0200, Florin Sarbu wrote:
>>> Hi,
>>> this is still needed (for me at least but it looks like should be the
>>> case for everybody too). I have today's master on both poky and
>>> meta-openembedded and get:
>>>
>>> ERROR: rpcbind-systemd does not appear in package list, please add it
>>> ERROR: Function failed:
>>>
>>> SYSTEMD_SERVICE_rpcbind-systemd value rpcbind.service does not exist
>> Are you sure you're using systemd.bbclass from meta-systemd?
>>
>> $ bitbake -e rpcbind | grep ^PACKAGES
>> PACKAGESPLITFUNCS="populate_packages_updatercd 
>> package_do_split_locales                 populate_packages"
>> PACKAGES="rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev 
>> rpcbind-doc rpcbind-locale  rpcbind"
>> PACKAGES_DYNAMIC="^rpcbind-locale-.*"
>>
>> # $PACKAGES [3 operations]
>> #   set conf/bitbake.conf:270
>> #     "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale 
>> ${PACKAGE_BEFORE_PN} ${PN}"
>> #   set /OE/shr-core/openembedded-core/meta/conf/documentation.conf:91
>> #     [doc] "Names of packages to be generated. @group packaging"
>> #   set systemd.bbclass:33 [systemd_create_package]
>> #     "rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev 
>> rpcbind-doc rpcbind-locale  rpcbind"
>> # computed:
>> #   "rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev 
>> rpcbind-doc rpcbind-locale  rpcbind"
>> PACKAGES="rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev 
>> rpcbind-doc rpcbind-locale  rpcbind"
>>
>>>
>>> Have Khem's patches you were talking about been merged? Can't see them
>>> anywhere though.
>>>
>>> Thank you,
>>> Florin
>>>
>>> On 02/14/2013 11:44 AM, Martin Jansa wrote:
>>>> On Thu, Feb 14, 2013 at 11:32:05AM +0200, Florin Sarbu wrote:
>>>>> The ${PN}-systemd should be added to PACKAGES
>>>>> so that the package gets created.
>>>>>
>>>>> Added do_install_append to have the systemd.service
>>>>> installed in the proper location.
>>>> see khem's patch fixing this in many recipes including rpcbind.
>>>>
>>>>> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
>>>>> ---
>>>>> .../meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend |    8 
>>>>> +++++++-
>>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git 
>>>>> a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend 
>>>>> b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend 
>>>>>
>>>>> index 0fa7f97..8197550 100644
>>>>> --- 
>>>>> a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend 
>>>>>
>>>>> +++ 
>>>>> b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend 
>>>>>
>>>>> @@ -1,6 +1,8 @@
>>>>>    inherit systemd
>>>>>    -PRINC := "${@int(PRINC) + 1}"
>>>>> +PACKAGES =+ "${PN}-systemd"
>>>>> +
>>>>> +PRINC := "${@int(PRINC) + 2}"
>>>>>       # look for files in the layer first
>>>>>    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>>>> @@ -10,3 +12,7 @@ SRC_URI += "file://rpcbind.service"
>>>>>    SYSTEMD_PACKAGES = "${PN}-systemd"
>>>>>    SYSTEMD_SERVICE = "rpcbind.service"
>>>>>    +do_install_append() {
>>>>> +        install -d ${D}${systemd_unitdir}/system/
>>>>> +        install -m 0644 ${WORKDIR}/rpcbind.service 
>>>>> ${D}${systemd_unitdir}/system
>>>>> +}
>>>>> -- 
>>>>> 1.7.10.4
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel 
>>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



