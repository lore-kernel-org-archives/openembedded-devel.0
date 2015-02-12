Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id DB2D672374
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:51:37 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id s11so8434126qcv.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 05:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=V507DDo4Z1J4u8jEQtL9EYo/oWFEoJ+quBMaxmE4qnE=;
	b=yIRMLd5E3wWJSN2J8A2rjT9/tFt1IA4mXx7apWtMqyHQ5mcJeNgio/7Y1Mqq6jIhrH
	hz4Rt2TD38b9x82BoRQpP6wj7uV9kfpe7I/l2sOTWLRH/OVpPG3yoFYgPb4j4P1lX2zC
	PSg+JGfWcFGcul4l/q0/OeafkDixQKzRs6shVOp8Rho0vv6TqEoe2bnUBJgP/LwMOsY+
	hKrfBAmYht/K+nGU3nqI3HhAarfk4oZ6eFGbr1iVEMO8CuCttZDu8LLFe3AyNHKpHqXs
	OgLoFjbuPy7VgXCdWh6SRPpFBgmGZjw30GYce+mDm03u0rjhZL//uQFo1ex5AKYbxEgx
	/1dA==
MIME-Version: 1.0
X-Received: by 10.140.102.205 with SMTP id w71mr10199870qge.104.1423749099142; 
	Thu, 12 Feb 2015 05:51:39 -0800 (PST)
Received: by 10.96.118.39 with HTTP; Thu, 12 Feb 2015 05:51:39 -0800 (PST)
Received: by 10.96.118.39 with HTTP; Thu, 12 Feb 2015 05:51:39 -0800 (PST)
In-Reply-To: <CAP71WjxqmFWuZ9NJRdxns4+ZrUUWmKcTDg4gz_9YJF5LE0eFkg@mail.gmail.com>
References: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
	<1423081763-2905-4-git-send-email-danismostlikely@gmail.com>
	<CAP71WjxPCVC6BcdmrDUz0HJ36Uw-4P-a4skKEFOZtudE2PWSDg@mail.gmail.com>
	<CACS+7ZQ0xqDt9DoWAdJ94V2xMiMuoQJcCw2ciKJF+r=_zSQAYg@mail.gmail.com>
	<CAP71WjxqmFWuZ9NJRdxns4+ZrUUWmKcTDg4gz_9YJF5LE0eFkg@mail.gmail.com>
Date: Thu, 12 Feb 2015 07:51:39 -0600
Message-ID: <CACS+7ZSv+hsBjSjfYMFmkT8D9SL=JGYpAbe1oDe35t4T__uqCg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 3/5] emacs: Un-blacklist, seems to work fine with new qemu
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
X-List-Received-Date: Thu, 12 Feb 2015 13:51:39 -0000
Content-Type: text/plain; charset=UTF-8

On 5 Feb 2015 14:10, "Nicolas Dechesne" <nicolas.dechesne@linaro.org> wrote:
>
> On Thu, Feb 5, 2015 at 5:10 PM, Dan McGregor <danismostlikely@gmail.com>
wrote:
> > In my testing I explicitly disabled x11 in PACKAGECONFIG. I suspect
> > there may be something broken in its X11 support, maybe I should
> > remove x11 from the default PACKAGECONFIG set?
>
> indeed, without X11 emacs now works fine in non X11 environment. i am
> not sure what to say then... if i use debian or ubuntu on the same
> board, emacs works fine with or without X11, so we must be doing
> something wrong in the recipe..

I figured it out. There's a known bug in the emacs-23 branch that was
distro patched in several other distros. Basically glib fixed a bug the
emacs relied upon to function. I have a new patch I'll post later today
that fixes this issue and some others identified in Martin's bitbake world
run.

The proper fix is to import emacs 24, but that'll take longer. When I'm
done I'll also post that.

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

