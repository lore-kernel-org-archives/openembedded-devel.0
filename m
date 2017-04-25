Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 890E772F94
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 10:19:54 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id u75so42821732qka.3
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=21bcXolbetpb64iJK2lJArjcgrTc0M7V+oFpjaOm4Pw=;
	b=Y+nDJdVvmpGopqHUyMuLJoT+xl0mW3WKmjW0mVesRQGN3jBe9QvIGEjwqW6OI1mOqa
	LoqgQN5LnK3FhWuJcCqS+D3HoYq7n18CjAvWwW45Sr8kriUi3qJo/tphN/8S87RcLW1x
	xsaUawJLcTlmARfyZcueaNo+XvQmL23c0yjJvCbsdOn6uxCZFN5ffxMliqJAUhlDVMWe
	N7dtfmLOvLNbgBX0S92j+9aagg6mOlO62zFx+rUrldI25o3FfGaB/o2FI25g/DKfaC2f
	YYg3FrTZilfFeOO8oKMtPvdypN3xK4kYewThCjqg15niOCX7Vh8IrIxAE4EqitBjz0LM
	0v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=21bcXolbetpb64iJK2lJArjcgrTc0M7V+oFpjaOm4Pw=;
	b=e4WYuzxPeez/dpXV5VNSFyCJPF+D+YfydSYkmXn9S9a/eVuQSUPnUCuGkbPHVCS/ip
	f11cF++NYLFJ9sDhxfv7OjE+Wn9pddu4SaUPIDD1l2lLtLQQgjHMLiTNE9BKvOO/dz3j
	ymQRC+RePHdQvkSJkWkVr/b0u4J/mfMMIodiQ4dH6Xz5gCYgeXHzmqUIUBBfRT8tWIUR
	BaWi22n7oVNKqF5ziiXAL1f8qmC8Fdf8lse/sJkWp3JkwFKjxTUnNKRKzV0vqrC0jUX9
	wAK1hyeQzbMzBqlrVwYtm9zTZ3QUtYiTviz/pJbeKKHlYotmnrV2wr+d+Myx1pjgTNvr
	A1jw==
X-Gm-Message-State: AN3rC/4I2wmEKXUy+/0RJYn+kFtNfWqopoMzQDvZ3tcDJ6Dpwoa5KP+7
	BKnHEB7ErCCtfKl8IKDZDz65oLPMqZgA
X-Received: by 10.55.17.224 with SMTP id 93mr27151963qkr.244.1493115595424;
	Tue, 25 Apr 2017 03:19:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 25 Apr 2017 03:19:34 -0700 (PDT)
In-Reply-To: <87a875qxeg.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0La+bGDBuJ42yVy79hW2iN3ZhpeyjXrhUApLn-PAi6PYBw@mail.gmail.com>
	<87a875qxeg.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Apr 2017 11:19:34 +0100
Message-ID: <CAJTo0LaLOhPcz8DYQ4wGzVXrP7Qs_Fa7jgrx76wCDAuR8eoWfQ@mail.gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [OE-core] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Tue, 25 Apr 2017 10:19:54 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 23:00, Nathan Lynch <nathan_lynch@mentor.com> wrote:

> Does adding this patch to lttng-modules work around it?
>

Yes, it fixes the build here.  I'll throw it at the autobuilder now, can
you send a patch with a commit message that isn't "someone told me to try
this"? :)

Ross

