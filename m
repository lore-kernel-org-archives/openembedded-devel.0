Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id F049A75208
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 15:46:43 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a63-v6so6220209pfl.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lpY/3snJdO8dvUL2sja/WTFjlccWwV9OuFNcK+YWR+4=;
	b=EfpXriQ/KmAITkyOMkYoAmndpQ1rmQv5eWXonwTrfNhjufREX7ovOmtt4Bu9KU128U
	roP9bNA9PyMn5A4iGfm3Lb1EgPbnpRdU2t0GErvnMuiRGI0VafJbnAGddrUBiAP4m5sQ
	nBIlYe57O5zLWLKHIdu9PdZwSj8TTo9ILYs8L/n/Vx932H94VqNxKyw9NXo6Dz9t05BT
	UdAdHvyWpQss2/Cgd6GVOUHacQG3hZ5CAwlYhqVqVlJHzUikHA+7155tUJB8C5dLOIkg
	rpm39MjLKTFHBjoUoR1dgqikBsGo/rRat5wd+kUi1U2AAWCin0z6a+opRboSE2n9qGqI
	42lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=lpY/3snJdO8dvUL2sja/WTFjlccWwV9OuFNcK+YWR+4=;
	b=oPzbnOb7UAY2nZedqFMfnyYj7+WuArhM1f7gVsk7Psy7BE7CF7ibBo367fqJFbZ6NW
	4eAtJmsqnxKq23BefGeS+1eVKaUiJWZnVhsFp9e3+8hvLpSS3oc3JU7TPxWJBBJurfx3
	jzRosnI76htqke9nM9tUPZjB4kDPc887HTOQpqGTYSsGZV+A/tS8br0qdxbRWdZuow1R
	sPl3mOCmWZYgnEvdrVNnaG4xCn4lxNgUwuiTALKwMB5KF1jyF+MXMxYReZ0GaZKbjX08
	aYxd1AzlgN5nTBv3GC3sPOWmL0aAhp2e30aFyBgVY2C85wBMNf8NKlaHBqffdUrhHt17
	x17w==
X-Gm-Message-State: APt69E3AKbMOgNyYDPbQm+YxzRVLBKB3D3PpAk80Ek2EPCyHhU2KPl43
	OC7pf4JlYRhSjuE+9XH3HGgb5aGv
X-Google-Smtp-Source: ADUXVKJubwkMa0WHyo/PF8aR8gQ1ddhLIRIxYlq9zz00WvhYBv1NAtw4FKC6lULRjU6TEXbQOGog5w==
X-Received: by 2002:a65:5006:: with SMTP id
	f6-v6mr5562797pgo.116.1529164004592; 
	Sat, 16 Jun 2018 08:46:44 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:9414:1129:bb93:e38c])
	by smtp.gmail.com with ESMTPSA id
	e189-v6sm18349371pfc.134.2018.06.16.08.46.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Jun 2018 08:46:44 -0700 (PDT)
To: Jason Wessel <jason.wessel@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20180616132433.75139-1-jason.wessel@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8007a236-6e6c-e48a-2ef2-e3a4466e4b22@gmail.com>
Date: Sat, 16 Jun 2018 08:45:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180616132433.75139-1-jason.wessel@windriver.com>
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
X-List-Received-Date: Sat, 16 Jun 2018 15:46:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/16/18 6:24 AM, Jason Wessel wrote:
> The upstream spice already fixed the following problems:
> 
> ../../git/server/red-channel.c: In function 'red_channel_receive':
> ../../git/server/red-channel.c:307:44: error: cast between incompatible function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct RedChannelClient *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
>       g_list_foreach(channel->priv->clients, (GFunc)red_channel_client_receive, NULL);
>                                              ^
> ../../git/server/red-channel.c: In function 'red_channel_destroy':
> ../../git/server/red-channel.c:406:44: error: cast between incompatible function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct RedChannelClient *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
>       g_list_foreach(channel->priv->clients, (GFunc)red_channel_client_destroy, NULL);
>                                              ^
> ../../git/server/red-channel.c: In function 'red_channel_send':
> ../../git/server/red-channel.c:412:44: error: cast between incompatible function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct RedChannelClient *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
>       g_list_foreach(channel->priv->clients, (GFunc)red_channel_client_send, NULL);
>                                              ^
> ../../git/server/red-channel.c: In function 'red_channel_push':
> ../../git/server/red-channel.c:421:44: error: cast between incompatible function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct RedChannelClient *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
>       g_list_foreach(channel->priv->clients, (GFunc)red_channel_client_push, NULL);
>                                              ^
> ../../git/server/red-channel.c: In function 'red_channel_disconnect':
> ../../git/server/red-channel.c:481:44: error: cast between incompatible function types from 'void (*)(RedChannelClient *)' {aka 'void (*)(struct RedChannelClient *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
>       g_list_foreach(channel->priv->clients, (GFunc)red_channel_client_disconnect, NULL);
>                                              ^
> ../../git/server/char-device.c: In function 'red_char_device_reset':
> ../../git/server/char-device.c:838:49: error: cast between incompatible function types from 'void (*)(RedPipeItem *)' {aka 'void (*)(struct RedPipeItem *)'} to 'void (*)(void *, void *)' [-Werror=cast-function-type]
>           g_queue_foreach(dev_client->send_queue, (GFunc)red_pipe_item_unref, NULL);
> 
> --

I think these dashes will confuse patchwork. Can you remove them and 
resend ?

> 
> The new commit also changed opus to compile in by default.  This is
> now added as a PKGCONFIG option.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>   meta-networking/recipes-support/spice/spice_git.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
> index 35482ca86..e12e7d691 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>   
>   PV = "0.14.0+git${SRCPV}"
>   
> -SRCREV_spice = "2a3d5624382ba49c4eb906e69697b92f79d06cf4"
> -SRCREV_spice-common = "4c2d0e977272c5540634d24f485dd64c424f6748"
> +SRCREV_spice = "f1050bfc76c9c4146257e087baf74e0b62d7d218"
> +SRCREV_spice-common = "95743f40a2da39e0a19859c305e69e2c99d39e42"
>   
>   SRCREV_FORMAT = "spice_spice-common"
>   
> @@ -47,6 +47,7 @@ PACKAGECONFIG[smartcard] = "--enable-smartcard,--disable-smartcard,libcacard,"
>   PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,"
>   PACKAGECONFIG[client] = "--enable-client,--disable-client,,"
>   PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
> +PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus,"
>   PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
>   PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
>   
> 

