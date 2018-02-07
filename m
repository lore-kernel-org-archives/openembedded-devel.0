Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6C55C7807D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Feb 2018 09:05:39 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id t94so145676wrc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Feb 2018 01:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zPoWTIjQBmxMJI0oFzArtyuWa0rf/5UnZboG9Tpmjgc=;
	b=c+Dgzs6PuZlu33I1/1+Z5841s++dS8EfiI7+kP6nejuZddt85eH4QvtjnXwpxV857V
	4+qTp5V/xmnSJOZC0uh8JaGGhl2ju6p8BWBRWkngLsIV/zu7kHrm4eagYyhEQ7rNR4ia
	ic7Xrs9tg+lRr7U28jXeraR3iwbVmTPanazP0fNFdzsM6eNWHS9l3c4gCh0HbdXESKh7
	FcU4PBvDrhJOiExUgpP14eFC2npl89RrQOgQRcpbpb4Bal3dvyRrIg1riw9gYPXlvBDr
	Nw0O4oDvEVcZEI3VAHSZlZUg4S40Oef5z8/cbHdUER1G7JAzYqS4wRfyhwBawPyn/YRp
	mDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zPoWTIjQBmxMJI0oFzArtyuWa0rf/5UnZboG9Tpmjgc=;
	b=AJxtPDdevPZXdRL45LsCD5eKwHZ9DEfK+6E7ilF27bTScNJ/Ex4wrAzdn04gn3UPPA
	1x+yyeCj1oM2FNrW0y83bPNWDT2ox2HPSP42O6kbsOK/YeJg3qabg0Ap8GLVvnr3a5LC
	PYw1co+zY9BQ7cQIDHFOpeQQWxnbZ+6cCwT6zuxBBdcE9uhFfZLs+13Td1xl+FjUWTRG
	wvLi/jG7gpWUtMlGJs8Y4UUxZ+kZ7ifd4Y1sEmHYq3Z4UpRCpygR9OqqcpuieViFO2yX
	Ll8SEdNr/HIKm9ZoAXZ0ZGMwJ/P/OcvTYzkup7jKuFz58Nhx7ZYWXRStSYOpDZa6nWcu
	waKw==
X-Gm-Message-State: APf1xPD7l2ZAyIf0zNuhBIpb/UWLQ9hAOs5xmcZlTJ3xAtEkZ2JEWIwi
	ApaWJUZxizzNKZDqcb7AjvCfIkym7wMQKL/0WRsC5A==
X-Google-Smtp-Source: AH8x225oCI7JRQs3627rXYn8o0ak2+ZhQkgLu+0JnU+wb6q4JP9j8h2wiOxeXJREmV2XZWE49Mop/hIC6dkOfz14vAc=
X-Received: by 10.223.171.24 with SMTP id q24mr4997314wrc.206.1517994340249;
	Wed, 07 Feb 2018 01:05:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 7 Feb 2018 01:05:39 -0800 (PST)
In-Reply-To: <1516553654-14732-1-git-send-email-derek@asterius.io>
References: <1516553654-14732-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 7 Feb 2018 10:05:39 +0100
Message-ID: <CA+chaQcGrgxOvQ-7QC46eOZWWUQLKoTW=Mm+nzWDqA3hwn0MnQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-smbus: update to version 4.0
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
X-List-Received-Date: Wed, 07 Feb 2018 09:05:39 -0000
Content-Type: text/plain; charset="UTF-8"

We might need another upgrade for this after last oe-core changes, now it
fails with:

smbusmodule.c:26:10: fatal error: linux/i2c-dev-user.h: No such file or
directory
 #include <linux/i2c-dev-user.h>
          ^~~~~~~~~~~~~~~~~~~~~~

Do you have something already in your queue?

On Sun, Jan 21, 2018 at 5:54 PM, Derek Straka <derek@asterius.io> wrote:

> Fixes issues related to incompatibility with i2c-tools upgrade in oe-core
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-smbus.inc               | 7
> +++----
>  .../python/{python-smbus_3.1.2.bb => python-smbus_4.0.bb}          | 0
>  .../python/{python3-smbus_3.1.2.bb => python3-smbus_4.0.bb}        | 0
>  3 files changed, 3 insertions(+), 4 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-smbus_3.1.2.bb =>
> python-smbus_4.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-smbus_3.1.2.bb =>
> python3-smbus_4.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-smbus.inc
> b/meta-python/recipes-devtools/python/python-smbus.inc
> index de2a270..0bca58f 100644
> --- a/meta-python/recipes-devtools/python/python-smbus.inc
> +++ b/meta-python/recipes-devtools/python/python-smbus.inc
> @@ -2,10 +2,9 @@ SUMMARY = "Set of i2c tools for linux - Python module"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=17;md5=
> fa24df321a520ff8e10f203425ab9fa8"
>
> -SRC_URI = "http://downloads.yoctoproject.org/mirror/
> sources/i2c-tools-${PV}.tar.bz2 \
> -"
> -SRC_URI[md5sum] = "7104a1043d11a5e2c7b131614eb1b962"
> -SRC_URI[sha256sum] = "db5e69f2e2a6e3aa2ecdfe6a5f490b
> 149c504468770f58921c8c5b8a7860a441"
> +SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz
> "
> +SRC_URI[md5sum] = "d92a288d70f306d3895e3a7e9c14c9aa"
> +SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f
> 2054bb39f19961d67e0c91610f071ca403"
>
>  DEPENDS += "i2c-tools"
>
> diff --git a/meta-python/recipes-devtools/python/python-smbus_3.1.2.bb
> b/meta-python/recipes-devtools/python/python-smbus_4.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-smbus_3.1.2.bb
> rename to meta-python/recipes-devtools/python/python-smbus_4.0.bb
> diff --git a/meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb
> b/meta-python/recipes-devtools/python/python3-smbus_4.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb
> rename to meta-python/recipes-devtools/python/python3-smbus_4.0.bb
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

