Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R0szk-00009x-46 for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 12:35:08 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R0sut-0007AM-Am for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 12:30:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 12:30:07 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 12:30:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 06 Sep 2011 12:26:26 +0200
Message-ID: <j44sgi$8rn$2@dough.gmane.org>
References: <1315157824-29946-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1315157824-29946-1-git-send-email-dbaryshkov@gmail.com>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-oe 1/2] openssl: fully fix parallel builds
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
X-List-Received-Date: Tue, 06 Sep 2011 10:35:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks, both patches are in now

Op 04-09-11 19:37, Dmitry Eremin-Solenikov schreef:
> Add a patch from oe-core to fix parallel builds in openssl 0.9.8m. Then
> drop PARALLEL_MAKE settings in both of recipes.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> --- 
> .../openssl/openssl-0.9.8m/parallel-make-fix.patch |   20
> ++++++++++++++++++++ .../recipes-connectivity/openssl/openssl_0.9.8m.bb |
> 3 +-- .../recipes-connectivity/openssl/openssl_1.0.0d.bb |    1 - 3 files
> changed, 21 insertions(+), 3 deletions(-) create mode 100644
> meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/parallel-make-fix.patch
>
>  diff --git
> a/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/parallel-make-fix.patch
> b/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/parallel-make-fix.patch
>
> 
new file mode 100644
> index 0000000..82857f5 --- /dev/null +++
> b/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/parallel-make-fix.patch
>
> 
@@ -0,0 +1,20 @@
> +Upstream-Status: Submitted + +fix the parallel build regarding shared
> libraries. + +Signed-off-by: Qing He <qing.he@intel.com> + +diff --git
> a/Makefile.org b/Makefile.org +index 2fb0309..8bec3d0 100644 +---
> a/Makefile.org ++++ b/Makefile.org +@@ -352,6 +352,9 @@ all_testapps:
> build_libs build_testapps + build_testapps: + 	@dir=crypto;
> target=testapps; $(BUILD_ONE_CMD) + ++libcrypto.a: build_crypto 
> ++libssl.a: build_ssl ++ + build_shared:	$(SHARED_LIBS) +
> libcrypto$(SHLIB_EXT): libcrypto.a $(SHARED_FIPS) + 	@if [
> "$(SHLIB_TARGET)" != "" ]; then \ diff --git
> a/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb
> b/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb index
> a7eb332..1091bf2 100644 ---
> a/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb +++
> b/meta-oe/recipes-connectivity/openssl/openssl_0.9.8m.bb @@ -11,6 +11,5
> @@ export OE_LDFLAGS="${LDFLAGS}" SRC_URI +=
> "file://configure-targets.patch \ file://shared-libs.patch \ 
> file://debian.patch \ +            file://parallel-make-fix.patch \ 
> file://oe-ldflags.patch" - -PARALLEL_MAKE = "" diff --git
> a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
> b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb index
> 89b8615..63b5460 100644 ---
> a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb +++
> b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb @@ -41,6 +41,5
> @@ PACKAGES += " \ ${PN}-engines-dbg \ "
> 
> -PARALLEL_MAKE = "" FILES_${PN}-engines = "${libdir}/ssl/engines/*.so" 
> FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOZfVSMkyGM64RGpERAtSSAJ4nN/oPB3VVAXODFmpF4k71q+CodQCgh1wS
fqP96Q7HeUh4MeY8VeuaaP8=
=7dmp
-----END PGP SIGNATURE-----



