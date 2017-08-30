Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id C0F3B7827F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 17:10:37 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 105so2872610uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 10:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H87M1p6TpG58m1SuFDGthE56l6d7+i+aE0/70Z1lVcE=;
	b=IXXSa76KDCnLxOehhDjHdT8g94bC03YQqHUQ0aDFlOHFgfalXJo4ZiRJLC2a+N+oVF
	9i3jd/0GEopCgFNt2qc1c/PPVCydCQUw/8PsVVa3ABwEKoBHCOxQ4BD30S3nMTDp9zSU
	3FTnDvOOqtJpqGsmItrdY3HyHwSllKeWOuvg9wPbf+E1RVrn3CV6ygiGoxfdC78CO1b1
	iobmF/PpJSfh/y3aJ4kYG9uTPE2jt1Xor8x6WlX7wseZphiByZEfuh+meWW5fBDo3eP9
	dxUJwgUIGt6zEtvXVWwRQ76BK2p112u8SxG+pMMUlLd4BqPdvuh1FfPg7kSfLy9TJI4c
	v8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H87M1p6TpG58m1SuFDGthE56l6d7+i+aE0/70Z1lVcE=;
	b=T3eHgnQRaO+Ar6qj2IJvl2/6wOqog1VbIpyoNvKLV0U2ngd00mocOMP0t4ekVC9DZ9
	YkdDFrr73tDcKXrS7k8ChsgI9I9F8hr+YEw/fponChmswvaOf4VD4nNTeqshWX3Btb2/
	UIIUaKFvBB80ScVvuudKq5SOBnBeBjtHw+H0y57sHX3dqoHdBdLCvUaLSAHj1vDNnr9W
	N5D012XsY0BWhIB5sNFRITNp/Niyam7yFxvgRb537mcstvj4r4Kz7B7yCmYPGhYDs/jK
	S7C40MEb9+/0S3F6d/varKu05LDNi12leXQPq9ebrK6GOESr4YbFJhI8BzaCf0qHo8TO
	3UJg==
X-Gm-Message-State: AHYfb5h7lR+6CGOKQwFIb6TSjqc3WiBieuDbkhWhPKHL7sxPwy84iWzS
	QspnBCPZfdSzfMSDYpBYe160u5OOfw==
X-Received: by 10.159.38.82 with SMTP id 76mr1575850uag.160.1504113038517;
	Wed, 30 Aug 2017 10:10:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Wed, 30 Aug 2017 10:10:38 -0700 (PDT)
In-Reply-To: <20170828163937.29460-2-adrian.ratiu@ni.com>
References: <20170828163937.29460-1-adrian.ratiu@ni.com>
	<20170828163937.29460-2-adrian.ratiu@ni.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2017 19:10:38 +0200
Message-ID: <CA+chaQfSOVYsbXY8BoguCKS4Zbs14cPVr+W=i_nc+TaqBaLNcw@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] system-setup-keyboard: unblacklist recipe
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
X-List-Received-Date: Wed, 30 Aug 2017 17:10:37 -0000
Content-Type: text/plain; charset="UTF-8"

Can you please fix:

system-setup-keyboard-0.8.8: No GNU_HASH in the elf binary:
'/tmp/work/core2-64-oe-linux/system-setup-keyboard/0.8.8-r0/packages-split/system-setup-keyboard/usr/bin/system-setup-keyboard'
[ldflags]



before it gets unblacklisted?

On Mon, Aug 28, 2017 at 6:39 PM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> It's dependency got fixed by commit 7f502e72397b0
> (system-config-keyboard: fix depends to work correctly with RSS)
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../system-setup-keyboard/system-setup-keyboard_0.8.8.bb
> | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-
> setup-keyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/
> system-setup-keyboard_0.8.8.bb
> index 0bd7af734..fbbfa3dd8 100644
> --- a/meta-oe/recipes-support/system-setup-keyboard/system-
> setup-keyboard_0.8.8.bb
> +++ b/meta-oe/recipes-support/system-setup-keyboard/system-
> setup-keyboard_0.8.8.bb
> @@ -29,5 +29,3 @@ do_install() {
>  }
>
>  FILES_${PN} += "${systemd_unitdir}/system/${BPN}.service"
> -
> -PNBLACKLIST[system-setup-keyboard] ?= "Depends on blacklisted
> system-config-keyboard-native - the recipe will be removed on 2017-09-01
> unless the issue is fixed"
> --
> 2.14.1
>
>

