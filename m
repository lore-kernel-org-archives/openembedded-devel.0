Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4856E666
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:10:21 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n204so3040354qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Nov 2016 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=HlrUb75i8xOx+IoCM+ZLY1hiVYfK4A4Vhdma5QUMHQ4=;
	b=uEuwlSSiS4z7oTaHLsz1kwsg4UB4DVKxZnvoIexSOvB3689atlwDgUI2zBc53a9uKV
	siCsUQO2q55lfDjyBPAjUnRoycMp+KV8ESef+GMQuE7OhF+IJtvL1Q3Eou43CFFRt4lX
	o49nViMgp2xOIhznucaUe9i7xoQlJxOVFOHAGGdQ/k3YZPTrPGwWQWm7HbZcm1Tyc6ms
	F7aoLxBpfkhp+AyqksnnLduZqf8lqWOF1pnTq3p7FSVQaUG349GBH2tZ/S3EHCnwkdKS
	ioUC3osj/mxuodjtTnMLguRARGeQ0l0KYttAdZ+GYlCmkqCxRJL8BpJcavla5COjfnJ6
	NS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=HlrUb75i8xOx+IoCM+ZLY1hiVYfK4A4Vhdma5QUMHQ4=;
	b=WdztlUaqwo/UovSs2jtLl7uvvgOCyveuM4yxgE/D3bmVGtw5wVaU+REsKk9QMx0Gvm
	FE6gDW+2NvA0DSPGxX2C33ZIPkaDMfVEtg8Fj07/FAxg/S1eSgh9W4FRsqr/LZedrb9g
	CkidFafnd31zcocTfCUROTARmweiCTGsLZ9GR7sXu8piav4wUPtxM3LTZA8ru8uITE15
	o07CjhYRqYM3YBWTFbtbACVnloh24fi/Tm8g38OzEqYq2KWrjuIU0zbPo1dCtcnIVh6R
	ncEgVMKHhOGPJCwrfjE+pH5s+NC0/dKtIl8pb0imUze7GeICBUHdt9g3rfxLhj0j6vhl
	vvJg==
X-Gm-Message-State: ABUngveXvVR9N+C1ZuWuUBrdfX4x98Sxo849fMa74hTUxl+EouGT7g3pNeM4Lolk6R3dQaQh4LzlKub8FZaTm3J5
X-Received: by 10.55.215.6 with SMTP id m6mr2421144qki.244.1478085022610; Wed,
	02 Nov 2016 04:10:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 04:10:02 -0700 (PDT)
In-Reply-To: <5F5E2368-C835-42C4-875F-B88DDB4EFF2D@gmail.com>
References: <4d4b2776807f4f6e8480ea33a3a71c89@SEGOTNC5112-N6.vcn.ds.volvo.net>
	<CAJTo0LYLT0bL4bgvkL_zJ1OGfOyvdxCooJ5V45ngtgW_pJFx0g@mail.gmail.com>
	<5F5E2368-C835-42C4-875F-B88DDB4EFF2D@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 11:10:02 +0000
Message-ID: <CAJTo0LaRSrTKRCQ-=0hQ+RR=grEuLhh+=-eLpqBTwDPr4dcSHg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] packagegroup-core-eclipse-debug
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
X-List-Received-Date: Wed, 02 Nov 2016 11:10:22 -0000
Content-Type: text/plain; charset=UTF-8

On 1 November 2016 at 16:51, Khem Raj <raj.khem@gmail.com> wrote:

> > The gdb recipe builds a gdbserver package.  There is a very rare bug
> that I
> > can't seem to find where sometimes gdb won't build gdbserver, but I've
> > never been able to figure out how and why this happens and you can fix it
> > by rebuilding gdb (bitbake -C unpack gdb).
>
> it can be excluded if someone excludes GPLv3 from accepted packages
> perhaps thats are case here ?
>

I've seen this happen once, and the package wasn't even created.  GPLv3
exclusion happens at image time, not package build time.

Ross

