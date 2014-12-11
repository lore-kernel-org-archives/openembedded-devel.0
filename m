Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 580B265E1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 13:54:38 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id dc16so3523471qab.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 05:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DhNciTVTfVS5KueJPzMMr/4IHcxtEvAUjgNXRkcLGP0=;
	b=f7NLHSEk5LpR2x+ZfDo/DVCbUafrPYyk2SZZ9FJC3NAUOp7FiN0R8R5fm+MTYVRY7n
	3dELrK92NHnwtiW65kgxh6Hz25QqHudogtk0Eg7z98E7RlBsIQYf/Y84RCEBvjoHbGEJ
	feR77cuFvhCMaPiCZsGIF2S+9b3UksTLJTKvqVDbsnJd5uc+RJDqlNYH0BTS4FxQXirR
	clFH5kCW8dAPWFGR9o5ayExfjx8Q+gG20Ka1GrMpQAU+u+T4gs4bhHzjAjXmlkc2X3V5
	AjS6nJmeULAYOBRbRY6xn5w0FvE9OM+AjupQwbEL9dYyXLl7z0WYMQopw6FAjJ5XtW1+
	Tceg==
X-Gm-Message-State: ALoCoQnUa8GipHCJ2/j/iA0Y6ZK/mNzbc57VTHV02UrjPhyrdMLORyj6o1FMapxu42fk9xUOxZz2
X-Received: by 10.229.176.198 with SMTP id bf6mr20178279qcb.12.1418306078997; 
	Thu, 11 Dec 2014 05:54:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 11 Dec 2014 05:54:18 -0800 (PST)
In-Reply-To: <20141211124459.GC2467@jama>
References: <20141211092332.GA2467@jama>
	<CAJTo0LYwYW40XvxNN=rY4z6fK+4NJ2ZFxa2xsUvuspERa_MT+A@mail.gmail.com>
	<20141211121417.GB2467@jama>
	<CAJTo0LYEvdspWOu=_LQTtD6xZTFZvHTyZpwQOEXbtpbSnPE-5Q@mail.gmail.com>
	<20141211124459.GC2467@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Dec 2014 13:54:18 +0000
Message-ID: <CAJTo0LZEOOKCP3wV9V8bnNLDs8dhi+rfO+7Lphwak74RpqiXMQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, test-dependencies 2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 13:54:48 -0000
Content-Type: text/plain; charset=UTF-8

On 11 December 2014 at 12:44, Martin Jansa <martin.jansa@gmail.com> wrote:

> gst-plugins-bad-meta depends on gst-plugins-bad-rtmp when built after
> world (rtmp is detected) and doesn't depend on gst-plugins-bad-rtmp when
> built in minimal TMPDIR.
>
> test-dependencies.sh is showing this warning when the dependencies
> between "maximal" and "minimal" builds aren't equal.
>
> I still don't get what's wrong with that warning.
>

Gotcha, yes, understood.

Ross

