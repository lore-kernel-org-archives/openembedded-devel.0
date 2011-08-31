Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QyjJ0-0006Vh-Ic
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 13:50:06 +0200
Received: by vwe42 with SMTP id 42so482198vwe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 04:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=WfsW8TP/ix7mpaQgpQQNVQoHIi4oXayq2jKfMhZAUgc=;
	b=sVcPc7yb7sMt4MBqAYK8Bjx8SKbcbYfhm78YDxPtvoWbBBrVlKfiPcxTr38BsWD5+g
	4fyVFyt+/U2OXHtoZVgQlB1Mo2EJQi2RiGpYFyHnTrDTHKcFd3HR6rbDwSmNQs812S7Z
	LFJe6Lp5qeY8/g57qAUogQb/5h4exwQ6Mo4RE=
MIME-Version: 1.0
Received: by 10.52.88.175 with SMTP id bh15mr267560vdb.13.1314791111587; Wed,
	31 Aug 2011 04:45:11 -0700 (PDT)
Received: by 10.220.188.65 with HTTP; Wed, 31 Aug 2011 04:45:11 -0700 (PDT)
In-Reply-To: <j3l22l$5ti$1@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
	<1314785183.3769.22.camel@mattotaupa>
	<j3l22l$5ti$1@dough.gmane.org>
Date: Wed, 31 Aug 2011 13:45:11 +0200
Message-ID: <CACW_hTY0vpBXAZw0z=WYp+GqB+zWuVrnRTB+2CcMHJHNn_1KUQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: `PR = "r0"`: Add or not to add?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2011 11:50:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/8/31 Koen Kooi <koen@dominion.thruhere.net>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 31-08-11 12:06, Paul Menzel schreef:
> > Am Mittwoch, den 31.08.2011, 09:15 +0200 schrieb Koen Kooi:
> >> Op 31-08-11 01:06, Andreas M=FCller schreef:
>
> [...]

>
>
> >
> >> please remove PR in new recipes
> >
> > Actually I would favor to leave them in.
>
> Well I don't, and atm I decide if it goes in or not.
>

Ah. God is back. (btw who decided you are the decision maker for these
things?).

Somehow  I had the impression that the number of active contributors in OE
was diminishing; Guess I now understand why.
Statements like this are probably not the best way to run a community
project and/or keep people motivated.


> > The manual also advises to do this.
>
> The manual says a lot of things and was written for .dev, not OE-core or
> meta-oe.
>

Then make sure that people know how do do things (e.g. by updating the
manual for OE_core and/or meta-oe)

>
> > To change that policy, I would favor a survey/poll so that not every
> developers says something different as s/he sees best fit.
>
> Be sure to include every other variable with a default in that poll in
> order to be consistent.
>
> There is quite a difference between this variable and most others.
If one changes a recipe a PR change is in virtually all cases mandatory.
Having a line
PR =3D "r0"
in the recipe increases the chance that updating PR is not forgotten.
(and most, if not all, other variables with a default value will not change
when a recipe is updated).

My two cents.
Do with it whatever you want to.

Frans.

