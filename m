Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 01A3660125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 17:05:22 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id k129so10097968iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2016 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=I08LR6pTBys6n/zv9ZxMcsWUXLOfy8E7maJC1LSssCw=;
	b=xUQ9m5cGArXwimxPx9McfUfHODzanaUVI0iHENoREeA/E7ozmsjYMz5JzoD2DkrdR9
	D2levEevwZG0HEg5zHxFcGK2bBhnSOXQkVWed+ho6xeleEGHRFBy2mLMynZG8lBRDK8b
	nMLxxv45o+3mMvopRg4vYulJ1qHd8QAAhmW/UUJ9HAm3C/2fyPSA6WKyzIohXFvinS1s
	Dawbe4m/ohmcGql6B2CnaS9WKH1EnHTjkI6UUME3jHocN2NwdykUY4xjdDQgiP8UYEEj
	BYg2swtxz9Z2jAjubkKhbe/Gu3rmYOsyoWOZcZ+XZFqNnx0PdP+x5/KGLRqy19tasX0D
	RGVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=I08LR6pTBys6n/zv9ZxMcsWUXLOfy8E7maJC1LSssCw=;
	b=xprq9JvfvTqxL6Bet9AOkS6ju7Qnae9f0qmiO/JXJ7sVtKMfDav3OTcjVlAGZk6mFM
	PWgKFLGDREX1AhfUgJrQLHk7pA/Dn9QUDbzlVTIQ6U20W6O3BKS/wQk8jXXLjVMs6enJ
	wvtNxBgo++UHfwdkHNDIcVFEbNAOMOu+Tf5XeCuP/3GKXWCPaOpt6GUCOui/j9eqsVgM
	sZNToRoDn3B9+z/bh7Jpog2beTQeTN6hpD2kiV+h4w2vfPWVlUoL2O3i8/t5LPu7X2uA
	AhhLCL9q6sP6+vGVXBQdWFTZ9Yuz6B83NopYu8S2KNCBGwyVCmuFpPnwcDY3a8Q6Bfwm
	uv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=I08LR6pTBys6n/zv9ZxMcsWUXLOfy8E7maJC1LSssCw=;
	b=m5E8900ZHmyprjdinaDntKT7K09Dzugo8zr7pGr5jZALQ4NDX16Gld/K91PG/158YX
	3Ov86BNqC0bH1N/vBvSfmsuoAGUxpD9aHYoQIWt1wr9D3Rp6IwrEs1NtY9sUdJbXFhjl
	o2/nGcn1YbZMYAhpKYcBSVRXMUmsItgru2p1nw2c/+Q15l7y/GppEiErxUlirX9TRcqi
	UVTfHKARzEeMHVWe+M8W/6AaQ6OaauBV/I627nUoxLEvCC82xAJBnKi8fNM3e2pbnpdI
	VYBug+xu0mu2tb2KuPR9UmtlUpIbZEz6QO0oxSFqHH8v/P7LGMpdhc+HVsiI83oPUXRd
	FqRw==
X-Gm-Message-State: AOPr4FVc1qwNUi+JKbZryFJrnUBvIsOuqKcdugUz9tOKA27XsTHMmwqRyQHKPMoYVsTqfV87fmdce/uzGO+TIQ==
X-Received: by 10.107.2.70 with SMTP id 67mr19377224ioc.70.1462467923196; Thu,
	05 May 2016 10:05:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Thu, 5 May 2016 10:05:03 -0700 (PDT)
In-Reply-To: <1462465350-33532-1-git-send-email-noor_ahsan@mentor.com>
References: <1462465350-33532-1-git-send-email-noor_ahsan@mentor.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 5 May 2016 10:05:03 -0700
X-Google-Sender-Auth: _rTLo2Ko88yrQTTbdhjGi0lYcL4
Message-ID: <CABcZANkpvF7ehM5fdd53229jonE4x43Qg2bB7M5OcM88pXb+fQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] Fix "failed sanity test tmpdir" for libnice and update PNBLACKLIST.
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
X-List-Received-Date: Thu, 05 May 2016 17:05:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 5, 2016 at 9:22 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:

> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * Update do_compile_append where it was updating *.pc from ${S} and
>   removing staging dir folder. Now we have seperate build folder
>   where packages got build. We have to search pc in ${B} not in ${S}.
>   After updating the tmp dir pathc is removed from nice.pc file.
> * Remove PNBLACKLIST for libnice and farsight recipes.
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
>

The commit message doesn't meet the OE guidelines (not prefixed by the
recipe being changed) and you don't mention farsight2 in the message at all
-- should that be a separate commit?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

