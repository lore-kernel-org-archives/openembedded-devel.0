Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.136.1614635083643394555
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 13:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n+MKdc0i;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id f124so47302qkj.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Mar 2021 13:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8zwAnVv3tmY2GJdah3BVUqAUBDnCvgCKDI/tvC4A3DI=;
        b=n+MKdc0ir03DlYbwpwWNsUmgtYVLnV98L3QMBtcMMMjb4SVvunif9JYoqt/1pMkRhv
         wusPSXfKXbW/SrqISEpmA8EltTkmWK3/BbAzgWdmQeGJyG558SUCQCr4AFpgHLxromqc
         HhigkR5PUtJDDjSXb3Z3JZhSNxykVLIMCOmSr3OfLiImRBLUXBXlPGEuaZjvhGufuLS3
         3xB3kYsq9c9m30TwXrnqGS7Jmxwz7MCYwIvSyMpToNugUvL5y+COIc9l9VITLfW+sMMq
         gnZhlNsuIasBDC7LliPX9mskg+558rYp3LCsrAQVG/i2FO/u+5VHbU0qJBcs4HDIVCBQ
         3VUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8zwAnVv3tmY2GJdah3BVUqAUBDnCvgCKDI/tvC4A3DI=;
        b=es1yrrLI5CyzWtdRlEyRIbh3pwy7/KKGWy7GgR3uBrhktrz8KgLUh3dLxsOe3G9V0Z
         2ft6cJi63np5zJj9+Ad50RA9dokIcDlzKgqEHMjkWJyl4TdhN6l52d8vuC0kPqdmFc6p
         b2Q/7AzTEGUBKVoUDiC3QPvYcVZPBX1QX9aeKXLzrk6vdOKV3SrGEUfpQNZwCYtxdbEw
         C74K6o+LIxczufFRYqc5/20TNryHjSZOCYeJ/CCtLl+GBNMqUhP19Id3udY1O/S2edjz
         BcrOkG+2Raf2VTUmm5HbtyrLoEKNXIcYQtsZFd/UormPRrs48Hfb41sJaeiAvrzpGouv
         eKrQ==
X-Gm-Message-State: AOAM531yhQq5KbNIAQYijxX+O7mBUlSZ++hSujEP2RkAsDPK2JU1EJyc
	Vtff4lxN2Fg/3B3104MhXr12PJAl+4G0fW0GZys=
X-Google-Smtp-Source: ABdhPJxJjO0/BugpbR4PybqZXerFTCRFprc3Wp5/KLlTpmr8t7vmaIFxayAU2EtDQCtL1q4Fe1p1pNZWk7raLK9DjiA=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr10458218qka.119.1614635082647;
 Mon, 01 Mar 2021 13:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20210226145555.11205-1-leon.anavi@konsulko.com> <e9ab2d2c-959e-3d01-7a8c-87e1a131fb08@windriver.com>
In-Reply-To: <e9ab2d2c-959e-3d01-7a8c-87e1a131fb08@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Mar 2021 13:44:16 -0800
Message-ID: <CAMKF1spPKxKUmvDwp9ehy9j-aigwKjM9G3rA7muGPcwdz3D0Nw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-semantic-version: Add recipe
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Leon Anavi <leon.anavi@konsulko.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

there is python3-semver recipe as well. While they are different
sources but perhaps are similar in functionality can you find out if
we need both

On Mon, Mar 1, 2021 at 9:51 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
>
> On 2021-02-26 9:55 a.m., Leon Anavi wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Add semantic_version - a library implementing the 'SemVer' scheme.
> Version 2.8.5 brings:
>
> - Properly handle wildcards in SimpleSpec (e.g. ==1.2.*)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>
> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> ---
>  .../python/python3-semantic-version_2.8.5.bb         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb b/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
> new file mode 100644
> index 0000000000..b8541ff570
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-semantic-version_2.8.5.bb
> @@ -0,0 +1,12 @@
> +SUMMARY  = "A library implementing the 'SemVer' scheme."
> +DESCRIPTION = "Semantic version comparison for Python (see http://semver.org/)"
> +HOMEPAGE = "https://github.com/rbarrois/python-semanticversion"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
> +
> +SRC_URI[sha256sum] = "d2cb2de0558762934679b9a104e82eca7af448c9f4974d1f3eeccff651df8a54"
> +
> +PYPI_PACKAGE = "semantic_version"
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
>
>
>
> 
>
