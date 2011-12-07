Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RYCU6-0002zr-GJ for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 09:04:10 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RYCNY-0003AH-3D for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 08:57:24 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 08:57:24 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 08:57:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 07 Dec 2011 08:57:17 +0100
Message-ID: <jbn68n$lav$1@dough.gmane.org>
References: <1323088316-20564-1-git-send-email-koen@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1323088316-20564-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.3.3
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
X-List-Received-Date: Wed, 07 Dec 2011 08:04:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

ping

Op 05-12-11 13:31, Koen Kooi schreef:
> Even though a vm is a hard dependency it is set as RRECOMMENDS so a
> single vm can get uninstalled:
> 
> root@beaglebone:~/java# opkg remove openjdk-6-vm-shark No packages
> removed. Collected errors: * print_dependents_warning: Package
> openjdk-6-vm-shark is depended upon by packages: *
> print_dependents_warning:         openjdk-6-java *
> print_dependents_warning: These might cease to work if package
> openjdk-6-vm-shark is removed.
> 
> In the above situation all vms (cacao, zero and shark) were installed,
> but due to llvm problems[1] shark is currently broken. To fix the java
> install shark needs to get uninstalled.
> 
> In theory this change allows people to break the java installation, but
> in practice it's already broken due to [1].
> 
> [1]
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-December/036595.html
>
>  Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
> recipes-core/openjdk/openjdk-6-common.inc |   11 +++++++++-- 1 files
> changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-6-common.inc
> b/recipes-core/openjdk/openjdk-6-common.inc index ef1c41d..257fe56
> 100644 --- a/recipes-core/openjdk/openjdk-6-common.inc +++
> b/recipes-core/openjdk/openjdk-6-common.inc @@ -10,7 +10,7 @@ ICEDTEA =
> "NEEDS TO BE SET" S = "${WORKDIR}/${ICEDTEA}" B = "${S}/build"
> 
> -INC_PR = "r11" +INC_PR = "r12"
> 
> SRC_URI = "\ ${ICEDTEA_URI} \ @@ -426,7 +426,14 @@
> RPROVIDES_${JDKPN}-vm-shark = "java2-vm" RPROVIDES_${JDKPN}-vm-zero =
> "java2-vm" RPROVIDES_${JDKPN}-vm-cacao = "java2-vm"
> 
> -RDEPENDS_${JDKPN}-java = "java2-vm" +# Even though a vm is a hard
> dependency it is set as RRECOMMENDS so a single vm can get uninstalled: 
> +# root@beaglebone:~/java# opkg remove openjdk-6-vm-shark +# No packages
> removed. +# Collected errors: +#  * print_dependents_warning: Package
> openjdk-6-vm-shark is depended upon by packages: +#  *
> print_dependents_warning: 	openjdk-6-java +#  * print_dependents_warning:
> These might cease to work if package openjdk-6-vm-shark is removed. 
> +RRECOMMENDS_${JDKPN}-java = "java2-vm"
> 
> # For some reason shark and cacao do not automatically depends on
> -common. # So we add that manually.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7fHF0ACgkQMkyGM64RGpF3FgCfRixFz4cNEI7OdLfkulNHjp/U
Zi4An0KRfx/jCebXGK67GpFziay5CMHp
=Xnc1
-----END PGP SIGNATURE-----



