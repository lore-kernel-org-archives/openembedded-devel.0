Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B8F8E78307
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:58:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m72so5189210wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bVRK8kIf4Bh0I6Kr27pZNCJTe7rq5LZCFm7mxYdjqc4=;
	b=PuTFuKkN8Zt/VCVt34Nj+mvLdrEruVX5HkFtiJlZeyE7oP7lDoy6qZak4L7DOOuUqj
	zkjkzr1gPN5lNZRegPNW+cFwvKZNYH/VFjdrNKEXkliRG3SvvUaXteicE2h+X61TOlmB
	bBcTUuCU7f5eCYPI3y64PMEpy/5NQ6AUzEuZOtX6hmq5j+YqxaPTqUTFXLZ4sKtP9bnT
	1RoazmdhwdAOUzxyl0/4u9cbnLRP2zzZ3BNNAtLVI/4C4s1T20QmKxJdrJpE/F86vfEA
	PRTRPVbKXClH7TbTNBPsLd1q6Ht350cu1dR57k7dKfVmcUl7lqCXvKUPiTPqcBizfuya
	PXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bVRK8kIf4Bh0I6Kr27pZNCJTe7rq5LZCFm7mxYdjqc4=;
	b=EAPGczgF1+Z+EK81PeUYV1L3aTvKYRZEWLbOO84gAx5CbHN1Cl9TBkXsvhiC4DRabW
	H/e6352jv6UzebC30lfBEodkRqOrzzKuziVpWoj6vGpH6ywln9qnMQmRIHt9c/NKu8kW
	tOTdTsfFZpJRxQnVZiAo05xkfMf0dsRseB1aVeSGkluic2rLrTiWOiAWkRiIFpQG+qXf
	PQbzehxpCdx6mkyfQClt2h0G0Pw4n6BHf4jwsKNiBghyChNvZPRJeZKZpN+/SElxrI4R
	1IgLVSnDC0745d77TMLZ64TdL6m3BpvQpp9vpYKMb/2K2CZiwpdvjRgtNRFhY0jBNk8D
	3JCw==
X-Gm-Message-State: AMCzsaXZHTW7eiPqVth56r3ZO5xmMyUu4jgjcqJMvcGSmSofUzLqshq/
	I0c1OBCdpYz5jrpON3fKI47FNX5Z5jbdVt31lhgEeA==
X-Google-Smtp-Source: ABhQp+RuVpvd35q6o+s550LZprHBQZxsL9MTePGjxhYLpT55bHkAWFWLeEUcEStX41x/XSB/znc4/gZEwasbN09FbgA=
X-Received: by 10.28.58.81 with SMTP id h78mr4324446wma.10.1508259489767; Tue,
	17 Oct 2017 09:58:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 17 Oct 2017 09:58:09 -0700 (PDT)
In-Reply-To: <CAMKF1sro2nuRcguZzsVOj5B2dNzw6P5KKrkK5dmuzpk_eX8e6g@mail.gmail.com>
References: <cover.1507147924.git.paul.eggleton@linux.intel.com>
	<4da0611806ae98b10f6ae00200b3e292a068f940.1507147924.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp6TG-LrCUq-FMp+z_mR6Yh-CiRXT0tDvJXVsYr+97VPg@mail.gmail.com>
	<20171017051134.GC9221@denix.org>
	<CAMKF1sro2nuRcguZzsVOj5B2dNzw6P5KKrkK5dmuzpk_eX8e6g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Oct 2017 18:58:09 +0200
Message-ID: <CA+chaQeZpm=FAXVETU4x9scAECJ3EURrjjo54JhddHeDBzXWkg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] mdns: move from meta-intel-iot-middleware
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
X-List-Received-Date: Tue, 17 Oct 2017 16:58:09 -0000
Content-Type: text/plain; charset="UTF-8"

I agree with Khem, I've merged oprofile even when it fails with musl,
because that was the main reason for moving it from oe-core to meta-oe, but
we don't want to burden Khem with more new musl issues when they are
detected soon enough (my world builds don't use musl, so I depend on Khem
to provide feedback when he can) .

On Tue, Oct 17, 2017 at 6:23 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Oct 16, 2017 at 10:11 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> > On Mon, Oct 16, 2017 at 09:19:25PM -0700, Khem Raj wrote:
> >> On Wed, Oct 4, 2017 at 1:20 PM, Paul Eggleton
> >> <paul.eggleton@linux.intel.com> wrote:
> >> > The following improvements have been made over the recipe that was in
> >> > meta-intel-iot-middleware (a layer which is no longer actively
> >> > maintained):
> >> >
> >> > * Upgrade to latest upstream version (765.50.9)
> >> > * Fix compilation failures by passing CC and LD
> >> > * Fix "no GNU hash in the ELF binary" issue
> >> > * Point S at the correct source subdirectory so that "make clean"
> works
> >> > * Fix lack of soname on libdns_sd.so leading to missing RDEPENDS QA
> error
> >> > * Add SUMMARY
> >> >
> >>
> >>
> >> This has been accepted into master but it fails to build with musl
> >
> > Is musl a requirement for meta-oe?
>
> We have fixed it to a point where we have around 10-12 recipes which
> don't compile
> with musl, and it would be better to keep this level as such and
> especially when we
> know its failing. its a requirement for oe-core
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

