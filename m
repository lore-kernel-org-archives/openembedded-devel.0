Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8FAD178253
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:53:42 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id u133so6763050vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3wNUbVc63ICuiLnE7t8YuV/P9Z/rkFSKEDKJiDI3mxw=;
	b=UHZ+WEa/mmlz1JLATQOxch1r8Lbkiys1CsCufrdvetsMDTsWzTt8V6+KH2Gt3wGBnA
	rRNlq9hvn7Q2J4KujGulvvCCu5KMeRXHEz+RYo9ryPa48Q1TbxEbufahGuAv9e9A2oqv
	tivBVDDT17i83lOpQmzrH1/mi7ojLLFJN+7x3OF7T2Qx7WCoBw4Df6hNsn5vlr+gh905
	TMbi5H1vCJKKcqBP158/k6JpureHMdnDsqgQeyN7J87uzjhAIme64PnK+sciQruGoBBS
	p7nlmKaupuhxvgycB4pL0o65mTU5wP/fYfpSI0R5jlnJTYpEFWxgvtG9S6dLDYTGkU0l
	u6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3wNUbVc63ICuiLnE7t8YuV/P9Z/rkFSKEDKJiDI3mxw=;
	b=qH8sTor+R8VnusKXxfi3Qjwqv4F8CuudetsPhCdBrAR+QLtr9AFjJXk9i9TnOoro3j
	tVah1gFVQ5ssA2LZyre+ILpvdICgMtjl8L5VufTkLXFJ6SS5FfxzqdnscVgghdUjHt57
	ukn0HmEa64AaoahKpqvDn/7V4ALu9oJHdOtApXa6455+HhU9YrY2s/c4+Khh655jdp06
	4jqwKEYu8peRZTBUJ5DXs+YmUalSiN5jnFmaUmKx24aJL3AyMWeaHwaQ10NgJEg3GD99
	jELM5fNUOReFVXK0O8aWnwNQE1CYITwVhpGSyx/pn6COcenM1q6F2X2iO2zVIlkOLhyg
	m9DA==
X-Gm-Message-State: AHYfb5hYPVvAtqPpTX+OZIIZNsHqIpqEtRhEt+wKciLyWevnBgRKgA/9
	Mlm5JQtZ3dSNa+tFM9jiD1JOV486Zg==
X-Received: by 10.31.248.197 with SMTP id w188mr17968134vkh.182.1502834023252; 
	Tue, 15 Aug 2017 14:53:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Tue, 15 Aug 2017 14:53:42 -0700 (PDT)
In-Reply-To: <87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
	<87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 15 Aug 2017 23:53:42 +0200
Message-ID: <CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Tue, 15 Aug 2017 21:53:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 15, 2017 at 6:23 PM, Raphael Kubo da Costa
<raphael.kubo.da.costa@intel.com> wrote:
> Khem Raj <raj.khem@gmail.com> writes:
>
>> what are main architectures targetted with crosswalk ? I think scope is
>> important, since meta-browser supports, almost all oe-core supported
>> architectures. including x86/arm/mips/ppc, any cross build patches are
>> required in anycase, but architecture patches will be additional if you
>> were only considering a subset of architectures.
>
> There's nothing Crosswalk-related in my Chromium recipe; it's in
> meta-crosswalk simply due to a historical accident and the fact that I
> haven't found a proper home for it so far.
>
> With that said, I've tested my builds with x86, x86-64, ARMv7 (IIRC
> Chromium doesn't support earlier ARM processors) and aarch64.
I think the update stopper for chromium on meta browser is the new
build system (don't remember the name). To take this step and have a
more recent version of chromium in meta-browser would be really great!

Andreas

