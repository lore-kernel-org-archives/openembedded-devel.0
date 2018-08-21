Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6855B79163
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 18:40:26 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id h138-v6so9055141qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=yRRRC58DBqlZxy12CBBVeD0e+N15cqDQdrImz5yFkg4=;
	b=klTf1DB/rF9ZBA5xUXMDh28PB3cQDLFTl7EamUSiK+wzeOkbzfQYB+eRl+9a5rLzse
	KNqV8oZtFIg3I0jbqlmiZaPaZXKH9jBqSt33QbfvagJTKcjAqTWTEbSaRAODAPzp1QQB
	LHJ7DvaL2KlGw2I/UnKJkiub/pFCBEZ7b6vgsxpBK3l2YIdL+QO0RlAhkTYugsw08ay6
	M9cOjD0qA6X1+TDMuhPMHMUEZJ//TOZ2fkS9Dk6GAQ1fVJEVJZk+aI0LLxzFthzYcOxO
	1xixg0nblqYE275sBRwcqZlUAcixCiexktgPjjAKfdR1au6PNhopbduBgeAAcMKA8zr7
	MsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=yRRRC58DBqlZxy12CBBVeD0e+N15cqDQdrImz5yFkg4=;
	b=YKTp8IX0pfjysbHpwCQblllOIF1oRITVVuLxpw4Yq7HWUBPVh9O5ODSB/x4xxgAD8c
	erLH9v+4eWP61V5XPqvsCMQ/nFChRox4Tz8+Mfzw0i5Bm5MiQr/QITdjQfBdkui9+HW9
	J5Ibu3djS9Yd2XQpm91chworfDKJ8qF+Wp47+ArvFBGm8+gWxUO9RPOL0se3/sjCiwHb
	ops16MELI65ziOwQoHGd0QJvOlrjoXc2XXoXG5kqFZEwu5jB5sEkJ92891QO3DgKHknD
	ESgZ7bA/W+o/mNXhm5BcMKoHavxmaKkvtexaBHZ10WBW3KvwzIKxFSgQHEZml43TKRBg
	1dtA==
X-Gm-Message-State: AOUpUlG7bWFL8qy9+cCCzHMz5GzTKfJSWWfAiLEUlH95CSsan91D6FLM
	TQyDEm3a9DayFEDslFFoXNlW4PJGEaGjLFPJdoPdlw==
X-Google-Smtp-Source: AA+uWPwpq2OGV6+oOkFnj8hvVnobZ/Rp+lrjTFlFCFbayl5+mMarl8AESCS4mKhqqVXUyotalHoPMq98asGi3J2nZow=
X-Received: by 2002:a37:9904:: with SMTP id
	b4-v6mr36726271qke.102.1534876827029; 
	Tue, 21 Aug 2018 11:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180821173930.12507-1-raj.khem@gmail.com>
	<20180821183558.GY15656@vctlabs.com>
In-Reply-To: <20180821183558.GY15656@vctlabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2018 11:40:01 -0700
Message-ID: <CAMKF1som2Rg_k5tUsVsDK_rYByrgSz8wF-o2JSLZ5505Eo9hHA@mail.gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dos2unit: Remove after move to core
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
X-List-Received-Date: Tue, 21 Aug 2018 18:40:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 21, 2018 at 11:32 AM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>
> Is this a test to see if anybody reviews the reviewer :)
>
> dos2unit -> dox2unix in title
>

thanks, fixed in kraj/master

> On Tue, Aug 21, 2018 at 10:39:30AM -0700, Khem Raj wrote:
> > Its in OE-Core now
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>

