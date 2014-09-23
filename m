Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id B128160167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 11:23:27 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XWOBp-0000wm-Bp for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2014 13:23:25 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 13:23:25 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 13:23:25 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 23 Sep 2014 13:23:11 +0200
Message-ID: <lvrl6v$psb$1@ger.gmane.org>
References: <20140920003044.GA30844@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <20140920003044.GA30844@linux.intel.com>
Subject: Re: [PATCH v2] Phoronix Test Suite package
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
X-List-Received-Date: Tue, 23 Sep 2014 11:23:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Todd E Brandt schreef op 20-09-14 02:30:
> This is the package recipe for the phoronix test suite v5.2.1. The tool
> is for benchmarking and testing of the system.
> 
> Signed-off-by: Todd Brandt <todd.e.brandt@linux.intel.com> ---- 
> meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
> | 24 ++++++++++++++++++++++++ 1 file changed, 24 insertions(+)
> 
> v2: - changes based on Ross Burton's comments. However, I kept this
> line: S = "${WORKDIR}/phoronix-test-suite", since the tarball folder
> doesn't include the version number. - moved the recipe from
> recipes-devtools to recipes-benchmark - changed the section from tests to
> console/tests
> 
> diff --git
> a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
> b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
>
> 
new file mode 100644
> index 0000000..af5eb54 --- /dev/null +++
> b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
>
> 
@@ -0,0 +1,24 @@
> +SUMMARY = "Phoronix Test Suite" +DESCRIPTION = "The Phoronix Test Suite
> is designed to carry out both qualitative \ +and quantitative benchmarks
> in a clean, reproducible, and easy-to-use manner." +LICENSE = "GPLv3" 
> +LIC_FILES_CHKSUM =
> "file://../phoronix-test-suite/COPYING;md5=d32239bcb673463ab874e80d47fae504"

This
> 
is relative to ${S}, so
file://COPYING;md5=d32239bcb673463ab874e80d47fae504 should work as well.

> +RDEPENDS_${PN} = "php-cli"

R* variables go below do_install, since those are related to packaging

> +SECTION = "console/tests" + +SRC_URI =
> "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz" 
> +SRC_URI[md5sum] = "51e52d883710dc516c5494bd1c377219" +SRC_URI[sha256sum]
> = "1186f460691e2fe7a07df5edb8d8ed1ac0c65327512e646da2b2e3a60dda6cd9" +S =
> "${WORKDIR}/phoronix-test-suite" + +do_install() { +	DESTDIR=${D}
> ./install-sh ${exec_prefix} +} + +FILES_${PN} += " \ +
> ${datadir}/phoronix-test-suite \ +
> ${datadir}/appdata/phoronix-test-suite.appdata.xml \ +
> ${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \ +
> ${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png
> \ +	${datadir}/mime/packages/openbenchmarking-mime.xml \ +"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUIVgeMkyGM64RGpERAu6ZAJ9poIrB6ApzSg2x30g1fGs62VCCewCfT6nK
92MuQa/1ctapiTfm43uNI6M=
=Xtr9
-----END PGP SIGNATURE-----


