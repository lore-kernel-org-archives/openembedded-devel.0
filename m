Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E3B357D6D0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 18:17:13 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l12so26889927qtq.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 10:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7oWkLc4gKCyicjtpgP+3zf0BMB4nZMMWg7+WxRBFHWs=;
	b=b4lWHKPuG/a4psZWN3IPa1Y8TT7Do7lBX6E+Nz+3SlgBDRbnBXbj466pIw2gCTCKID
	wUtlsJ7duh77IRw+Gyk/C4bX06H8IiPCp7lGySIKwshMxnWFWPVtG94JjP9ukeH4VxtW
	23BPuXGn0NKRi4LYtG7cG+scs1JWot64UJVjObuZ+0x/uJ3bOx/2IbTHj2oyr9lYcA6U
	LzalaRoqw9crqhYM+YoYOh1a+6i8uThny7h67Bqn5bi7l27LbIM8DGL4ZNsrtpcG+mK0
	PppR0axRCffBZor+WZuhYHiFeImgkqIr66+j13UAly33+/gQgT+gmFQoliWZnsSYVumo
	8QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7oWkLc4gKCyicjtpgP+3zf0BMB4nZMMWg7+WxRBFHWs=;
	b=bWNk7XF7TYeaaXEyxPi68YEmqSA1/rp+mDp4ljR7wzBJD/jhJgY5mo7PsovFFtEEjC
	mWu4qKtzIWCemkFDLzVItbS6yIJIPWqd06lRRHQVt1t+1tDH7C34PSdDWr0ZRj8oIumt
	VRFc42NHSjRiCCY9DnUicBvedMM7BL52a/LlJKUKwROMJc7VyU+HDNfIkDjqvVOXSmIA
	iwmbrvMkv30admN/VBa+xIoz0563o3Bwo9cn+dgNtwKqmwoxljXzCssp2+OJrgxgjNem
	xRRLujtnFVHIbZjVm64TfH3BeBwwXMJgihaUKZqxTSctblLVmz0gyazcPESvnK0bvSUR
	3SvA==
X-Gm-Message-State: APjAAAWbPQh2NrxcqgzfIrYZPVaNLr9FFyQ1m+gyFrQK3HnSpqQ1Ny2h
	6HO8eqriOFtAUgiIT8a/HLxW3/fc4huXvn9ztUM=
X-Google-Smtp-Source: APXvYqy6KRUQzR5/GLQCRWX5BPbG4BUsUfbF0TU096+RKDglUKLMOE7Sszf+sXa+9F2QiPvgjXAQa7OLzQ8dyRCdZwE=
X-Received: by 2002:aed:2c03:: with SMTP id f3mr27352024qtd.80.1577557034399; 
	Sat, 28 Dec 2019 10:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20191227171120.10253-1-peter.kolbus@garmin.com>
In-Reply-To: <20191227171120.10253-1-peter.kolbus@garmin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Dec 2019 10:16:48 -0800
Message-ID: <CAMKF1sqqEY+vNtoApKjyExfAajfW89KLf5uaA9QgkPCq8YBWMg@mail.gmail.com>
To: Peter Kolbus <peter.kolbus@garmin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/2] python3-booleanpy: add recipe
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
X-List-Received-Date: Sat, 28 Dec 2019 18:17:14 -0000
Content-Type: text/plain; charset="UTF-8"

license checksum fails

http://errors.yoctoproject.org/Errors/Details/300491/


On Fri, Dec 27, 2019 at 9:11 AM Peter Kolbus <peter.kolbus@garmin.com> wrote:
>
> boolean.py is a library to define and parse boolean algebras. It is
> used by python3-license-expression.
>
> Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
> ---
>  .../recipes-devtools/python/python-booleanpy.inc   | 14 ++++++++++++++
>  .../python/python3-booleanpy_3.7.bb                |  2 ++
>  2 files changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-booleanpy.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-booleanpy.inc b/meta-python/recipes-devtools/python/python-booleanpy.inc
> new file mode 100644
> index 000000000..4484af29b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-booleanpy.inc
> @@ -0,0 +1,14 @@
> +SUMMARY = "Define boolean algebras, create and parse boolean expressions and create custom boolean DSL"
> +HOMEPAGE = "https://github.com/bastikr/boolean.py"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7f538584cc3407bf76042def7168548a"
> +
> +SRC_URI[md5sum] = "1189d115a38f84f5df743014926a9159"
> +SRC_URI[sha256sum] = "bd19b412435611ecc712603d0fd7d0e280e24698e7a6e3d5f610473870c5dd1e"
> +
> +PYPI_PACKAGE = "boolean.py"
> +
> +inherit pypi
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb b/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
> new file mode 100644
> index 000000000..5f8602d18
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-booleanpy.inc
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

