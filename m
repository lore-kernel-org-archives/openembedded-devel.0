Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id A9B2A77A3B
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 10:18:52 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id g60so109368919qtd.3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6vESzVvag/Vkglr+WZjCeVTqF4aPQ6ouNkWfMYuZ1Rs=;
	b=sRIA8/VbPdNXGvU8KZh+/jSLwAr8UuBekdKFS0Fw00T5LZBs8XTwPGZRUADWv4mmVb
	RIcdlg21yaaclYo+It1Gb2bxXSgJuVIb3FTrPwDOTrURGREkndThMtwi7f4T9hmJccJE
	H0gaKHffhXkKaFgClqCvTIV2gSFqhgJjt45H8MqKJZNVjgNA742pYjKyg5V2J9b3nicg
	wwTgF4bP/GbabOWKbmmc7DXWxxa37dBrR3pwyp+oN+LQLKAIDYsJlWDpA/15+jGu2zBY
	3LOuURtCGEqObMsO703SYQTuWnsu6Sjabx9aY7WVB/PB7i5k4ymkFiY1LsaFE2vp1YhY
	Jgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6vESzVvag/Vkglr+WZjCeVTqF4aPQ6ouNkWfMYuZ1Rs=;
	b=ti/G3P3YKv9rCkSmP4Wg05Wy9S7D4Agb1EUDUMX6+1PGpU96GhB2Qvb/wQNkfp9kQ1
	DTV3OuvaO6gksMeaF54kUk9O+s1Dy08s9soFjQWCwiesb0MnqRAdMIfFdGtA6ZYympdE
	LoIuX0F4Vzt3KWuD+7UkKouJR649LRhYhQlZguYXk9qECosWLFdAE04GJsRXDqvCWlF6
	C+TBLHlE6wZ2tAxa3YO0sCGpDZFcob6buovvJibPHqW3/MMHk3iyJ7uwxImIfDmN1mkz
	a7+4Ibm1ebKSYHzyERUnyxoFnwX8G+WE0/tPNIkzucuzNA7Zb/G5GZP02bKF7o9dntTh
	g5cw==
X-Gm-Message-State: AN3rC/56rnpuzbloMMu9yH85WH5RsDWofPkda1AgF1WK0FjE9Lw1RoCU
	pBaL8wotn8+r03/dL9tb2WJaL9AWOBAI
X-Received: by 10.200.34.242 with SMTP id g47mr24266089qta.109.1493029133479; 
	Mon, 24 Apr 2017 03:18:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 03:18:32 -0700 (PDT)
In-Reply-To: <CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 11:18:32 +0100
Message-ID: <CAJTo0LbHfg3ra7ugc8Q9zq-dyf35pyocuBDEe9uVh09ZaNnr7w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 10:18:53 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 10:09, Burton, Ross <ross.burton@intel.com> wrote:

> All merged, I'll fire in a moment.
>

https://autobuilder.yocto.io/builders/nightly-non-gpl3/builds/237/steps/BuildImages/logs/stdio
shows that the old elfutils in meta-gpl2 doesn't like gcc7 either.

Ross

