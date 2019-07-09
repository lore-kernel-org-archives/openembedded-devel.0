Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA8E7E417
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 17:41:11 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l9so14222128qtu.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q0ZVzvLOg4Jnt8JBuomiahTdvIoDWv6xBntjS78WkLM=;
	b=nDYTO55e/CKrA8qwFxTkf8Ai12O4gSPgL0FXCUegu5llBRr3MpiL8zflc0lsf8vXBm
	x2xrS5KDFrykYQpTup0uxVWN51PpAovH0PdTb/VQIg2wRmFyR9otmoe16+af/dK4yrph
	APXK5KQQh0ccRqT+9QRmBnn6k4/ZYWBtQhXdpR2mOvtiuIs+6gzrRMGfsYYk1WKfVKyO
	c6saUKdZP4imv/mkf0DZvccQTLKf9Pu8IfkRfwR2Lv7FGqBOnWpVvjXNG+wj0IzgF/i9
	FH6nGSEmuJXph6fq+4NuVqifZtZ7G3j2w0hwj4ocy8U5HH0WpHR3+at8wYWZ6cP3tERj
	Awpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q0ZVzvLOg4Jnt8JBuomiahTdvIoDWv6xBntjS78WkLM=;
	b=XOZ/nMQM0FE2OhAAP6pBxGyOgb6RYlNb2H18uOM9/9cG29Uqo938T9UnRXoOkqB3ZN
	Rd1TpZCV6YN9ZuTqqTgidMZecAYr2oIJKmoA0y7XoPj1z0K7y4CjpCBpwTQzrn378UfP
	kuqHwbIeC/aLrmYGG1dEMVQzY+WwhRjz/hcr2yjj0AIAtMAqMfZyNTNyRlILa64Qqnuu
	5EKuTNygZNfvPCbC/QbT8EtMKxW5b/FvektC9qL9M+zNfPDdPgorzoRZPJxgVJvwqkLK
	fwSeQr3WhUgNFx5T687BzsuYBuufqG9Vx0u18skY9nl880GqYnKCiVgh96yjT2wTvlZj
	lLlw==
X-Gm-Message-State: APjAAAWUZZRSAiWdoh1hHlFVIO2rxT68np4YHrX16bHHNiwKiks6n9LH
	L/Ek2Y9c8iXRn9T1WeNBm6nFgmgLbXFcX8kGFvlUz40V
X-Google-Smtp-Source: APXvYqwrY2yGJTcYzz6R1zszFlMscfBfEZNUVU22VDN/xv5umI3MBCGRwQ37/p3yeyT3AOMGbfTN7sgHaHY9mvGJRLM=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr14243244qtr.194.1562694072035;
	Tue, 09 Jul 2019 10:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <1561643269-130343-1-git-send-email-hongxu.jia@windriver.com>
	<20190628100721.GB18526@localhost>
	<0b346c3b-22e5-2e09-3a81-d199e5c8591a@windriver.com>
In-Reply-To: <0b346c3b-22e5-2e09-3a81-d199e5c8591a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 10:40:46 -0700
Message-ID: <CAMKF1sqfgaDzxRuce8uACF7wascrtR6xj8rGT7GOpf7E=oV8tA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH] networkmanager: goodbye libnm-glib
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
X-List-Received-Date: Tue, 09 Jul 2019 17:41:11 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Hongxu

Lets wait until 1.20 release of network manager. Can you propose this
again after
1.20 is released and upgraded in OE?

On Fri, Jun 28, 2019 at 7:57 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> On 6/28/19 6:07 PM, Adrian Bunk wrote:
> > On Thu, Jun 27, 2019 at 09:47:49AM -0400, Hongxu Jia wrote:
> >> Since commit [061953143 networkmanager: Update to 1.18.0] applied,
> >> upstream disable libnm-glib by default. And in further networkmanager,
> >> upstream removes libnm-glib, libnm-glib-vpn, and libnm-util for good
> >> ...
> > Any strong reason for removing this already now?
>
> Make sure to clean up empty package, in 1.18
>
> libnm-glib is already disabled, and left three empty
>
> packages(no package generated acturally). I found
>
> the issue, trace the reason and provide fix
>
>
> You may note original PACKAGECONFIG[glib] does not have
>
> without option, so clean up it rather than add missing without option
>
> PACKAGECONFIG[glib] = "--with-libnm-glib,,dbus-glib-native dbus-glib"
>
>
> > It's gone in 1.20 so removal then is clear, but if someone wants
> > to use it for legacy code with 1.18 this should stay possible as
> > long as <= 1.18 is shipped.
>
> I think it will be upgraded 1.20 soon, and if someone wants
>
> to use legacy code, I think 1.16 in warrior is better choose
>
> which libnm-glib is always enabled
>
> //Hongxu
>
>
> > cu
> > Adrian
> >
>

