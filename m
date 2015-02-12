Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id C824F72374
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 11:19:44 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id m20so7690174qcx.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 03:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KGx8owgXw34hMPavFl0rUbu/LqBtCZq4j9SPZUExi4k=;
	b=IZcNJ3Brkckom90iqs5UYpivMC/mvgYiH9sFgnqbbN5jaMFE8tCD5oud0xwf+CFvvT
	i2jOOIfaQY9yXNGR1GtWAryUVFpLXB7GbbgvSkjE4XYLiPuJGFCOp/Oq794g890K1H5c
	L1IKtvFwrE0IAJgD0uMmxsp8/ompIaF7oCy4FSdEkj5ZRpddkgxZz5qwgpOaBHdoxwuQ
	NLgLiid96uETN1E74nLuZSYx4NH2tiBtJb8NhaJ/12fM3+COQbaCDztjXrNoV/pO61sL
	Ix8O/fZxVm8coNlSTo1332janJdPB/l0TiGo1jVlY6LFAZOKvMfv0nhc+Ri0XFncbpYX
	v+mA==
X-Gm-Message-State: ALoCoQlYUtllNCtvGvZzeuJsxqqmbFcPAX15+nDIOBJjynMhTsoWGqblnq3WdwOTrSxYcOaH4Crm
X-Received: by 10.140.92.161 with SMTP id b30mr8840136qge.59.1423739986003;
	Thu, 12 Feb 2015 03:19:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 12 Feb 2015 03:19:25 -0800 (PST)
In-Reply-To: <20150211213954.GI30457@mentor.com>
References: <1423669983.23617.78.camel@tycho.nsa.gov>
	<6445648.XiRzhvmYHl@peggleto-mobl5.ger.corp.intel.com>
	<20150211213954.GI30457@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Feb 2015 11:19:25 +0000
Message-ID: <CAJTo0LYRUUC6ErtyC2E6kB70bnVQVoeVro9ajwBZ52-NNgTUBQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: meta-selinux
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
X-List-Received-Date: Thu, 12 Feb 2015 11:19:46 -0000
Content-Type: text/plain; charset=UTF-8

On 11 February 2015 at 21:39, Joe MacDonald <Joe_MacDonald@mentor.com>
wrote:

> > What's more likely happening I suspect is that you are on a newer
> > branch/revision of OE-Core/Poky than the meta-selinux maintainers have
> tested.
> > I can't speak to the maintenance schedule for meta-selinux but maybe
> others
> > with knowledge there can chime in.
>
> Our master tends to lag behind oe-core's master for a few reasons, but
> none of them are really insurmountable.  Certainly the intent is that
> meta-selinux/master will build successfully with oe-core/master at any
> given time.


The yocto-autobuilder software is in git and I heartily recommend it (or
similar, if you've a buildbot allergy) for anyone maintaining layers.  Just
the simple act of running a build every night to verify that the layer
works with the latest master branch (and stable branches for bonus points)
means that problems like stale bbappends are rapidly found and resolved.
For even more bonus points, also do builds against master-next if that
branch exists so you can get notification of changes that are in review.

Ross

