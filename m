Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD3B6C23A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 18:52:33 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id g15so6561088vsf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 10:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DPyAW0ioOlOsynUATy3swZn6DorkbkrzHJoa9dw9G4Y=;
	b=qhEOSIUik72E5khGC7XjrOwb0mKl4pf8T2cxcW4jNN3F/R1BVY2sxyVQCCWI0QQgHB
	MrpUPzf3/wUGNqqrMdPI6aSWFLvBmAsJgveOL5qVe7WEnRxh2Vg4BTRLwzijp0lWw051
	VeBD8sL3vMrnuosaJzFl9Kzu4vrYlOC3+FFO2Na72+QbT7igp5bm7iPhSxOZgG3ERVkR
	ypzLFirNwn8udRwkbbDlGx4XTIpzDUHFjY1s6WvesbiA0LpIJEP++RE5DsC6O4hnQ2wG
	HVQ9COao1sC+pf4Y56b7NQbNjX5GZGU82xpmyYFlBqUju/WTXWqVsbrofa6Fci4XthYS
	Y7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DPyAW0ioOlOsynUATy3swZn6DorkbkrzHJoa9dw9G4Y=;
	b=ZeN5Swm+lA2r9t9z1cm4Lpsc1jz579A1ExDByV9Yn6BDO5cLdSNSGlA/GyUiayAllb
	uom0QR76lddDUY2WhZGNvsoaoQcI1Tj56PBO5fAt8R3p1EtG7fmdOa9gyD9tFkV+nMtZ
	roG428WqG4qnl4wqE2NnF9AftM5DdYo+MopsubEry6pTo6q7pNCUjW2c0Kx/hHyoDuMw
	V/zxTUAG2VoD4qNG/qxPR7lM8y4Eitq6xrf6K3vx3PvMymKgWdShTJ2R5Bu40kcHFu5j
	hyKH2/HAOwNl4yVhnWe+MuKZHXv1Vg5lPbgiaY7Vcx9MkDl0LNSCZNF572iQJa7EzCLH
	yH8w==
X-Gm-Message-State: APjAAAWo0sQTrx8sk9BaHjIPaNdvuTChVpnYQ4KH6xw9fcuh9LSj6oGM
	njN1Evr2bBZb/GITsNEn/jKc92ZLCGGeegr0/SU=
X-Google-Smtp-Source: APXvYqzAgCHkNVJiY+YTK4ZObbCacZKHF21Z5DexARGxq/qz79z1OXOBtm311Eshx+GHSPMib1+8RyDiDXdsk86U2cg=
X-Received: by 2002:a05:6102:3213:: with SMTP id
	r19mr7467448vsf.83.1578941554120; 
	Mon, 13 Jan 2020 10:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20200113170209.95601-1-alex.kanavin@gmail.com>
	<20200113170209.95601-3-alex.kanavin@gmail.com>
	<CA+chaQec=MyVT6a7FkmKPG5izt5UydqhSXqv6-POKh558Y4etA@mail.gmail.com>
In-Reply-To: <CA+chaQec=MyVT6a7FkmKPG5izt5UydqhSXqv6-POKh558Y4etA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2020 19:52:23 +0100
Message-ID: <CANNYZj-j42s83n9RsWoDpKyTpQUhWMGx9=82zVt0Doa=MDFy9g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/3] sysprof: move from meta-oe to meta-gnome
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
X-List-Received-Date: Mon, 13 Jan 2020 18:52:34 -0000
Content-Type: text/plain; charset="UTF-8"

Because I already had the patches ready, and simply added the move between
layers on top of them. Placing it to the right layer requires either a
patchset do-over from scratch, or resolving a merge conflict with
possibility for mistakes.

Alex

On Mon, 13 Jan 2020 at 19:15, Martin Jansa <martin.jansa@gmail.com> wrote:

> Why don't you add it to the right layer in the 1/3 change?
>
> On Mon, Jan 13, 2020 at 6:03 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  .../files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch  | 0
>>  {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb  | 0
>>  2 files changed, 0 insertions(+), 0 deletions(-)
>>  rename {meta-oe =>
>> meta-gnome}/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>> (100%)
>>  rename {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb
>> (100%)
>>
>> diff --git
>> a/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>> b/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>> similarity index 100%
>> rename from
>> meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>> rename to
>> meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>> diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
>> b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
>> similarity index 100%
>> rename from meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
>> rename to meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

