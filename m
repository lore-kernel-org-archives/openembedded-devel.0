Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 88C396067C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Aug 2017 21:25:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t138so6976148wmt.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Aug 2017 14:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=0uFjOg4SyXy7MK5AtQ0PGl8Jfi0DU2Umtr7U+/u3xys=;
	b=jIijgI1WVAj+6XMuWvtoD96WNTWk7ladHuVMld73lZUxGtMhGY5DjAk7FryS5q0Btx
	Kr2wJvG4CFLcHW51lezM69ejRf/MyYtcqjWhXL3ABFT+STDQe5MLUfdhuVjf0JrurzBv
	PNH6z1PdHzToscp2klUe6uZoiIcyYE24TFfUHLggwhQYr55WExyCIu/evfNm/sAaP5Gn
	cEmhytGv35X0oLux4XDdKpuiOAB6y66QUqfgIUhcfH2H3llnQ+AqC6WGHWszYKTi+6nv
	C98x2MOoWj592miR3Ww6kjh7vckqHNc3JdGJW4OdBAkABJ+bY5AgurSSXv0r9Pu5IKeC
	dhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=0uFjOg4SyXy7MK5AtQ0PGl8Jfi0DU2Umtr7U+/u3xys=;
	b=qD+/kkLbe3iMCiuNBBxVvqijY3t8RtxZXrNy9Hym0kd2A+6RVcS572C1WDtjPNnH6F
	KtSy7U2yHkDVtKSZ8ZumPVPDR/Xt9LYFIXCIF+OFPbsVsMEz7S16OTttrIdYrI94tzlM
	vWAG/kFgMWFaM+Q5Adg7dMbz9JUX2WoZb124dTzjDYgW1c9M/yALd0uEHmHwdR/WUulJ
	WeeYEThMxbNVp9VHCsVAE6ClXPySY4gFKPR4hT9n3YWATC7oixH7IwnORKLJA3BUD4S6
	t+SKphqhCDX8ZbctiyTA5MTr71iT5p6552es/Ists8j68jfBGjfChopXjnFt1DAkXkAX
	l8tA==
X-Gm-Message-State: AIVw110Doj7Eods652UKhY5StzR3BYr+PMUCgjd9mxeaPRyfbADVCioc
	b00c0aUlc4XwCSPU5QwaV6zP/eF4qg==
X-Received: by 10.80.139.65 with SMTP id l59mr3835513edl.52.1501881950471;
	Fri, 04 Aug 2017 14:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
In-Reply-To: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 04 Aug 2017 21:25:40 +0000
Message-ID: <CAMKF1sqx0z62dbQtQQZHhiDU1_0gjrzSfhOacsmBVkP5ehariQ@mail.gmail.com>
To: Diana Thayer <garbados@gmail.com>,
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-openwrt] Issues adding layer using readme instructions
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
X-List-Received-Date: Fri, 04 Aug 2017 21:25:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Diana

Haven't seen anyone report this error thus far
I would suggest to add the layer manually to
Bblayer.conf and see how then you get better error messages during parse

On Fri, Aug 4, 2017 at 1:45 PM Diana Thayer <garbados@gmail.com> wrote:

> Hello!
>
> I'm experiencing issues building with meta-openwrt. Following the
> instructions in the readme <https://github.com/kraj/meta-openwrt>, I get
> this error:
>
> ```
> $ bitbake-layers add-layer ../meta-openwrt
> NOTE: Starting bitbake server...
> Loading cache: 100% |#############################
>
> #####################################################################################|
> Time: 0:00:00
> Loaded 66 entries from dependency cache.
> ERROR: Parse failure with the specified layer added
>                                                           | ETA:  --:--:--
> ```
>
> What failed? Why? How do I debug it? I followed the directions step by
> step, both within openembedded-core and poky.
>
> Thanks for any help you can provide.
>
> Best regards,
> Diana
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

