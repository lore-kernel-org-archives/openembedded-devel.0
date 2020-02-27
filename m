Return-Path: <ricardo@foundries.io>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id E3CBB61872
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 17:57:40 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 59so3728383otp.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 09:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0PoABGx4MHMm2F3mr/8L59+tv5Lc6OFVhzXGAV2mSPE=;
	b=1eY3p5QNpNVuTWVPwlB2z/xH+nFKRyeKtjy2QfDgo15Ze4DTW9XwJ8RGZM9qc1D+9E
	yOW6Jnu+2GFgoWhYeK0DZrGC596jpfW3jZlCbcTyQVDTmOfj5B5hnrErC0f18PeHSAL0
	bcDdFwCSypmdLsuiAGY4oGdT4/g4cHzr8VeEUW+d3oSem3l6UTB0LmjdpL1n8BFCjRtu
	djZJLlnoOuSqcaQMscZBExNGNI1TPFE83KnBD0oaO984mEebdrRFHpMw0L/J2z5tpoBd
	E2AJ0SjusYTBwK+uXDkqULjt56sCzzqGyB/imTDr+iLEhoz8j2vz6eFKxQoc3Zqh9NAv
	rr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0PoABGx4MHMm2F3mr/8L59+tv5Lc6OFVhzXGAV2mSPE=;
	b=AReItSHCq8jrotuCF9/W1aX9s8+MQRZ8xkEBupxHN/wHxCPf5tOYwDNfqNFiUUriNX
	eYUT2mTqHpRWY0/GoFUMibz7U388taI+3SZMqSVhTnqIa2HefqqwOkTgxnMuuACODj7Q
	BkZaXif89+Q59QZpnsyzhH0cj9ONewHJEvn2/B/87/HCO0R48s5la6L94AN/o0M5Shdr
	iP1Zcf2LXFLxf2VHchYJF8uc9e6oe9RACzVhF736dGmNgZes57bUHuoBjg739c+QBurr
	/iHLEMrZ8DBx3K1giiYRozG62Uqq2BrcGPWZZsq3PK7m47vWJaQCcpwUFJyFy86vafAC
	d5ug==
X-Gm-Message-State: APjAAAUpmJv3nBINolxgAC1PWiFwG3Ai6m6BLvlXKClTQhnG7ZMKsXrh
	thi4aQrudjPcLI+JWtMupO4SKrMYThDGEn6N7fT4
X-Google-Smtp-Source: APXvYqzxstVZ7p7TDl3awFAkDBUBDnhjSW9onrdI4b6z88EbvelYZXMMuhRgI0uPIop5MM8tMYIUgLreqoNAvj/sjh8=
X-Received: by 2002:a05:6830:1e76:: with SMTP id
	m22mr57467otr.295.1582826261751; 
	Thu, 27 Feb 2020 09:57:41 -0800 (PST)
MIME-Version: 1.0
References: <1581723823-21171-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723823-21171-5-git-send-email-wangmy@cn.fujitsu.com>
	<CAAaKDhE__cs1WdFWSN7_JRDfX_TzyxUr0eQpYWNTRSxvmdoZ7w@mail.gmail.com>
In-Reply-To: <CAAaKDhE__cs1WdFWSN7_JRDfX_TzyxUr0eQpYWNTRSxvmdoZ7w@mail.gmail.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Thu, 27 Feb 2020 14:57:06 -0300
Message-ID: <CAAaKDhEo_vgX7Ey8R1tqAqKvk4GPEQb1xOhNJwu9rV-A0b7oNA@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libp11: upgrade 0.4.10 -> 11
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
X-List-Received-Date: Thu, 27 Feb 2020 17:57:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 27, 2020 at 2:52 PM Ricardo Salveti <ricardo@foundries.io> wrote:
>
> Hi,
>
> On Fri, Feb 14, 2020 at 1:12 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  .../recipes-support/libp11/{libp11_0.4.10.bb => libp11_11.bb}   | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/libp11/{libp11_0.4.10.bb => libp11_11.bb} (93%)
> >
> > diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb b/meta-oe/recipes-support/libp11/libp11_11.bb
> > similarity index 93%
> > rename from meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> > rename to meta-oe/recipes-support/libp11/libp11_11.bb
> > index 655db4907..5a0951df2 100644
> > --- a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> > +++ b/meta-oe/recipes-support/libp11/libp11_11.bb
> > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
> >  DEPENDS = "libtool openssl"
> >
> >  SRC_URI = "git://github.com/OpenSC/libp11.git"
> > -SRCREV = "973d31f3f58d5549ddd8b1f822ce8f72186f9d68"
> > +SRCREV = "e1210903291b1de9eabcad26e740a4b2fbcca692"
>
> Is this change really correct? The latest libp11 upstream release is
> 0.4.10, as you can see at https://github.com/OpenSC/libp11/releases.
> The next one seems that will be 0.4.11, so now sure how it was moved
> to 11 directly.
>
> Also, the SRCREV seems incorrect, as it is pointing out to the 0.4.9
> release (https://github.com/OpenSC/libp11/commit/e1210903291b1de9eabcad26e740a4b2fbcca6920).

Had a typo, correct link:
https://github.com/OpenSC/libp11/commit/e1210903291b1de9eabcad26e740a4b2fbcca692

Cheers,
-- 
Ricardo Salveti

