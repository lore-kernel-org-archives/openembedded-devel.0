Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PskiJ-0001wH-4v
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 00:35:15 +0100
Received: by wwe15 with SMTP id 15so1203706wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Feb 2011 15:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=VYsFuuTqXDPmFLExmjXYlJWBtQuQFSUJ4VG4dmTFaGk=;
	b=salHWWEo4hI7+8qnrXo4GiWecEY86I8fZSLz2Tx4f4RaIWJguv+/aiET060U9R2dgo
	1ahSBw9Y7B9I7ree8DHdLqc8jjP9etS+yDvkFbS1wk5nolrIilvkSrFgLHBQrI4XrjXO
	Hue5uE6MyQbNZtj7ng1Lin3KKn0MsdFoXkCxc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=ahXNP7xa8zgh83dq8nNu52w7xx/7VPqW0KwlO6XXUIJ0fRM9TmHD7bo9Dp+7glbdRW
	FP/nEh+2OZL8dHOsU+YK2gjafZfeUSjL1EfzesoNkEffp6U0ZZs4KtNLM8XOhxLo2hqm
	wKZDmRl2cOM4eMLvE88KNijqwaJINwuhGf1yA=
Received: by 10.216.213.15 with SMTP id z15mr1333738weo.61.1298590434089; Thu,
	24 Feb 2011 15:33:54 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.246.11 with HTTP; Thu, 24 Feb 2011 15:33:34 -0800 (PST)
In-Reply-To: <1298588138.26090.38.camel@mattotaupa>
References: <1298490534.26736.52.camel@rex>
	<AANLkTim-WprzRfvaYnFMjoR4=19hj96qp3NioMjY0Axi@mail.gmail.com>
	<4D668554.4050307@mentor.com> <1298588138.26090.38.camel@mattotaupa>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 24 Feb 2011 16:33:34 -0700
X-Google-Sender-Auth: YfDrss96SaPQ-y9vIeSumrau5uo
Message-ID: <AANLkTin=8b8KSQF7fPN7R3ahatwU8+SnwSmSSegRy4H5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: OT: pull requests, merges and bisection (was: OE TSC Meeting 2011/02/21 Minutes)
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
X-List-Received-Date: Thu, 24 Feb 2011 23:35:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2011 at 3:55 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> it is great that the minutes of the meetings get published. Thank you.
>
>
> Am Donnerstag, den 24.02.2011, 09:20 -0700 schrieb Tom Rini:
>
> [=E2=80=A6]
>
>> Not clear in the summary but from the logs is that we want to, as part
>> of making this be transparent, publish guidelines for how this will
>> work, based on what poky is doing now. =C2=A0The high level plan is to f=
ollow
>> the contrib tree model that poky has which means sending pull requests
>> (which in turn also post the patches to the ML for review).
>>
>> For changes that don't have a tree to pull from, someone with write
>> access would need to pick them up.
>
> XBMC is using also an approach with pull requests. The Linux kernel is
> doing that also. Is there documentation on how pull requests, merges and
> bisecting works together?
>
> My problem is that pull requests are based on a certain commit in
> origin/master. After the request is sent most of the time several
> commits are pushed to origin/master in the mean time, so a merge is
> necessary =E2=80=9Cpolluting=E2=80=9D the commit history.

I don't really see a problem with it, personally.  It's not pollution
if it's useful information, and recording the point where the branch
was brought it can indeed be useful information.

> With my current knowledge I find it very difficult to track down bad
> commits especially if commits break the builds in between. Does `git
> bisect` take care of that itself? How do the Linux developers deal with
> that problem, especially merge conflicts?

Well, you can mark commits that are broken for unrelated reasons with
bisect, but ideally people would use something like git test-sequence
combined with rebase to ensure that there are no points in their
commits which will break bisect, and *that* gets merged to master.  I
think it's pretty important to retain bisectability (not a word, I
know :) on our branches.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


