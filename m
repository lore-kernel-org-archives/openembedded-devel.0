Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id E353F7719E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 09:34:24 +0000 (UTC)
Received: by ioir85 with SMTP id r85so18747238ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 01:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PJiZBN8B4r8xjJ2omoQFuql6mPPQ9wBoUL16BW7SwI0=;
	b=JyHADlbD55ih7byeN8Nmv9nef/aBMa5DHV011/JrTKyjP1L9clNYhft6bmGN5pKLCF
	MRo93LR/uN3TKtx7oAOO4O7fOVeOrTxQz27nW0nXOwOZhStn0oTlbURMwxi5UiQdA9K7
	xhJYzyVvB6iqi/DeP4NRPE/K4blm0ce1wAJ/OSw/+G1z+5Wsff9nbRsZ8XYyR5FYOQt3
	bCXXWoFP8jScu17FJw61lqd1mMb8BU3dymhIFrbHaXkxDSnAiN8MVIE54gQkZCyOVoDw
	0teLy9y/7vcKm4XvVmq+pWFsoQ69aZsGieuGlO29f5fJL03iV6taKlCAwPoOzAnBEuNf
	CJ5A==
MIME-Version: 1.0
X-Received: by 10.107.135.30 with SMTP id j30mr12511487iod.148.1447320864810; 
	Thu, 12 Nov 2015 01:34:24 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Thu, 12 Nov 2015 01:34:24 -0800 (PST)
In-Reply-To: <51bac70d8a574673855bba1aa7181b72@XCH-ALN-008.cisco.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
	<CAAzKXngADOxQ-rOfF1DBSNqhV-GUPookXZjLkTZ=CgOf4ks7Eg@mail.gmail.com>
	<CAJ86T=X_4vtGKXxW5y8e3zS-tv9fAnnmsOPFFuOrZp8wHdJMCA@mail.gmail.com>
	<CAAzKXnh-muNFgKm+ndHzLgMeSk7X-Zq3f3NWaenPHF-LkQgJ=w@mail.gmail.com>
	<51bac70d8a574673855bba1aa7181b72@XCH-ALN-008.cisco.com>
Date: Thu, 12 Nov 2015 10:34:24 +0100
Message-ID: <CALbNGRT3E3oMgspJuXaJ=Y_Os179mpSY1x=t6gF+K-XvejunQg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to control build parallelism
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
X-List-Received-Date: Thu, 12 Nov 2015 09:34:26 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 10:26 AM, Julien Brianceau (jbriance)
<jbriance@cisco.com> wrote:
> I've added -j in http://patches.openembedded.org/patch/100133/, because chromium recipe wasn't fair to other recipes.
> For instance, if bitbake is processing 8 compile tasks (incl. chromium) in parallel on a 24 cores machine, 7 recipes will
> be compiled with -j${BB_NUMBER_THREADS} whereas chromium will use something like -j24
>
> Just out of my curiosity, what "${PARALLEL_MAKE}" brings compared to "-j${BB_NUMBER_THREADS}" ?

BB_NUMBER_THREADS -> max bitbake tasks run at the same time
PARALLEL_MAKE -> make tasks (gcc) at the same time

Andrease

