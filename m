Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6E36FF5B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 15:40:28 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id z14so126430411igp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PxbNYRcb49quK/imVt57InGWxjNR5T2yt6QZ3JLRLDw=;
	b=Ud03wPPwd5Gc7u+NHGPh66o+T9OrEufBcuNARvsuVGd9Nduiw0sbVmYeT9k3gF3+W9
	qnzyWqHI6EJnSV4EXVQcg83t3BNkw0/pUSlDRIPsQ8Hk8dSIRvgNSqRbEC4Exqb1ivYC
	7JHqPDSFsLm8x3ipmyih+8UYr4MwPgbKvgyc80EWVwbJZmRlatyznZAOuQh4T9qRGacP
	KGz88D7mP37sYckCDLddaSd6IIE2fsmbZUuMJY8i04lAzOWQlBx/zLEeneHCcliPOAH9
	StCnLxYLs1hG1NvF1BQVer8B/SQWdrGMdIIc1I+Gua8I/b4bu+L1kzIHSECBsKzbUVIj
	xYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PxbNYRcb49quK/imVt57InGWxjNR5T2yt6QZ3JLRLDw=;
	b=K9FP9Oi6e4t9UTe1QyzCmuWh2m0Wv4AOY3WzQm4UUkGxBua2krgGWeF8t3/NdCIsTI
	IS4OyPr/mnv7q/k3ufRuidprHJf08LJs6h0nV6f8XwsEFcv45gGtsbo2Rqrb6afKhABP
	kGLbgzvzzj+/af6vTSLkJMBCXLUrNclvCAeCNToASDiau0OI+vEXrd8MGUO+UtbUJwLZ
	IB7k20zaLZlxCWP4ZTHxS7dqBhBpfGlPStq7C3pNk+U+kPQiYC87eW1y5pg2pM1BHl5w
	5Zytbq+yqTXIPOLlNppOs3qDr6vqFbBkguVIovmHUEAWJjm9vm2cDHkaPlYeefMD1QYh
	Uytw==
X-Gm-Message-State: AG10YOQR2z38KXOe3+oAp49Ty6pWEY7gX+TvqBL1leiFZxqGVsihy/wSXf+RkPxKEyuRhWrscSpvKLTKvGqHM3x9
X-Received: by 10.50.111.111 with SMTP id ih15mr10412379igb.78.1453390829770; 
	Thu, 21 Jan 2016 07:40:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 21 Jan 2016 07:40:10 -0800 (PST)
In-Reply-To: <56A0F5D4.5090701@linux.intel.com>
References: <56A0F5D4.5090701@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jan 2016 15:40:10 +0000
Message-ID: <CAJTo0LYvEUgd0xNdu-HoVR1dW_eXYpZjy-BjzxOm0KKt0vcWcA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] proposal: let's move oe-core to ffmpeg (from libav)
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
X-List-Received-Date: Thu, 21 Jan 2016 15:40:29 -0000
Content-Type: text/plain; charset=UTF-8

[CC'ing oe-devel]

On 21 January 2016 at 15:14, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> let's replace libav with ffmpeg in oe-core. The reasons are:
>
> - all of the major distributions are using ffmpeg now (the last holdout
> was Debian, and they switched to ffmpeg in summer 2015 after a long
> discussion and deliberation [1][2])
> - ffmpeg is much more responsive to security issues
> - ffmpeg does regular releases, while libav hasn't had one since spring
> 2015
> - other reasons listed in [2]
>
> [1] https://lwn.net/Articles/650816/
> [2] https://wiki.debian.org/Debate/libav-provider/ffmpeg
>
> Objections, thoughts?
>

Sounds sensible to me.  However we're a week away from M2 deadline so I'm
not sure we'll be able to have a consensus and get patches before that
unless someone is incredibly motivated.

Ross

