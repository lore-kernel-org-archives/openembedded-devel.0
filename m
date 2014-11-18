Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9897215E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 23:13:04 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so3547447wiv.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 15:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=8B9QrBo/dMh4g89zLKDFJVFsegwdypysJh8JvZKMdz4=;
	b=owvRDYSnEL0O1UsdHxIJV3FkcWbNDNZCWOPYbtwyXcL1MDfQbtYN8Laay+b4KRIySg
	G0uYJm5YGcA1Y7DnXOAuXJrsHWBp1nIUwyULVauEoWSkkNry8rgQK2KR5pquhk/axws2
	yLn18F4O4LFKk58JqK9lGRRB7bFjn0lvFfewg3fKdETg0CMLs7XXyPWr+5+0PenWoHKP
	q4kXj4BhI/pOMgJIoP3kddieyql6TH7Gx0fN1TdFplKhxHD3Gh4xwDEGKKR1KCpsM7OV
	gCOP3ZzpSaCe4A8fN7gYQrGaCuHrnBaRVScXLI2wben84qJbm6rS9TmZaur4yf07VWe/
	P/yw==
MIME-Version: 1.0
X-Received: by 10.194.238.3 with SMTP id vg3mr50791388wjc.69.1416352385076;
	Tue, 18 Nov 2014 15:13:05 -0800 (PST)
Received: by 10.194.82.103 with HTTP; Tue, 18 Nov 2014 15:13:05 -0800 (PST)
In-Reply-To: <20141118225901.GA12111@linux.intel.com>
References: <20141118225901.GA12111@linux.intel.com>
Date: Wed, 19 Nov 2014 00:13:05 +0100
Message-ID: <CA+chaQdR_YsDATsLvfgW-WEANTDcr=bVjScphaT9DExk3nsoBA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH/RESEND v3] Phoronix Test Suite package
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
X-List-Received-Date: Tue, 18 Nov 2014 23:13:06 -0000
Content-Type: text/plain; charset=UTF-8

> v3resend: has this been accepted?

Yes almost 2 months ago.

Is it so hard to find:

http://git.openembedded.org/meta-openembedded/commit/?id=c22f2d1be5b9762d6972ffe2fe258b8241571f59

?


On Tue, Nov 18, 2014 at 11:59 PM, Todd E Brandt <
todd.e.brandt@linux.intel.com> wrote:

> This is the package recipe for the phoronix test suite v5.2.1. The
> tool is for benchmarking and testing of the system.
>
> Signed-off-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> ----
>  meta-oe/recipes-benchmark/phoronix-test-suite/
> phoronix-test-suite_5.2.1.bb | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> v2: changes based on Ross Burton's comments. However, I kept this line:
> S = "${WORKDIR}/phoronix-test-suite", since the tarball folder doesn't
> include the version number.
> v3: changed the license file locatoin and moved the RDEPENDS field down
> v3resend: has this been accepted?
>
> diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/
> phoronix-test-suite_5.2.1.bb
> b/meta-oe/recipes-benchmark/phoronix-test-suite/
> phoronix-test-suite_5.2.1.bb
> new file mode 100644
> index 0000000..ef9f735
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/phoronix-test-suite/
> phoronix-test-suite_5.2.1.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Phoronix Test Suite"
> +DESCRIPTION = "The Phoronix Test Suite is designed to carry out both
> qualitative \
> +and quantitative benchmarks in a clean, reproducible, and easy-to-use
> manner."
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +SECTION = "console/tests"
> +
> +SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
> +SRC_URI[md5sum] = "51e52d883710dc516c5494bd1c377219"
> +SRC_URI[sha256sum] =
> "1186f460691e2fe7a07df5edb8d8ed1ac0c65327512e646da2b2e3a60dda6cd9"
> +S = "${WORKDIR}/phoronix-test-suite"
> +
> +do_install() {
> +       DESTDIR=${D} ./install-sh ${exec_prefix}
> +}
> +
> +RDEPENDS_${PN} = "php-cli"
> +FILES_${PN} += " \
> +       ${datadir}/phoronix-test-suite \
> +       ${datadir}/appdata/phoronix-test-suite.appdata.xml \
> +       ${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
> +
>  ${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png
> \
> +       ${datadir}/mime/packages/openbenchmarking-mime.xml \
> +"
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

