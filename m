Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 74C2F7732B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:28:53 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id n124so159269310lfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 02:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=M1SOpoCXVgw6XdVn9mY6C+XhN6AkriYwNvwO2Md/Q6Y=;
	b=TpTWYYM39a8DEBIOaeV08IeHie4Lo+85eEA9PJd9yOhEDprHToqqbNn2NkLvVrAZC/
	FQyKBVTPaLpH2TsfxMlpc1G2Jj+VfW6pkKDxP80fgxeXSfyCiRGcwUSe4Nums7UIBAkP
	2yr/i9Mgr/XNz/qbAbWEMEsR7RhLZ1D+lxh+upymC9jP0GlYM7pCo60tsl748O7HyCDw
	Y9KpZ4kG6LqPRqac/TN9k7ZdypTtrSUIvj1qQ3Ib+YgcIWF7iLWeZN6TG1UY8Ni/FfjS
	xRwmVI5iCD718nZRkACHlm2aXY1P0/opBWeoIlpJcUJyHY4as2frnN1xor2HbYM+ZRN/
	+4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=M1SOpoCXVgw6XdVn9mY6C+XhN6AkriYwNvwO2Md/Q6Y=;
	b=PtHuwE0cZwr4OhZWCgjZ+UHTm31Gdhd5XJ+HrjBf+pouo3a5XsWBjvT66wrr57ghUF
	GqiGtHN6yAeiJXaUwW6ZTaPqPAPvAJiCemwFeAg0INY1Z4ad1x3wtejpHpC+kKmJIZRT
	W0rlMVXsxIT+wEDrHPdNtYI1DVeCYdvPgjXGFs7nnCoZgQbkS7eila5KYVTWivMsyeqZ
	MobdVQUfAV1s60HMgM1kcdFGLBvpTHUdc1dFhq9/PzbFf/+V4cGiO3md2EJqXvMW65rl
	imDl6K033yfg2UKmnJXA4+VqFsZG7oKqdHNf7wRtV1FzoL8pjGmq6OFUfJ/1jXemR6j2
	suBQ==
X-Gm-Message-State: AIkVDXJYC3HMee2DWip6cH1/gkoNsXc7T13kfBE4yZ3lcILfNe/0iRWA2jk39rIiUo2JLA==
X-Received: by 10.25.169.67 with SMTP id s64mr2426594lfe.133.1485512932630;
	Fri, 27 Jan 2017 02:28:52 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	h76sm1171472lfg.39.2017.01.27.02.28.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 02:28:51 -0800 (PST)
Date: Fri, 27 Jan 2017 11:28:50 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170127102850.dv7ytzoaltcruump@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
	<1484608187-28597-2-git-send-email-max.krummenacher@toradex.com>
	<CAEHkU3UX4NhOVvg6QXcuWgw_H5Z1EaOgih3Lsj9D+hfvC1s44A@mail.gmail.com>
	<5dfb289d-2a44-1233-3761-f7e372c6dafc@gmail.com>
	<CAP9ODKoPaq_wxJCBQk=o0d03uDUbmsJcYj7M34X3StNpJy7NwQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoPaq_wxJCBQk=o0d03uDUbmsJcYj7M34X3StNpJy7NwQ@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [meta-browser][PATCH 2/2] README: add -s to git send-email example
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
X-List-Received-Date: Fri, 27 Jan 2017 10:28:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Otavio Salvador <otavio.salvador@ossystems.com.br> [170127 11:12]:

> On Thu, Jan 26, 2017 at 11:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > what happens if commits are already having a sign-off ?

> A new one is added.

Then I don't think this change should be made.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

