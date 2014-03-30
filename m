Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id CC4F660DFA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 00:17:27 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id as1so6463424iec.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Mar 2014 17:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vNHZZPUk33il5FJXZ74G68O8jmn8tUCg/TKIaQVAQnk=;
	b=yCOSfT/1k9DXuVcGAdTFi4IdCrycHdgMaNtm34r/hXhPw2om9HZsSZ96YX6MRPIIGm
	akxCcwfoY3OrxiX9MTy3Xwhdn9lkQwM5JBrcXaxsdmIK8QNKq6I24fbAg4r0vOVRnzmG
	0FOOwb4hg59SAB7EKkO/9xIl/Dh7CKul5T0+YINWP0Fe3wlx0GmcBRQzcAlSN+fEFCdj
	6oD2Qr2HtTLx0VPmHjnBV96vnh2zm72dbzUXCeqvcIM0ukSqOm+fU+iitO0h2j5QYEK1
	jl/2YEO/6MMNFHJhW/a9XS+uAXR6+Tx8HD9z6ZdrgZEbbrlFVMf1xmxejEFxjRariOaM
	bsSA==
X-Received: by 10.42.197.129 with SMTP id ek1mr19146452icb.9.1396138648341;
	Sat, 29 Mar 2014 17:17:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Sat, 29 Mar 2014 17:16:58 -0700 (PDT)
In-Reply-To: <5316DE87.7090906@linaro.org>
References: <1391518370-19990-1-git-send-email-koen.kooi@linaro.org>
	<20140305041901.GU26981@jama> <5316AB64.3080501@linaro.org>
	<20140305055717.GV26981@jama> <5316DE87.7090906@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Mar 2014 17:16:58 -0700
Message-ID: <CAMKF1soo+m6dBiHr9FrHxowjJokE8HMoGEOq+EoEaB3XwRLY-A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mongodb: add git version
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
X-List-Received-Date: Sun, 30 Mar 2014 00:17:28 -0000
Content-Type: text/plain; charset=UTF-8

>> Yup, 4.8 from oe-core.
>
>
> These atomic ops *are* available for gcc 4.8, but it doesn't advertise them
> for armv5te. There are 2 solutions:
>
> 1) CFLAGS += -D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4=1

this is a quick solution but make it CFLAGS_append_arm instead, it
really should be fixed in
mongodb package itself if its just using sync_compare_and_swap only
atomic then it will work on
armv4+ platforms

> 2) Add a block to that files that tests for gcc > 4.7.0 (that's what fedora
> does)
>
> I'll see if I can find time to fix this next week.
>
>
> --
> Koen Kooi
> Builds and Baselines | Release Manager
> Linaro.org | Open source software for ARM SoCs
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

