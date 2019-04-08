Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id D690F6B512
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 23:48:27 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id 139so2057330ita.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 16:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=L/TnXLLq8IdEA/9qHZg8qlPp406WKqEldGEcEPC8lJA=;
	b=V2Er5MQEyaeXkTZUhTeKYHwKPFT4IoeWFKiCUyg/quyio5K4f79Pr59lbNde+d7HZC
	P8b3r7wdlTk2s5FkiakM3QhNJ74bHPhO8YBRWQ/xlV7wclikMBB+0Xmj8gxnJKQt08P/
	Zienl2IFbkkBxc25OeMUwuYN1yqa8Wnhptteobnqsmbp3VC/uK2CN9DretvSQ2TZaHnY
	niksMAprhbsFOm8ATvNKIo4NnGYz4wB8nwGjX0dcxfzFamIefrKLrb/RoY3s3GPk5Pbk
	bf8aopMeJWHTRYdoXx/VOfd6MhmWH05nmlADuMwAoaNcGbItAgF28G/FYEUy8DNxlsCm
	UJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=L/TnXLLq8IdEA/9qHZg8qlPp406WKqEldGEcEPC8lJA=;
	b=Kvh1dPvV/xrv09y/eTsnV6dBktk5IoO5dIVDYS74Gh4ZJRF/aJLrZ8Hn7REb9sLqdB
	ZRt+GyG5qd4IsqQ5F3Z0Z0TSiXTVA8g5PqCH7rz7e8f902WKo4R6lhaxYbGfjAsiVPuq
	bTTZes9Ujot0Ahhv1M7U0bV5O/p/NQT24gUWF7wymK12yDmv5l2N0GaQD+MSoUfMt6fs
	lSoV2yGBIjg6Q2u7wKGQoCVpdY6rCtVHPEwiCOOSXR2Wc4LbivSHGKn6yE3JJYj65GSi
	0GS/zeNj8VwhFXkZT5dyRza+TZl9m3nsWYeFOusYnqoGzCGFggKgm6k/baAtA3QX1Fq6
	rsXA==
X-Gm-Message-State: APjAAAV7zihEwrZos0vuPNgk9dJPnd2JAW7BUeTeM6KI567rpc8aqS23
	pBi6NxVKh6Z+b+0tItAe01EZKcdH1GJyTgQf2IubRg==
X-Google-Smtp-Source: APXvYqz52xrN1QJrbm6laDMqvcY5hhr6eGlSCbseDxRljey7P0pM7BI5FYpvBpBwkaVNTd8J+PK7rirEu0ygAO+0ssI=
X-Received: by 2002:a24:43c8:: with SMTP id
	s191mr19563072itb.109.1554767308790; 
	Mon, 08 Apr 2019 16:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190408224258.1744-1-schnitzeltony@gmail.com>
	<20190408224258.1744-4-schnitzeltony@gmail.com>
In-Reply-To: <20190408224258.1744-4-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 9 Apr 2019 01:48:17 +0200
Message-ID: <CALbNGRR=6wqoLuV49-WZNut5=yLqqSj8HtK+qmTPQiQG2TzUBQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH 3/5] parole: replace gstreamer1.0-plugins-good by gstreamer1.0-meta-video in RDEPENDS
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
X-List-Received-Date: Mon, 08 Apr 2019 23:48:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2019 at 12:43 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Please ignore this one

Andreas

