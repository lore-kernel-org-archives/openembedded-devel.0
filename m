Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 29A9B6FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 18:35:18 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id q21so74998530iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Q28b+/kGRFEW/YOgoYbvXX6buapeDrWti3b/opMUeMM=;
	b=ev+FkDHpA1NgaTsrhX97mJnxp9nlUyZwKfB2gZFtAZ+JWBZEk+S+7R8gxgphRfwQNI
	JuzRKaqWDk0lsGAGBhV1K24qER/j2VxHMzbHzQ/KcsOBuLv2A/nTrUlTK4S9/lnSnVPg
	1+75vMCVF+RGQgcUu+TS4z94Bl/vxnaRzCUVWNMoJqdUxOGSBWIVftgen/TTSskKDrOB
	CTX/oeiPJLF34EzDpm6DDAAh3E/gF72qs41WmWKZRU3MIzZp20WHCfu+V+Sc+/v4V9fw
	u+53we6ULzdihzqGGbYWEYo7mzBEDRwJ3PXL3fG4q3c/AtDa+Gl8Dp82Ej8+99KtYUgO
	DO3w==
X-Received: by 10.107.34.79 with SMTP id i76mr6542662ioi.195.1451500519603;
	Wed, 30 Dec 2015 10:35:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 30 Dec 2015 10:34:50 -0800 (PST)
In-Reply-To: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Dec 2015 10:34:50 -0800
Message-ID: <CAMKF1sqWtAXeVqRvVNOarUr9VupQpk5zANC6HR-tVXrOoeQ27g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mariadb: -native also needs gold workaround
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
X-List-Received-Date: Wed, 30 Dec 2015 18:35:19 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 30, 2015 at 5:57 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> When the host distro uses gold mariadb-native fails to build.
>

what is the failure ?

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
> index a6826c3..6a55476 100644
> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> @@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
>  # https://mariadb.atlassian.net/browse/MDEV-5982
>  TARGET_CFLAGS += "-fuse-ld=bfd"
>
> +BUILD_CFLAGS += "-fuse-ld=bfd"
> +BUILD_CXXFLAGS += "-fuse-ld=bfd"
> +
>  EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
>                   -DWITH_JEMALLOC=no \
>                   -DWITHOUT_TOKUDB=TRUE \
> --
> 2.0.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

