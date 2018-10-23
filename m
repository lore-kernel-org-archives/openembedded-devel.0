Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id C43D079AB3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 22:34:28 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b9-v6so966847pls.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 15:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=q0inuJjOQn44mKMHnJzunGX82yNn3zJPdAa1LBwKkWs=;
	b=Qik5LKXXuGHP0o/s504mS0868lbbzrd933Jas9DLn1buYALyzpXVb4GxlWe/GkXr7I
	ek41pkYzopSj5hkzVwfYRNkqShHmdw31rnxw8kuLLihCTowznZaZRLJ3MyYevU/GsnC6
	pcbDyZ2VvfW6s8+Xrc4eM6rIBBfYB3nw1vg8bAXhQapXg9hu3Bp2g3xzCDLHo2ScHFij
	B/yjUKQYmv5tiiUNmLRMQMPqY/3pLrq7twzHAyZcRTKBGTuB3+6upSrFixBZIQN6imNK
	luO0x1mrB4FxTn6UpgxdlUugqcsaU3AO0ynA2+1F6kAzGqjVzZbe9Mr8fKbxiP/K6dAh
	y0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=q0inuJjOQn44mKMHnJzunGX82yNn3zJPdAa1LBwKkWs=;
	b=Kyy426Ac1+lj1ekM9LhB+vV9OMP9Mz1ZD9r49tLIyq5C9qFQMD2XP25ziKv5Awmg1Y
	YdbjW7w7ZQbCKPlEOki9p5YN1nPYnJm9lclDI5/k65IOe2WdRyR6si/RuIJ2i0IDp0xp
	KnIlEjgwO8KJ1ZR8JjHBteyfCH51MtBgQsLDwD/C1qdBC5iSmVt+ZyWEZk0ttLWXz5dn
	zpDedB/M7F6trqf6NeKfIO0tUVH9tyJxptcxfg9wT1kD7ZWr+VppxG7CxH+Tz/0z/TSL
	aXb31Vuh0sLGjzrteEnCNLjwpUEBmRS0+3j8MtZqhV+YFGNt21BVlRpk3KNkEdM1V8aq
	J5jQ==
X-Gm-Message-State: AGRZ1gJ2xhSVuBlxQmPqMUAFV9M+Ttk8YfLk9pRh3vJ6hEJEWVpNfup1
	TmumgR4EocGDCCkuY2FYpXqM7jFuw1I=
X-Google-Smtp-Source: AJdET5cHoXJ2NUxD5VdjPnt/IPRrkBBVD7ErnpY4jNJ3zuFZT8b2nx4OYgMI3fZlRDRoCWyg9cyGYw==
X-Received: by 2002:a17:902:bb0d:: with SMTP id
	l13-v6mr129845pls.5.1540334069747; 
	Tue, 23 Oct 2018 15:34:29 -0700 (PDT)
Received: from [10.15.240.186] ([109.144.222.79])
	by smtp.gmail.com with ESMTPSA id
	k72-v6sm7751535pfj.63.2018.10.23.15.34.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Oct 2018 15:34:29 -0700 (PDT)
To: Max Kellermann <max+openembedded@blarg.de>,
	openembedded-devel@lists.openembedded.org
References: <20181023163812.5631-1-max+openembedded@blarg.de>
	<20181023163812.5631-2-max+openembedded@blarg.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1a21e2c2-9301-061b-b797-dc88cc5de69b@gmail.com>
Date: Tue, 23 Oct 2018 23:34:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181023163812.5631-2-max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: Re: [PATCH 2/2] ncmpc: add PACKAGECONFIG[regex]
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
X-List-Received-Date: Tue, 23 Oct 2018 22:34:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/23/18 5:38 PM, Max Kellermann wrote:
> From: Max Kellermann <max.kellermann@gmail.com>


Can these two patches be squished together ?

>
> ---
>  meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
> index 9e8522a9e..8468d125d 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
> @@ -7,12 +7,11 @@ inherit meson
>  
>  DEPENDS += " \
>      boost \
> -    pcre \
>      ncurses \
>      libmpdclient \
>  "
>  
> -PACKAGECONFIG ??= "colors locale mouse nls help_screen artist_screen search_screen song_screen key_screen lyrics_screen outputs_screen"
> +PACKAGECONFIG ??= "colors locale mouse nls regex help_screen artist_screen search_screen song_screen key_screen lyrics_screen outputs_screen"
>  
>  PACKAGECONFIG[colors] = "-Dcolors=true,-Dcolors=false"
>  PACKAGECONFIG[lirc] = "-Dlirc=enabled,-Dlirc=disabled,lirc"
> @@ -20,6 +19,7 @@ PACKAGECONFIG[locale] = "-Dlocale=enabled,-Dlocale=disabled"
>  PACKAGECONFIG[mini] = "-Dmini=true,-Dmini=false"
>  PACKAGECONFIG[mouse] = "-Dmouse=enabled,-Dmouse=disabled"
>  PACKAGECONFIG[nls] = "-Dnls=enabled,-Dnls=disabled,gettext-native"
> +PACKAGECONFIG[regex] = "-Dregex=enabled,-Dregex=disabled,pcre"
>  
>  PACKAGECONFIG[help_screen] = "-Dhelp_screen=true,-Dhelp_screen=false"
>  PACKAGECONFIG[artist_screen] = "-Dartist_screen=true,-Dartist_screen=false"

