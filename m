Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 14DCD77E4D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Feb 2018 09:33:46 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id s5so5097044wra.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Feb 2018 01:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JVP0kk8Oj9EACfO9JM83uFCiH6KZ7v4s8HgqeHm04CI=;
	b=SkfRc545tO7mqJFU4a3C+n9BpUQGhXm8TnsOUV2JTfoAN9o9mRYqHcVJISnWxYkVBy
	YRailkyKpnPFXfRGXO1ZemoCjHSPeuZNRmhGT2pj64UBnkeJlygdKyD6FOb1fsOUlrxS
	f49d/4QQBrJhRI6nOJ+ZHoXj23nvo9KRTPND5iRSBsimkJtxvoZQgVrbr1ZgIoy0mR6V
	17wCdD0DzCGc5ic4PX3ZT68kgvnFpLfptAnAwI4DknZd1xCmacOUPoUC0w/mPBQFUUmJ
	nFwEUajhjzHXWq2KSp6qgo29sbb7yx2JqZ/kYu7H2Hg/KGTSpPhHudtBaOQwZogHgSIb
	JE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JVP0kk8Oj9EACfO9JM83uFCiH6KZ7v4s8HgqeHm04CI=;
	b=agXwQoCmYJ8j+LIbSYYfl9PiqggorHt+OSxWcM4Y/x3WDvi1tgm6xGnjPHBOBq5ztQ
	p2ER6udxBg8xUblBuvBXBuz3yj8FhCpfrbnL8TpXlH3oZ8/tI/1jLr46j3fGeeP0KF2P
	dPELGTmQdSXeiP3UU59s+YexhahsAzFqJQeNF7tIRogqMEvtgmpnGRvTuVtIdEHdwDBQ
	lxPq3ejbkWRgntl76OUjvHzK6y+IbJL9KdtX4jNbZsFrqBgf2EprgS/VQMhRK0AkuwuO
	A3S2WKuZCshoLTsqeSx2RUtVyJ4k6EOoOKEABxGDoKgZG47OV9FuLokJ/lD1f5zBg3BL
	9AOg==
X-Gm-Message-State: APf1xPDep2BzJ3sH8FEEsTem1fkmHFX4bAQU/ugPNvegYx9Neq4E9SH0
	yO7ecAIQgAJt3QGPYNWg/Q7DAfR5v1myKVvfm8E=
X-Google-Smtp-Source: AH8x224ahg+qzAVKVNGJPfzEALp8DZJ46SYNQNgNV2Pe6KzqWjak86AFvqvCcnq96OZ+hcnl4rqPEXWH9lbaaV/ENAU=
X-Received: by 10.223.199.140 with SMTP id l12mr7902883wrg.68.1518860027675;
	Sat, 17 Feb 2018 01:33:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sat, 17 Feb 2018 01:33:46 -0800 (PST)
In-Reply-To: <20180205125319.18132-1-pascal.huerst@gmail.com>
References: <20180205125319.18132-1-pascal.huerst@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 17 Feb 2018 10:33:46 +0100
Message-ID: <CA+chaQdDx-r=WPd6MvtRODmhk+Jfv60+J5Fegv5am+2wCqRYnA@mail.gmail.com>
To: Pascal Huerst <pascal.huerst@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebengine: add PACKAGECONFIG for proprietary_codecs
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
X-List-Received-Date: Sat, 17 Feb 2018 09:33:47 -0000
Content-Type: text/plain; charset="UTF-8"

This doesn't apply in master, WEBENGINE_CONFIG was last used in 5.9.

On Mon, Feb 5, 2018 at 1:53 PM, Pascal Huerst <pascal.huerst@gmail.com>
wrote:

> Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
> ---
>  recipes-qt/qt5/qtwebengine_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/
> qtwebengine_git.bb
> index ecf4657..4d6c7b6 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -57,6 +57,7 @@ PACKAGECONFIG[speex] = "WEBENGINE_CONFIG+=use_system_
> speex,,speex"
>  PACKAGECONFIG[vpx] = "WEBENGINE_CONFIG+=use_system_vpx,,libvpx"
>  PACKAGECONFIG[webrtc] = "WEBENGINE_CONFIG+=use_webrtc,,libvpx"
>  PACKAGECONFIG[nss] = "WEBENGINE_CONFIG+=use_nss,,nss"
> +PACKAGECONFIG[proprietary_codecs] = "WEBENGINE_CONFIG+=use_
> proprietary_codecs,,"
>
>  EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
>
> --
> 2.14.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

