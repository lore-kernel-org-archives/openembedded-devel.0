Return-Path: <ticotimo@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id CA4DF6022F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 08:38:45 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id g71so6991910ioe.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tsQtIKMLCL7ZQ22/E0XJJBsS+TktFeaIt6W4n8/0oOU=;
	b=VwSpiXQQxr+hO4cWc9+wcjfkSl0PU8T3O3yh+Onh8FjHrOAcQK372/knlA57HGdifE
	Lqgz4mq8G19ubWO43c4PdBJrnuVixfGRLqkLI1iEr+PFbdRvrblahArJCDqpIttIXA32
	g5fpoTYWPIpGJMO3CYQCiVLrY7bhnBxvDoUtRqxI2A+OLuGOvz4ZaM3I1Gl81bWc8rls
	HJr9VKEc3x7RKxJm0HCwsLb2rNKJ4/LAL4Ix3ensEPFB4oAV/JNUuerwYtCROOPgFP1i
	hwNLnkIjkh9RssbRgq9dplwmti6jdAcoTbTQk5aQ97q4tVUoLGRbwB8ztp/q4hcWbtAI
	DKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tsQtIKMLCL7ZQ22/E0XJJBsS+TktFeaIt6W4n8/0oOU=;
	b=OhMakzqWQTac6UT0B/NbX03uxGWM8GY2EnilKxc1iAwnVDoC3VCgR+tvxseO21AdK/
	eu6VHTR2CfFG21/gLVHkngj0L46aZGAXPCcM3YQVp2aUSgFO0WNz+t7EHnwgsh3iSnen
	GNKTOtKcXGUOsCQYQG605tnjt79yVPnePROubt0PSpfnrVoef3nguLuUPKXHzYfvxbNU
	Yn81sDI8d6IFL1mYGHD8UlHfVoWCWBjGJc4Hzsuq9PhfBpolCFvBgufKDbO45OX0zqFI
	EeCnQZl8XKzuO4bHgoxqcqxUsVjl/m7BFLctRuW7KqhVqlBojYablKERTautfFpEsYTi
	rgmQ==
X-Gm-Message-State: AHYfb5gft8dOyvWn6qGGS2CQW0Y5Lue/W7YNZcdu+7FxKZCuJZxV0hU5
	DqPn7LYcZhHx8aJ7a8Rfz3LV6kd6Rg==
X-Received: by 10.107.192.196 with SMTP id q187mr8795775iof.66.1502354327257; 
	Thu, 10 Aug 2017 01:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
	<1502288526.1934.39.camel@linux.intel.com>
	<879E7479-CCE4-47D5-BB40-E789BA93185C@converseincode.com>
In-Reply-To: <879E7479-CCE4-47D5-BB40-E789BA93185C@converseincode.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 10 Aug 2017 08:38:36 +0000
Message-ID: <CANx9H-AJpd0OpMG13ps89kQ7bpzH3b3GdN5xzfhVPTW3EcdjmA@mail.gmail.com>
To: Behan Webster <behanw@converseincode.com>, 
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Alpha release of check-requirement.sh
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
X-List-Received-Date: Thu, 10 Aug 2017 08:38:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So where does it live? It ends up being: run shell script from "somewhere".
I know what you mean about git and other requirements, but still it must be
sourced from "somewhere". If you add a desire to be version controlled, it
then logically lands in a git repo. Or subversion, bazaar or mercurial.

Thinking outside the box, we could make it a python (humor me) module
installed from pypi and document how to run it...

I tend to use shell scripts as my first draft and then translate to python.
This usually means a lot of "subprocess" calls and is by no means a silver
bullet.

Alternatively, it becomes a clickable link on a website. That means nodejs.
Or perl. Or...
On Wed, Aug 9, 2017 at 9:40 PM Behan Webster <behanw@converseincode.com>
wrote:

> > On Aug 9, 2017, at 7:22 AM, Leonardo Sandoval <
> leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> >
> > in my opinion, this fits nicely into the oe-core, into the
> > scripts/contrib folder.
>
> Keeping it in script/contrib seems odd to me (horse before the cart). One
> of the requirements for OE is git (or tar) to actually get OE in the firs=
t
> place.
>
> I see this as more something some one would run before cloning OE or Poky=
.
> It=E2=80=99s a replacement for needing to read a long HOWTO on a webpage =
to get
> started with OE or YP.
>
> Behan
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

