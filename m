Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R4rPv-0003Tt-EK for openembedded-devel@lists.openembedded.org;
	Sat, 17 Sep 2011 11:42:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R4rKt-000599-DF for openembedded-devel@lists.openembedded.org;
	Sat, 17 Sep 2011 11:37:23 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2011 11:37:23 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2011 11:37:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 17 Sep 2011 11:37:08 +0200
Message-ID: <j51po4$gjh$1@dough.gmane.org>
References: <1316187584-1972-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1316187584-1972-1-git-send-email-dbaryshkov@gmail.com>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-oe] openssl: fixup the openssl-fix-link patch
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
X-List-Received-Date: Sat, 17 Sep 2011 09:42:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-09-11 17:39, Dmitry Eremin-Solenikov schreef:
> Include more dependencies into openssl-fix-link.patch patch.

After this patch:

 NOTE: Applying patch 'openssl-fix-link.patch'
(sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch)
| ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.
| xterm Xt error: Can't open display:
| xterm:  DISPLAY is not set
| ERROR: Error executing a python function in
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb:
| AttributeError: 'module' object has no attribute 'domain'
|
| ERROR: The stack trace of python calls that resulted in this
exception/failure was:
| ERROR:   File "patch_do_patch", line 136, in <module>
| ERROR:
| ERROR:   File "patch_do_patch", line 133, in patch_do_patch
| ERROR:
| ERROR:   File
"/OE/tentacle/sources/openembedded-core/meta/lib/oe/patch.py", line 379, in
Resolve
| ERROR:     bb.msg.fatal(bb.msg.domain.Build, ("Cannot proceed with manual
patch resolution - '%s' not found. " \
| ERROR:
| ERROR: The code that was being executed was:
| ERROR:      0132:			raise bb.build.FuncFailed(str(sys.exc_value))
| ERROR:      0133:		resolver.Resolve()
| ERROR:      0134:
| ERROR:      0135:
| ERROR:  *** 0136:patch_do_patch(d)
| ERROR:      0137:
| ERROR: (file: 'patch_do_patch', lineno: 136, function: <module>)
| ERROR:      0129:			patchset.Import({"file":local, "remote":url,
"strippath": striplevel}, True)
| ERROR:      0130:		except Exception:
| ERROR:      0131:			import sys
| ERROR:      0132:			raise bb.build.FuncFailed(str(sys.exc_value))
| ERROR:  *** 0133:		resolver.Resolve()
| ERROR:      0134:
| ERROR:      0135:
| ERROR:      0136:patch_do_patch(d)
| ERROR:      0137:
| ERROR: (file: 'patch_do_patch', lineno: 133, function: patch_do_patch)
| ERROR: Function 'patch_do_patch' failed
NOTE: package openssl-native-1.0.0e-r13.1: task do_patch: Failed
ERROR: Task 1
(virtual:native:/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb,
do_patch) failed with exit code '1'
ERROR:
'virtual:native:/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb'
failed
koen@dominion:/OE/tentacle/sources/meta-texasinstruments/recipes-graphics/xorg-xserver$





> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> --- 
> .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   14 +++++++++----- 
> 1 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git
> a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
> b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
>
> 
index b319c62..15762a7 100644
> ---
> a/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
>
> 
+++ b/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
> @@ -8,15 +8,19 @@ Index: openssl-1.0.0d/Makefile.org 
> =================================================================== ---
> openssl-1.0.0d.orig/Makefile.org	2011-09-01 17:03:59.000000000 +0400 +++
> openssl-1.0.0d/Makefile.org	2011-09-01 17:12:24.000000000 +0400 -@@
> -246,9 +246,9 @@ +@@ -244,13 +244,13 @@ @dir=crypto; target=all;
> $(BUILD_ONE_CMD) - build_ssl: +-build_ssl: ++build_ssl: build_crypto 
> @dir=ssl; target=all; $(BUILD_ONE_CMD) -build_engines: +build_engines:
> build_crypto @dir=engines; target=all; $(BUILD_ONE_CMD) -build_apps: 
> -+build_apps: build_crypto ++build_apps: build_crypto build_ssl 
> @dir=apps; target=all; $(BUILD_ONE_CMD) - build_tests: -	@dir=test;
> target=all; $(BUILD_ONE_CMD) +-build_tests: ++build_tests: build_crypto
> build_ssl + 	@dir=test; target=all; $(BUILD_ONE_CMD) + build_tools: +
> @dir=tools; target=all; $(BUILD_ONE_CMD)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOdGpEMkyGM64RGpERAuBYAKC41lWUivezMZ21gOZ6RdG+QYh4ggCfZTGR
pGvnn2Dj3rtuuKHNABsn0qY=
=Zrkx
-----END PGP SIGNATURE-----



