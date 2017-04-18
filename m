Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 475E27197E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 12:25:16 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id u2so53417337wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Sn1S7qfceRhb1x6E4B6LofB6ibV8InlNfXeCQjcXPHc=;
	b=WDTcKuickW0MDid/wMp8pm27WkWdU1yfRIXlyteQJAFLrSZh9ixSp/oRIGALyDzNzQ
	FDx6+ifbsUXxWfFLu59aSY0rTzWRII2qKcifoGLxsPipruJ8LaHwqwVy+Oerh94Rxv/+
	AdtrJZyOmFJwHC7YeQwpjRc1qWB14vuv9/yrvtdXsfzTbPgesf6MDM/v/RGBcDkhc9Z1
	W0wqEEyHOF+qqjWEA3Mw23LViaEvsKU5i2tQ6nfKGzQYEaYkcthNjQaqw1rXlbpSziM2
	iYans4cN8enirn1nfi3cboyF4+BkwatEcipKrX16RrOvPfAnMs8EhTMQ0ksTbPGnQGv+
	/rJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sn1S7qfceRhb1x6E4B6LofB6ibV8InlNfXeCQjcXPHc=;
	b=Df9isRx8VKnsHliq7tAaTUcavRgd2Z6wvHJUeMUuWUN71EscaKNcRTT2Il139WXudP
	mgMBjoNgv8XF4xdAtxNxHxX2pF+yWXE/3A5u9rbA5UnA8xFvEAp9GzSd/tz7S16dbWzH
	6m7IaIC1ZaP3anF8nmX0c/BEIgfyxfp/y1f9YtaxSfVCS3baocU8xpT9zuXuUFf9vpur
	Jprh5RsmmWCtWgTy1gnV5n/7c2hdTBtceamdjl9wB4UPPCGzHitHL9W3cIIVkEPHCOiD
	wDoRL7mEvEO764Texstt3Cbk3gcs8DxhFzvRgOiBkR0OA1aBwDtkGVQvEqSHJQAYccm6
	g0Yw==
X-Gm-Message-State: AN3rC/4oqu8sNvWoTd+4EmXvk2b1OiX2WgmbTLGHvsmUfbrPreli/1jd
	nkIUb4PH2r0sDG4BrkjHxlf/M5Z7+g==
X-Received: by 10.28.175.209 with SMTP id y200mr13664521wme.81.1492518317853; 
	Tue, 18 Apr 2017 05:25:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Tue, 18 Apr 2017 05:25:17 -0700 (PDT)
In-Reply-To: <20170413185813.25145-2-andrej.rode@ettus.com>
References: <20170413185813.25145-1-andrej.rode@ettus.com>
	<20170413185813.25145-2-andrej.rode@ettus.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Apr 2017 14:25:17 +0200
Message-ID: <CA+chaQcvjZtqeavTSZvBMFrZcGBtFTE645h+4pyWxsF7g8ROdQ@mail.gmail.com>
To: Andrej Rode <andrej.rode@ettus.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v3 2/2] python-mprpc: add new recipe
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
X-List-Received-Date: Tue, 18 Apr 2017 12:25:17 -0000
Content-Type: text/plain; charset=UTF-8

Why patch=1 parameter? it will be autumatically recognized and applied as
patch thanks to .patch extension.

On Thu, Apr 13, 2017 at 8:58 PM, Andrej Rode <andrej.rode@ettus.com> wrote:

> Add recipe for python-mprpc, a messagepack RPC library for python
>
> Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> ---
>  .../python-mprpc/files/0001-fix_setup_py.patch     | 34
> ++++++++++++++++++++++
>  .../python-mprpc/python-mprpc_0.1.13.bb            | 17 +++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta-python/recipes-connectivity/python-mprpc/
> files/0001-fix_setup_py.patch
>  create mode 100644 meta-python/recipes-connectivity/python-mprpc/pyth
> on-mprpc_0.1.13.bb
>
> diff --git a/meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch
> b/meta-python/recipes-connectivity/python-mprpc/
> files/0001-fix_setup_py.patch
> new file mode 100644
> index 0000000..f5df9b9
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-mprpc/
> files/0001-fix_setup_py.patch
> @@ -0,0 +1,34 @@
> +From bda99eab9036d46e7bb06b446d11cab0b1dd8093 Mon Sep 17 00:00:00 2001
> +From: Andrej Rode <andrej.rode@ettus.com>
> +Date: Mon, 10 Apr 2017 16:49:50 -0700
> +Subject: [PATCH] setup: remove find_packages and only install mprpc
> +
> +Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> +---
> + setup.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 5001d0c..4c0ba75 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1,6 +1,6 @@
> + # -*- coding: utf-8 -*-
> +
> +-from setuptools import setup, Extension, find_packages
> ++from setuptools import setup, Extension
> +
> + setup(
> +     name='mprpc',
> +@@ -10,7 +10,7 @@ setup(
> +     author='Studio Ousia',
> +     author_email='ikuya@ousia.jp',
> +     url='http://github.com/studio-ousia/mprpc',
> +-    packages=find_packages(),
> ++    packages=['mprpc'],
> +     ext_modules=[
> +         Extension('mprpc.client', ['mprpc/client.c']),
> +         Extension('mprpc.server', ['mprpc/server.c'])
> +--
> +2.10.2
> +
> diff --git a/meta-python/recipes-connectivity/python-mprpc/pyth
> on-mprpc_0.1.13.bb b/meta-python/recipes-connectivity/python-mprpc/pyth
> on-mprpc_0.1.13.bb
> new file mode 100644
> index 0000000..78df00a
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "A gevent based messagpack rpc library"
> +DESCRIPTION = "mprpc is a fast implementation of the messagepack rpc
> protocol for python. \
> +It is based on gevent for handling connections and enabling concurrent
> connections."
> +HOMEPAGE = "https://github.com/studio-ousia/mprpc"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
> +DEPENDS += "python-gevent"
> +RDEPENDS_${PN} += "python-gevent python-msgpack python-gsocketpool"
> +
> +SRC_URI_append = " \
> +    file://0001-fix_setup_py.patch;patch=1;pnum=1 \
> +"
> +
> +SRC_URI[md5sum] = "449e6239eb5ff07b9cceb86e1ab0c2ee"
> +SRC_URI[sha256sum] = "5881cc7fbb8de814e2b4aa5958bfe1
> 47c5c301e46749190f0e6abf373cf56d82"
> +
> +inherit pypi setuptools
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

