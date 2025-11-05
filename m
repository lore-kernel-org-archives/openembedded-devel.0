Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCEDCCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 10:33:45 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6362.1762338821002927815
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 02:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=imdaky8l;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429bccca1e8so3231854f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 02:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762338819; x=1762943619; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99JYOPw/CZFp+W4OIMIQHIn+WRwUqruTIbmtfg8kmeo=;
        b=imdaky8lMw/VWjEM5xVVEdBAFASc9f5hAqXU8IZ+S+GwQzAxFnajX5cs7iWTjhRb6q
         BuHY9Bp+jfg/U9W2oa2UPkSJGQZWNHdaOQWuXg5B6UCUExGNBA4rNAFYy4theYDvgmkL
         RVgPhlESZu1nYWo0N/cqKJZBmSgpznKCGssAWYU8QA0yCJ5LpLQBkdhm7riS/e5qSX8z
         5NV7UR/nVVSx2WgZD0CVagAvnK4lu72CLTalbQJuIYhXw63q7TZvGTI9HYLpZ3NBIyTJ
         zTDjydJmI7gChS+R4Fif45BCMDYcBz+kQrOuqew7mnbrs5+zpvy+KCEd/PBSP/SZB2lc
         uvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762338819; x=1762943619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99JYOPw/CZFp+W4OIMIQHIn+WRwUqruTIbmtfg8kmeo=;
        b=ULST86oDlS40KL2ovZ/S5eHPShb02YQHG3Qje8YZMOfJUAXMKhSzia2uEUb9ohgeyD
         Pbm8UFRILBsXe3fJrHIhRSpMFP7ij2AnfkU9s5RaSTr3BopDZBPBY73BT3nZbpKTc1lR
         xvv0O5Cm2Dv/KX3ZYz4WUtsnIOA3ter0GbdF1z5Y+lL9nnLtRwajqKAOSw2KLD+iyzA6
         meVc28vc2e+2fawRicQiGusp6mdmPJIkyIPejmLuwHSCq5sUV1gc2zmwquxa0R2HGEOI
         ZV0cBCzb8S4owJi0IQdvrh75w/4q/0EusbRvPEOYrCdD0QqbCiZDP5Ga/8nZj4VOIzI6
         AoYA==
X-Forwarded-Encrypted: i=1; AJvYcCXmZJ156n/AFqSEsJkYOVghDP81+HC9v4GukZPy4BEBD6KVIllpTLr9JPamElUODLZtdK9FwSe5YB7QErvhAyt9W30=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxS+N8Ya+WOGWlWzSVUhMFdUgEuhd1eGh4kNf9gCFqN8l+xsAW+
	1HZIT9ABh9CxxjcLDNlFbEDDHKuYHOXxA6HWP6RQiqU2UAZsuH3SLeX+
X-Gm-Gg: ASbGncudtMx8UwPXO4HlRWwWt1fjlt4E0n5Xzkv9e0aPIbSP7zF+9c3eYX6taSXe5sH
	CqDt3ywmp7r+0zvWSi3A4ox/EkKgsqZtjolaDRAEZ3f7CaRI96AcYKsCFcpup7sHJIPXMv21Kap
	+J/s1hWI/BYhBIHLwDdpQg+mVO9W9xceeBtT98HGbwXi25FCuw1lcu2ciu9jNmuJGz78bMMfbhX
	lOUtkLg+ByCvscYVC0m08TBuph7iTVrZD587t3UXKREw5WobhZpI+mtbccMl2nYfCdBIhhdUha7
	ZNszDzpzL3cGoG2hEHDjZOAFwJjo2xZtlpGl2LAkHKnbybouNEnYU2bWV0crz9dBQkHCxWT6zls
	DXhU4fOIUlEUE0eX8WBx5PaxuX6YJHz0FSPEp1m4SYBEz3MR/HEL6xIwH4ekNgt2wehY8fI40F3
	aR5qsXbqoE
X-Google-Smtp-Source: AGHT+IH9PVJ8lHXzJOO/M6MupVF0KpbdCgqDzhk1oopQYfhZlN+nmx2Jriy8mD8TW7ChC587Aht9sA==
X-Received: by 2002:a05:6000:210c:b0:427:9d7:86f9 with SMTP id ffacd0b85a97d-429e33096eamr1549177f8f.47.1762338819109;
        Wed, 05 Nov 2025 02:33:39 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fbd1csm9750312f8f.38.2025.11.05.02.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 02:33:38 -0800 (PST)
Message-ID: <2636ab70-4d47-49ce-a35d-60556a154f9c@gmail.com>
Date: Wed, 5 Nov 2025 11:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][master][PATCH] imagemagick: adds ptest for
 imagemagick recipe
To: ashishkumar.mishra@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
References: <20251103051945.1615774-1-ashishkumar.mishra@bmwtechworks.in>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251103051945.1615774-1-ashishkumar.mishra@bmwtechworks.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 10:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121325

Khem,

Did this patch fell through the cracks accidentally, or do you think it
needs some corrections first?

