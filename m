Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0257A7318D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:21:25 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b199so17430681lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 11:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=SF1NJ/4nd4rPtABqu+h9UDxcJY6Oe9xtUqg00m7ADnU=;
	b=xLRVLv/H3iG6gpkDEhi3RJYGlnG8zBgbF4QpJpLFiGsyCCV83ej/huqux+ziKqrNAA
	OBi/HZCc3KX+L2fUaVQ7NGrSMUun1PnfiQIopMrAsjYQM4FsGkddMUbuEpYnMVY2iorv
	Ko2LQyZOfI3KBAIxtd1oRn5o+WX9ZkN/lV+IR2KbOrZq+401dukD9lNI3M4Mq+jpwChQ
	sWV+QYbYlWvCsGF+2Dzubid8o4ljLRva5PrYS13fCxNLkp2ZtN8p7QAfiIfwAv+nbeN7
	CnR+Bl8O8CZlBvpfRM9IpEhP4c7vM3MOJOmKyFdasf94b4p7K+xJh6u2XKrwrOXS81p9
	71ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=SF1NJ/4nd4rPtABqu+h9UDxcJY6Oe9xtUqg00m7ADnU=;
	b=baxN6NWGVZ9GF2NaWsb2RjUcwFLCFW0n4uWxnblMiKLDb8D8tQxf+2IHrQuKT6EKrU
	Jf0WnaRQG0YtxoxAzJR/TqxaQ/xw6a3TKwqqD7RBs7YNbxfiGZuKAV7Lk99CCJfh3TNv
	ZE5mM9gIn/L7N70MefvqZZmL8T1BfuZ64W7bPsg+5po0Fz3WoXNS/DGG5emNn56YOfbD
	QgAuyK1B9eOtfA94XYsilp1J4L1d3RRQCjUKX0lrxGu2CgP/a8lLz68uN+IoFoAnecsK
	5xQgfGZRARL6hGrB0im7i1GbAWk76ZQ18c1Ycpz+SYGNdtdlMQO7zMdq9eg4u+E7NQdC
	X62A==
X-Gm-Message-State: AEkoouvy4dH5GydH5BN0whttDYNSB9mQwPcEqkXUYFNdNetqMmz7oafG1TfqRk3JTSz4O/cu9fLrWEj/X7OUUw==
X-Received: by 10.25.19.32 with SMTP id j32mr1122334lfi.204.1471544485107;
	Thu, 18 Aug 2016 11:21:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 18 Aug 2016 11:21:24 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1608181408250.25743@localhost.localdomain>
References: <alpine.LFD.2.20.1608180535210.16814@ca624034.mitel.com>
	<10C3DF54-CD57-4E94-B989-E87C3122127D@gmail.com>
	<alpine.LFD.2.20.1608181408250.25743@localhost.localdomain>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Aug 2016 20:21:24 +0200
Message-ID: <CA+chaQeYS9NqyL0dqE_rK=nCKdX7OYF-dgSHJRwm9xro0qaJqQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] meta-oe: php, given "_append", remove superfluous "+="
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
X-List-Received-Date: Thu, 18 Aug 2016 18:21:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Don't resend, it's already in master-next (all 4 squashed into one) and I
would keep the space before \ because we always use space before \ even
when it's not really necessary.

On Thu, Aug 18, 2016 at 8:09 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Thu, 18 Aug 2016, Khem Raj wrote:
>
> >
> > > On Aug 18, 2016, at 2:37 AM, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
> > >
> > >
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > >
> > > ---
> > >
> > >  again, not compile-tested since it seems obvious
> > >
> > > diff --git a/meta-oe/recipes-devtools/php/php.inc
> b/meta-oe/recipes-devtools/php/php.inc
> > > index ee7a143..23de2b1 100644
> > > --- a/meta-oe/recipes-devtools/php/php.inc
> > > +++ b/meta-oe/recipes-devtools/php/php.inc
> > > @@ -15,7 +15,7 @@ SRC_URI =3D "http://php.net/distributions/
> php-${PV}.tar.bz2 \
> > >            file://0001-acinclude-use-pkgconfig-for-libxml2-config.pat=
ch
> \
> > >           "
> > >
> > > -SRC_URI_append_class-target +=3D " \
> > > +SRC_URI_append_class-target =3D =E2=80=9C \
> >
> > nitpick: You do not need a space here since its already added after
> newline
>
>   since i did that more than once, i'll resubmit those patches. if i'm
> going to be annoyingly nitpicky, i might as well do it correctly.
>
> rday
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

