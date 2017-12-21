Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5A159787F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 11:39:43 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id w127so20748384iow.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 03:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c70EhqYpccA+EMS5WqrViTfwHJfuUQX4pL5VKr9KrZ8=;
	b=vTcuCG9axnTUZOuzoE2uizRUcV/HY7XR9iVy0mdZP587mZxlXz0d4y1uvsMmlxEqAB
	YXoqvbaqtJcVgrj9x3xqYvmtQICqVfTvSFeS5V/LW6ke6WxW2vkmk48aYCLAFo10Ja/X
	ePcvTh+qDYA2T9r5G3x2dAG/AwXlsj+nongG3+CQ3pVTyhzPPna5ayPbqZ4XiEG3ryjt
	sAooRcwybO/eC5cPITEyPtMPy4vz2ZSBrnUX/kGiMcUoL8OVbYA9+TH3KRAmnMLd2dQ+
	K4LGA/pKG+Ga3AqMpcigt/NBMYo2uSCjxDqZ/mYv6mWIUdxpaILmBS4Nn2Xlx84ty5b1
	NTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c70EhqYpccA+EMS5WqrViTfwHJfuUQX4pL5VKr9KrZ8=;
	b=OF89wF2K2x3EzYwhPy+ISGOb+65kAx6mY+lS/dE3nFrs3KsZck4A+IK4OXA70CGsXh
	1ckPMXXChdRTV7USkRjeRacN45AXYYLTTIfNGWf1LNT8B6y/nrE/aH/MeRyUbqnS0Rui
	aC4fy/A/9NbpJE9nk1Ng1AgTT3fuxpL8zfTd/F/yvlvp6dGcefXhYF+LiCQPvyfiEq3J
	61KROy8N8f2WDyifRF4PmlqnJD9cAwroA0sb7xRuUks+mlC9XPy3+LyyHxlbdjSp+JAo
	uTuGoaQGfJQ9IRge2epYnpmA5fKaGlKytpCAPVDiRPStnwmJjsF/SXSSuEfQVisvNsjy
	4FCg==
X-Gm-Message-State: AKGB3mJXG0eU/rg/nRYf0XcOsYS100FuIVTwFq+1Y22WN5xecXKlCKpV
	f1VBCU52Doo0MmMelMwEhEv8ZwoUJO1VDYhutnyoYg==
X-Google-Smtp-Source: ACJfBosEm1PsJNKWc9nY3UuvYIHALvnlm1IQdSIlTsINSVAEhCXL9aThxTbwkc7tJhklPoKIH92Kuolmz7gOqQ39bwc=
X-Received: by 10.107.47.1 with SMTP id j1mr12649485ioo.217.1513856385339;
	Thu, 21 Dec 2017 03:39:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.34.140 with HTTP; Thu, 21 Dec 2017 03:39:24 -0800 (PST)
In-Reply-To: <6d1905cf-26d2-49cf-d0bb-248cbf4a071d@dresearch-fe.de>
References: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
	<CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
	<6d1905cf-26d2-49cf-d0bb-248cbf4a071d@dresearch-fe.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Dec 2017 11:39:24 +0000
Message-ID: <CAJTo0LYWwMnj4Wb6JC1y7uw4ZrPv6=SynfkSc0TU0dwi9Dezjw@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] MS Windows machine?
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
X-List-Received-Date: Thu, 21 Dec 2017 11:39:44 -0000
Content-Type: text/plain; charset="UTF-8"

On 21 December 2017 at 09:54, Steffen Sledz <sledz@dresearch-fe.de> wrote:

> On 21.12.2017 10:08, Burton, Ross wrote:
> > On 21 December 2017 at 06:40, Steffen Sledz <sledz@dresearch-fe.de>
> wrote:
> >> Anyone tried to cross-compile for MS Windows target with Yocto/OE?
> >
> > Yes, see meta-mingw.
>
> A misunderstanding?
>
> I like to build *for* MS Windows, not *at* MS Windows.
>

"OpenEmbedded meta layer for mingw based SDKs"

Running bitbake on Windows isn't possible.  It's getting closer with the
new Subsystem for Linux thing but that's not ready yet.

meta-mingw lets you build SDKs *for* Windows.  We've used it to build cross
compilers that run on Windows that generate Linux binaries.

If you want to build for a Windows target then that should be possible but
nobody as far as I'm aware has made the work public.  meta-mingw will
contain most of the changes needed as that does build Windows binaries.

Ross

