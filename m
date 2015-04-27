Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 328D372A78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:55:08 +0000 (UTC)
Received: by qgfi89 with SMTP id i89so47648088qgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 03:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UWnFK4gn8da2lpNdOG6WOVlkrtZUAYdQQA4W0a++Y0I=;
	b=aVDsLQlrPm8ysqqtjdmXCcGh21OhGnod0w65JZ9xKeTvSqgy3C+WD+equN1eN5Rh5p
	EzikQOo1yXTVZdyI0+c3zyNHREFgv9WUdFquPsmyenPLYEbctZ89hEhwVFNRsVRLAJtE
	/ehD+Msx087ncNFF9/CGD/M4i/EhibXm1dUCrVx9WyHRnC95h6NMBw5NP0mXAz7d2yzg
	CtrvhAi5JPXFk1FfEjaqizvx4dsHifl69AcRCgzFTGQkJSDToHy+xjuF5RJk3rWmVBSH
	/BvrKG9aVsp9n1scWNQVRcPPLEj7JUW8Bnw0DHZdhOMBce70rNkrtBGb2hyBKMd+zNvy
	ruqg==
X-Gm-Message-State: ALoCoQnjhArBoW1BJVmnZVLxSM1GNhCjcGOjnlTjklGa6vOkFoeeca59VLeGPfOh1Vh6gmcfFibQ
X-Received: by 10.55.50.20 with SMTP id y20mr11017129qky.58.1430132109923;
	Mon, 27 Apr 2015 03:55:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 27 Apr 2015 03:54:49 -0700 (PDT)
In-Reply-To: <2199106.4TMPZeLVjV@peggleto-mobl.ger.corp.intel.com>
References: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
	<20150427045319.GA6712@ad.chargestorm.se>
	<2199106.4TMPZeLVjV@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Apr 2015 11:54:49 +0100
Message-ID: <CAJTo0LYZzODifjO+11BunepKdoGv5=ftfhmheNBjbf-Yios8Eg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [meta-oe][meta-systemd][PATCH V3 1/2] bluez4_4.101.bbappend: update according to bluez4
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
X-List-Received-Date: Mon, 27 Apr 2015 10:55:12 -0000
Content-Type: text/plain; charset=UTF-8

On 27 April 2015 at 09:28, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> > If you look at meta-systemd today, you'll see that there's only a minor
> > number of recipes from oe-core, that's being appended. All the other
> > recipes that previously where appended to from meta-systemd, has got
> > their systemd support directly in their own recipes.
>
> It depends on what you mean by systemd "support". What's left over in most
> of
> the meta-systemd bbappends is RPROVIDES/RREPLACES/RCONFLICTS on the package
> names which we haven't used for a couple of years by now; surely at some
> point
> we should let those die with meta-systemd?


FWIW I agree here. Those names are only for compatibility with
meta-systemd, so they can stay in meta-systemd and eventually be retired.

Ross

