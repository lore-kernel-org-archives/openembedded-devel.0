Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4652877EBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 15:28:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wDyQK3wPtz1r26D;
	Fri, 28 Apr 2017 17:28:41 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wDyQK3P2vz3hjk9;
	Fri, 28 Apr 2017 17:28:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id dd3Psg8p0Ky5; Fri, 28 Apr 2017 17:28:38 +0200 (CEST)
X-Auth-Info: TltGVtPWG9TeRY8gsMUhBC+7fut0f/9KrRBsFPtgm00=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 28 Apr 2017 17:28:37 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <20170407213646.29455-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <b5cfca0f-b88b-47dc-3379-9b4a0fe5429a@denx.de>
Date: Fri, 28 Apr 2017 17:28:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170407213646.29455-1-marex@denx.de>
Subject: Re: [PATCH] fbida: Fix compile-host-path error
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
X-List-Received-Date: Fri, 28 Apr 2017 15:28:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 04/07/2017 11:36 PM, Marek Vasut wrote:
> Remove the explicit reference to /usr/local/* in Variables.mk.
> This is completely bogus and causes failure during cross-compilation.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Can we have this applied so that the package stops failing to build ? Thanks

> ---
>  meta-oe/recipes-graphics/fbida/fbida_2.10.bb       |  4 ++-
>  .../fbida/files/0001-Avoid-using-host-path.patch   | 34 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
> 
> diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
> index c14fc9b68..459a1e8d2 100644
> --- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
> +++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
> @@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>  
>  DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif"
>  
> -SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz"
> +SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz \
> +	   file://0001-Avoid-using-host-path.patch \
> +	   "
>  SRC_URI[md5sum] = "09460b964b58c2e39b665498eca29018"
>  SRC_URI[sha256sum] = "7a5a3aac61b40a6a2bbf716d270a46e2f8e8d5c97e314e927d41398a4d0b6cb6"
>  
> diff --git a/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch b/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
> new file mode 100644
> index 000000000..cdf2c25d3
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
> @@ -0,0 +1,34 @@
> +From 8d8fa9f22d9f6a95523bac63ac3af724faf5ff92 Mon Sep 17 00:00:00 2001
> +From: Marek Vasut <marex@denx.de>
> +Date: Fri, 7 Apr 2017 23:26:09 +0200
> +Subject: [PATCH] Avoid using host-path
> +
> +Remove the explicit reference to /usr/local/* , this is completely
> +bogus and causes trouble during cross-compilation.
> +
> +Signed-off-by: Marek Vasut <marex@denx.de>
> +Upstream-Status: Inappropriate [upstream requires this]
> +---
> + mk/Variables.mk | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/mk/Variables.mk b/mk/Variables.mk
> +index 99f787c..3ffd87a 100644
> +--- a/mk/Variables.mk
> ++++ b/mk/Variables.mk
> +@@ -42,12 +42,6 @@ CFLAGS		+= -Wall -Wmissing-prototypes -Wstrict-prototypes \
> + 		   -Wpointer-arith -Wunused
> + CXXFLAGS	+= -Wall -Wpointer-arith -Wunused
> + 
> +-# add /usr/local to the search path if something is in there ...
> +-ifneq ($(wildcard /usr/local/include/*.h),)
> +-  CFLAGS  += -I/usr/local/include
> +-  LDFLAGS += -L/usr/local/$(LIB)
> +-endif
> +-
> + # fixup include path for $(srcdir) != "."
> + ifneq ($(srcdir),.)
> +   CFLAGS  += -I. -I$(srcdir)
> +-- 
> +2.11.0
> +
> 


-- 
Best regards,
Marek Vasut

