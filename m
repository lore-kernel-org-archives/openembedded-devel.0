Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 73D8961F29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2013 06:22:37 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id es20so2594348lab.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2013 23:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=2/2YeU8qfwzSp4+PocanHBxNxPeHiK4voOEjIQbyENU=;
	b=GQAjf+Kophy7yRqDHTQx5hLYBjjSLBnThiYpufu9krU7PIl/d+l80cJTmOQGJ3jFPT
	ZzAvrzCRjoIuMxnMj44IJT7SBjLShHCzXRRdye6YtYh+Bb5coRH6fwdiK+Y37Bam1gop
	Ma9iZ/njRFocEVniUXOUyj1D4QjFzyE9ZQ4zIxZo+108jFI2Z6uIqoy1+oXy8rj4Q5yJ
	Xwv5MrnQSKvYFKy9blW2/BEmSq2TLlMaaTLxw8RPMz6jCsjF1eSi3vyDkDuIiiJxpR5P
	SoTP4Ax3EbAjRyP7JGCk62q5vpUjYY4k4fRQdJF1viyQ6JhpAOnCo/ZeKRZv9by2E1da
	q9pg==
X-Gm-Message-State: ALoCoQmMK612lMQVTuYDoE2rozztC6B1QxR34M46x3Rnqh8CQB8WxisRYGGrkSfTtt1+ycK0r/sa
MIME-Version: 1.0
X-Received: by 10.112.210.136 with SMTP id mu8mr5804482lbc.25.1376806956928;
	Sat, 17 Aug 2013 23:22:36 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Sat, 17 Aug 2013 23:22:36 -0700 (PDT)
In-Reply-To: <a4c39e85485f80316e6cefa9b6ad79d0838c83a2.1376461413.git.hongxu.jia@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
	<a4c39e85485f80316e6cefa9b6ad79d0838c83a2.1376461413.git.hongxu.jia@windriver.com>
Date: Sun, 18 Aug 2013 09:22:36 +0300
Message-ID: <CAGNsrLDyg3Rq0Gk+sG8Vp4y0i+=me2eTjadW2tt4dyU_qU0_cw@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC PATCH 01/13] meta-filesystems creation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Aug 2013 06:22:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On 14 August 2013 09:30, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> This layer contains filesystem related recipes.

My build started to fail with:
ERROR: Nothing RPROVIDES 'sshfs-fuse'

After adding meta-filesystems layer, I've got another error:
ERROR: ParseError at
meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:8:
Could not inherit file classes/gitpkgv.bbclass

