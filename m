Received: from [209.85.198.240] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1M4z8B-0007NK-9U
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 17:15:28 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1052793rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=WTK/7+Nbjy6RTCX+EHGJ7qwZixePSbTjheEi3e3bHRE=;
	b=Y3BTG5M5XBb9CV05y/KZ1JmT6bOPUu+xfNc/TB+vbSGSvD2GHKz50zI15q+UVf1MJ/
	F4cEc8YJGBimW5sP/yKELuUZHl3vHd2BM0HowTtScxkRImtGbSDbcVE1F7vPAvN3GAec
	lhIYpiX8qXJWqvfFNZT0fL/PdmGNjLxtioFEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=P+Gp0OE32JdsOYkIWQNHYmimxfr2+84bkxNYGk93tYKKEI30PBxQT7Ftesa6XW008z
	PvQKnpWGLf5XFqY0XtTwTIG0vUfmzrQJ7wmoxvkYLU9GbEyRoa48bhq2tJJC3M7fwJcB
	xXK02z/uF34NCbwPN0MTpoNiqwnuUweyHYGOQ=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.143.158.2 with SMTP id k2mr1086533wfo.245.1242400109578; Fri, 
	15 May 2009 08:08:29 -0700 (PDT)
In-Reply-To: <4A0CE800.5040407@dls.net>
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
	<4A0CE800.5040407@dls.net>
Date: Fri, 15 May 2009 08:08:29 -0700
X-Google-Sender-Auth: cd005a17c69c7a16
Message-ID: <b6ebd0a50905150808s16773addp27a1f06a6476e12f@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown implementation and use it by default.
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
X-List-Received-Date: Fri, 15 May 2009 15:15:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2009 at 8:56 PM, Mike Westerhof (mwester)
<mwester@dls.net> wrote:
> Chris Larson wrote:
>> For each recipe which completes a task successfully, this emits the curr=
ent
>> version into ${TMPDIR}/versions.conf as a PREFERRED_VERSION line.
>> ${TMPDIR}/versions.conf and conf/versions.conf are automatically include=
d,
>> in that order, in subsequent builds, to provide more deterinistic builds=
 by
>> default, and to let the user make the lockdown persist via a simple cp
>> command...
>
> Excellent! This is much needed as a feature. =C2=A0The usage model seems =
to
> be a very reasonable one, and would tend to be consistent with what
> users sort of expect for a workflow.
>
> I say "sort of expect" because I think they would rather see the
> management of the versions.conf file be done by bitbake. =C2=A0For exampl=
e,
> the "bitbake crystallize" command (to choose a name) might do no build
> at all, but just generate, or re-generate, the versions.conf file. =C2=A0=
But
> that's a trivial point; they'll have to remember to cp or rm
> versions.conf as necessary themselves.

Aye, Phil Blundell and I were discussing this on IRC yesterday.  This
is mostly a hack around the fact that bitbake should never have
defaulted to the latest version of a package to begin with.  But in
order to fix that, we'd need a new/better mechanism for the user to
express what they want in a build.

> The only big concern that I have is that this is really quite a drastic
> change in behavior for the "cookbook-type" OE user community out there
> (the folks who have memorized a set of procedures to build their distro
> images without any real understanding of how it works). =C2=A0How do we
> propose to roll out this change?

It does change behavior, but only within the context of a single tmp
directory existance.  I doubt anyone in particular relies on their
build suddenly switching to a newer version of something when the
newer version shows up in the repository, but perhaps they do.  I
expect the biggest change is that doing "bitbake foo-1.0" rather than
the default of foo 1.2 would result in it continuing to build foo 1.0
going forward, rather than that being a temporary change.

Honestly, I'm not sure how best to smoothly roll something like this
out.  I don't think you can make it any less intrusive for a default
behavior without modifying bitbake.  Obviously, we could make it not
be default, but I don't know how I feel about that, either.  I guess
thatd be best, to avoid breaking people's scripts, but I still quite
dislike the current bitbake version behavior, personally.

Anyone have any ideas on this?
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


