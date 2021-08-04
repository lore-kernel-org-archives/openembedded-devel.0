Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.11367.1628093665283840444
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 09:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mjZXrq5k;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id mz5-20020a17090b3785b0290176ecf64922so9419809pjb.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q4MqIRty+15uAooWmVIVXdcCuB15n46CiI/cSxiMA0E=;
        b=mjZXrq5kNlvHAdgSvX2dD79X6vNwWtNHb6CGVvLLkLVNUqQSlEYOofutF1iOM6/AWh
         4VvlK/ASDPR8x9r8hMdJHGsCc76U3XAVsddtl7v2SE+GmpJjSUWp3/sQh6SCJe6QGOB7
         ng5QUzXUAu6QbZT40yci4H63kDzRf5WCAZ+QxhkYhlfRDaib3lYxbxrltjtH83TvvHmG
         XSUdSXf1aZUiTVzXFc0BSLwjsPLV65F06lC3LyzQppTVScDMkVdwAPxNsBgUSkAFe+xI
         3xDlN9G5Ze+Uk5aZZSvLXAaMHRBIDwlDb2Poy5Ie2ZRjmxTfizxhV8u0TxFZLrgoRxqF
         HRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Q4MqIRty+15uAooWmVIVXdcCuB15n46CiI/cSxiMA0E=;
        b=gXQAjNH36YRLao3Z3MaSACtpjhk1yXXhvN7jxN5U94Wvtq2ThLfJvoisSAJvmaPfgc
         e6Cot/m2JERtrwOfkKCvYR6tj2nCDZ/k4ImjKX6Toai9vxg9rXwYhz93OiDeH7sm29Gv
         RFDVnwJ783HCpS+WhMORuoCBJ2h/M6eqf5LOZHXecwx14dBMMp9DV84teRddc+JC1iVi
         9CWJUdDn7Ds07OU5JSzm59S5NTRJjGztWJ7m+aW6vN71B6ZNrEw/rLN4xBKCMbPZGYs8
         JnaTjEsdYE7LI86R3tE74S+Q8ouS6s8FABZsfhS9FBk9cSzA0bg9Tin2pVDPtvo29AD3
         Xhkg==
X-Gm-Message-State: AOAM5313grntpib6UGwTQQMImGxe1ZjsnRVvi9YkCUXV+phdKkI9/RSJ
	MdHZsKuArgOuEz3NheUTXTaweEWXw0+X3Q==
X-Google-Smtp-Source: ABdhPJyl294m9QNY4WOXxQ7/ko4zDKP1lDWwAtuPL2puFwmwLDii3MvQhAvZl51VVuKUAkwoQl4NfQ==
X-Received: by 2002:a62:e304:0:b029:3c5:f82f:8250 with SMTP id g4-20020a62e3040000b02903c5f82f8250mr256486pfh.49.1628093664606;
        Wed, 04 Aug 2021 09:14:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:61bd:9658:157a:c74c? ([2601:646:9200:a0f0:61bd:9658:157a:c74c])
        by smtp.gmail.com with ESMTPSA id w8sm3071101pja.24.2021.08.04.09.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 09:14:24 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] klibc.bbclass, image_types_sparse.bbclass, packagegroup-meta-oe.bb: update the overrides syntax conversion
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210804142712.251990-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <35f086c7-8947-0d0b-4b26-cb1cef6746dc@gmail.com>
Date: Wed, 4 Aug 2021 09:14:23 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804142712.251990-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 8/4/21 7:27 AM, Martin Jansa wrote:
> * re-run the latest version of the script which converts CONVERSION_CMD as well since
>    https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=d9e81d66db2bc2aa56d177cef78c814c29679a4a
> * skip many incorrect s/_linux/:linux/g changes which were introduced by:
>    https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=9ea1041f8eab26ee871a9176e9691e5d3e6745bd
>

can you do this on top of master-next and send a v2 please ?

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta-initramfs/classes/klibc.bbclass               |  2 +-
>   meta-oe/classes/image_types_sparse.bbclass         |  2 +-
>   .../packagegroups/packagegroup-meta-oe.bb          | 14 +++++++-------
>   3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
> index 83112c06fa..202d132d94 100644
> --- a/meta-initramfs/classes/klibc.bbclass
> +++ b/meta-initramfs/classes/klibc.bbclass
> @@ -4,7 +4,7 @@ DEPENDS =+ "klcc-cross"
>   # Default for klcc is to build static binaries.
>   # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
>   CC:forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
> -CC:forcevariable:armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
> +CC:forcevariable:armv4:linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
>   CC:append:armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
>   CC:append:armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
>   
> diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
> index 1459f800a5..af3879372b 100644
> --- a/meta-oe/classes/image_types_sparse.bbclass
> +++ b/meta-oe/classes/image_types_sparse.bbclass
> @@ -1,7 +1,7 @@
>   inherit image_types
>   
>   CONVERSIONTYPES += "sparse"
> -CONVERSION_CMD_sparse() {
> +CONVERSION_CMD:sparse() {
>       in="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>       out="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse"
>       case "${type}" in
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 5cd605ff49..47ee3099aa 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -205,7 +205,7 @@ RDEPENDS:packagegroup-meta-oe-crypto ="\
>       libsodium \
>       pkcs11-helper \
>   "
> -RDEPENDS_packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
> +RDEPENDS:packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
>   
>   RDEPENDS:packagegroup-meta-oe-dbs ="\
>       influxdb \
> @@ -948,12 +948,12 @@ RDEPENDS:packagegroup-meta-oe-test ="\
>       pm-qa \
>       testfloat \
>   "
> -RDEPENDS_packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
> -RDEPENDS_packagegroup-meta-oe-test:remove:arm = "fwts"
> -RDEPENDS_packagegroup-meta-oe-test:remove:mipsarch = "fwts"
> -RDEPENDS_packagegroup-meta-oe-test:remove:powerpc = "fwts"
> -RDEPENDS_packagegroup-meta-oe-test:remove:riscv64 = "fwts"
> -RDEPENDS_packagegroup-meta-oe-test:remove:riscv32 = "fwts"
> +RDEPENDS:packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
> +RDEPENDS:packagegroup-meta-oe-test:remove:arm = "fwts"
> +RDEPENDS:packagegroup-meta-oe-test:remove:mipsarch = "fwts"
> +RDEPENDS:packagegroup-meta-oe-test:remove:powerpc = "fwts"
> +RDEPENDS:packagegroup-meta-oe-test:remove:riscv64 = "fwts"
> +RDEPENDS:packagegroup-meta-oe-test:remove:riscv32 = "fwts"
>   
>   RDEPENDS:packagegroup-meta-oe-ptest-packages = "\
>       zeromq-ptest \
> 
> 
> 
> 
> 
