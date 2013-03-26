Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UKRvL-0003Ye-M3
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 12:20:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Mar 2013 04:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,911,1355126400"; d="scan'208";a="307532786"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2013 04:02:09 -0700
Message-ID: <51518030.9090201@intel.com>
Date: Tue, 26 Mar 2013 13:02:08 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1364293926-32661-1-git-send-email-laurentiu.palcu@intel.com>
	<kiru27$1u0$1@ger.gmane.org>
In-Reply-To: <kiru27$1u0$1@ger.gmane.org>
Subject: Re: [meta-browser][PATCH] nss: change shebang line for smime script
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
X-List-Received-Date: Tue, 26 Mar 2013 11:20:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/26/2013 12:42 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 26-03-13 11:32, Laurentiu Palcu schreef:
>> This patch fixes the shebang line of the smime script and also adds a 
>> 'perl' RDEPENDS for the main package since smime needs perl to run.
>>
>> Also, this patch fixes some do_rootfs failures when using RPM backend 
>> because RPM automatically scans the files and, if perl scripts are found,
>> adds dependency on the file found in the shebang line (i.e. 
>> /usr/local/bin/perl).
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com> --- 
>> recipes-support/nss/nss_3.13.3.bb |    3 +++ 1 file changed, 3
>> insertions(+)
>>
>> diff --git a/recipes-support/nss/nss_3.13.3.bb
>> b/recipes-support/nss/nss_3.13.3.bb index 59c16e8..c05179f 100644 ---
>> a/recipes-support/nss/nss_3.13.3.bb +++
>> b/recipes-support/nss/nss_3.13.3.bb @@ -7,6 +7,7 @@ LICENSE = "MPL1.1 GPL
>> LGPL" LIC_FILES_CHKSUM =
>> "file://security/nss/manifest.mn;md5=d71978748f23eae3156c38ac2a691924"
>>
>> DEPENDS = "sqlite3 nspr nspr-native" +RDEPENDS_${PN} += "perl"
> 
> R* variables are grouped with below do_install since the OE style guide
> tends to group variables into the order the tasks are executed. So RDEPENDS
> and friends go below do_install next to FILES_*
OK, I knew there was a rule about where these variables should go but I
didn't check it again... I will resend the patch. Thanks for brining it up.

However, I did google it just now out of curiosity (and to refresh my
memory) and found 2 different pages with different rules:
http://www.openembedded.org/wiki/Styleguide
https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide

I'll go with the yocto wiki since is newer than the openembedded one but
I believe these 2 should be in sync.

Thanks,
Laurentiu

> 
>>
>> SRC_URI = "\ 
>> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_13_3_RTM/src/${PN}-${PV}.tar.gz
>> \ @@ -105,6 +106,8 @@ do_install() { sed -i s:OELIBDIR:${libdir}:g
>> ${D}${libdir}/pkgconfig/nss.pc sed -i s:OEINCDIR:${includedir}:g
>> ${D}${libdir}/pkgconfig/nss.pc sed -i s:OEEXECPREFIX:${exec_prefix}:g
>> ${D}${libdir}/pkgconfig/nss.pc + +	sed -i
>> s:/usr/local/bin/perl:${bindir}/perl:g ${D}${bindir}/smime }
>>
>> FILES_SOLIBSDEV := ""
>>
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
> 
> iD8DBQFRUXuNMkyGM64RGpERAkwBAJoC3D1MJRVys1x7mMOJJYKRldACmgCfRz4J
> K/jWMy6Ni5/K8wXHpS9rbWU=
> =T5Sy
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


