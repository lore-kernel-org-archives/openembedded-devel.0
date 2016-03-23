Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4B7601A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 11:51:52 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 124so33884981iov.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 04:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=wlLoH+UJYyGwcSVGfRgoKw/XzQnf8m9254Ijs9uK5ok=;
	b=HXZ+SWvtDSjYOjZTnWOAYP+a0hUW9FHhP1JmAmkT/eZOfqOF1KZlm77Lq9tYo6mvmg
	KA9YQ680/dipfm5Y1HAw9DH8VNDIbJeQ5Pcd6NxCHcKK1uUg6hDelOm7kBeeiKD3mcgj
	Jq17bfaM2aOZUcSERqw5EqMkkknc0BrNePAwESEO/7hAO6v17MpTqKQL+6/g5F7v6u0E
	Ktm3CUwqtf/6Y4S3cGHCbAyJb8kc/k/CIMWLuO8Ce0uiJv4V3u3Y1AXir6k1p9u22NmE
	DazJSikn97v7gEUhA97JeJ6oXJSAK6vWFQig5pBnrYFMzBsJPjAr/YEhadFp1HezKwCR
	A28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=wlLoH+UJYyGwcSVGfRgoKw/XzQnf8m9254Ijs9uK5ok=;
	b=TqNTEtFAiEWIG6/QoTHWJNhWIEHg+9Qnae5YNAhPCHFqVF1E9dtnr7gQf1/jxTBWL8
	QI265xhvtSeSdSYk3GPyEjdj27oXV4KAT2pvKGbqVjlZ8kPRNmC4TrsCQmGhYwUVegoF
	/P8zAPAz1qTwqUX6u0K9PNXCxsy2ubCB5cl0p1u32lPA68P3X6O3eMwJJMkAybgegLfb
	DFBWQt60+xabsprNM3Xw92ITDSnU5F4bS6HmC1DzDtH9jwp+OfEGwVpfBHoKTjDw0JYj
	gdo/FO4nFPYmj4JefZHvgOG2haoH6tNYLoqq41wCo4yBo5e5/nsFH8Z7M1a5OlCJKIXk
	PUkw==
X-Gm-Message-State: AD7BkJIqv1sEE7TwDp6SziIGkCGGkwl+vpd06ZkzaGBc5cwgKSsnAQ90v+XXKxnfDk3lmVI9fyqeUHevBgMXIITy
X-Received: by 10.107.16.19 with SMTP id y19mr2688965ioi.148.1458733901552;
	Wed, 23 Mar 2016 04:51:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Mar 2016 04:51:22 -0700 (PDT)
In-Reply-To: <1458688019763.44680@planar.com>
References: <1458688019763.44680@planar.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Mar 2016 11:51:22 +0000
Message-ID: <CAJTo0LbQkjEe5Q8H5PxeHQ6NZvqZsaS-m2-iVAG7P8Y9-VxJWg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Specify GCC version for building native applications
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
X-List-Received-Date: Wed, 23 Mar 2016 11:51:54 -0000
Content-Type: text/plain; charset=UTF-8

On 22 March 2016 at 23:06, Matt Schuckmann <Matt.Schuckmann@planar.com>
wrote:

> I can install both gcc 4.9 and gcc 5.0 on my system and use
> update-alternatives to switch back and forth when I need to but it would be
> nice if I could just configure bitbake/OE to use gcc 4.9 directly.
>
> So is there a way to tell bitbake/OE what version of GCC on the host to
> use to build native applications?
>

Yes, looking at native.bbclass shows that it uses BUILD_CC etc.  Just
assign those in your local.conf or similar, this works on my Debian box to
pick gcc5.3 over 4.9:

BUILD_CC = "gcc-5 ${BUILD_CC_ARCH}"
BUILD_CXX = "g++-5 ${BUILD_CC_ARCH}"
BUILD_CPP = "gcc-5 ${BUILD_CC_ARCH} -E"
BUILD_CCLD = "gcc-5 ${BUILD_CC_ARCH}"
BUILD_RANLIB = "gcc-ranlib-5"
BUILD_NM = "gcc-nm-5"

Ross

