Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F77374BBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 06:43:54 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id ay10-v6so4014080plb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 23:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JIAVKvk/Eqnzvfv2h//91hi7YlWgEuauxPffJc7hTh4=;
	b=pK2ej6OC8omfTTn/H/v3D9/Fa1irTVSU/jElM4lg6OislsW4n1x9S0hbZyKEgnDOH4
	Allr1lhUQlJ0DD8CnxtZ4429iXkrVABNFGnWwB1XcnH9QOi/gdqwGAWLfaMC0LSDqHK4
	YmZgxGWjX6WPRf0TiaSzJHRkGTGBxt64peNrgYiqXMCW1rY7/lL9OS+/kTUxCKPvBPek
	JH/5NcbD3rDSTMQo0gWKxBBLYMCXNwJ1UmhU0BZKVQFbZWLfjEEsB6ltFyKljK0c+XWK
	32x8T0SXir41mG1Ug3vaRSMeQN2ZyitMCngDxrPY+N2WfcuSJE5hclb8xic/zZB3own5
	XFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JIAVKvk/Eqnzvfv2h//91hi7YlWgEuauxPffJc7hTh4=;
	b=THgkKTViKFerccxm+/b/zVByI4oCBR3iHWKVYQ8YDbjm1QUuqciDhGlwzf8rxtmxF/
	yoh+gPeqfyx1syEbIIwc1TXetkG92/cuqUEYUjb/rH3S3OwpDKTG9DToC+WyXanzM4dF
	FPs5BShaioIDmLPzFnZGvGg9gDyNHQy9rqvqysiX6sH02Z30cqnBIBy06fcnUGGpvZGt
	lWXfzPXsz8+59lGqMXlofse/ZyTd626dLpQcDaEj63HRGrVSX43u3LV/9hr7pa8KATSs
	XZ/bwvop0qRoAWF11E7vAyMnfQXj8gtQJicvSfUD2bpoMWJCTCwflcBAXqcVwFi+FvTR
	+59w==
X-Gm-Message-State: ALKqPweXu4NDChlUYE6F98xxSJQjjPUQ2RH0sEFZqyogg/D8/576eShU
	4HaSztLDFwn3WUxF2EydPshUuoD2aRJLBTP7Uxw=
X-Google-Smtp-Source: AB8JxZoRZqSmhRyGQeL7Tg37wKIAx2AMKv2Ks4L0L1mPNCgGzNnjtKGGl0q7vCaI2ZLAR+aVo02VKw2TTskDDTv/SZM=
X-Received: by 2002:a17:902:28ab:: with SMTP id
	f40-v6mr8372759plb.208.1526625835954; 
	Thu, 17 May 2018 23:43:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Thu, 17 May 2018 23:43:25
	-0700 (PDT)
In-Reply-To: <20180516075011.27429-1-richard.leitner@skidata.com>
References: <20180516075011.27429-1-richard.leitner@skidata.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 May 2018 23:43:25 -0700
Message-ID: <CAMKF1sp7zbjzREPoRck4e-VGL4fXbHUcQLMbv_89fgGzxwwbiw@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] stm32flash: add recipe
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
X-List-Received-Date: Fri, 18 May 2018 06:43:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 16, 2018 at 12:50 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> Add recipe for version 0.5 of stm32flash, an open source flash program for
> STM32 using the ST serial bootloader.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
>
> diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
> new file mode 100644
> index 000000000..d401981ff
> --- /dev/null
> +++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Open source flash program for STM32 using the ST serial bootloader"
> +HOMEPAGE = "https://sourceforge.net/projects/stm32flash/"
> +BUGTRACKER = "https://sourceforge.net/p/stm32flash/tickets/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +inherit autotools-brokensep
> +
> +S = "${WORKDIR}/${PN}"
> +
> +SRC_URI = "https://prdownloads.sourceforge.net/stm32flash/stm32flash-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "40f673502949f3bb655d2bcc539d7b6a"
> +SRC_URI[sha256sum] = "97aa9422ef02e82f7da9039329e21a437decf972cb3919ad817f70ac9a49e306"
> +
> +FILES_${PN} = "/usr/local/bin/stm32flash"

Please add this patch

diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
index d401981ff9..7f1a7823a5 100644
--- a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
+++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM =
"file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"

 inherit autotools-brokensep

+EXTRA_OEMAKE = "PREFIX=${prefix}"
+
 S = "${WORKDIR}/${PN}"

 SRC_URI = "https://prdownloads.sourceforge.net/stm32flash/stm32flash-${PV}.tar.gz"

 SRC_URI[md5sum] = "40f673502949f3bb655d2bcc539d7b6a"
 SRC_URI[sha256sum] =
"97aa9422ef02e82f7da9039329e21a437decf972cb3919ad817f70ac9a49e306"
-
-FILES_${PN} = "/usr/local/bin/stm32flash"

and squash it into original patch and send a v2

