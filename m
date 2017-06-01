Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id D2CF677D11
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:30:24 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id 7so164373518wmo.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 09:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=TvCE300diEWG9Sv6VULUTF6bvZzSnn5U9fbmS4nHEig=;
	b=c/wDPNTXM65HvBdkWfzNR3hLUxnJXzlXzk4Lco0cPPva7GfBhVbExqDGVt2nvDDfVf
	7QIF9wXDthM7+WlVt6PAN3S1zASLtZfIj9uVp/OHyQjLiG6N/pZusauXnZJQw/nr5Gjn
	Ms/kPORzVDRh6pp525KPuaVT7osH2riWbCwkWU+UPVDbay/UOHHO4C94ypJL/gcDbxam
	SZhqgyf5Hk1mMrnRZMFB/t44Hexviu2drG+8cl7AS+fplWQNgSQwXkuzc+ujZF8es30/
	e9iGZVt+ujAswCwGCA0OL9Nl8IQAtvErNGzBjtUba8NMnK4bppa2vLcwcmDsFC+QvnZB
	hCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=TvCE300diEWG9Sv6VULUTF6bvZzSnn5U9fbmS4nHEig=;
	b=OIOl1H8C9xvb6ZD9+2QJUGAO/0HPaxaMUrE8Sri2PpEsLQyTArpMmpjHVhMO1o4ADD
	rOOTMtRCiSFZrjY+8lcD4f9+6X/a+yH5ieEza53xL6sSbXfJpi2ulPfB1kOfQNG0MpSK
	qX5BPptZdgaLPhXuvQlFTELzk9SlIL/FI2OY0NM8DPQs7MFoq6ChrbZtAb7mbF1E+juX
	7PZUzU4a7Fnr4ej0Mqp6yewbXp/WVWVBi7ZHyDzT96Pr3eJ05VjG+7DSDDi/H7B+wEwn
	Cvs92rvg0hXq2TjFJyc6j0UmO0YmFkhx0RGGcQrXqBS8VWfRasC0xndZ6J1xtFL6uDH0
	Jdyg==
X-Gm-Message-State: AODbwcBe9b1Mrx/DCUuoQiW6RYuaOI/Vrg3xqiBq2rJGq8y81oun2Ph1
	ZkhuTGX8+tEXs+d/RKFYdLmLWXNieA==
X-Received: by 10.80.182.35 with SMTP id b32mr2569325ede.123.1496334625556;
	Thu, 01 Jun 2017 09:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <1496212846-21304-1-git-send-email-samuli.piippo@qt.io>
	<6780201c-a87e-730f-4cb2-9545d6ffe782@zonque.org>
	<a57704de-9be3-0182-dc47-201117ab41b0@gmail.com>
	<5b8de782-d675-642e-2622-ef4f93bbb3e4@zonque.org>
	<79f414a2-00db-068d-962a-a25b23c97190@gmail.com>
In-Reply-To: <79f414a2-00db-068d-962a-a25b23c97190@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 01 Jun 2017 16:30:15 +0000
Message-ID: <CAMKF1sqzX+NBRvP9pCURo5cUPadVmngNpTv2RCv=BBs8bzNzmQ@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>, Samuli Piippo <samuli.piippo@gmail.com>, 
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Thu, 01 Jun 2017 16:30:25 -0000
Content-Type: text/plain; charset="UTF-8"

Export cc=${CC} or some such in recipe

On Thu, Jun 1, 2017 at 6:17 AM Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> On 01.06.2017 15:57, Daniel Mack wrote:
> > On 06/01/2017 02:35 PM, Samuli Piippo wrote:
> >> Parts of the chromium is built for the host and requires gcc-multilib to
> >> be installed when building on a x64 host. I should have noted that in
> >> commit message.
> >>
> >> My /usr/bin/cc is a symlink to gcc
> >
> > Hmm, same here, but that's not the case when when bitbake is executing
> > it, as it modifies the PATH.
> >
>
> OK found it. I didn't have new enough poky, so the HOSTTOOL filtering
> was not used.
>
> We need to find proper place to add HOSTTOOLS += "cc c++" to whitelist
> the needed tools for webengine.
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

