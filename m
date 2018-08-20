Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id B271079023
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 17:14:10 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id b16-v6so27126698oic.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=aHOdp76zGcH6t1WjNjxfMUu7q3gSHue/sj/J1xtXYVg=;
	b=ZvFYWJlH/m+jQP/auBBPqUnufDQyyVk1y3vqkDLf2bAs3c+EZxDJ98wdBmulSPZEd3
	NGip0Jq4CF5jw+sABcCU40ETTYDG4ei2JSKwc0wfXZvi7O609GO8uIDFHOXl6rUYocVW
	JbuKw0T/KAuX7Zp+VVjYXGHlXCVqNYobu2AJyGcxEEo0xrLyufSKbw/3tyhaM8EAsmRj
	/9OT4F/1CMCXpcfWI4s2E389a6aFKL4uRT2Im3W4SVIWrfqEYEvQZFWaeaaB9jHIOEPV
	tCj+1CLUs5Ck5q0S/jeVDcNz4G1xCo8cTDRmRRum+qFRMrnYHyJR3ARO0j6ir7t6+lxu
	n63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=aHOdp76zGcH6t1WjNjxfMUu7q3gSHue/sj/J1xtXYVg=;
	b=Ptu6moaWHqnadv4NCY0mOJ57D67G5JVHBABpbIxhHpN5WY7I25OTCA7hG0dCHeL8Bf
	OxGlyU04KAgLqBZ/xkwg1Vy0Oeqn7YU2edrI0pVIe0/lVQXs1Wgbxv/KmEk6H128MFPL
	mmU8T9JR2tdVY3eyqrHlVzd00YTyySMkWxp/sKn90vZFaWVRLGfom49Be48aLKmTvj1z
	YUI+vxmoyBjbZsTaI4bkvHNHEvmG3elhGzeue+V3ciPbzDpA+Rz8J1itU6yQe3sJNDQe
	UHnHbb4TGyWcgB+24YryXMHd300oBjfHBT9J3PaCIXOp4npk7oN/wHdpwq9mPrEzOnSZ
	EZlQ==
X-Gm-Message-State: AOUpUlGUhBbOFA51C/2gzZcWAwqN72PaCgu2bhiqkqVcdL4WWIY750LA
	Sq5YJhtv8o1ojiH/0rbPZhtMPMLUxb8RUA==
X-Google-Smtp-Source: AA+uWPxA4pWg/UkDpV7L+s/rh+8yLM/4iSgIUi352/DtcOYd8ewG8sGWVOWtaCknNPJAS1L/wc3TpA==
X-Received: by 2002:aca:adc6:: with SMTP id
	w189-v6mr15537393oie.174.1534785251222; 
	Mon, 20 Aug 2018 10:14:11 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51]) by smtp.gmail.com with ESMTPSA id
	r10-v6sm14748381oif.37.2018.08.20.10.14.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 10:14:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id b15-v6so27075211oib.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:14:09 -0700 (PDT)
X-Received: by 2002:aca:c78c:: with SMTP id
	x134-v6mr15615784oif.8.1534785249220; 
	Mon, 20 Aug 2018 10:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <a0731f9a-83e2-9ea2-a04e-191ef3793e74@skidata.com>
	<CAP9ODKqDEZ8ND4K3SEELY2mTjALCX5rzWLxjD0Vht7RFTVZ6cw@mail.gmail.com>
	<20180724152529.GA19585@mail.itconsulting-heinold.de>
	<CAP9ODKp3_1iQybyE0McSFUbd7YFPoPbD8HVy+qu05aP18zvwKw@mail.gmail.com>
	<CANx9H-BRdfmLO1vbeFocn6RSOmcd5F73hB_bYQqOMsc5o_nPSA@mail.gmail.com>
	<CAMKF1sp4c_LFSGWKvkQ_bdi3Qz3maQO5k+mo1ViYNxxKAQ_5sA@mail.gmail.com>
	<CAP9ODKpyad5xfNkEf6+SxiW90xr=BT6=5Y3VFtv1+z5+NXFY-A@mail.gmail.com>
	<36f387ee-a523-6ac9-3e79-61689da55ccb@skidata.com>
In-Reply-To: <36f387ee-a523-6ac9-3e79-61689da55ccb@skidata.com>
Date: Mon, 20 Aug 2018 14:13:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrAAvosag_JtRptgec-JiPsiKi98Jhh4VEfuV+wTzDdvw@mail.gmail.com>
Message-ID: <CAP9ODKrAAvosag_JtRptgec-JiPsiKi98Jhh4VEfuV+wTzDdvw@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Mario Goulart <mario@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] bug-tracker
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
X-List-Received-Date: Mon, 20 Aug 2018 17:14:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 20, 2018 at 12:26 PM Richard Leitner
<richard.leitner@skidata.com> wrote:
> On 7/25/18 10:39 AM, Otavio Salvador wrote:
> > Em qua, 25 de jul de 2018 06:38, Khem Raj <raj.khem@gmail.com> escreveu:
> >
> >> how about gitlab ?
> >
> >
> > Personally I prefer github as most people have account on it and are used
> > to it.
>
> Same for me... I'd prefer github and a new organization as owner.
>
> So who would be capable of doing this?
> Also setting up the mirrors (either way it will be) correctly?
>
> Or are there any reasons against it?

Sounds good to me.

I can help setting it up if desired.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

