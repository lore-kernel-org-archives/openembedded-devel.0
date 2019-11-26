Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id E39CE7FBCD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 22:38:36 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d13so17745692qko.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 14:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fTx5rBMjhVjLi7d2yIEn8rTubcC5h3T1hNKvRsVfWDs=;
	b=ZTqfAo13fc138X95b023LcY3IRKfROGcbVN0lfZ9uusHw7sx83ZtPXH4+xTgBJwHXm
	G6h2spNH2FB5ANzrCH/Go4dgeC3KjSYyoULh4D6ub6f25vBizgZWO9h9YBYswzQhlNDs
	pItWyEn4acRvRW5EHbdhsiAYEJRzfGDiU0lLodxVANi2Gq89BGwbwH5R7l60SgK7nvwk
	KTzX7qouXMG/MvoNPlYjIGyKSyilzsQGEpEOH/eZOu8sfyl4rWCxYGPvoV6Ft7CDl+vP
	b9DPEIdf66UQdNl0KlZVDT13DlRG3ZGrPXyQntWss5Y6/ifH+gggNvvpY2mN40SKpfjN
	PtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fTx5rBMjhVjLi7d2yIEn8rTubcC5h3T1hNKvRsVfWDs=;
	b=i56TpXvbvbGr8vvTvi3VWoWmo9QQLDT3KlbGqebeTtw3tFe+O8MqNScKj3rpKH8UXc
	TG7dJvMrg++n9k/1rGZV3ikeoDt/8n6gtTtV3fMVWbV2Rz63wHmGrfVgek8iJQ06cNxs
	4DE1z3ekZptl1fYTevHGLa2je17YP0OMt0BI93A3f2LuHPvOuZ8Rqaen1RVc1K+DvYqd
	3haaPi247t4JGykHn9SjsNtN23AznITRZ1dFRi29+/J8cx7eIz9YRKkYwVHJMRXpc2Q1
	Ml56SKh9A95eXJlZUUhENX+DKUwvjVkdQe05Lz0QcT/vRRmbbGdwwhtZ6LBrJHcLM6h2
	qfJg==
X-Gm-Message-State: APjAAAUR3YctMxO3so5AQ4PU6biu05oiwpJKJmP1NXwgv8FxycoVlzw0
	SJZUtK1HFbpYrgX/RDHiZxGw/xVKjLMp1bbksKg=
X-Google-Smtp-Source: APXvYqxk2SaVvVnmPYBHe0LaoVfDXDgdQqy3Re/ueTY3DrIcYRUwD1rRLDsDA90lQtwR1vaosk6GMDFLDp2LY5u4/Zs=
X-Received: by 2002:a37:bf82:: with SMTP id p124mr900799qkf.337.1574807917533; 
	Tue, 26 Nov 2019 14:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20191126210206.15650-1-ross.burton@intel.com>
In-Reply-To: <20191126210206.15650-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Nov 2019 14:38:10 -0800
Message-ID: <CAMKF1srh--y6WWUA+LoW0gK2nFR6tjAaWc1Qz93uupaPX5ZV+g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] htop: use Python 3
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
X-List-Received-Date: Tue, 26 Nov 2019 22:38:38 -0000
Content-Type: text/plain; charset="UTF-8"

I had similar fix staged

On Tue, Nov 26, 2019 at 1:02 PM Ross Burton <ross.burton@intel.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-oe/recipes-support/htop/files/py3.patch | 15 +++++++++++++++
>  meta-oe/recipes-support/htop/htop_2.2.0.bb   |  3 ++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/htop/files/py3.patch
>
> diff --git a/meta-oe/recipes-support/htop/files/py3.patch b/meta-oe/recipes-support/htop/files/py3.patch
> new file mode 100644
> index 0000000000..fd28d51d5c
> --- /dev/null
> +++ b/meta-oe/recipes-support/htop/files/py3.patch
> @@ -0,0 +1,15 @@
> +Use Python 3 explicitly instead of python, which we don't export to HOSTTOOL.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/scripts/MakeHeader.py b/scripts/MakeHeader.py
> +index 349531b..3336dea 100755
> +--- a/scripts/MakeHeader.py
> ++++ b/scripts/MakeHeader.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + import os, sys, string, io
> + try:
> +    from StringIO import StringIO
> diff --git a/meta-oe/recipes-support/htop/htop_2.2.0.bb b/meta-oe/recipes-support/htop/htop_2.2.0.bb
> index 01c856d123..5724c5b8c6 100644
> --- a/meta-oe/recipes-support/htop/htop_2.2.0.bb
> +++ b/meta-oe/recipes-support/htop/htop_2.2.0.bb
> @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
>  DEPENDS = "ncurses"
>
>  SRC_URI = "http://hisham.hm/htop/releases/${PV}/${BP}.tar.gz \
> -           file://0001-Use-pkg-config.patch"
> +           file://0001-Use-pkg-config.patch \
> +           file://py3.patch"
>  SRC_URI[md5sum] = "0d816b6beed31edc75babcfbf863ffa8"
>  SRC_URI[sha256sum] = "d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

