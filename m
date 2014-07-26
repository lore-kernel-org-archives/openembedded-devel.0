Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 10E0965F01
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jul 2014 23:14:02 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id mc6so4161557lab.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jul 2014 16:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=AjFztmEX1EyGPuH47eV1FqFx6OUhNO9/ayNJSBzLHAs=;
	b=xOZ/CLBvCQfd8wec/TNDNN97+Cyz57rCS+A1raVKB7RyMiT0R+CXZPfu+fu6fIQxNa
	HdBs3niCTj9IjbKtMlKY2jHz0nT6kxPL+9G/8PW0nEW8I1wNcGbwlwfMiKey6o9aJern
	yZjf+yvcuhnuxg4q6Fu+jYmXIEVlJelPAI0d0gXR4Q2MyhsP+zjaCK/XqXyAZkxfK1lO
	EqSSuTDJW5jEz93OqPYXHIALiJ/NwJox8gTgQUX7RPD315f8Dve77R9Tz6CD6YhgdF6B
	TnZVrWNJazZXzs8b8uOiLh8MMuFzn+qGJCMz2uxZ9eiHRs4Gh9rnDCiLVEqiKtEn6bZX
	cq4Q==
X-Received: by 10.112.148.10 with SMTP id to10mr10563891lbb.77.1406416442825; 
	Sat, 26 Jul 2014 16:14:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.63.72 with HTTP; Sat, 26 Jul 2014 16:13:42 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407260841510.28771@localhost>
References: <alpine.LFD.2.11.1407210555370.10857@localhost>
	<CABcZANkamKKfYkMBnit4H8go-_BY_0ePWbg32Fx6oCjNVspiwg@mail.gmail.com>
	<alpine.LFD.2.11.1407260841510.28771@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 26 Jul 2014 16:13:42 -0700
X-Google-Sender-Auth: HTViIeuomw7VZ4dQkDhAmJDP9aY
Message-ID: <CABcZANmro1OOnNZjAM-mkPjxV7wTUOpKHR9AQrqJTMhV5LOs5g@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: i'm assuming some "do_<task>[dirs] =" directives are redundant, yes?
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
X-List-Received-Date: Sat, 26 Jul 2014 23:14:03 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 26, 2014 at 5:43 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Mon, 21 Jul 2014, Christopher Larson wrote:
>
> > On Mon, Jul 21, 2014 at 2:59 AM, Robert P. J. Day <rpjday@crashcourse.ca
> >
> > wrote:
> >
> > >
> > >   pedantic observation -- i notice in base.bbclass:
> > >
> > > do_unpack[dirs] = "${WORKDIR}"
> > >
> > >   and over in patch.bbclass:
> > >
> > > addtask patch after do_unpack
> > > do_patch[dirs] = "${WORKDIR}"
> > >
> > >   so given that patching has been added as a task after unpacking,
> > > wouldn't ${WORKDIR} already be guaranteed to exist? doesn't hurt, of
> > > course, and no, i have no intention of trying to clean any of that up
> > > :-), i just wanted to clarify the actual mechanics.
> >
> >
> > 'dirs' isn't just a list of dirs to create, it also sets the current
> > working directory for the task. The last directory listed is where
> > the path is set.
>
>   is that documented anywhere? the "variable flags" section of the
> bitbake user manual says nothing about that last obviously significant
> property.


Good question, I have no idea :) Clearly it should be somewhere.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

