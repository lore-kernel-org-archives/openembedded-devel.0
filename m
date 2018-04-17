Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D59EE60053
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 10:39:41 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z73so34097008wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NCH/Muz3PMuhcWYX9/8K8bhy3367CwTc7u7+1fVAfCE=;
	b=P4LC1wtWuGFLeskcVXOj8iNGqiVOu6bMGKwQ8K/5bhQ/wPTw2srrJuTEg58KIyS33+
	HqjpWkM7ZNfAc7MCqHV+5/jsYnoimsCEsDLK3rqHw4wAFNahHWoldCUx98zGk1UqFfQm
	hX6IAhjTXSbh5PIAe1JPWiiIlkMoZkNtz/iHpDJb4skFyoAkDX8zOqN2wUMZRPlyZUoC
	QWyeqTj0FYjRzNXBMhYAmGkethbI9Hccn8aAw9dJLyf131C9m+U3X0mgkuO+SEd51qRb
	mBs+8AX8FHKWBiV4tjWVj9WvhqRuoruOTFM+uuJyhm0dBUiSjE9D8Ijxf4jyjYuyfaop
	23Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NCH/Muz3PMuhcWYX9/8K8bhy3367CwTc7u7+1fVAfCE=;
	b=oDYa0F1a+9wSb3WUyfD8nfU76oS/BelLlb8Q/vfyd89qk6bZHEcA6KTTMSfXAnbe4r
	rXS9tf9pGQvoW918i3MW65HVheGmZZPGfuNWdJ2yUTwLDdErn4gSaO9M1/Y83AwTkDQj
	+MxGSKcEctxwzLS7ntSuqd2SZ8fqVXkVVKU0eFpjKzeuyEYWPH24AkVhnOT9E+IaHztW
	v22RSBOYJqDTurXEk2e8kWwnIsEJ49FwnmuavfOgoV/gVMcfqIrPa1H+j9jSueEzaaYC
	jdudM7jarIhEkMRu9t6GBh6+iqgxAm4yHTmQiytlP0d5auoCOU6GvfXcuyxFTKvTIJ1O
	odqA==
X-Gm-Message-State: ALQs6tByc+Z1V5+uXM141Id7GdqNZON6gMGDYaRX3Vpt0dlIAXadNuZh
	QiEEux90XUl48XvY4wJWuqzdOLLHtJucoKurkhc=
X-Google-Smtp-Source: AIpwx48X1jxWY1DgnzmJMYcJfa3+oWqJ7nHVc7AO5aXlMQHTk7HBw62KuVxHt88UbXA3njVZu9ejA24IrkoZbf6sSuQ=
X-Received: by 10.28.178.212 with SMTP id b203mr596560wmf.32.1523961582423;
	Tue, 17 Apr 2018 03:39:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Tue, 17 Apr 2018 03:39:41 -0700 (PDT)
In-Reply-To: <1523956656-12896-1-git-send-email-hongxu.jia@windriver.com>
References: <1523955884-38040-1-git-send-email-hongxu.jia@windriver.com>
	<1523956656-12896-1-git-send-email-hongxu.jia@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Apr 2018 12:39:41 +0200
Message-ID: <CA+chaQdtV1S4oq-NVt86NG2J20t51XhUpt-2C1OZJLOH86unrw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH V2] qtbase: add disable option to opengl PACKAGECONFIG
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
X-List-Received-Date: Tue, 17 Apr 2018 10:39:42 -0000
Content-Type: text/plain; charset="UTF-8"

How does this work with gles2 PACKAGECONFIG?

It was intentionally like this to implement tri-state options (desktop,
es2, no).

On Tue, Apr 17, 2018 at 11:17 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> The qtbase detect oepngl by default and report error if not found,
> add disable option while explicitly disable it.
>
> Remove useless no-opengl PACKAGECONFIG
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 5c4fe4f..ca056af 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -111,9 +111,8 @@ PACKAGECONFIG[ico] = "-ico,-no-ico"
>  PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
>  PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
>  PACKAGECONFIG[eglfs] = "-eglfs,-no-eglfs,drm"
> -PACKAGECONFIG[gl] = "-opengl desktop,,virtual/libgl"
> +PACKAGECONFIG[gl] = "-opengl desktop,-no-opengl,virtual/libgl"
>  PACKAGECONFIG[gles2] = "-opengl es2,,virtual/libgles2 virtual/egl"
> -PACKAGECONFIG[no-opengl] = "-no-opengl"
>  PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
>  PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
>  PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

