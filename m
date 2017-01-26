Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 29B8D771F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 14:35:23 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so50706493wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 06:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ZJME8qs6hwXPgifS5GgbeV0ltdVZxBzje2scLmJVrug=;
	b=pLFDpoFSmx66BVpAXancEw4ZqYFGuM+oCGhMnp4exVa9CkIQJEwNwd+5UagHYgXatr
	7iP3nqSC2M3Ge/WejruW5eX5k5NXtfx6iTX47Q7IrykOEIYm45FpmmPdWPyM0mhOB+r6
	+9FajgHHiKpq0oLqrGuoNh3QbO4AIQ8xBmrvhl8LuSjdMvO8x10mQ9iZOKbbol7VhswQ
	RmeW0KYGRB495At/mQWIeHnocuEPtKVZiV6tK4GfqIXamb5UgWY78yP/9oI9lEOPihAL
	jqddKWM8QFqYv0mRFUVuwF+cjP4Pg+wo4A1817aA1UQP1ztUb3AA6Hps+VDEEbAeeU2P
	ZADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ZJME8qs6hwXPgifS5GgbeV0ltdVZxBzje2scLmJVrug=;
	b=o/gXF5JUF8tbUjedCjThf1zDExRTt+Gy0jQ5AGYRqYwrZB+b+9adw8chU/32fNLK/l
	IamS8oUoC4hrxuTGc9Mr2FoCUh1AExi37E4msHKGJohyBvRk9f/MRu5xnVezaXc/d2IR
	zC3IjSKBuRnHjzgxF/BQ1+hPaHH8BjOdtolrHixQzbtRFw8wx9iS/DV8lxcpw5zX6hA7
	FkzPR+OsM8UjVMKPVQ1teaxACpJ8ZJ3ngAryh4RJZIdd27MiMOnBz3U+JG//eWi/sMUz
	A7kPBD1v3jamTFS17j8IP/sYDcolfCLTtz2EiVjzvEHycz+XD2qq0fGQnqLEQmPFkcFo
	wq1g==
X-Gm-Message-State: AIkVDXIEFOJ0ASo0K//SQB0rR23pX7G0t1hzybKAa66C+3DpuuK4V7THUGVGNCZ+dTw2aXNU5CFHaZO7p92jfw==
X-Received: by 10.28.74.69 with SMTP id x66mr2788046wma.124.1485441323652;
	Thu, 26 Jan 2017 06:35:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 26 Jan 2017 06:35:23 -0800 (PST)
In-Reply-To: <CABXoSoUBb5KtNNqFFO8xd0UE9D3g6d4gDig4aXg_epCoX3h0Fg@mail.gmail.com>
References: <1485160227-29998-1-git-send-email-samuli.piippo@qt.io>
	<20170125160207.GF3260@jama>
	<CAHvQdo3_+YfdZN_MYmZQLOW7uDnE-=LuXUwL8SR7sXLCG8VVyA@mail.gmail.com>
	<20170126125414.GA3016@jama>
	<CABXoSoUBb5KtNNqFFO8xd0UE9D3g6d4gDig4aXg_epCoX3h0Fg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Jan 2017 15:35:23 +0100
Message-ID: <CA+chaQdCqf-3mWDKFo9qnBhRQUqGa4ByBwapEamRp-aa2XNc=A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH v5] Upgrade to Qt 5.8
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
X-List-Received-Date: Thu, 26 Jan 2017 14:35:24 -0000
Content-Type: text/plain; charset=UTF-8

Strange I was applying https://patchwork.openembedded.org/patch/136285/ to
master-next yesterday, not sure why they aren't there.

Can you send rebased version, because the v5 doesn't apply cleanly:

OE @ ~/meta-qt5 $ pwam 136285
2017-01-26 15:33:41 URL:
https://patchwork.openembedded.org/patch/136285/mbox/ [149874] ->
"pw-am-136285.patch" [1]
Applying: Upgrade to Qt 5.8
.git/rebase-apply/patch:1590: trailing whitespace.
-- 
.git/rebase-apply/patch:2766: trailing whitespace.

.git/rebase-apply/patch:1592: new blank line at EOF.
+
error: patch failed: recipes-qt/qt5/qtbase_git.bb:43
error: recipes-qt/qt5/qtbase_git.bb: patch does not apply
.git/rebase-apply/patch:2766: new blank line at EOF.
+
error: patch failed: recipes-qt/qt5/qtwebengine_git.bb:110
error: recipes-qt/qt5/qtwebengine_git.bb: patch does not apply
Patch failed at 0001 Upgrade to Qt 5.8
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


So maybe I've missed something when applying it manually.

On Thu, Jan 26, 2017 at 2:17 PM, Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> On Thu, Jan 26, 2017 at 2:54 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > On Thu, Jan 26, 2017 at 11:00:59AM +0100, Johannes Pointner wrote:
> >> Hello,
> >>
> >> I tried to build qtbase after this update, but it failed to configure
> >> because of PACKAGECONFIG options which are no longer available or
> >> moved to another part (qtmultimedia):
> >> PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
> >>
> >> PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
> >> PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
> >
> > Yes, I'm seeing the same issue, the flags were removed in:
> >
> > commit 90c425642dfeae4564b43dacf15f80479962e910
> > Merge: 1a43199 9808b53
> > Author: Liang Qi <liang.qi@qt.io>
> > Date:   Wed Nov 16 07:37:38 2016 +0100
> >
> >     Merge remote-tracking branch 'origin/5.7' into 5.8
> >
> > but there is still PACKAGECONFIG in qtbase recipe, so this needs be
> > fixed in v6.
>
> The changes were part of v5, but they are now missing from the patch
> committed to master-next
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

