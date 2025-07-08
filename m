Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D8CC83F0A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 17:21:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2031.1751995262904804660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 10:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SYjHKHol;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234c5b57557so43443945ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751995262; x=1752600062; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zH+zQ7Q1krGnGE0BWbadtlGM4IJ1Fz2qFW+7cXc2OpQ=;
        b=SYjHKHolz4mjCcXxEysRdZzro+CFXjkVYN2G7RxgLUjHj54FrVcxp/91W2lWUr6pc5
         XaSqWwVFfxr2fVyv/8vGZG2KMQPatEwhWUmffu0psXL3erwKBGg2Rne+iBBZaul3ZRAP
         yLrlA6+jZ88osCR/fd5POLeWlFbu26dj37ujE34wx9LDJd2IS+Wae5ZwcLwSAcsz6hsM
         4cygD3Ej7ygVFzc2gZ9SY/0dLxWH9MXeVUN4j9WlvUPHA8mszuBVVas3FCe2dSGXf2L6
         IHcMOPZOHpQIo5gGArcm3K0I2djVsZ+79/oZDVNxfen3j8lkhZP5L8Bt/hkE6QyNUz9d
         Xkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995262; x=1752600062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH+zQ7Q1krGnGE0BWbadtlGM4IJ1Fz2qFW+7cXc2OpQ=;
        b=o/5XiQ4ovyps1sigHcobKpnLb1vrn44kjwJ4jkIEccRGfEV7qPMQ3hyI2RX6IqasoX
         +tP66kGJC7OhN5KOw8xoxDUuxXUicwSt1jhtDAdUA4e8Qg7UuNPXcwoGs5WBG80S91Sq
         Blhwf8XjpUDCqwOdYg0qMllPsgPzZDDMqhPzNcxHCBMLe589NkG0sePpJDDmZ8KWo/TK
         WTx6uwSRsF8D6fsQQMWnH6JNFm6DjKWTi7MB6FEgS8BEdWigpNtiiO0UefN0cW5faeU0
         83FLdZKgJVRDXQFD4bxJNEJQxqtAVObrCtQ1ox54pM6kC3P40bXyfQFe8WX92GlA2EQJ
         OQqQ==
X-Gm-Message-State: AOJu0YxGIVINf4lIpaFbhqS4Ti9sgyF5imJ8zoErRt5hmoE1GCpzpVeX
	E8GwLkM3jEou1ypyR0mGnmWiJ9nA8aa2CMijHVpYVqEEOvFFyPa5XVQF
X-Gm-Gg: ASbGncvCWVPZUShppJHBQDsXYRN0pcKUoWtxshxzqcnGsGUXKpEN74gGxos4K1oh2dy
	oASsYCSrRN74HRf5B/xo+Y5RuMgjfHtGMhgQKBciNh3YlBmlQC0zpN5UTRtNXTVyNib9oqhmoBt
	+LYLv8woGDr0z0Radt9yCcNXDIa14VX/T6wRQS/FEvPpeplEFhAiyjrFim6Ked/jAG+9H8RM5TA
	pByLGqjEXxT7ii365kLiznX/NMoetEZR/l9IN+HRMGs+K4noPwmPEbxMzmfwZzsKzmNKGX3Me5z
	pYvsLG3+4AOdpvMfJHY/KtOPsHCdv2RR7ExdT715V/tDhFiRT2qjpZNRLUA=
X-Google-Smtp-Source: AGHT+IEtrAykeGE0mdw7ejQyKkCUn0mrExXuvs8hiIlbDi59JJf66wvU0ucVgHz5l0rs4is6UdFoRA==
X-Received: by 2002:a17:903:124d:b0:235:f143:9b16 with SMTP id d9443c01a7336-23c85eacab9mr306764695ad.41.1751995262211;
        Tue, 08 Jul 2025 10:21:02 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845b740fsm116408505ad.232.2025.07.08.10.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:21:01 -0700 (PDT)
Date: Tue, 8 Jul 2025 14:20:58 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] gpicview: enable gtk3 PACKAGECONFIG
 only when gtk+3 is available
Message-ID: <20250708172058.xa73kq2wf7nbhuyf@hiagonb>
References: <20250708105155.478279-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708105155.478279-1-martin.jansa@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 17:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118321

Hi Martin,

On Tue, Jul 08, 2025 at 12:51:53PM +0200, Martin Jansa via lists.openembedded.org wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
> index dab11a02bc..ace909fcf1 100644
> --- a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
> +++ b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
> @@ -15,7 +15,7 @@ SRCREV = "ca13623c6176585db4759ce4371fbf89c56fa630"
>  
>  inherit autotools mime-xdg pkgconfig
>  
> -PACKAGECONFIG ?= "gtk3"
> +PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk3', '', d)}"

Thanks for the patch. In this case, shouldn't we add gtk+ if gtk3 is not
set? If PACKAGECONFIG is empty, then the compilation will fail:

| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking for gtk+-2.0 >= 2.12.0... no
| configure: error: Package requirements (gtk+-2.0 >= 2.12.0) were not met:
| 
| No package 'gtk+-2.0' found

Or maybe add gtk+ as dependency and keep the gtk+3 only on the
PACKAGECONFIG?

Best Regards,
Hiago.

>  PACKAGECONFIG[gtk2] = ",,gtk+"
>  PACKAGECONFIG[gtk3] = "--enable-gtk3,,gtk+3"
>  
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118307): https://lists.openembedded.org/g/openembedded-devel/message/118307
> Mute This Topic: https://lists.openembedded.org/mt/114043964/9076898
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [hiagofranco@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


