Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7A35272EA1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 02:28:46 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id 128-v6so1042147vkf.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 19:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4GjWM0lfQIWUaMJQ++gB6igBMGmOSdDpNK8xcBpjbm0=;
	b=Q/zNTeHXVx0NG+mpJD+vLVRoIFtlSlmbNYN+RqZgsBGvSiE8xYQHy1AvaJ6LBYqOmP
	E0c76AH8uAX8bjqbO0Pi7NFXyZkH3XS9quNPs+SOM88N09Kk98TrBS8TiLAhQUXGUkrI
	BkZWWDuxNjjHj0rVK1UlR6W8O0FPVrM/wGyQRDkRLdF5mICCpUqImhl0niYtRzeddoIj
	k4kBPA29VXx44qs8kcc+d8eULTApttlyS0MWo17qZtErZHJvNlrvoczrsf0eXfZ7RXP2
	owNdcwipsbSDlHyMkcCu6NHx8UCjrnAU6yxoSbtvLISxcO3T83Dc86cTGf42mqsEXR9v
	FbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4GjWM0lfQIWUaMJQ++gB6igBMGmOSdDpNK8xcBpjbm0=;
	b=Wnuze4KalfPA0ecltzAtpo4rM8ZYBfP38vwxL/SDAE6qSyKLFTQ23t+sy8Wg/tlG/c
	Q8DPFce+XyWxe3LLkZJJ02KGQsPgMPoyW9qGso6YR+z1eI2YxK8+8EpuN88NzusRYr/j
	d6W04Kl9xn/va1I4UUfetvWbN2kXG62bDrHGRBGOLLd6qjjcFBtu7KafZhSdbMrvwPTd
	Mc9nm8cay2oR7feOvwh+4SKabCNePljEkYtXniG/W81pfT5KmxqW+ieQFUpIIV3np4hB
	wp37reZoFAbQHhlksWUcVoklUzqKrlLhY1jT7Uw0bO9jf7ZVrGRRAJHtmMvUFvhU93uy
	jhRQ==
X-Gm-Message-State: APt69E20WFcb3PMn126F2nxeG9sF6h9LXAzc7g61IxwpvdlmzpPJRRKo
	zCrdwXcmK4nwaawCXji6+MdnfrF4garsVkbOmqg=
X-Google-Smtp-Source: ADUXVKLhaGlzjMD4PA9zomVJbdLP1cS31yKMBNhr98ZOrD8romEd/B4oe1ds7i5k3kmL/nUEZ5w2HKRfRcxKBHAqPUU=
X-Received: by 2002:a1f:5244:: with SMTP id
	g65-v6mr11298296vkb.28.1529461727204; 
	Tue, 19 Jun 2018 19:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180620021342.12415-1-liezhi.yang@windriver.com>
In-Reply-To: <20180620021342.12415-1-liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jun 2018 19:28:31 -0700
Message-ID: <CAMKF1spbat6ZCxLfvo8LTM7B1oHnmwa6=1YzgJ0TyhYFG7mPhA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gd: Replace strncpy with memccpy to fix -Wstringop-truncation.
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
X-List-Received-Date: Wed, 20 Jun 2018 02:28:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 19, 2018 at 7:14 PM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Fixed:
> git/src/gdft.c:1699:2: error: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...gdft.c-Replace-strncpy-with-memccpy-to-fi.patch | 46 ++++++++++++++++++++++
>  meta-oe/recipes-support/gd/gd_2.2.5.bb             |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
>
> diff --git a/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch b/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
> new file mode 100644
> index 0000000..b175c44
> --- /dev/null
> +++ b/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
> @@ -0,0 +1,46 @@
> +From 85c7694a5cf34597909bdd1ca6931b0f99904c2e Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Tue, 19 Jun 2018 00:40:49 -0700
> +Subject: [PATCH] annotate.c/gdft.c: Replace strncpy with memccpy to fix
> + -Wstringop-truncation.
> +
> +Fixed:
> +git/src/gdft.c:1699:2: error: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]
> +
> +Upstream-Status: Pending
> +

could you also post this patch upstream and start a discussion?


> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + src/annotate.c | 2 +-
> + src/gdft.c     | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/annotate.c b/src/annotate.c
> +index 00aaf49..17df813 100644
> +--- a/src/annotate.c
> ++++ b/src/annotate.c
> +@@ -104,7 +104,7 @@ int main(int argc, char *argv[])
> +                                       fprintf(stderr, "Font maximum length is 1024, %d given\n", font_len);
> +                                       goto badLine;
> +                               }
> +-                              strncpy(font, st, font_len);
> ++                              memcpy(font, st, font_len);
> +                       }
> +               } else if(!strcmp(st, "align")) {
> +                       char *st = strtok(0, " \t\r\n");
> +diff --git a/src/gdft.c b/src/gdft.c
> +index 9fa8295..81dbe41 100644
> +--- a/src/gdft.c
> ++++ b/src/gdft.c
> +@@ -1696,7 +1696,7 @@ static char * font_path(char **fontpath, char *name_list)
> +               gdFree(path);
> +               return "could not alloc full list of fonts";
> +       }
> +-      strncpy(fontlist, name_list, name_list_len);
> ++      memcpy(fontlist, name_list, name_list_len);
> +       fontlist[name_list_len] = 0;
> +
> +       /*
> +--
> +2.10.2
> +
> diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
> index 63d9acf..62d0df0 100644
> --- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
> +++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
> @@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=07384b3aa2e0d39afca0d6c40286f545"
>  DEPENDS = "freetype libpng jpeg zlib tiff"
>
>  SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
> +           file://0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch \
>            "
>
>  SRCREV = "8255231b68889597d04d451a72438ab92a405aba"
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

