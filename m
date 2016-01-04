Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id EDD7B731AE;
	Mon,  4 Jan 2016 18:02:00 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id ik10so147110igb.1;
	Mon, 04 Jan 2016 10:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=UeuURWtVjfvO6pbgahOI4rCnn7LxTll5L2PxI2jFGNA=;
	b=ByMHj6wTZaSpfmE2/iAV3vWbpbr5sk8Y9TuLRp1i7JK6SZoKE7c2IKkPCGwNqNC9Ev
	nE8Fx2ccNAOJ3x4t+Ln82Wxy0ZrHuDXISNgXB5BDr7JvhdsSQhou17+/HkRtthHNWkEq
	v6VTaQbB4mY5cLudlj8YBi1BJtzYYfM22FYkI8qgdashGx5Nby/go2FzBV5utj7dErA3
	DMx2IGYIIQdfuJnAoZNIHqAYh+ad1Eq0xXoynM6YHzbvHxyLI9lksj+QWcAfHVRXcQYk
	P8oXrTh188ZyicEHVYrUmT/e0khXIWFh1QLVmm4vMyQk1CgMt8VGulJHqGl0Tl660kUc
	yGeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=UeuURWtVjfvO6pbgahOI4rCnn7LxTll5L2PxI2jFGNA=;
	b=kJc2jRyTZgmp6C4un5w2pANZHgz4LSzp2IlOZI3zelZ9W8rHyBf2G+awxlVjSZPnas
	tAGFWOna6X2/YrHQlV5hCbMZ+qFMAqW+Kc8NFy40HVTVfE7UgCWzpcRX9gVVFn3+F++E
	YHnUMrBrOBLqMxDJphtU8pkKwuo0oDJu23TA/WV87TvGpsFO4qwAVrn1ZsR+En8upwRW
	wKbK6x7sNxqcdxdOKo7msJAyeLiGr3j3tTdu/Tjjw+gMaNZSFgx/c5GPgD7QrPg2uQ0J
	Qu9fKz/eRCWvi+2PlfWrg7sOGYxZxWDZWx5whCemfgao57p8ooVs0rRgxbNUQM73Pi+G
	hfiA==
X-Received: by 10.50.61.177 with SMTP id q17mr80014966igr.68.1451930521013;
	Mon, 04 Jan 2016 10:02:01 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.104.194 with HTTP; Mon, 4 Jan 2016 10:01:41 -0800 (PST)
In-Reply-To: <CAJTo0LY-O9ee3jGoSPOPjqpu=u9zCEo2vfh3jfyxvgC15MWxbQ@mail.gmail.com>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
	<CAJTo0LY-O9ee3jGoSPOPjqpu=u9zCEo2vfh3jfyxvgC15MWxbQ@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 4 Jan 2016 11:01:41 -0700
X-Google-Sender-Auth: l2E5v58IjeHgOfeyKBS0Zn_fYys
Message-ID: <CABcZANktEorpFuYzmJ-4awzSLvypP67kao1jA3Kna3KBaOq1xA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Delete all .la files?
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
X-List-Received-Date: Mon, 04 Jan 2016 18:02:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 4, 2016 at 10:28 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 23 December 2015 at 21:41, Burton, Ross <ross.burton@intel.com> wrote:
>
> > So in the new year I plan on submitting a renamed version of this class
> to
> > oe-core and adding it to INHERIT_DISTRO.  Any comments?
> >
>
> Technicalities time: should this be a new class that is in the default
> INHERIT_DISTRO?  Or directly integrated into base.bbclass?  Does anyone
> have a strong opinion either way?


I'm inclined to say separate class.. as much as I hate too much class
proliferation, base.bbclass does an awful lot of stuff already, arguably
too much. *shrug*
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

