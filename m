Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RdQYj-00012O-45
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 19:06:33 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 98DEB110018A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 18:59:17 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 5D7281100182
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 18:59:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225004171.adsl.alicedsl.de
	[92.225.4.171]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 18:59:15 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 156763C4A3; Wed, 21 Dec 2011 18:59:14 +0100 (CET)
Date: Wed, 21 Dec 2011 18:59:14 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111221175913.GA26064@rhein.zuhause.netz>
References: <1323088316-20564-1-git-send-email-koen@dominion.thruhere.net>
	<jbn68n$lav$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jbn68n$lav$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java] openjdk-6-common: move java2-vm to RRECOMMENDS
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
X-List-Received-Date: Wed, 21 Dec 2011 18:06:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 07, 2011 at 08:57:17AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> ping

Thanks for the patch, its pushed.
> 
> Op 05-12-11 13:31, Koen Kooi schreef:
> > Even though a vm is a hard dependency it is set as RRECOMMENDS so a
> > single vm can get uninstalled:
> > 
> > root@beaglebone:~/java# opkg remove openjdk-6-vm-shark No packages
> > removed. Collected errors: * print_dependents_warning: Package
> > openjdk-6-vm-shark is depended upon by packages: *
> > print_dependents_warning:         openjdk-6-java *
> > print_dependents_warning: These might cease to work if package
> > openjdk-6-vm-shark is removed.
> > 
> > In the above situation all vms (cacao, zero and shark) were installed,
> > but due to llvm problems[1] shark is currently broken. To fix the java
> > install shark needs to get uninstalled.
> > 
> > In theory this change allows people to break the java installation, but
> > in practice it's already broken due to [1].
> > 
> > [1]
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-December/036595.html
> >
> >  Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
> > recipes-core/openjdk/openjdk-6-common.inc |   11 +++++++++-- 1 files
> > changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes-core/openjdk/openjdk-6-common.inc
> > b/recipes-core/openjdk/openjdk-6-common.inc index ef1c41d..257fe56
> > 100644 --- a/recipes-core/openjdk/openjdk-6-common.inc +++
> > b/recipes-core/openjdk/openjdk-6-common.inc @@ -10,7 +10,7 @@ ICEDTEA =
> > "NEEDS TO BE SET" S = "${WORKDIR}/${ICEDTEA}" B = "${S}/build"
> > 
> > -INC_PR = "r11" +INC_PR = "r12"
> > 
> > SRC_URI = "\ ${ICEDTEA_URI} \ @@ -426,7 +426,14 @@
> > RPROVIDES_${JDKPN}-vm-shark = "java2-vm" RPROVIDES_${JDKPN}-vm-zero =
> > "java2-vm" RPROVIDES_${JDKPN}-vm-cacao = "java2-vm"
> > 
> > -RDEPENDS_${JDKPN}-java = "java2-vm" +# Even though a vm is a hard
> > dependency it is set as RRECOMMENDS so a single vm can get uninstalled: 
> > +# root@beaglebone:~/java# opkg remove openjdk-6-vm-shark +# No packages
> > removed. +# Collected errors: +#  * print_dependents_warning: Package
> > openjdk-6-vm-shark is depended upon by packages: +#  *
> > print_dependents_warning: 	openjdk-6-java +#  * print_dependents_warning:
> > These might cease to work if package openjdk-6-vm-shark is removed. 
> > +RRECOMMENDS_${JDKPN}-java = "java2-vm"
> > 
> > # For some reason shark and cacao do not automatically depends on
> > -common. # So we add that manually.
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
> 
> iEYEARECAAYFAk7fHF0ACgkQMkyGM64RGpF3FgCfRixFz4cNEI7OdLfkulNHjp/U
> Zi4An0KRfx/jCebXGK67GpFziay5CMHp
> =Xnc1
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


