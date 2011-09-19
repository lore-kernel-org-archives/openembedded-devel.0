Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5XMy-0005Ex-DZ for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 08:30:20 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5XHu-0004eP-M7 for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 08:25:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 08:25:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 08:25:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Sep 2011 08:23:57 +0200
Message-ID: <j56n5t$s0d$2@dough.gmane.org>
References: <1316384018-7651-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1316384018-7651-1-git-send-email-dbaryshkov@gmail.com>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-oe][V3] openssl: fixup the openssl-fix-link patch
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
X-List-Received-Date: Mon, 19 Sep 2011 06:30:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-09-11 00:13, Dmitry Eremin-Solenikov schreef:
> Include more dependencies into openssl-fix-link.patch patch.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> --- 
> .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   22
> +++++++++++-------- .../recipes-connectivity/openssl/openssl_1.0.0e.bb |
> 2 +- 2 files changed, 14 insertions(+), 10 deletions(-)


I still get: NOTE: package openssl-native-1.0.0e-r13.1: task do_patch: Failed


> 
> diff --git
> a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
> b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
>
> 
index b319c62..6522d83 100644
> ---
> a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
>
> 
+++ b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
> @@ -8,15 +8,19 @@ Index: openssl-1.0.0d/Makefile.org 
> =================================================================== ---
> openssl-1.0.0d.orig/Makefile.org	2011-09-01 17:03:59.000000000 +0400 +++
> openssl-1.0.0d/Makefile.org	2011-09-01 17:12:24.000000000 +0400 -@@
> -246,9 +246,9 @@ -	@dir=crypto; target=all; $(BUILD_ONE_CMD) -
> build_ssl: -	@dir=ssl; target=all; $(BUILD_ONE_CMD) +@@ -244,13 +244,13
> @@ + 	@dir=crypto; target=all; $(BUILD_ONE_CMD) +-build_ssl: ++build_ssl:
> build_crypto + 	@dir=ssl; target=all; $(BUILD_ONE_CMD) -build_engines: 
> +build_engines: build_crypto -	@dir=engines; target=all;
> $(BUILD_ONE_CMD) + 	@dir=engines; target=all; $(BUILD_ONE_CMD) 
> -build_apps: -+build_apps: build_crypto -	@dir=apps; target=all;
> $(BUILD_ONE_CMD) - build_tests: -	@dir=test; target=all;
> $(BUILD_ONE_CMD) ++build_apps: build_crypto build_ssl + 	@dir=apps;
> target=all; $(BUILD_ONE_CMD) +-build_tests: ++build_tests: build_crypto
> build_ssl + 	@dir=test; target=all; $(BUILD_ONE_CMD) + build_tools: +
> @dir=tools; target=all; $(BUILD_ONE_CMD) diff --git
> a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb
> b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb index
> 28039ca..9a22632 100644 ---
> a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb +++
> b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb @@ -6,7 +6,7 @@
> DEPENDS += "ocf-linux"
> 
> CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
> 
> -PR = "${INC_PR}.0" +PR = "${INC_PR}.1"
> 
> LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOdt/8MkyGM64RGpERAljDAJ0QCYyu2A2/7OdJpRlwcUFYJUidMgCgqP8s
z86IWlWOK1kpEvOUaYWEa5c=
=lht2
-----END PGP SIGNATURE-----



