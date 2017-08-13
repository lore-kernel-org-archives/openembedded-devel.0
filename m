Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4B30878325
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 16:44:19 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j68so7929882pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mr7upsAerp8vWtyDj7A2ridWldQ/7N9emFEmXHtrxmI=;
	b=txtQ2R7mldbpSxdznjuPRykXVKXNQg91mrkYj0HOu5V0QMDzjt3xtoWLHjepGG1DcR
	v7E/JT8kXubP8D8yPvpDuxm7CLTc+PPauMql2DsSl2AjpyKcMrPEzLlmZW+AryztqJvp
	Kps/IZ6j1HTeV06y7ba5v3G88ZMebHE18JLr+BQwGIdPuMnyEQWkYIg1oZ89jwdzERVT
	bwn39PNEIZvwFXVT+7I7h+HMuiQgADFf5phnusOtqHN4R73xpbMYdCNuX8II71VCDIVQ
	sujx1XGN7yiLSm2tJlYOyUB+x9Z8BEW5zpZA1w1dq9DXvAevQqrUGB0nGgbYfvT77ZXa
	TaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mr7upsAerp8vWtyDj7A2ridWldQ/7N9emFEmXHtrxmI=;
	b=Vv2prarB28H7KdZKGBT/9tgQ1bbgvFKLNtANM3SDLibEoj3lIAIWRoadMD4TOg6O4W
	O4LdZ36JbBayy2Fo4eUoZXIXcOY+VRWCGn/AzMhkMtcN7Rb6Zjlj7LNWjry/wa/4Toba
	BDfRtGiNYgs7xEPHhAj8qi3uj+FqMkVLxpyzaGPWFzFfVQTWKs74S3HsnHWGwDKQm8rK
	h45JfISwnAVd01gNWASWrFtZaSiIDgPSErzoE93bXBvyLOd4hyW7oIqMp4UaIB5kNQyr
	f6/XvW0JKHAoyuUpHqXYwBxXSZ6ESLUJ3xRJi93VwU3xjf0/JzHNMsIG1vpK5NP45Rvf
	VdcA==
X-Gm-Message-State: AHYfb5jpkU4aUL2oqrvH3Zm6oYqiwXB0OH4U8q2jqG6f0ZEfAMpBv+G+
	hMjpeuAVl3q1kCezVnBKax6Z9jE75g==
X-Received: by 10.99.3.197 with SMTP id 188mr22351507pgd.288.1502642661400;
	Sun, 13 Aug 2017 09:44:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Sun, 13 Aug 2017 09:43:51 -0700 (PDT)
In-Reply-To: <1502641460-4734-2-git-send-email-akuster808@gmail.com>
References: <1502641460-4734-1-git-send-email-akuster808@gmail.com>
	<1502641460-4734-2-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Aug 2017 09:43:51 -0700
Message-ID: <CAMKF1spGeqyKwxp19ojkuS_u-Kj+vtChBMMXsmj9q=seCg9d_A@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master][pyro] 2/2] libexecinfo: fix complie issue
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
X-List-Received-Date: Sun, 13 Aug 2017 16:44:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 13, 2017 at 9:24 AM, Armin Kuster <akuster808@gmail.com> wrote:
> define _GNU_SOURCES to fix compile issue:
>  execinfo.c:76:5: error: unknown type name 'Dl_info'
> |      Dl_info info;
> |      ^~~~~~~
> | execinfo.c:83:13: warning: implicit declaration of function 'dladdr' [-Wimplicit-function-declaration]
> |          if (dladdr(buffer[i], &info) != 0) {
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
> index f79b1ab..13a38ab 100644
> --- a/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
> +++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.1.bb
> @@ -16,6 +16,7 @@ SRC_URI[md5sum] = "8e9e81c554c1c5d735bc877448e92b91"
>  SRC_URI[sha256sum] = "c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26913a4c19d8a59b1f"
>
>  CFLAGS += "-fno-omit-frame-pointer"
> +CFLAGS += " -D_GNU_SOURCE"

Please merge it into existing assignment above. Unrelated to this
patch, this recipe should
move to oe-core.

>
>  do_install() {
>      install -D -m 0744 ${S}/execinfo.h ${D}${includedir}/execinfo.h
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

