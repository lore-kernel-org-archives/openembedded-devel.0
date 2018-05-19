Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6973874F7F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 20:22:54 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id 77-v6so12914390otd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 13:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6g1JdkaoVlBL4qSukEHDKFSd7TtZMMoazSqwBlMec70=;
	b=NU+vgRWcnKe54e3FLGTslDqNAA4StuKUREgRW4wqXto9msGv18Uh0JKaKcqiXGERCB
	MkEPggK7RELCO5L3alYtLXTFhYlCnaWqlZojXeTb0tRVJFNT8oHhtLAejhXXR+yQ6kQX
	edBXmPeLUGXxaRnxhdKVWOuJ5y+8E3FuRYf3mZcJvX74gjzHT6Emm4DPAl/J6gIGFZXO
	A+yU0p4GrZ5vgY0gG5JZ0mtob9SVF1Sy4+nPQST+jChqsxO8hFs4NpijF2i/faxsI5Ie
	Fzi+RYk3UkYnI+GhuPsmi06mUrCO7adyzGlUZ/wgKCvZXOPlMEpr3rSTyGE03UVNmJZF
	qH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6g1JdkaoVlBL4qSukEHDKFSd7TtZMMoazSqwBlMec70=;
	b=FjujJz2wYoQr7CQm/zivOPI2KP1sF1N9r338amxdf74D1TBgTyMgo3qsfulOP4i+jh
	mHwov93eMwTx2dZzd/qRJ7gUojBMCCCTi7PiljWv7KIRZUdMhh6IwE0l0uspKdvvE+0D
	TEIqQhLCrTls8tuDYDRt084/WeozpM3nntUD4fq89li+4x4zBMTJDzVG3DBkhCyyk8QW
	Zj0h40k0GdgJMf0giL6AozKRjQWIDVk/Ne/AHjmNgv+K+9Hk4c9ED1UatjHv7OhT6pKI
	qJeC8XewCEC2H8tdITrJ0DTnGo0QFFvnqkFQn09L28imNP4sxWUIABdAR/7mIUaD8djj
	1GOQ==
X-Gm-Message-State: ALKqPwdjmpATUCG8Q1mDuiTzUCjVBUXA2fOJYvCv+VptfP/gBc67CdD1
	Mve2elKFCKIrfpRcNrs5lkRQ4FkHzkpv0QEKiEk=
X-Google-Smtp-Source: AB8JxZqNvdukAyfdgA/0B/WDUrBhLtSjis9gXNGm6F9ZwHf9+j563x1ayeIM07qecVz4tZ4iQaCW9DBymnVEeqAuMOM=
X-Received: by 2002:a9d:3e11:: with SMTP id
	a17-v6mr9301607otd.321.1526761375872; 
	Sat, 19 May 2018 13:22:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.73.11 with HTTP; Sat, 19 May 2018 13:22:55 -0700 (PDT)
In-Reply-To: <fb3745f4-8a86-4e92-3790-b4a7ef5e4f4a@gmail.com>
References: <20180518214228.25819-1-schnitzeltony@gmail.com>
	<fb3745f4-8a86-4e92-3790-b4a7ef5e4f4a@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 19 May 2018 22:22:55 +0200
Message-ID: <CALbNGRRxf9J4mbYz2m1JOq5Bby+R6y8u9jbNLhhvrT_kVPmOiQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] evince: update 3.28.1 -> 3.28.2
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
X-List-Received-Date: Sat, 19 May 2018 20:22:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 19, 2018 at 9:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Andreas
>
> I am seeing an error building with clang
>
> | ../../../evince-3.28.2/cut-n-paste/unarr/common/unarr.c:106:22: error:
> format string is not a string literal [-Werror,-Wformat-nonliteral]
> |     vfprintf(stderr, msg, args);
> |                      ^~~
> | 1 error generated.
>
Hi Khem,

Thanks for testing - will look into that tomorrow.

Andreas