On 11/3/25 06:19, AshishKumar Mishra via lists.openembedded.org wrote:
> The logic used is :
> - We check if the required tools are present or not
> - We used magick to create an raw RGB file
> - The created RGB is then converted to PNG using convert
> - We re-gerenate RGB from PNG and compare the original and re-generated RGB
> - Enabled the ptest in ptest-packagelists-meta-oe.inc as
>   suggested by Gyorgy Sarvari and incorporated logging suggestion
> - This was done as standard imagemagick test like drawtest requires manual
>   internetion to verify the file.
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |   1 +
>  .../imagemagick/imagemagick-ptest.sh          | 132 ++++++++++++++++++
>  .../imagemagick/imagemagick/run-ptest         |  43 ++++++
>  .../imagemagick/imagemagick_7.1.2-5.bb        |  13 +-
>  4 files changed, 187 insertions(+), 2 deletions(-)
>  create mode 100755 meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/run-ptest
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index 825747d522..bd6db35c5b 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -16,6 +16,7 @@ PTESTS_FAST_META_OE = "\
>      function2 \
>      fwupd \
>      gcab \
> +    imagemagick \
>      jemalloc \
>      jq \
>      leveldb \
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
> new file mode 100755
> index 0000000000..08595837d6
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
> @@ -0,0 +1,132 @@
> +#!/bin/sh
> +#
> +# ImageMagick ptest:
> +# We ceate an BASERGB file for our usage using "magick"
> +# We convert this RGB file to BASEPNG
> +# Using BASEPNG we recreate RGB named REGENERATEDRGB
> +#
> +# BASERGB to BASEPNG to REGENERATEDRGB
> +# - Then compare  BASERGB with REGENERATEDRGB
> +#
> +# 0) The convert command is deprecated in IMv7
> +#    used "magick" instead of "convert"
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
> +echo "[DEBUG] Starting ImageMagick Ptest with ${WIDTH}x${HEIGHT} pixels "
> +
> +# Verify required binaries
> +for bin in magick cmp wc rm; do
> +    if [ -z "$(command -v "$bin" 2>/dev/null)" ]; then
> +        echo "[ERROR] Required binary '$bin' not found $PATH"
> +        exit 127
> +    fi
> +done
> +
> +
> +# Generate raw RGB
> +magick -size ${WIDTH}x${HEIGHT} gradient:red-blue \
> +    -depth 8 -type TrueColor \
> +    -alpha off -define png:color-type=2 \
> +    -strip -set gamma 1.0 \
> +    rgb:${BASERGB}
> +
> +returnvalue=$?
> +if [ "$returnvalue" -ne 0 ]; then
> +    echo "[FAIL] Failed to generate RGB pattern "
> +    exit 1
> +else
> +    echo "[DEBUG] ${BASERGB} generated from gradient"
> +fi
> +
> +
> +# Convert raw RGB to PNG
> +magick -depth 8 -size ${WIDTH}x${HEIGHT} rgb:${BASERGB} \
> +    -type TrueColor -alpha off \
> +    -define png:color-type=2 -strip -set gamma 1.0 \
> +    ${BASEPNG}
> +
> +returnvalue=$?
> +if [ $returnvalue -ne 0 ]; then
> +    echo "[FAIL] Failed to convert RGB to PNG"
> +    rm -f ${BASERGB}
> +    exit 1
> +else
> +    echo "[DEBUG] ${BASEPNG} generated from ${BASERGB}"
> +fi
> +
> +
> +
> +# Regenerate raw RGB from PNG
> +magick ${BASEPNG} \
> +    -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
> +    -alpha off -define png:color-type=2 \
> +    -strip -set gamma 1.0 \
> +    rgb:${REGENERATEDRGB}
> +
> +returnvalue=$?
> +if [ $returnvalue -ne 0 ]; then
> +    echo "[FAIL] Failed to regenerate RGB from PNG"
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
> +    echo "[DEBUG]: imagemagick-ptest.sh sucessfull "
> +else
> +    echo "[DEBUG]: imagemagick-ptest.sh failed "
> +fi
> +
> +
> +exit ${RESULT}
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest b/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest
> new file mode 100644
> index 0000000000..75251a803f
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
> +    echo
> +    echo "[DEBUG] Launching test script $t"
> +
> +    if sh "$t" 2>&1; then
> +        echo "PASS: $(basename "$t")"
> +        PASSCOUNT=$((PASSCOUNT + 1))
> +    else
> +        rc=$?
> +        if [ "$rc" -eq 77 ]; then
> +            echo "SKIP: $(basename "$t")"
> +        else
> +            echo "FAIL: $(basename "$t")"
> +            FAILCOUNT=$((FAILCOUNT + 1))
> +        fi
> +    fi
> +
> +done
> +
> +echo
> +echo "======================================="
> +echo "[SUMMARY] Total: $TOTAL | PASS: $PASSCOUNT | FAIL: $FAILCOUNT"
> +echo "======================================="
> +echo
> +[ "$FAILCOUNT" -eq 0 ]
> +
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
> index 8ba14261ae..9da9d7df58 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
> @@ -12,11 +12,14 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
>  BASE_PV = "${@d.getVar('PV').split('-')[0]}"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
>  
> -SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https;tag=${PV}"
> +SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https;tag=${PV} \
> +           file://run-ptest \
> +           file://imagemagick-ptest.sh \
> +"
>  SRCREV = "4a620c2a89a7481e83cb4a0ff32db0ccbb3afcd2"
>  
>  
> -inherit autotools pkgconfig update-alternatives
> +inherit autotools pkgconfig update-alternatives ptest
>  export ac_cv_sys_file_offset_bits = "64"
>  
>  EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl --enable-largefile"
> @@ -55,6 +58,12 @@ do_install:append:class-target() {
>      fi
>  }
>  
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
> +    install -m 0755 ${UNPACKDIR}/imagemagick-ptest.sh ${D}${PTEST_PATH}/
> +}
> +
>  FILES:${PN} += "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \
>                  ${datadir}/ImageMagick-7"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121265): https://lists.openembedded.org/g/openembedded-devel/message/121265
> Mute This Topic: https://lists.openembedded.org/mt/116093375/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


