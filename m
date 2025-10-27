Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D100CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 09:30:13 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.28051.1761557411725778803
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 02:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WyamunDF;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42701b29a7eso2269628f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557410; x=1762162210; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5q1NwieCu1y61/7jNyzxylZayteUAmSIw7DfuhkMQyU=;
        b=WyamunDFmjr2ZaNGvaws5Z0zSel8EtMRTbcvarsQ80EZMNU2qdT6V9tNuiLiNRYlf5
         1fG+VuvxatM4UPuTrmyAkowcM7/9nZGNzYm1mO2xCDuCkVSvAivbETQIF6S/LqijFlgL
         tM+LrsmyRbG38JY0f9ost/k3AP4aYa3vQL5HOWxQCcfl2acAr5ulLWy1eJbI8nPFJ/N0
         SfoUxn8Ue/fgPQBVGOjifkWnLyPqowWOgk64zQ5dHnrC6LLvWLwCLnhkGQLsFEugo5Qg
         5WhAqEstigzoDIEHqiEFFncuQkxFRCUPbBKjxRb0P2d2cheZKoHjqOq9fIrD8eBShlmU
         DYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557410; x=1762162210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5q1NwieCu1y61/7jNyzxylZayteUAmSIw7DfuhkMQyU=;
        b=VrfdMgJ765EPSYeQLWEGzUMbDebJXCUSfZWNPyx8e1BAQ35hHBFIWGTqkpPlLRJ3if
         jrR+RXe/ZPB51YjHd0O3Wwxa+axup9EjHk41j5yr+x7Kt7/f2tXconcRK7r8ONXRJTTL
         zEC+ESc6XsWdVtpVH+0+KFNgych55pAnNf+IuaQkAaZDcN7V3mD9kyB2Um4yCfS627mA
         lPB6A13A2MBhJC097CvcHQAdXNwRLE7OQ8EPSeeBwDcRvW+AzOLziDHp9yQV3WDMER4D
         +ezKDQqPFaVIVSJGCyvs1e0lhdFKphFqmRS2ZPAaLFUyD7Qp23tN1Ur2Wh/pjPgCpd/a
         huFw==
X-Forwarded-Encrypted: i=1; AJvYcCWTp+/WHX3A3baWObgMaatJZ6/QfEHwMsVrjeHMxFiJ+gTwMDZ/nPXIu5Oa/vp3eMF7hWqbk2Mf9oRDpZqlPdbrxeU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy12vDIk4iPDQqe79f0NH0vBS6Kbn5bgxHzXylErHCpVcASMKlh
	mzhNB6wwW18g2dXYW7aZ0sB0fnbUhX3DrYSQqUs9l+K330yTjL3nnTT+
X-Gm-Gg: ASbGncvmLtTnfHn1Y/ULnsqgDdf9x+gC0YOGGKcoFKEsJCrkr6iPT0QG2nPx8WM+iGt
	y9Gm8JgaNop86Tji0c5NHiRQ7xqP58pMFprM/jIYeOc9eSETtkQhtq758Mmy7l/xOvYseZMmSME
	bbq4lSiH4ngE+v3eWWT3MhWOj0c7/d+ktISksciZD2ygnBg6lXU03erpVunJM64hkFjtsfuKIT2
	aLWHVaACOQfWL7tLW2qZLSCTGHYy1JS5fQR0wltKBM4oL8IUhLCNiqf02xnW/xkiQRCc+7gxjh4
	dIA5ioF4FIQY+TmNnXNWxpvJiBZVHG6u0/biOMUUIpFKE1PBNKVXNOtd2ekqo6NhlcsXY8gIdxo
	/6gppe5+7dwRebI+Iynq1D2H/qaKuEqZnpU4tJt8IGHQIJ0RQVhLuBC4qcKtGcvV3HySWPnqJjo
	aKentzP1HSWAtXAUxfFPw=
X-Google-Smtp-Source: AGHT+IEYgI8YDgUSSSoC//m9RroLdhfbZ+liHHGw7L0wKrN50G5OjC3swXf4i1KH8ZMR7xs+WtJ89g==
X-Received: by 2002:adf:e3c8:0:b0:429:8d74:4b16 with SMTP id ffacd0b85a97d-4298f59482cmr5590927f8f.20.1761557409911;
        Mon, 27 Oct 2025 02:30:09 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm13449419f8f.6.2025.10.27.02.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 02:30:09 -0700 (PDT)
Message-ID: <09ba1133-9de9-4bd6-8d59-4cc87b2b2aae@gmail.com>
Date: Mon, 27 Oct 2025 10:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][PATCH] imagemagick: adds ptest for imagemagick
 recipe
To: ashishkumar.mishra@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
References: <20251027045701.3396903-1-ashishkumar.mishra@bmwtechworks.in>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251027045701.3396903-1-ashishkumar.mishra@bmwtechworks.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 09:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121028

