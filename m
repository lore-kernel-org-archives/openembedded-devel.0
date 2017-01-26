Return-Path: <samuli.piippo@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 838DF731D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:17:32 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id q89so23676092lfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Yf1yL53j7Ny57U/H9/rt8PLYsu3Mdf/4/HNdR1uvXDY=;
	b=qelUT/ouKpkH65AyXT89As5DpqzhdT0D7sV+d12GPYZIOnvlyk7TNzi+q8/rD/n9wK
	ySHVeGFNGdaMhqkKeie+bF2QAOwBPANKSp9VcEXjnYNEcWqv3Rmbrh7XYbIJsuyafq4D
	vCI+HpAwTn6z9B+A53Zy0nNsAT//GHbGINcR4xRbS7Zyec8M1CKgzwnrYTi+c0jJcj1Y
	JmPZZsK/xZHKZr+WrgLjFUtWOtCAH5tJXWKtI4Ht5a9gqBF/ovjVLjURnq3UDBBIjXJy
	rlZDLqSYWbioxxX6eL+aGQxjAN+zGLZXySQ7Pdhkhhvyd1K0W6PMe16EqSHDP9wRDNkV
	xWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Yf1yL53j7Ny57U/H9/rt8PLYsu3Mdf/4/HNdR1uvXDY=;
	b=hv+OMZEbJFvweMvzn8T3Jb8B4/ETtyTMJR3aicQY6cOA7DYgKcRqAKy6NJzUpCK+9d
	Da/v1ZwHFRFxCLIYU9sBvaOCpnpkqjQv71ISbeBberFw48V7YYkhIT7eZ4MfjACRR4AW
	KmfHP1yetI+XFo+j20qqBMaS3iXY5+NTGxAt0/DJ3SjqepOpVtqrx6F+WJdsLZbR9KMt
	2s43RmhVcgqxuNgIBhizvC2bhIy3bA1umYkZ32XQdwfSf0lwcN28zIC2oopc/96QHiaz
	CeRdVrasabUz6AKrL5Wkn4yS9XqGlt/qX4EiTXZTzPbbF3mgPYJYIGbDlH3O+WQYKES0
	EZrw==
X-Gm-Message-State: AIkVDXJRpvZbrfZFitd7vAaM4/F5pqAWL1BhcQvEOoVODpQbMH7Dx5MszZid2B7kilvzPJrl2bRY8H6vKvKLOA==
X-Received: by 10.25.199.14 with SMTP id x14mr807424lff.13.1485436651763; Thu,
	26 Jan 2017 05:17:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.215.102 with HTTP; Thu, 26 Jan 2017 05:17:31 -0800 (PST)
In-Reply-To: <20170126125414.GA3016@jama>
References: <1485160227-29998-1-git-send-email-samuli.piippo@qt.io>
	<20170125160207.GF3260@jama>
	<CAHvQdo3_+YfdZN_MYmZQLOW7uDnE-=LuXUwL8SR7sXLCG8VVyA@mail.gmail.com>
	<20170126125414.GA3016@jama>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 26 Jan 2017 15:17:31 +0200
Message-ID: <CABXoSoUBb5KtNNqFFO8xd0UE9D3g6d4gDig4aXg_epCoX3h0Fg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 26 Jan 2017 13:17:34 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 26, 2017 at 2:54 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jan 26, 2017 at 11:00:59AM +0100, Johannes Pointner wrote:
>> Hello,
>>
>> I tried to build qtbase after this update, but it failed to configure
>> because of PACKAGECONFIG options which are no longer available or
>> moved to another part (qtmultimedia):
>> PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
>>
>> PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
>> PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
>
> Yes, I'm seeing the same issue, the flags were removed in:
>
> commit 90c425642dfeae4564b43dacf15f80479962e910
> Merge: 1a43199 9808b53
> Author: Liang Qi <liang.qi@qt.io>
> Date:   Wed Nov 16 07:37:38 2016 +0100
>
>     Merge remote-tracking branch 'origin/5.7' into 5.8
>
> but there is still PACKAGECONFIG in qtbase recipe, so this needs be
> fixed in v6.

The changes were part of v5, but they are now missing from the patch
committed to master-next

