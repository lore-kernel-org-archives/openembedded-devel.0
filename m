Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id EC49F7F440
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 21:43:45 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id x134so7242414qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 14:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BFM2/VKe2DGYEGEy03Z+vWuigRHKFhXGGLsTyejPI2E=;
	b=XGAHQ7eHIz2Xg1zWIRvHUMv3jUApnPNpg9pGm/hlGS8ky1a2vFtFH8O7LOUCLIuGWS
	ab5X6wVvHfBViAx10iXbNnbqwT+DIpMzTbkZq+aWUP7WXaDE36JDxMHpjma1bD2T+mSd
	N/HJfTZqfTZm65rZEqzSPvOwIjQa9RKu9zwbJSTPJbmNz2EPkXDJs9r1GtLlvSpuo2IJ
	Duxq+PgwUz0VO3hWDCjZfo6Mjy2KbyLpYXym8n4GSbqpQsJZ1uR+znE6zw31cCSWodrz
	fzpWicJWptp6ysfvGlwTA1eKiFowhl8KpVOOHohENCLKJlox0G/qO2XziS5ZqeaeBTwE
	d7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BFM2/VKe2DGYEGEy03Z+vWuigRHKFhXGGLsTyejPI2E=;
	b=oTYkHR8IDakIb6hJxpwHiYm3b2hnM9GTOE+Gj9ruU/vbo7nWRTU9ZjuYmNMZzsgdEp
	Usm3Yv9Eu1q9hVPyAM4evx6YCyPC6RsjsJgQc9JYrCcAB2RbQrvfFbCQHOZkOcA9gpVt
	up+UycXvoWwz1PfhrBDTBexB+dbCu8SRgFWhORHoGUwxGQNr0tajVNx5i8xVMNaJIDK3
	iXvnolap05WQc9vK2wZNo5Eto107LV+lqJsTDblG7RBm3SByASuX46zsQsG7gnKMbYW0
	G2cI0xJVpnZhYOX4YSmy1c/zsDJIJYkqjJU2oRMwmWOR2XRQON7XZbazoU1pwTgTgbRp
	5aHA==
X-Gm-Message-State: APjAAAWm9CpUaNx2KyRwZEanFwfWiFLXIvnn5N06pKABTZsOMe6co6Km
	usQ9n7l1F330osQWL48o1WaJVHelzy9tbGHezDZHtnwO
X-Google-Smtp-Source: APXvYqxDr5GVmBXyOpeNCmFuBpPgfrzsliSiJdPlu8x1hptkfz43kYhiZsUEY6hUvJ+COxPSA3QwvvahE1trjUlBk1Y=
X-Received: by 2002:a37:b002:: with SMTP id z2mr10823768qke.71.1567806226370; 
	Fri, 06 Sep 2019 14:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190906205120.19040-1-alistair.francis@wdc.com>
	<20190906205120.19040-3-alistair.francis@wdc.com>
In-Reply-To: <20190906205120.19040-3-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2019 14:43:20 -0700
Message-ID: <CAMKF1srPxkcN-pFB_DUQustRCSVuiEn7phPEkAhS6E-c+oSY_A@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 3/3] python3-pytest-asyncio: Initial commit of 0.10.0
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
X-List-Received-Date: Fri, 06 Sep 2019 21:43:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 6, 2019 at 2:03 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../python/python-pytest-asyncio.inc                | 13 +++++++++++++
>  .../python/python3-pytest-asyncio_0.10.0.bb         |  2 ++
>  2 files changed, 15 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-pytest-asyncio.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pytest-asyncio.inc b/meta-python/recipes-devtools/python/python-pytest-asyncio.inc
> new file mode 100644
> index 000000000..ad549690b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pytest-asyncio.inc
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
> +HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
> +LICENSE = "Apache2"

Please use Apache-2.0

> +LIC_FILES_CHKSUM = "file://README.rst;md5=ae62268d207c73b615fbefddaf91a881"
> +
> +SRC_URI[md5sum] = "247a7ec32f24a185341327c42a0f85bf"
> +SRC_URI[sha256sum] = "9fac5100fd716cbecf6ef89233e8590a4ad61d729d1732e0a96b84182df1daaf"
> +
> +inherit pypi
> +
> +DEPENDS += "${PYTHON_PN}-pytest-native"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
> new file mode 100644
> index 000000000..09f26f8d1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-pytest-asyncio.inc
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

