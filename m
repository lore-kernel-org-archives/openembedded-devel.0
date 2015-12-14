Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 09B1A700FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 10:29:01 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so114154347wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 02:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=HkKlxgDW4mdT5Ku8d/pxgqxJD5sdNh4970gJmSmRpVg=;
	b=NE4rCtyioRkV7LpSnIOprBquhZgmsRkx9rScBKM5icVxuRgVOb2pNfzkXXzdNYWSJF
	1+/kYmC4KQXqDsB1FZpw0JCi6YObvQQjkkufKu+4i/cWHk1dosZAmbXE67nzTVcTJ8SB
	2A0gUmDBUd8/ZR8l3BTCulJ0ztdWcDpCma4OlOmHnTH5BLaUYYu8E2ap0davGRGQcveB
	Vpdxnx2xNdKWGeNdQRHKBenGk6md+kT8VlkWMa/NXk0Ab385RBN6JYYIEiI4TWketWDd
	18wl0gOhhGFSClg250DqJ5FrmY6h++AYfefVTofWW+vPtvoC/rkPLWe+o7veJ2R9a2u0
	Zt3Q==
MIME-Version: 1.0
X-Received: by 10.194.223.39 with SMTP id qr7mr35549199wjc.63.1450088942200;
	Mon, 14 Dec 2015 02:29:02 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Mon, 14 Dec 2015 02:29:01 -0800 (PST)
In-Reply-To: <1450068857-32490-1-git-send-email-rongqing.li@windriver.com>
References: <1450068857-32490-1-git-send-email-rongqing.li@windriver.com>
Date: Mon, 14 Dec 2015 11:29:01 +0100
Message-ID: <CA+chaQfU0rmV==UX+t1BKpor2o_YRpXStiTX2BcL7_A5mom7-w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe] phoronix-test-suite: uprev it to 6.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Dec 2015 10:29:05 -0000
Content-Type: text/plain; charset=UTF-8

It cannot be allarch when it RDEPENDS on TUNE_PKGARCH bash, python, php-cli.

On Mon, Dec 14, 2015 at 5:54 AM, <rongqing.li@windriver.com> wrote:

> From: Roy Li <rongqing.li@windriver.com>
>
> 1. inherit systemd and move the systemd unit files to correct dir
> 2. inherit allarch
> 3. add bash/python to RDEDEPENDS
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  ...test-suite_5.2.1.bb => phoronix-test-suite_6.0.1.bb} | 17
> ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-benchmark/phoronix-test-suite/{
> phoronix-test-suite_5.2.1.bb => phoronix-test-suite_6.0.1.bb} (60%)
>
> diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/
> phoronix-test-suite_5.2.1.bb
> b/meta-oe/recipes-benchmark/phoronix-test-suite/
> phoronix-test-suite_6.0.1.bb
> similarity index 60%
> rename from meta-oe/recipes-benchmark/phoronix-test-suite/
> phoronix-test-suite_5.2.1.bb
> rename to meta-oe/recipes-benchmark/phoronix-test-suite/
> phoronix-test-suite_6.0.1.bb
> index ef9f735..5acfbf1 100644
> --- a/meta-oe/recipes-benchmark/phoronix-test-suite/
> phoronix-test-suite_5.2.1.bb
> +++ b/meta-oe/recipes-benchmark/phoronix-test-suite/
> phoronix-test-suite_6.0.1.bb
> @@ -6,19 +6,30 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  SECTION = "console/tests"
>
>  SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
> -SRC_URI[md5sum] = "51e52d883710dc516c5494bd1c377219"
> -SRC_URI[sha256sum] =
> "1186f460691e2fe7a07df5edb8d8ed1ac0c65327512e646da2b2e3a60dda6cd9"
> +SRC_URI[md5sum] = "c3b26fcc57a3a253e558f759fdc1089f"
> +SRC_URI[sha256sum] =
> "27add54f4ecb464549de580cece84b4a4945b99df3ef7ff7034eb7f23ffb3b39"
>  S = "${WORKDIR}/phoronix-test-suite"
>
> +inherit systemd allarch
> +
>  do_install() {
>         DESTDIR=${D} ./install-sh ${exec_prefix}
> +
> +       if [ "${systemd_unitdir}" != "/usr/lib/systemd" ]; then
> +               install -d ${D}/${systemd_unitdir}/system/
> +               mv ${D}/usr/lib/systemd/system/*
> ${D}/${systemd_unitdir}/system/
> +               rm -rf ${D}/usr/lib/
> +       fi
>  }
>
> -RDEPENDS_${PN} = "php-cli"
> +SYSTEMD_SERVICE_${PN} = "phoromatic-client.service
> phoromatic-server.service"
> +RDEPENDS_${PN} += "bash python php-cli"
> +
>  FILES_${PN} += " \
>         ${datadir}/phoronix-test-suite \
>         ${datadir}/appdata/phoronix-test-suite.appdata.xml \
>         ${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
>
> ${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png
> \
>         ${datadir}/mime/packages/openbenchmarking-mime.xml \
> +       ${systemd_unitdir}/* \
>  "
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

