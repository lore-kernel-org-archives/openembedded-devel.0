Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 43A2075260
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 16:51:47 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 101-v6so19279414oth.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 09:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BvPeyVPLSYAawdt+emvyUBz3RQZe+ZCHZaZC6a8NZ3s=;
	b=L4qGaq4UIgayElrgywV9GhCX9VPGIzPrCRf+7/F0tiqZq6saWQ6SdAeW/LeAe5mGaC
	S+6MLz6W8vSQl0O4kDaXWgmqDqICqqYFef2Wbn/YxvHW76r0biyQKHtIEEHCbCPttzwh
	9AZW1kkY0z+KAmbu5EzhhZJPMWiXEQpo1w0uvDl75etVIXloog0K7qWjgjId65XOMZ2j
	J5tBZgIITIMG7BEBJ9lKDcdRGnYfqdOZPFjr0Ey/FtPTzCLj99OtG6qYVB96hTpBI0oM
	gJQFISJtjnh+7w0HufymzMCilB1UIbuSfQF4ghuS2tgGGaGUX1bZHTia8A8j8OjNUlzE
	6H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BvPeyVPLSYAawdt+emvyUBz3RQZe+ZCHZaZC6a8NZ3s=;
	b=Ad9qvsA0Bx0uoJhlicHbtaTd528uqJRKdu70J4rmlJOvLPAfYO6YbSsE2KQuWdmzJA
	4CRscPIwNtawMswDWj5bgi5sB82SYo+t6u2uNZuNiyU8pVqw9pqIjWP2xTd1mPKfe1AC
	3r7GeROIwy1wP+XgNBH+gIPECEUH3pJqtyrbtT0aVcIdxBIE9W9FEUc5K3m6cI2vI5e8
	ElSk4MpPTqRfR24tsOOcsOKNvthQkIMCA/CVLBXU1FBIXgt4N5L0TtR2yL9zIJm4n5Tm
	3fh5tKGxOGU5665H4dDKTslrfJHOfewqiO2Fc9Yw02Wq66TTnfl8krfO/z5Z7EBKFUFj
	zVeA==
X-Gm-Message-State: APt69E0TkJO3x5JtSpPAr7Wn0WBx0U9q4NCjlkTokovgS1WXya+jsQCT
	/PbiAHHRuYvz/O0GGace5Uf5AISLN179ZGVF7KI=
X-Google-Smtp-Source: ADUXVKJtbt6C/HEIHlIUixsmqGeT1/TxReV7GjETurb1XfBRUAAQQV73sqDz0tvEJdaTiLvXzCesB4r9PkBJEHrUbtA=
X-Received: by 2002:a9d:1490:: with SMTP id
	d16-v6mr7539189ote.299.1529340707871; 
	Mon, 18 Jun 2018 09:51:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 09:51:47
	-0700 (PDT)
In-Reply-To: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Jun 2018 18:51:47 +0200
Message-ID: <CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 16:51:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 4:45 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Since commit 5f31db601408 [xfce4-panel: upgrade 4.12.2 -> 4.13.3] we
> are getting a QA Warnings/Erros for 'installed-vs-shipped':
>
>     ERROR: xfce4-panel-4.13.3-r0 do_package: QA Issue: xfce4-panel:
>     Files/directories were installed but not shipped in any package:
>       /usr/lib64/xfce4/panel/plugins/liblauncher.la
>       /usr/lib64/xfce4/panel/plugins/libdirectorymenu.la
>       ...
>
> From various OE documents the .la files should not be packaged in
> either the main recipe package or the -dev package unless required. So
> inherit 'remove-libtool' to have all the .la files cleaned up as they
> don't appear to be necessary.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> This error is currently only seen on master-next since the xfce4-panel
> upgrade commit is yet to make it into master. As such this fix is only
> applicable to master-next.
I think it was not the upgrade -> 4.13.3 commit but later commit / same series

various classes recipes: Remove FILES entries for dbg/dev packages
...
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -12,11 +12,3 @@ DEPENDS += "intltool-native"

 FILES_${PN} += "${datadir}/icons/* ${datadir}/applications/*
${libdir}/xfce4/modules/*.so*"
 FILES_${PN}-doc += "${datadir}/xfce4/doc"
-
-FILES_${PN}-dev += "${libdir}/xfce4/*/*.la"
-FILES_${PN}-dev += "${libdir}/xfce4/*/*/*.la"
...

My builds have remove-libtool enabled so I did not see this QA warning/error.

Isn't remove-libtool enabled by default since pyro/2.3 - so that this
patch is obsolete (and all the other same kind coming later)?

Andreas

