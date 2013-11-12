Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 24FE56D7EF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 21:57:03 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wp18so6766362obc.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 13:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=JsaAg2GEJbDuCq+Fzh1aRMEG5J2TRm/8CcjLaZWrzhg=;
	b=NDlclXdZ87nmWjeZC1enzmflh0+RteAXDPpMWgSeaEz6dngbEynuV0ZNQSp6pCWH8E
	Kp9cvrEaQ4WQS66sulJF/7u98FIx+gl229PvIS+4v77ugaIjLGOX6Sj6WJ+TLc1VgRdq
	csCtQw6qg9hRVTzFcXu2+JzAJEeih0Eq9vdkQNLw+awpCbbmtBYGKnxA0Nuu0bbJTmUx
	lh8f/+mb0Bl2kgj14FAxLB8ajfFQjBWpmXHIxoWqSs4i4r+3pYCkxnMpwp9fxlRbIgeJ
	nTOPejOhoeEYa8A5k5Up9Z/mV6ePwj3Sh9UO1Y0bXZLUT9vylfRHLtxrkixNAeKSxIGM
	THtA==
X-Gm-Message-State: ALoCoQlKmOJxBvjFOqRzlwC8YOWDqLVMc0kCIyFAW+quiaBPMiZc3v3lbK/dSH6E8k64719SOd0H
X-Received: by 10.182.251.194 with SMTP id zm2mr3150857obc.99.1384293424575;
	Tue, 12 Nov 2013 13:57:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.156.40 with HTTP; Tue, 12 Nov 2013 13:56:44 -0800 (PST)
In-Reply-To: <CAKS01okUK2TYZ6OrnGt71wqgVinNehY8Rs9buy3JZEUrJf26kg@mail.gmail.com>
References: <CAKS01oniO3YHFg2CAarKKaXfkSXnkEhy_JCwZNobQGqcNdM=cw@mail.gmail.com>
	<1384273172.6460.13.camel@ted>
	<CAKS01okUK2TYZ6OrnGt71wqgVinNehY8Rs9buy3JZEUrJf26kg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 12 Nov 2013 22:56:44 +0100
Message-ID: <CAP71Wjw81hCY3pWe=oiedTcCSCd0_ypZ0xyiJf7=Os5QiCp9fA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: how to populate sysroot with dev packages.
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
X-List-Received-Date: Tue, 12 Nov 2013 21:57:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 12, 2013 at 6:36 PM, Anup Kini <akini@synapticon.com> wrote:

> I did try that, but it does not add the A-dev.deb.
> It will only deploy the A.deb files.
>
> I want to populate the A-dev.deb also...
>
>
i think you might be confused between sysroot and image (or rootfs) here,
no? what is it that you are calling 'sysroot'? in fact packages (e.g. .deb
files) are not installed in the sysroot, but in images. sysroot is being
populated independently of packages. on the other hand A-dev.deb would
indeed not be installed by default in an image that you create, unless you
specifically add the package to IMAGE_INSTALL.

