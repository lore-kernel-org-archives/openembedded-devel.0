Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA11CC0015E
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 21:02:09 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.5977.1690232526572353547
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 14:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=puhDCJoB;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-63cf28db24cso14932356d6.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 14:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690232525; x=1690837325;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FNYqqcpjWevHHU3sFamfWFserkXAcVfK13ZpWj+9Qu0=;
        b=puhDCJoBSpwGerw8npV50gVnO40H5J2r1lau+Yqk8Rttht+6Ox8yHV8i/nN5uAAtY0
         aDiTryfUxoPeS0wmA8Q4bLQqBGDbhd1Xw/v+r5WC3Ec9lIgSZj2+obEg5JZ+ytn4iTGJ
         GURvq/x6uq38n1I7ZuECd2BSDSA04F1hc0sUDmAPfqEAlIOk2t9qQLT9zGOsI4JLi8yA
         Z2w/YEACsRulR6UKGCUDypTLNi3krBOrLtx6GrtrR3VjzFoNCmOJ9dXUqlOnN40Ri4SR
         YW7qunfW45+ECnFgdeabqe/Iq6UVymjqPu6PWDAQoyIKpMmhVAHfKrRFSPUFpgMuVmbq
         Ya3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690232525; x=1690837325;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNYqqcpjWevHHU3sFamfWFserkXAcVfK13ZpWj+9Qu0=;
        b=WTV4IOneDwiO2TSSOLaG3v+dbjpNxoX3PH+AvB0kBDWMyMBqQhb1RRL8sF0q98UW3o
         GB4ClVkdJAsdmo7TFTt0C91BdkQu1XjVwMCVBZnV/fSacvYKOwGR9/dEGih6vQcXe+Ft
         0daLSg88d7ErIV1rfHxPfQg6gMugA81B+qZrfef36ABSe2OD9cLnwrOir7eyfb2zI+qh
         1aQJCpZLrI1E6X4v86kaWtC+nEttTwZ+cR8EKfnsNlGQ3EChJmgVWQvG9NiKNcQP0/TJ
         Mwa0AcXk+GigfkW1sk1NLeO0WClUoIkS8M4KiRpshiu6dRMiWydsmn6s9eeilt0HPUut
         QLVg==
X-Gm-Message-State: ABy/qLbSmmt5vkwtwuO9mT9eXTqdJWwXF1KjWKR0bWW4dAV24eEg0QH8
	R04U+ZQy6jfgEhRRPgYL1U2zqEZYbrvki0EBLQw=
X-Google-Smtp-Source: APBJJlGEiXZxLXlU9QI/Q8BoF3hmHQXSNvGZp+/VZV/o6/xf9+UqMYNi5WHJ2yUl6HsBgQGovyWzTQ==
X-Received: by 2002:a05:6214:1049:b0:626:f3d:9e46 with SMTP id l9-20020a056214104900b006260f3d9e46mr985288qvr.18.1690232525413;
        Mon, 24 Jul 2023 14:02:05 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:71eb:b8e9:8589:9ca5? ([2001:1970:5b1f:ab00:71eb:b8e9:8589:9ca5])
        by smtp.gmail.com with ESMTPSA id u16-20020a0cf1d0000000b0062629cbff11sm3813424qvl.11.2023.07.24.14.02.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 14:02:05 -0700 (PDT)
Message-ID: <5788128e-92b6-2bf2-f675-6fac29c3805b@baylibre.com>
Date: Mon, 24 Jul 2023 17:02:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-python][PATCH] python3-pocketsphinx: upgrade 0.1.15 ->
 5.0.1
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <1774E6973474AC33.7114@lists.openembedded.org>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <1774E6973474AC33.7114@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 21:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104005


On 2023-07-24 16:08, Trevor Gamblin via lists.openembedded.org wrote:
> pocketsphinx now requires the skbuild module. It has changed versioning
> style, explaining the large jump in version numbers. The LICENSE
> actually has changed to include parts from other projects, which are
> either BSD-2-Clause or MIT.
>
> Also adopt the fix_cythonized_sources function (inspired by the pandas
> recipe) to fix some QA warnings:
>
> WARNING: python3-pocketsphinx-5.0.1-r0 do_package_qa: QA Issue: File /usr/lib/python3.11/site-packages/pocketsphinx/_pocketsphinx.cpython-311-x86_64-linux-gnu.so in package python3-pocketsphinx contains reference to TMPDIR [buildpaths]
> WARNING: python3-pocketsphinx-5.0.1-r0 do_package_qa: QA Issue: File /usr/src/debug/python3-pocketsphinx/5.0.1-r0/_skbuild/linux-x86_64-3.11/cmake-build/cython/_pocketsphinx.c in package python3-pocketsphinx-src contains reference to TMPDIR [buildpaths]
>
> Changelog: https://github.com/cmusphinx/pocketsphinx/releases
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

Scratch this patch for now. I went back to try and add missing RDEPENDS 
(e.g. python3-logging), and the errors that the fixed_cythonized_sources 
function appeared to fix resurfaced. h5py and pandas use similar methods 
but I don't see a difference that hints at why this recipe won't work 
with the same additions.

I also tried switching the recipe from setuptools3 to 
python_setuptools_build_meta, but even after adding cmake-native and 
ninja-native to DEPENDS, I see this error during pocketsphinx's do_compile:

| writing manifest file 'cython/pocketsphinx.egg-info/SOURCES.txt'
|
| ERROR Missing dependencies:
|       cmake
|       ninja


> ---
>   .../python/python3-pocketsphinx_0.1.15.bb     | 14 -----------
>   .../python/python3-pocketsphinx_5.0.1.bb      | 24 +++++++++++++++++++
>   2 files changed, 24 insertions(+), 14 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> deleted file mode 100644
> index f7ffd9d268..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
> -DESCRIPTION = "Python interface to CMU Sphinxbase and Pocketsphinx libraries"
> -HOMEPAGE = "https://github.com/bambocher/pocketsphinx-python"
> -SECTION = "devel/python"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
> -
> -SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
> -SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
> -
> -inherit pypi setuptools3 features_check
> -
> -DEPENDS += "swig-native pulseaudio"
> -REQUIRED_DISTRO_FEATURES += "pulseaudio"
> diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb
> new file mode 100644
> index 0000000000..c6bd978d24
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
> +DESCRIPTION = "Python interface to CMU Sphinxbase and Pocketsphinx libraries"
> +HOMEPAGE = "https://github.com/bambocher/pocketsphinx-python"
> +SECTION = "devel/python"
> +LICENSE = "BSD-2-Clause & MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c4d720cdc9c6953091f65e8b01524bb4"
> +
> +SRC_URI[md5sum] = "fdd1227fb750f087f0636f8c222cbbb9"
> +SRC_URI[sha256sum] = "cadfe42cf1596399ff1a6818ad75970c658e567c7250d67e758b29444facede9"
> +
> +inherit pypi setuptools3 features_check
> +
> +DEPENDS += "swig-native pulseaudio python3-scikit-build-native"
> +REQUIRED_DISTRO_FEATURES += "pulseaudio"
> +
> +PACKAGESPLITFUNCS =+ "fix_cythonized_sources"
> +
> +fix_cythonized_sources() {
> +        for f in `grep -l -r -e '\/* Generated by Cython.*/$' ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}`; do
> +                if [ -e $f ]; then
> +                        sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' $f
> +                fi
> +        done
> +}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104004): https://lists.openembedded.org/g/openembedded-devel/message/104004
> Mute This Topic: https://lists.openembedded.org/mt/100337092/7611679
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

