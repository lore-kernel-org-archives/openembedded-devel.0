Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 53FA671A65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 12:25:30 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id w64so54966421wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KcpAmFQkPBwaAnUCg1IVl75EJG5HbzK17EplhbCroq4=;
	b=A8aZzoxGWSQrlwUt2YhWbYf6OTGEI2gBsPq9C2WIsk+r2Gxm7ScAY6+xvte5h/LpvV
	UuwuSNvKF7dcs5GEGV8iA3NWgJPI8dIKTv/wnhY7IKXr6J2gIHuO44ZDbsRCwQzGEc4e
	WxchgZlCfTIb6/n605kXSuN+y/V4nAbrgRepW/QbLGmVXJsS4T1cyY2RTpkJuHisD7oi
	iOBFX0vNeR7zoHYuLRXI5/IB8oWwkK+bwpbibDQwa978gNnjJXypYhhLKjOWWwCIQOp7
	ATlmPyZc2oc2vwgb7MuNp00/rWMXeKoLaxPLzPrOjmEZ1tPheVoIYezwSk4VtqeuuAku
	dxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KcpAmFQkPBwaAnUCg1IVl75EJG5HbzK17EplhbCroq4=;
	b=EkazrO2Tg0mKG6NXzCbpuPMpOSbfn0x10eQYIanpnrVtDz+2pHlPrWU9wDJCaMXktk
	i0/G5sJTYnvew2WY4Uaeb+L7u1JN9zB2n38Ua5wDzC1Wyq945YlZFpzFGY3DkHMTT0Ei
	kbGkNfHjEgDaobh7+xKF3Wgd8mCN0UrlSALqHYi4I/tnb6Dxk7HRP3YVZ5+AwzIElWG8
	ZiNIZSUmgTpowzdx9HTgmMu+4sAIIsi5tq77eFNRnl6NbcgoWuT6JyyCE/H2OHlnQGhI
	w10dSzwI7+Pxmaw3HrlrKR9PvxovkBeSE86i7OnoZ2AWD68xZOIzVwAEZ3uZ6MczueVj
	kw8g==
X-Gm-Message-State: AN3rC/7PQNNIo59j5szdh/9MRtShigJXZ/NatbDIOXJDFzNZNVW+qK7P
	+Dsl81u3RCZMBHyk4IEFe4+PEbuo4Q==
X-Received: by 10.28.13.71 with SMTP id 68mr12507656wmn.124.1492518331884;
	Tue, 18 Apr 2017 05:25:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Tue, 18 Apr 2017 05:25:31 -0700 (PDT)
In-Reply-To: <20170413185813.25145-1-andrej.rode@ettus.com>
References: <20170413185813.25145-1-andrej.rode@ettus.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Apr 2017 14:25:31 +0200
Message-ID: <CA+chaQcoO1EHkdOJoQziHRaur7oQjOVjSprbJtUrV+_h0WB+WQ@mail.gmail.com>
To: Andrej Rode <andrej.rode@ettus.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v3 1/2] python-gsocketpool: add new recipe
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
X-List-Received-Date: Tue, 18 Apr 2017 12:25:31 -0000
Content-Type: text/plain; charset=UTF-8

Why patch=1 parameter? it will be autumatically recognized and applied as
patch thanks to .patch extension.

On Thu, Apr 13, 2017 at 8:58 PM, Andrej Rode <andrej.rode@ettus.com> wrote:

> Adds recipe for python-gsocketpool as a dependency for python-mprpc
>
> Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> ---
>  .../files/0001-fix_setup_py.patch                  | 35
> ++++++++++++++++++++++
>  .../python-gsocketpool/python-gsocketpool_0.1.5.bb | 16 ++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta-python/recipes-connectivity/python-
> gsocketpool/files/0001-fix_setup_py.patch
>  create mode 100644 meta-python/recipes-connectivity/python-gsocketpool/
> python-gsocketpool_0.1.5.bb
>
> diff --git a/meta-python/recipes-connectivity/python-
> gsocketpool/files/0001-fix_setup_py.patch b/meta-python/recipes-
> connectivity/python-gsocketpool/files/0001-fix_setup_py.patch
> new file mode 100644
> index 0000000..a9135a3
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-gsocketpool/files/0001-fix_
> setup_py.patch
> @@ -0,0 +1,35 @@
> +From 2d47a5df58802173bf90d760b1d6f520aeea76fc Mon Sep 17 00:00:00 2001
> +From: Andrej Rode <andrej.rode@ettus.com>
> +Date: Mon, 10 Apr 2017 16:47:41 -0700
> +Subject: [PATCH] setup: remove find_packages since that would install
> tests as
> + a package as well
> +
> +Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
> +---
> + setup.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 6b37016..a1f11a7 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1,6 +1,6 @@
> + # -*- coding: utf-8 -*-
> +
> +-from setuptools import setup, find_packages
> ++from setuptools import setup
> +
> + setup(
> +     name='gsocketpool',
> +@@ -9,7 +9,7 @@ setup(
> +     author='Studio Ousia',
> +     author_email='ikuya@ousia.jp',
> +     url='http://github.com/studio-ousia/gsocketpool',
> +-    packages=find_packages(),
> ++    packages=['gsocketpool'],
> +     license=open('LICENSE').read(),
> +     include_package_data=True,
> +     classifiers=(
> +--
> +2.10.2
> +
> diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-
> gsocketpool_0.1.5.bb b/meta-python/recipes-connectivity/python-
> gsocketpool/python-gsocketpool_0.1.5.bb
> new file mode 100644
> index 0000000..f86152c
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-gsocketpool/python-
> gsocketpool_0.1.5.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "A simple connection pool for gevent"
> +DESCRIPTION = "creates a pool of connections that can be used with gevent"
> +HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
> +DEPENDS += "python-gevent"
> +RDEPENDS_${PN} += "python-gevent"
> +
> +SRC_URI_append = " \
> +    file://0001-fix_setup_py.patch;patch=1;pnum=1 \
> +"
> +
> +SRC_URI[md5sum] = "04f618864b18d6b06f774994f172ef49"
> +SRC_URI[sha256sum] = "b6b73deab9bcbc428d4813697eebe5
> c3b9c40a971f62e13607b881aa749af9d0"
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

