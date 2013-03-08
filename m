Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1UDntP-0007qI-0R
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 04:23:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2836CpI025409
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Mar 2013 19:06:12 -0800 (PST)
Received: from [128.224.22.4] (128.224.22.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 7 Mar 2013 19:06:12 -0800
Message-ID: <513955A0.9010506@windriver.com>
Date: Thu, 7 Mar 2013 22:06:08 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: "Tumati, Pradeep" <Pradeep.Tumati@windriver.com>
References: <1361329774-27984-1-git-send-email-mark.hatle@windriver.com>
	<2953155.d53ADznyZ4@helios>
	<2B1E7B07AA49B047AD9561EB6E00F61436C8659F@ALA-MBB.corp.ad.wrs.com>
In-Reply-To: <2B1E7B07AA49B047AD9561EB6E00F61436C8659F@ALA-MBB.corp.ad.wrs.com>
X-Originating-IP: [128.224.22.4]
Cc: "Honig, Jeffrey" <jeffrey.honig@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Song Li <song.li@windriver.com>
Subject: Re: [PATCH meta-webserver] apache2: correct header file location
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
X-List-Received-Date: Fri, 08 Mar 2013 03:23:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-03-07 03:05 PM, Tumati, Pradeep wrote:
> Randy,
>
> Just wanted to forward you this email since Mark Hatle is on vacation...

Thanks.

>
> See my comments below
>
>> -----Original Message-----
>> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
>> Sent: Thursday, March 07, 2013 7:51 AM
>> To: Hatle, Mark
>> Cc: Tumati, Pradeep; openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [PATCH meta-webserver] apache2: correct header file
>> location
>>
>> On Tuesday 19 February 2013 21:09:34 Mark Hatle wrote:
>>> From: Pradeep Tumati <pradeep.tumati@windriver.com>
>>>
>>> Apache header files are being placed in ../usr/include/lib32-apache2
>>> under the sysroot where as lib32-modphp looks for
>>> ../usr/include/apache2 directory. This fix ensures that apache2 header
>>> files are placed in the ../usr/include/apache2/ directory.
>>>
>>> Signed-off-by: Pradeep Tumati <pradeep.tumati@windriver.com>
>>> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
>>> ---
>>>   recipes-httpd/apache2/apache2_2.4.2.bb | 32
>>> ++++++++++++++++---------------- 1 file changed, 16 insertions(+), 16
>>> deletions(-)
>>>
>>> diff --git a/recipes-httpd/apache2/apache2_2.4.2.bb
>>> b/recipes-httpd/apache2/apache2_2.4.2.bb index af7840d..af8c4ca 100644
>>> --- a/recipes-httpd/apache2/apache2_2.4.2.bb
>>> +++ b/recipes-httpd/apache2/apache2_2.4.2.bb
>>> @@ -41,13 +41,13 @@ EXTRA_OECONF = "--enable-ssl \
>>>   		--enable-rewrite \
>>>   		--with-dbm=sdbm \
>>>   		--with-berkeley-db=no \
>>> -		--localstatedir=/var/${PN} \
>>> +		--localstatedir=/var/${BPN} \
>>>   		--with-gdbm=no \
>>>   		--with-ndbm=no \
>>> -		--includedir=${includedir}/${PN} \
>>> -		--datadir=${datadir}/${PN} \
>>> -		--sysconfdir=${sysconfdir}/${PN} \
>>> -                --libexecdir=${libdir}/${PN}/modules \
>>> +		--includedir=${includedir}/${BPN} \
>>> +		--datadir=${datadir}/${BPN} \
>>> +		--sysconfdir=${sysconfdir}/${BPN} \
>>> +                --libexecdir=${libdir}/${BPN}/modules \
>>>   		ap_cv_void_ptr_lt_long=no \
>>>   		--enable-mpms-shared \
>>>   		ac_cv_have_threadsafe_pollset=no"
>>> @@ -68,19 +68,19 @@ do_install_append() {
>>>   		    -e 's,/usr/bin/,${bindir}/,g' \
>>>   		    -e 's,/usr/lib,${libdir}/,g' \
>>>   		    -e 's,/etc/,${sysconfdir}/,g' \
>>> -		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${PN}
>>> -	chmod 755 ${D}/${sysconfdir}/init.d/${PN}
>>> +		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${BPN}
>>> +	chmod 755 ${D}/${sysconfdir}/init.d/${BPN}
>>>   	# remove the goofy original files...
>>> -	rm -rf ${D}/${sysconfdir}/${PN}/original
>>> +	rm -rf ${D}/${sysconfdir}/${BPN}/original
>>>   	# Expat should be found in the staging area via DEPENDS...
>>>   	rm -f ${D}/${libdir}/libexpat.*
>>>
>>> -	install -d ${D}${sysconfdir}/${PN}/conf.d
>>> -	install -d ${D}${sysconfdir}/${PN}/modules.d
>>> +	install -d ${D}${sysconfdir}/${BPN}/conf.d
>>> +	install -d ${D}${sysconfdir}/${BPN}/modules.d
>>>
>>>   	# Ensure configuration file pulls in conf.d and modules.d
>>> -	printf "\nIncludeOptional ${sysconfdir}/${PN}/conf.d/*.conf" >>
>>> ${D}/${sysconfdir}/${PN}/httpd.conf -	printf "\nIncludeOptional
>>> ${sysconfdir}/${PN}/modules.d/*.conf\n\n" >>
>>> ${D}/${sysconfdir}/${PN}/httpd.conf +	printf "\nIncludeOptional
>>> ${sysconfdir}/${BPN}/conf.d/*.conf" >>
>>> ${D}/${sysconfdir}/${BPN}/httpd.conf
>>> +	printf "\nIncludeOptional
>> ${sysconfdir}/${BPN}/modules.d/*.conf\n\n"
>>> +>>
>>> ${D}/${sysconfdir}/${BPN}/httpd.conf }
>>>
>>>   SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
>>> @@ -88,12 +88,12 @@ SYSROOT_PREPROCESS_FUNCS +=
>> "apache_sysroot_preprocess"
>>>   apache_sysroot_preprocess () {
>>>   	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>>>   	install -m 755 ${D}${bindir}/apxs
>>> ${SYSROOT_DESTDIR}${bindir_crossscripts}/ -	sed -i 's!my
>> $installbuilddir
>> =
>>> .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${PN}/build";!'
>>> ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs +	sed -i 's!my
>>> $installbuilddir = .*!my $installbuilddir =
>>> "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!'
>>> ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs sed -i 's!my $libtool =
>>> .*!my $libtool = "${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool";!'
>>> ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
>>>
>>> -	sed -i 's!^APR_CONFIG = .*!APR_CONFIG =
>>> ${STAGING_BINDIR_CROSS}/apr-1-config!'
>>> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk -	sed -i
>>> 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-
>> config!'
>>> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk -	sed -i
>>> 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!'
>>> ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk +	sed -i
>>> 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-
>> config!'
>>> ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk +	sed -i
>>> 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-
>> config!'
>>> ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk +	sed -i
>>> 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!'
>>> ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk }
>>>
>>>   #
>>
>> Like the last patch this is not actually against meta-webserver master, and
>> like the last patch I was about to rebase and apply it on top, and again I notice
>> that there are ${PN} references that haven't been changed but appear to
>> need to be - the ones I can see are in the FILES_ values e.g.
>>
>> FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
>>
>> To match up with the paths we're specifying in EXTRA_OECONF this would
>> need to be changed to:
>>
>> FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
>>
>> Surely this sort of thing should be showing up in testing?
>
>
> This is Paul's response to the apache2 multilib defect that I have
> worked on earlier. Paul points out that a few more ${PN}s have to
> be changed to ${BPN}s and so I was wondering if you can guide us
> how to proceed from here.

We're a bit behind the upstream meta-openembedded/meta-webserver repo:

we have      : apache2_2.4.2.bb
upstream has : apache2_2.4.3.bb

Not a big deal and we'll get caught up soon, I expect.

Anyway, we do in fact have this error in the meta-webserver layer's
apache2_2.4.2 recipe but there isn't a warning generated when
the multilib dbg rpm is packaged...Ah, that's because we have a
local bbappend that needs to be sent upstream. Song can you do that
that in the next day or so.

Pradeep, because we're a version behind upstream, it's best if
we adjust our patches before sending upstream.

Hope that helps,

// Randy


>
> Thanks,
> Pradeep
>
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350


