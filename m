Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 250CC6C8BD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:35:36 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id oy12so823155veb.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=X72eS10gkp3n44ayoGqjdAIizqFyqLXYWeB+K6epjgw=;
	b=IfEXAOV6/kM9Vccj1RrNoQYGOa685nWw7E0BxUBafsStUFv5J+svrnnV4Fj2Ei9MOZ
	XfP2KYcX2KlmyuvPOQgowiqhvZOkjoTtDfD3GSBYxJR4Vz4UqD+htvSX424fnSY4MCsl
	PysI/bPqFNyxRg/7nqddeGv5SmCUhLvIoVqjzH1YiYThb8kqtvz1+IHNzf580VgKocbu
	97N3OKZMZjao5py83iz8yoYskFuTrQZOAHtcji2BnyuO78xqNmRZcvj3Au7NYxYoN5F9
	j5paD5WJvPUpvX27kxo0ri3WD6OJYo3Acw7HFytik8+bqHHo2rwzrUwljXVxQhiZx3H8
	TP3Q==
MIME-Version: 1.0
X-Received: by 10.220.133.80 with SMTP id e16mr33952251vct.13.1395318937483;
	Thu, 20 Mar 2014 05:35:37 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Thu, 20 Mar 2014 05:35:37 -0700 (PDT)
In-Reply-To: <CAOLEWZW0=OLt2oyRzeQY_3kfGfSYAwf9iOiYwGQ5JqDYZmJzuw@mail.gmail.com>
References: <1395133748-1211-1-git-send-email-stephen.arnold42@gmail.com>
	<CALbNGRSynkvxFUPNDCoQhPMnK7HHgNuM1sBOh8gPnJZXaW4r+Q@mail.gmail.com>
	<CAOLEWZW0=OLt2oyRzeQY_3kfGfSYAwf9iOiYwGQ5JqDYZmJzuw@mail.gmail.com>
Date: Thu, 20 Mar 2014 13:35:37 +0100
Message-ID: <CALbNGRQ_1-cw1RYBQ0dPZ+J9+9BVsCDEzr+9YykVOyJsMu2ErQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-graphics][PATCH v3] recipes-graphics/lxdm: autotools and config updates
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
X-List-Received-Date: Thu, 20 Mar 2014 12:35:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 19, 2014 at 3:57 AM, Stephen Arnold
<stephen.arnold42@gmail.com> wrote:
> On --enable-password=yes:
>
> The upstream docs say "enable to load autologin password store at config
> file" and it's part of the default config on my gentoo arm builds.  I
> haven't actually tried it in oe yet, since I wanted a default user with a
> password in my rpi build.  It sounds like the oe method doesn't need that
> option, so I can remove it if that's what you want.
>
> On the extra CFLAGS:
>
> I suppose they're not strictly necessary either, but they do help reduce
> configure warnings.  Some of the build failures didn't really have any
> obvious errors (just a boat-load of warnings) so it helps in getting to the
> true error.  But as I said, it should be okay to remove them now.
>
> Do you want a new version of the patch minus the above?
Thanks for explanation & taking care. I have not time for testing but
I think patches are OK as they are.

Andreas