In general I think this is a very good patch, but I'd like to add a
couple of notes:

1. Could it include the official test suite also? I would not remove the
current tests, but rather extend them - actually I think it's a good
idea to exercise the artifacts in a way you do.
2. The recipe should be also added to the
conf/include/ptest-packagelists-meta-oe.inc file
3. The test suite should return results in a strict form:
PASS: $testname_or_something_like_that
or
FAIL: $testname_or_something_like_that

Other logs can be present between these lines, but the test status
should be reported like this (not [FAIL]/[PASS])

Just to give some background to the last two points:
If point 2 is done, then you can do things like "bitbake
meta-oe-image-ptest-imagemagick" which will build a minimal image that
contains the ptest with its requirements.
If you also add "testimage" to IMAGE_CLASSES variable, then you can
automate the whole thing like "bitbake meta-oe-image-ptest-imagemagick
-c testimage", which will run the tests automatically, and also evaluate
them for you - this requires the PASS/FAIL output form, this is how
failures recognized automatically.

On 10/27/25 05:57, AshishKumar Mishra via lists.openembedded.org wrote:
> The logic used is :
> - We check if the required tools are present or not
> - We used convert to create an raw RGB file
> - The created RGB is then converted to PNG using convert
> - We re-gerenate RGB from PNG and compare the original and re-generated RGB
>
> Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> ---
>  .../imagemagick/imagemagick-ptest.sh          | 128 ++++++++++++++++++
>  .../imagemagick/imagemagick/run-ptest         |  43 ++++++
>  .../imagemagick/imagemagick_7.1.1.bb          |  14 +-
>  3 files changed, 183 insertions(+), 2 deletions(-)
>  create mode 100755 meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/run-ptest
>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
> new file mode 100755
> index 0000000000..fbb26d2741
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
> @@ -0,0 +1,128 @@
> +#!/bin/sh
> +#
> +# ImageMagick ptest:
> +# We ceate an BASERGB file for our usage using "convert"
> +# We convert this RGB file to BASEPNG
> +# Using BASEPNG we recreate RGB named REGENERATEDRGB
> +#
> +# BASERGB to BASEPNG to REGENERATEDRGB
> +# - Then compare  BASERGB with REGENERATEDRGB
> +#
> +# 1) We are checking if the binaries are present in RFS or not
> +# 2) We Created an RBG of size : WIDTH x HEIGHT pixels
> +# 3) Return value is captured after every major actio to capture the status
> +# 4) cmp -s is used to compare binary byte by byte data and
> +#    capture only exit status
> +# 5) Important parametsrs used are :
> +#    -depth                     : How many bits for each colour pixel
> +#    -alpha off  		: Don't consider transparency
> +#    -define png:color-type=2   : Make PNG work with truecolour RGB
> +#    -strip 			: Remove all non-pixel metadata og PNG
> +#                                 so file is reproducible
> +#    -set gamma 1.0             : No PNG brightness correction
> +#     gradient:red-blue         : Data moves liberly from RED to Blue vertically
> +
> +
> +WIDTH=16
> +HEIGHT=16
> +BASERGB=base.rgb
> +BASEPNG=base.png
> +REGENERATEDRGB=roundtrip.rgb
> +
> +echo "[TEST ] Starting ImageMagick Ptest with ${WIDTH}x${HEIGHT} pixels "
> +
> +# Verify required binaries
> +for bin in convert cmp wc rm; do
> +    if [ -z "$(command -v "$bin" 2>/dev/null)" ]; then
> +        echo "[ERROR] Required binary '$bin' not found $PATH"
> +        exit 127
> +    fi
> +done
> +
> +# Generate raw RGB
> +convert -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
> +    -alpha off -define png:color-type=2 \
> +    -strip -set gamma 1.0 \
> +    gradient:red-blue rgb:${BASERGB}
> +
> +returnvalue=$?
> +if [ "$returnvalue" -ne 0 ]; then
> +    echo "[FAIL] Failed to generate RGB pattern "
> +    exit 1
> +else
> +    echo "[DEBUG] Generated raw RGB ${BASERGB} for test case"
> +fi
> +
> +
> +
> +# Convert raw RGB to PNG
> +convert -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
> +    -alpha off -define png:color-type=2 \
> +    -strip -set gamma 1.0 \
> +    rgb:${BASERGB} ${BASEPNG}
> +
> +returnvalue=$?
> +if [ $returnvalue -ne 0 ]; then
> +    echo "[FAIL] Failed to convert RGB to PNG"
> +    rm -f ${BASERGB}
> +    exit 1
> +else
> +    echo "[DEBUG] ${BASEPNG}  generated from ${BASERGB}"
> +fi
> +
> +
> +
> +# Regenrate raw RGB from PNG
> +convert -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
> +    -alpha off -define png:color-type=2 \
> +    -strip -set gamma 1.0 \
> +    ${BASEPNG} rgb:${REGENERATEDRGB}
> +
> +returnvalue=$?
> +if [ $returnvalue -ne 0 ]; then
> +    echo "[FAIL] Failed to re generate RGB from PNG "
> +    rm -f ${BASERGB} ${BASEPNG}
> +    exit 1
> +else
> +    echo "[DEBUG] ${REGENERATEDRGB} generated from ${BASEPNG}"
> +fi
> +
> +
> +
> +# Compare original and recreated RGB
> +if cmp -s ${BASERGB} ${REGENERATEDRGB}; then
> +    echo "[PASS] RGB data identical after PNG round-trip"
> +    RESULT=0
> +else
> +    echo "[FAIL] RGB mismatch detected, printing their size "
> +    echo "[INFO] Base RGB size: $(wc -c < ${BASERGB}) bytes"
> +    echo "[INFO] Round-trip RGB size: $(wc -c < ${REGENERATEDRGB}) bytes"
> +    RESULT=1
> +fi
> +
> +
> +
> +# Checking the identify tool from imagemagick to get the PNG metadata
> +# True is added in end to ensure that test script doesnt fail even if
> +# identify fails for any reason
> +echo "[DEBUG] PNG file info:"
> +identify -verbose ${BASEPNG} | grep -E "Depth|Type|Colorspace" || true
> +
> +
> +
> +# Cleanup of files create by test code
> +echo "[DEBUG] Cleaning up temporary files"
> +rm -f ${BASERGB} ${BASEPNG} ${REGENERATEDRGB}
> +returnvalue=$?
> +echo "[DEBUG] Cleanup exit=$returnvalue"
> +
> +
> +# Logging the final result
> +if [ ${RESULT} -eq 0 ]; then
> +    echo "[DONE] ImageMagick Ptest completed successfully"
> +else
> +    echo "[DONE] ImageMagick Ptest completed with FAILURE"
> +fi
> +
> +
> +exit ${RESULT}
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest b/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest
> new file mode 100644
> index 0000000000..70c0dd8cb8
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest
> @@ -0,0 +1,43 @@
> +#!/bin/sh
> +#
> +# run-ptest — ImageMagick ptest harness
> +# POSIX-safe and BusyBox compatible
> +
> +PTDIR=$(dirname "$0")
> +TESTDIR="$PTDIR"
> +PASSCOUNT=0
> +FAILCOUNT=0
> +TOTAL=0
> +
> +echo "======================================="
> +echo "ImageMagick ptest: Runtime Validation"
> +echo "======================================="
> +
> +for t in "$TESTDIR"/*.sh; do
> +    [ -x "$t" ] || chmod +x "$t"
> +    TOTAL=$((TOTAL + 1))
> +    echo "[TEST $TOTAL] Executing: $(basename "$t")"
> +    echo "[DEBUG] Launching test script $t"
> +
> +    if sh "$t" 2>&1; then
> +        echo "[RESULT] PASS: $(basename "$t")"
> +        PASSCOUNT=$((PASSCOUNT + 1))
> +    else
> +        rc=$?
> +        if [ "$rc" -eq 77 ]; then
> +            echo "[RESULT] SKIP: $(basename "$t")"
> +        else
> +            echo "[RESULT] FAIL (exit=$rc): $(basename "$t")"
> +            FAILCOUNT=$((FAILCOUNT + 1))
> +        fi
> +    fi
> +
> +    echo "[DEBUG] Completed test $(basename "$t")"
> +done
> +
> +echo "======================================="
> +echo "[SUMMARY] Total: $TOTAL | PASS: $PASSCOUNT | FAIL: $FAILCOUNT"
> +echo "======================================="
> +
> +[ "$FAILCOUNT" -eq 0 ]
> +
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
> index 752fef303b..dd199902bd 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
> @@ -11,12 +11,15 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
>  
>  BASE_PV := "${PV}"
>  PV .= "-26"
> -SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
> +SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
> +           file://run-ptest \
> +           file://imagemagick-ptest.sh \
> +"
>  SRCREV = "570a9a048bb0e3a5c221ca87be9408ae35f711e2"
>  
>  S = "${WORKDIR}/git"
>  
> -inherit autotools pkgconfig update-alternatives
> +inherit autotools pkgconfig update-alternatives ptest
>  export ac_cv_sys_file_offset_bits="64"
>  
>  EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl --enable-largefile"
> @@ -56,6 +59,13 @@ do_install:append:class-target() {
>      fi
>  }
>  
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
> +    install -m 0755 ${WORKDIR}/imagemagick-ptest.sh ${D}${PTEST_PATH}/
> +}
> +
> +
>  FILES:${PN} += "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \
>                  ${datadir}/ImageMagick-7"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121023): https://lists.openembedded.org/g/openembedded-devel/message/121023
> Mute This Topic: https://lists.openembedded.org/mt/115970043/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


