Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id D788D60DBB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 20:21:32 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id p5so3892114vbn.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 12:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HEDm4RFR7uhxoPKDtD43D7EKG6UMWQjlezPJReq9wjM=;
	b=PyoNdeWZNEohOLi/Bj3Bm/8MJk8NrJSG6pM6lMMpzExorHaTNTe0obGllHn8HyDJEn
	zaxcVRbtYoeVyzvYyC8vH5itjCeofLAlmsVbpDVqnArQi5Bwgs9dwgrgUb/ZnSVNf+si
	s9lQa3hQMobBfH+80hB1Tkd/CJEn/twAGR0ViXX3uSH75UjekYmOTPIfhgjL+EtcbZqA
	dsO4udfiZy83XHqzuJxXrK0ms8z24tMArl/JsD4bItk/PgfV+z0ldVt4etTBwFwLH0Io
	niu9/zZK/o2D6UvxJ/9p3ioSBfnuGskevGmpzLU760PKD3IkBd3ydZLklextRjz+YB7f
	foig==
X-Gm-Message-State: ALoCoQlFWY8RPAqmZ5QYvOEjCLRJpVWguEaTxDc1VFeiRnzZIKe5tJ514xIcVXbe2qh4L0Hq3K4W
X-Received: by 10.58.211.130 with SMTP id nc2mr15029963vec.7.1390335692945;
	Tue, 21 Jan 2014 12:21:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Tue, 21 Jan 2014 12:21:12 -0800 (PST)
In-Reply-To: <1390332748-31444-1-git-send-email-koen@dominion.thruhere.net>
References: <1390332748-31444-1-git-send-email-koen@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Jan 2014 20:21:12 +0000
Message-ID: <CAJTo0LZOjUDhRCN7QPHwPckvDxzbvOWwEb3iT7ZRdnWwD3zZew@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] xf86-video-ati: recommend linux-firmware
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jan 2014 20:21:34 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2014 19:32, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Technically it won't work without, but it's possible to build the firmware into the kernel, so use RRECOMMENDS.

A blanket recommendation like that seems like you should be splitting
the relevant firmware into a separate package first.

Ross

