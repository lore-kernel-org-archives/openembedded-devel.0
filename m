Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5027F094
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 18:53:11 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id x22so41625397qtp.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 11:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3aSmragdCbjmdsQwbBnPmjv8qZCDWgwQ4md6uwfc7lU=;
	b=tr8RD9rVXUXxPdhnxfEu2pXjPWEvc9+dAYnQyD9Qt1T+t3mGifCJpuJxxMVKbTS5M+
	QiB4niZYRGsfpm+KZTgMYUc9ssIidl3lf/AEjo3YNQ+RGF+uSXtM910nuXHdO3QRkccY
	tmz3S3Og4QqrgOp5zPn+5DCNYWOe2DOWxuWb6vqDsBTxavV9rmHmeYF1I+jYdSX9y1XD
	OhGRAZgLLPvtkhLXipBvbuh0pmF0mbZFZFKl9cA569yvcCFSSVhMwqtIFSSDm79triuT
	0eBXj8XfYIfGMk2nv/RD2SkPIEYcNTPMr5d4nLJcBTliTVR+DENzbIjZzXnBmZPOI+Vy
	FVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3aSmragdCbjmdsQwbBnPmjv8qZCDWgwQ4md6uwfc7lU=;
	b=Wb7QQhgs7QTjjcLPAUofEr6Y7cab/0sWUulEj3Rk4x+Lu0re4jeow4QFTLAGpY3f6G
	qLHdvRjr7/3osdmcqoT1yZC3lYRzndPcQ0SomHLJPhdAX8TEB8cm+r+dnjA9Xmp0OM6I
	vIIFjQLCdGezjBWSYka4ay0/Sssdq7mlO2iZisjICtI9b9fsKXajXpYVMMF2p8fGr4Yb
	3DFyI+4QokOU/P73ZnP22Pb6xVHkw6DaUrbxhsm9if15rQibf4jj7Akeb/Fe/Iku/kgx
	ZZ49+4k4gTrej8vQ3y0LKHeKxFQznfsF3KH9vVnrwzVhPh64lGbbTfjvDlF5ZAkmtk/E
	ZwhQ==
X-Gm-Message-State: APjAAAW+Ejw73uv8s+8jRJxMtOSz5TicoyJS2AXLXY+hRe8GEpDp18yN
	8SsZ4jn/1PEc17Qtu+FWQxVrML4EamS+XpGxzpEUzi5Z
X-Google-Smtp-Source: APXvYqy+lPLOs6NEVbgo7pjWFNPAvHbQEeizNjbc+wiiP6vOOBwLeg5QHLbQkG+V0NGQq5ReQuGvRH0rj66yCqlMKRo=
X-Received: by 2002:aed:3644:: with SMTP id e62mr57379318qtb.80.1563994392312; 
	Wed, 24 Jul 2019 11:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190723151649.9238-1-bunk@stusta.de>
	<CAMKF1srWP3iFCHveAGELyZzQ0QeB16PG7+2H536au1QAoWOqCA@mail.gmail.com>
	<20190724103835.GA27634@localhost>
	<CAMKF1spNvU2v5n+_a479E5ZEjGD5nti5Wmcv2aaV07nE_kg4mg@mail.gmail.com>
In-Reply-To: <CAMKF1spNvU2v5n+_a479E5ZEjGD5nti5Wmcv2aaV07nE_kg4mg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2019 11:52:45 -0700
Message-ID: <CAMKF1spr1WkWTO_e61wQwagLeoOMgyUWxq=FKswNar9=wPtYxw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] meta-oe: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Wed, 24 Jul 2019 18:53:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 24, 2019 at 6:34 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Wed, Jul 24, 2019 at 3:38 AM Adrian Bunk <bunk@stusta.de> wrote:
>>
>> On Tue, Jul 23, 2019 at 06:44:49PM -0700, Khem Raj wrote:
>> > This causes
>> > https://errors.yoctoproject.org/Errors/Details/253988/
>> > maybe due to atkmm change is exposing another missing inherit
>> >  gnome-system-monitor -> gtkmm3 -> atkmm
>>
>> Does gnome-system-monitor build for you with musl without my patches
>> applied? It doesn't for me.
>
>
> Yes it did and build again after reverting there is a chance of race condition but this package has not failed before
>

a simple rebuild is successful with the patch as well.

