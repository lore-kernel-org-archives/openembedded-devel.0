Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 043A8773C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 11:15:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so57348297wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 03:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=x/9T8s12M8YsRfU4oHsqs2QMKK5K2FjkqBedj3+hxZU=;
	b=q/vk423Bx9lmGsas1uPz+H+XfUs3zKwEi2CGYh3l9KUZHwctE2aHAwqN4BFIkZDhkI
	s4E+/SAaHzOk8+iQGXN2uf+xj3ZyP9IK5H0Dgx8mzH8xgERzLIQJBVXRcyk4MmtUJ2pu
	EaDpzKI2VvX32SRtPgleLukOu7IH8oK5B7bJ01vxi+L34YgXYOAh+GfRmQmBcRFkrkOU
	iEPGmDF5rYv1qaGFhT6sxqiOZBdnaArNaPZCp237zpigan2ELNuEM/mbEo+p6XDOd1Jd
	kfKakn34HP4Z1co+3b8pDluft6lYDOltBTrxJ+kZkrKSBVZe0k55M5ocHiIOLYhqeE1g
	LQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x/9T8s12M8YsRfU4oHsqs2QMKK5K2FjkqBedj3+hxZU=;
	b=slCRivH1QjfV3vrUvneLwtvUL5Ayo5jh+mFmtw/h7iYapuxsYqXu5Wmb7LqGhYpWcb
	yXWDadRFWnKHj4UWB+OlpgWRB7shbU5Yn2SlYqPf5hZl8wtWaozM2zdt/03MTNHv7MvP
	49mEBcbLGUPPwoCFqt/qHOV5nGAVfMxoy1Cu1mtHGL5K0B6xyDX5TkLGoSD3awEEzFWa
	+wWjEvhJFJ731L3q/NlHM5Zdk/QcBvJcvBJ3TJKEAWN0B0TlH4HuNhSWfkA9wbaU6DL+
	g3dg4hWBHY56qATb50N1kMUV3mp7pmzmrsFvN+4sm9rgaaY0/prUjMLV1ns9c4lpmkCT
	kfNQ==
X-Gm-Message-State: AIkVDXLt4uAwf3nnxAXr2Mgx26n8ZlGvjnMQqAn268OZKJoqFdmoXzKaASRc0ovLo4YizQ==
X-Received: by 10.223.152.175 with SMTP id w44mr8223660wrb.151.1485515719468; 
	Fri, 27 Jan 2017 03:15:19 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	m188sm2031136wma.0.2017.01.27.03.15.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 03:15:18 -0800 (PST)
Message-ID: <1485515717.2825.12.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jan 2017 12:15:17 +0100
In-Reply-To: <20170127102850.dv7ytzoaltcruump@ad.chargestorm.se>
References: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
	<1484608187-28597-2-git-send-email-max.krummenacher@toradex.com>
	<CAEHkU3UX4NhOVvg6QXcuWgw_H5Z1EaOgih3Lsj9D+hfvC1s44A@mail.gmail.com>
	<5dfb289d-2a44-1233-3761-f7e372c6dafc@gmail.com>
	<CAP9ODKoPaq_wxJCBQk=o0d03uDUbmsJcYj7M34X3StNpJy7NwQ@mail.gmail.com>
	<20170127102850.dv7ytzoaltcruump@ad.chargestorm.se>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 27 Jan 2017 11:15:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Freitag, den 27.01.2017, 11:28 +0100 schrieb Anders Darander:
> * Otavio Salvador <otavio.salvador@ossystems.com.br> [170127 11:12]:
> 
> > On Thu, Jan 26, 2017 at 11:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > > what happens if commits are already having a sign-off ?
> 
> > A new one is added.
> 
> Then I don't think this change should be made.

I tested it. That depends on who did the sign-off.

You end up with two sign-off lines only if the are not identical, e.g. the committer and submitter
are different.

I went now through the READMEs of all installed layers and about half of them propose the '-s' while
the other half does not.
So I guess we should drop this patch.

Max

> 
> Cheers,
> Anders
> 
> -- 
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB

