Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id BA4FA7F2A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 05:10:59 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id m2so18447873qkd.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2019 22:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9wbL6wQ/JVLVxznXh97kL2/6uG7GLZO4uqGwK+P/zMI=;
	b=vJpc1L0bkcWX7umfcjj2d191MVUyD/dg+9C4UcP7lM0U0Y5SLGXVePXdZmOUpmYvF8
	lDzMD7ATbw8mM4LzwlfDA6qhoHtFhc/pqs5ZLXckbdrujovtAjHPCp1QTbX8MBn/M+KG
	pY26NDf59L2LbjYwWN5vZfDgbVI5Gp+TY/kPTQQTkbnQFEczzKm11ADonYtJGVA9qajf
	NnfZpJgW5G5OaYAPGzQI/TAb/cIL1BiW8EzRHc6mQLhMrDFgsKN7EZxRPNMc5ekeQD23
	t+2sxHuyELpz1xyblsbXwKt/sXNKpmARkHgwinojciPauBPX7zcOOj91taABrvjp2Ijd
	fqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9wbL6wQ/JVLVxznXh97kL2/6uG7GLZO4uqGwK+P/zMI=;
	b=uOG/JcgZFmH62iZ5UwaQ0c1Tb7dlgP71OEP5CVixfvLlX0rLFU9n10UmES8VvnghMC
	s1gznET3hJnF/hbD+7XCMFxbKqrd87fxWGFb0zbLdnxNp5PlCVENzfOJb+IDJgIKoJJ0
	mIbJayJUPWJUCJeI2I8vDOJRnvEDoMsK7xzdqhnSa0kluCpi1CT1Y2Qmfd7FG5He+2TG
	JlY8oCawEu/U0g9C+LVEB3VLfDiXUG9530j5L8reST6naMAr6eFvnEF5/XlJojcTnYYR
	eAKjoNZ1WyEwIUVRuMaMBzMzCghwVNRQq0tpz40u31flMe+wRf7e40cyS7noxOc9NsiI
	4MIA==
X-Gm-Message-State: APjAAAWmZJImRpZbOW48j0Hv6oHvfV83EUaHF2MEfQJM0Ch5HCWqlR+x
	DHJw0mgm95HUWQcW3MKntAeFUrUzGEhtt4uXuU2C2feojno=
X-Google-Smtp-Source: APXvYqw5tvEAxqC7CDdPb1aYcQFGysgnFtrRX/20DjHdlCTutwgys0GbxGwSoA/jzZEuJtH45eLqfdzVjUdXJEGgJgE=
X-Received: by 2002:a37:b245:: with SMTP id b66mr37748125qkf.337.1567573860292;
	Tue, 03 Sep 2019 22:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <1567401728-113652-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1567401728-113652-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Sep 2019 22:10:46 -0700
Message-ID: <CAMKF1spnx4pPh5ObnVTyahxE6Z8y7GCkv3GC_oCwf-fL_eYu9A@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-cmd2: Add python3 version
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
X-List-Received-Date: Wed, 04 Sep 2019 05:11:01 -0000
Content-Type: text/plain; charset="UTF-8"

03:10:10 ERROR: Nothing RPROVIDES 'python3-colorama' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
RDEPENDS on or otherwise requires it)
03:10:10 ERROR: Nothing RPROVIDES 'python3-cmd2-dev' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
RDEPENDS on or otherwise requires it)
03:10:10 No eligible RPROVIDERs exist for 'python3-cmd2-dev'
03:10:11 ERROR: Nothing RPROVIDES 'python3-cmd2' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
RDEPENDS on or otherwise requires it)
03:10:11 No eligible RPROVIDERs exist for 'python3-cmd2'

On Sun, Sep 1, 2019 at 10:23 PM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Providing a python3 version of python-cmd2.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-cmd2.inc       | 13 +++++++++++++
>  .../recipes-devtools/python/python-cmd2_0.9.16.bb | 15 ++-------------
>  .../python/python3-cmd2_0.9.16.bb                 |  9 +++++++++
>  3 files changed, 24 insertions(+), 13 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-cmd2.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc b/meta-python/recipes-devtools/python/python-cmd2.inc
> new file mode 100644
> index 000000000..1a0be778b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-cmd2.inc
> @@ -0,0 +1,13 @@
> +SUMMARY = "Extra features for standard library's cmd module"
> +HOMEPAGE = "http://packages.python.org/cmd2/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
> +
> +SRC_URI[md5sum] = "df35bb2dca8f5e1f6090e1f0aa02960a"
> +SRC_URI[sha256sum] = "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
> +
> +inherit pypi
> +
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
> index 94db37a2d..17b6ae285 100644
> --- a/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
> +++ b/meta-python/recipes-devtools/python/python-cmd2_0.9.16.bb
> @@ -1,14 +1,5 @@
> -SUMMARY = "Extra features for standard library's cmd module"
> -HOMEPAGE = "http://packages.python.org/cmd2/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
> -
> -SRC_URI[md5sum] = "df35bb2dca8f5e1f6090e1f0aa02960a"
> -SRC_URI[sha256sum] = "4b78379d53aff811d1deac720bbe71661769822a5fb2d830cd730656d180fb3d"
> -
> -inherit pypi setuptools
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +inherit setuptools
> +require python-cmd2.inc
>
>  RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-doctest \
> @@ -21,5 +12,3 @@ RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-threading \
>      ${PYTHON_PN}-textutils \
>      "
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
> new file mode 100644
> index 000000000..f5c5c7e1a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.16.bb
> @@ -0,0 +1,9 @@
> +inherit setuptools3
> +require python-cmd2.inc
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-pyperclip \
> +    ${PYTHON_PN}-colorama \
> +    ${PYTHON_PN}-attrs \
> +    ${PYTHON_PN}-wcwidth \
> +    "
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

