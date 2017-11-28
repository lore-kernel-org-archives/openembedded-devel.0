Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 55A2578258
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 11:58:56 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id a75so64081oib.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 03:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=u+L08DRa5O7b5mcM6l0RJ1FW3eklNwx1XHiYxO6XoMo=;
	b=HMyDrq6Uaofem3U4qMUzfqQ4f0v9EvfaiFLcqXxzAxDrOT64CdG5KL7aPsoFs6sLuS
	OIcdBQaqlLUrv5FxS6V0et1mtuN0LuUWZfk0mHUutyD/ivbYoroQ/UcbFOBBx12nO5no
	uTyHBZDWV9Iz1vv19d6/BEd6BIle72+dAQ1ekOS0nUo99+4UEFsXIuGejRu3KrfM7bhG
	r5oe6GKlthO36evQD9yIOEkdgNhzgVlD3iHeUEcKKZCYYqPn4F4U3PU7bHDQeSB2VtgB
	s26Amn90G4bAUFifVoY4C2WU4lhcAQZuvIdr5fyLrafpC2cXhejaq+z73vaCW9n2bZBg
	k30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=u+L08DRa5O7b5mcM6l0RJ1FW3eklNwx1XHiYxO6XoMo=;
	b=r65u2Soqc0NLw+3jy9RycAFNtr+0sxISfqd4H0zJj9IFRkK7jsye9rvm2k3k1g3qaN
	9jSxFJ8TBtPzvn8KjZ0dF7QWD0cRdM/8m1cQqn7db48uc/c0wW2LfP6BRF9BNajT2oso
	psq4u1a433du/Sb19q/MngEx8e56VeeihvtB/YohYqE9rUKn1VMiv134RoXVPzomvrkQ
	cFgnzngm+y2LcHkyDQ7CR53VqAvHSingITki7MwYA9qYwHyIYwV+wxZ5K040MLTepBGK
	U1g50gvG0jD15gLgjx0Fe+9oPVpfp5VaFfmS8PMxO5YJqAvsAzC9McwxAIC9AnriHWHT
	xwxg==
X-Gm-Message-State: AJaThX47wHgyTlZCxW5x7XT39xv2ylUb/HS9QtIWPC9LFV/UK2kfLQbz
	4zVmVVzoBpxZl7bpj9sFg2vpvsf3
X-Google-Smtp-Source: AGs4zMY1Jz0T4RUR3rvm51ysxLTpjL00tdRU8fw9idOWZAGBlDOm0LlG7haMrVHYmR93TSpWtU3Yqg==
X-Received: by 10.202.97.214 with SMTP id v205mr12738878oib.324.1511870337611; 
	Tue, 28 Nov 2017 03:58:57 -0800 (PST)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	r88sm13440011ota.67.2017.11.28.03.58.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 03:58:56 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id e142so61228oih.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2017 03:58:56 -0800 (PST)
X-Received: by 10.202.67.65 with SMTP id q62mr10927879oia.37.1511870335979;
	Tue, 28 Nov 2017 03:58:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 28 Nov 2017 03:58:55 -0800 (PST)
In-Reply-To: <CA+-BmJaRAePpM1UfwLOTPS0NPuViq5mQGD51BNwZrtES5XgzOA@mail.gmail.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
	<877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171115174136.GA4530@jama>
	<CAMKF1soYSpfBApFPmBa1zj1U6nkqJ9+nqPckRser8Y3eWPmRmg@mail.gmail.com>
	<CA+-BmJYi0W7whu3T5BneZGdt2me2J7iJBDXMy9FsoaKrnJvF3A@mail.gmail.com>
	<CADseiPmvSsqCQqjbU-VwGMhp=y97d0AFx5R2Yrnmw5zf_kji_g@mail.gmail.com>
	<CA+-BmJaRAePpM1UfwLOTPS0NPuViq5mQGD51BNwZrtES5XgzOA@mail.gmail.com>
Date: Tue, 28 Nov 2017 09:58:55 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqei-6juaQQOZ04mpF5Er8n1Op8s_Q6NfR9J2STY8fqsg@mail.gmail.com>
Message-ID: <CAP9ODKqei-6juaQQOZ04mpF5Er8n1Op8s_Q6NfR9J2STY8fqsg@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@googlemail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Tue, 28 Nov 2017 11:58:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 28, 2017 at 6:13 AM, Ayoub Zaki <ayoub.zaki@googlemail.com> wrote:
> Thank you, indeed I used rocko branches and it seems to build and also run
> on an iMX6!
> I use a mainline kernel 4.14  and with iMX6 Etnaviv GPU acceleration
> support.
> It's not clear for me how to enable GPU acceleration with chromium +
> Etnaviv :
> I tried the switch --use-gl=any,  it starts up but when running WebGL demo
> Chromium/Etnaviv is crashing...
> For normal browsing it works just fine however I noticed that CPU
> consumption is very high > 50%
> Anyone having better experience with Chromium + HW accleration support on
> iMX6 ?

The i.MX6 support requires a number of patches to properly support its
hardware. Currently not well supported ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

