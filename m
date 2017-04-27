Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 317FD719B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 23:05:47 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id u65so28894742wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 16:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h81bqVFHNemF0SP9UKmm5EArGtBF2v6bVrNJqdYJmHU=;
	b=qbYlk/5AtrkhqRgiOFFLEAjNlcLclD1iKCf15BpeZ2321eMHj0sKmHcv48w/Mqmwm2
	/bmJJON8a5GaJKQlDHxvz6aJqNZ3E6FaMyvQ4FTwlpt5Z2X9D3rkLHorOo2Nf3SGH7O6
	ToShaY+qzuVe0QjFU7+1pdCT3wz+RroDAnqJtACGcSXbVGF2XES+hXQ/cG1Og/1fxUJP
	GcnZbfOwhhm2H/zG5R7egMH57KQGovt+2/8nCLZg3GETeooauclf5qMprtCmMeMJPQVw
	4GQ9DExzsZxasSlQ44qnqIL+cONrJMs77zkQF8r63LvYTTbwNLUtnUiErauz9DPEGr9a
	g4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h81bqVFHNemF0SP9UKmm5EArGtBF2v6bVrNJqdYJmHU=;
	b=cFRPyPozEgH+WIBjTs0Df+N9+MZyLhQaUHSjE3Wuvm3dZiBtpRj/wMXVTFOUkcSW8b
	QHZlNZnZ1JfNa5JTYYanbAVjkwvaM8uakP+eqzCFhRRh/M3ajQQP2zDt7hgVm420O9wm
	cZWaK4KqIh0K8nnnDf4J5Lq0w3ZKEZWhB6cYcXDzf1dhpGxdcnB0kJf+jP/JAYs2D3cs
	dQ4re66VyhEHy8s8TZQww9xortliUnFewGZAoasD9/e/mD4GlzH2kFbLozENzopeJQEN
	XUfK46Yaz9qYibb5t7JshWVw0rCV2P8eVt4OWNdNtdik7c/6stMEXCR6HPsk7EqG1PRb
	2tBg==
X-Gm-Message-State: AN3rC/6DX1fmLAP4uJpVQurctfmu3sKfOzjeqUOVl/z6x02GG1xDWVh1
	b8OBg4hF76YW3n0EMEXIW6Z65uNuTw==
X-Received: by 10.80.208.210 with SMTP id g18mr6377278edf.143.1493334348045;
	Thu, 27 Apr 2017 16:05:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Thu, 27 Apr 2017 16:05:17 -0700 (PDT)
In-Reply-To: <20170427211948.12255-2-andrej.rode@ettus.com>
References: <20170427211948.12255-1-andrej.rode@ettus.com>
	<20170427211948.12255-2-andrej.rode@ettus.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2017 16:05:17 -0700
Message-ID: <CAMKF1sosx80ehDcFOKdt88GDRTbW3i577y-zxFdZ4V4OuQkjYQ@mail.gmail.com>
To: Andrej Rode <andrej.rode@ettus.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 27 Apr 2017 23:05:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 27, 2017 at 2:19 PM, Andrej Rode <andrej.rode@ettus.com> wrote:
> Add recipe for python-mprpc, a messagepack RPC library for python
>
> Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> ---
>  .../python-mprpc/files/0001-fix_setup_py.patch     | 34 ++++++++++++++++++++++
>  .../python-mprpc/python-mprpc_0.1.13.bb            | 17 +++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch
>  create mode 100644 meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
>
> diff --git a/meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch b/meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch
> new file mode 100644
> index 0000000..f5df9b9
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch
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
> diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
> new file mode 100644
> index 0000000..78df00a
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "A gevent based messagpack rpc library"
> +DESCRIPTION = "mprpc is a fast implementation of the messagepack rpc protocol for python. \
> +It is based on gevent for handling connections and enabling concurrent connections."
> +HOMEPAGE = "https://github.com/studio-ousia/mprpc"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
> +DEPENDS += "python-gevent"
> +RDEPENDS_${PN} += "python-gevent python-msgpack python-gsocketpool"
> +
> +SRC_URI_append = " \
> +    file://0001-fix_setup_py.patch;patch=1;pnum=1 \

I think you could just do SRC_URI += and remove patch=1 and pnum=1
they are defaults.

> +"
> +
> +SRC_URI[md5sum] = "449e6239eb5ff07b9cceb86e1ab0c2ee"
> +SRC_URI[sha256sum] = "5881cc7fbb8de814e2b4aa5958bfe147c5c301e46749190f0e6abf373cf56d82"
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

