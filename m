Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 142B57520F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 14:53:21 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r15-v6so7623913wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kj1Xdp096Bf8AbB2l5bdOAzBfF3PabJMUqKDQ80nCoA=;
	b=E1EC0jC1hz3KcVUAGNYEXD524anPpoeU8l/spCpqvhik+EfHLxciQnWibxmgrdbOeN
	jjygmJMJELfbMDoLiM/rS/5NhdLuhvW8Jflk3IOPH851iZ8N65QyzGNHHDUnHa7gMC9S
	wcK3EzBqe6JLkpYyoRK/tDs+WnjELDC8q2uvDkaDtxE38FwApI19s58ZEzsZyl7FnkTd
	OimoYyrhxBIJxIQmOWvCNloVI/8b7Tjt4vDapOQxjaeBx0DQoyByqZTkM2Dm7T7Qfdqf
	d6Z2XHNtDDmXUFfKiHx3zTe00PgcP5jp0ejqhEd9LVADhYOBa+S6K6LSfG5aH0CS2dYd
	tGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kj1Xdp096Bf8AbB2l5bdOAzBfF3PabJMUqKDQ80nCoA=;
	b=CviV/U29vRDIsxAEW8hLzMqKq3oLxd2DzCNu9RKBIrb6bWKfgXCgdpIbzpf60U6jL8
	Gfqngjxt95O41U8H6oiICrx7JWtb4MCMTHkHA7dLq1/YCveY/+z+RyF5NSqQJk/h8B7c
	oQmpOwSYh9s3MPNS6lF3u4d2I6QD/amOuYKTf6/qf5gZKeWHp9i0NEheM4CLWm12Gl+N
	c42zlt8Rd+WbqVwFiaLo658PQv3YX30hluZnhrLh+uBPSaICVffvYtDnVV3BniCb3DfW
	0Njh4BAtZ3juMQMMD7cQw/3bsN0KOad4GiKQjkBaGKHxhp/Jxquk0tX/+BoqrO801Uuf
	2xIQ==
X-Gm-Message-State: APt69E3/foG1NRmLJShT9cFDgpjr+M524h4RVDiwbWk0/OBNlXbXf+qG
	jUhcnXqoaeJbU617kfw4SUY1U/zLDfL6eRmQ7HE=
X-Google-Smtp-Source: ADUXVKIhyemKVdw9yx+KH5JDHNMvKr+/0kJGOy7vR1StPaRHRxv+fEEVVmesA+0MwCX4mxBanpZ1FK+3IR6JQyBDBzE=
X-Received: by 2002:a1c:6dd3:: with SMTP id
	b80-v6mr3928375wmi.32.1529160801305; 
	Sat, 16 Jun 2018 07:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180616132433.75139-1-jason.wessel@windriver.com>
In-Reply-To: <20180616132433.75139-1-jason.wessel@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 16 Jun 2018 16:53:13 +0200
Message-ID: <CA+chaQdQhS7yabDAV6PsQjBwuZhZw3CPKq90xxOorCfMRb8=Sw@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] spice: Uprev to fix compile errors from gcc 8.1.0
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
X-List-Received-Date: Sat, 16 Jun 2018 14:53:22 -0000
Content-Type: text/plain; charset="UTF-8"

Looks good, but the -- in the commit message strips your Signed-off-by and
the info about PACKAGECONFIG.

Patchwork might be doing something strange here, in the commit message here
and on
https://patchwork.openembedded.org/patch/151765/
I see just 2 dashes, but after downloading the mbox as
https://patchwork.openembedded.org/patch/151765/mbox
there are 3 dashes (twice) and git strips it.

Cheers,


On Sat, Jun 16, 2018 at 3:24 PM Jason Wessel <jason.wessel@windriver.com>
wrote:

> The upstream spice already fixed the following problems:
>
> ../../git/server/red-channel.c: In function 'red_channel_receive':
> ../../git/server/red-channel.c:307:44: error: cast between incompatible
> function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct
> RedChannelClient *)'} to 'void (*)(void *, void *)'
> [-Werror=cast-function-type]
>      g_list_foreach(channel->priv->clients,
> (GFunc)red_channel_client_receive, NULL);
>                                             ^
> ../../git/server/red-channel.c: In function 'red_channel_destroy':
> ../../git/server/red-channel.c:406:44: error: cast between incompatible
> function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct
> RedChannelClient *)'} to 'void (*)(void *, void *)'
> [-Werror=cast-function-type]
>      g_list_foreach(channel->priv->clients,
> (GFunc)red_channel_client_destroy, NULL);
>                                             ^
> ../../git/server/red-channel.c: In function 'red_channel_send':
> ../../git/server/red-channel.c:412:44: error: cast between incompatible
> function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct
> RedChannelClient *)'} to 'void (*)(void *, void *)'
> [-Werror=cast-function-type]
>      g_list_foreach(channel->priv->clients,
> (GFunc)red_channel_client_send, NULL);
>                                             ^
> ../../git/server/red-channel.c: In function 'red_channel_push':
> ../../git/server/red-channel.c:421:44: error: cast between incompatible
> function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct
> RedChannelClient *)'} to 'void (*)(void *, void *)'
> [-Werror=cast-function-type]
>      g_list_foreach(channel->priv->clients,
> (GFunc)red_channel_client_push, NULL);
>                                             ^
> ../../git/server/red-channel.c: In function 'red_channel_disconnect':
> ../../git/server/red-channel.c:481:44: error: cast between incompatible
> function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct
> RedChannelClient *)'} to 'void (*)(void *, void *)'
> [-Werror=cast-function-type]
>      g_list_foreach(channel->priv->clients,
> (GFunc)red_channel_client_disconnect, NULL);
>                                             ^
> ../../git/server/char-device.c: In function 'red_char_device_reset':
> ../../git/server/char-device.c:838:49: error: cast between incompatible
> function types from 'void (*)(RedPipeItem *)' {aka 'void (*)(struct
> RedPipeItem *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
>          g_queue_foreach(dev_client->send_queue,
> (GFunc)red_pipe_item_unref, NULL);
>
> --
>
> The new commit also changed opus to compile in by default.  This is
> now added as a PKGCONFIG option.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta-networking/recipes-support/spice/spice_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb
> b/meta-networking/recipes-support/spice/spice_git.bb
> index 35482ca86..e12e7d691 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -15,8 +15,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
>  PV = "0.14.0+git${SRCPV}"
>
> -SRCREV_spice = "2a3d5624382ba49c4eb906e69697b92f79d06cf4"
> -SRCREV_spice-common = "4c2d0e977272c5540634d24f485dd64c424f6748"
> +SRCREV_spice = "f1050bfc76c9c4146257e087baf74e0b62d7d218"
> +SRCREV_spice-common = "95743f40a2da39e0a19859c305e69e2c99d39e42"
>
>  SRCREV_FORMAT = "spice_spice-common"
>
> @@ -47,6 +47,7 @@ PACKAGECONFIG[smartcard] =
> "--enable-smartcard,--disable-smartcard,libcacard,"
>  PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,"
>  PACKAGECONFIG[client] = "--enable-client,--disable-client,,"
>  PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
> +PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus,"
>  PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
>  PACKAGECONFIG[xinerama] =
> "--enable-xinerama,--disable-xinerama,libxinerama,"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

