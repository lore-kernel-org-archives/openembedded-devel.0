Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9018D79980
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 06:12:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 468tK51006z6c;
	Fri, 16 Aug 2019 08:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565935962;
	bh=3CBTNMnclqcI69rVYMv2hdVma5BRZbSeEdXqtLMixNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWljW23AQWPbDh4g4/M1cO1K4wCza0OeIpWLiU2YmHQjg+mwP0Fz8O7AEGbQC4FDY
	RFGelsi2bkvXqv9yD5EiQzybmYEjZn+XrPwOHupXJ941nk42y/YEEPhwVnpaJ+SIqC
	Cz26B8catE9j/NK9HnkEQa64N62wIvElfY+45fTRQdfUyLHbeinVz44I3+dsvng1kQ
	/oEEbT/NeZ1CUXnJwmHfFUB68fvb3SfgSMav5W2gu1d4eBEOWdknB9lHH5qABhrBIw
	Ec/4wZaMX3Nkaa5YTgwYfb9E7sgjDb0Uq8WrBXbielFKyIC0rZLEr9od3IO7kpzgZT
	yO+nlf0FVH6FOfcVbkee36zcqnoZYN3e13+3tdhdrKYbL8dzRVRixM00UFQaedu61S
	S+7Lv/zeam8TFkmHKYOON0IzSa6ZcBmCaeSiAHcmwua4g0w+df3WX5+5ewI6LYR1Ym
	PkYE5xMGWujcEfe7Inlyg3fvfubyiMECnBbAyFOZBsDqA1XsrXqdpGc12onxV5zT26
	lWihS2OYvLAiZSFKlimJf3vG8CFjtaRPfe0lMHtPKsvqhn5Xl7miIbOCK+EZX3s1rr
	YeqlM+9oBSyrnb5hYsZT7t632ZSm/Mb1RbTy2nOX+Z07YjbT4OgvoA/c7OIcWJ/Ius
	roRMJsE/KJl//T1tQGlVGDIY=
Date: Fri, 16 Aug 2019 09:12:39 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190816061239.GA18239@localhost>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
	<20190815215605.19600-11-schnitzeltony@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190815215605.19600-11-schnitzeltony@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 10/13] parole: upgrade 1.0.2 -> 1.0.4
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
X-List-Received-Date: Fri, 16 Aug 2019 06:12:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 15, 2019 at 11:56:02PM +0200, Andreas Müller wrote:
>...
>  inherit xfce-app gtk-doc mime
>  
>  DEPENDS += " \
> -    glib-2.0 \
>      dbus-glib \
> -    gtk+3 \
> -    \
>      xfce4-dev-tools-native \
>      libxfce4util \
>      libxfce4ui \
>...

This looks like an unrelated change that should have a comment like
  Also removed dependencies redundant with "inherit xfce-app".
in the commit message.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


