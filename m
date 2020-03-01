Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id BED6D61923
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2020 13:43:57 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v22so2003826qtp.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2020 05:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=aqp120+V1evV+DCgD+Ffu7mdJC4/TrjOhGIZNF43B0Y=;
	b=LaoH171akypku0NhaDJT758FzwvmiB1vy1HZUuGpPthI0m2WbwXfgpzVn9M/Z/gVj7
	jOQYYqY5vzdPY98NKHCvVA3UVXGvwoDNqaugfeVlotbUrPDT54MxkMMasgb00qJoK/OD
	eUuBrCnBiJy1CrIxivLVS/wqyAdFcqHd6YzwZA7kLXuATDwe+z2jxyXmjjm3A7KIQT0B
	+PffyM1nzuS7ETri4u4jueO7mY0iifIWKzFnNBjtQVab8chQIKpatzYrf1OA7DlMKi5i
	rjafsFJsVjVx4RnT6paOwEmaDgG0LWanX4ozGR597F7VDVkDaaIWsx/5aYohOElwVfCR
	i/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=aqp120+V1evV+DCgD+Ffu7mdJC4/TrjOhGIZNF43B0Y=;
	b=Ea6WWYy3rnrB5j6Nwsed5Pgb0JD1sLzwXGKCPboqLivGMimGYl5bPQL5EothoxKRTL
	gllMKvLyWRqvK9Wezz1EbOZnVzsmTIeoaD2NIPsYdQ9V6J4rUDxtGXQmAm9UayYofLzs
	dc0P0BeprCX5Ofk48jaX5qwIh3ZkdxG5sg7u88ZyQFlty/UUyk+OSmr9dm//AhaGhqGr
	8FhwouX06FOBnq2NEBiy73Kzct9CzECqbeOeeYT2lmT6RLBsexIEPt1/Tje2AOWac6ZU
	5fUsEhn59ZQInWokYKorYqy31TwHMwaFWvh5hlb7tlRCgXxVSLuBUmmG8ZAEa8ckdJOE
	g/oA==
X-Gm-Message-State: APjAAAWlCNX+uABv+ubXmoMz3/UGoyWcYY6yiebFBSD8DuTnTx9YFr7T
	QZvZlLDaJjl1KP3BP51fBLmGAtrqXIzprQ==
X-Google-Smtp-Source: APXvYqxUJtHiPUw84+8tssCovgDZJxH3yRPxC5MvKACbBF9/S7plb33sXb/f/LkBc9OrGd+KelTOdA==
X-Received: by 2002:ac8:4e91:: with SMTP id 17mr12254128qtp.133.1583070238201; 
	Sun, 01 Mar 2020 05:43:58 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com.
	[209.85.222.174])
	by smtp.gmail.com with ESMTPSA id f19sm543728qtp.46.2020.03.01.05.43.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 01 Mar 2020 05:43:57 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f174.google.com with SMTP id u124so7534839qkh.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2020 05:43:57 -0800 (PST)
X-Received: by 2002:ae9:e509:: with SMTP id w9mr8448752qkf.26.1583070237025;
	Sun, 01 Mar 2020 05:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
In-Reply-To: <20200228150345.11829-1-brgl@bgdev.pl>
Date: Sun, 1 Mar 2020 10:43:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
Message-ID: <CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Sun, 01 Mar 2020 13:43:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

On Fri, Feb 28, 2020 at 12:03 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
...
> Over-The-Air updates are a crucial part of IoT systems based on linux.
> There are several OTA update frameworks available and many offer some
> sort of support in yocto (e.g. meta-mender, meta-rauc). There are certain
> operations that are common to all of them such as: generating binary
> delta patches, system recovery, creating provisioning images etc.
>
> This patch proposes to add a new layer in meta-openembedded dedicated to
> OTA. As the first functionality it adds a bbclass for generating binary
> delta images using two popular algorithms - vcdiff and rsync.
>
> Such images can then be easily packaged in update artifacts for different
> OTA frameworks.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I see the value of this, as we are also doing OTA update framework
development, however I wonder if it is worth a new layer for this. For
now, I'd say to put it inside meta-oe directly.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

