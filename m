Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NjbmL-0004py-9I
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 18:09:08 +0100
Received: by pwi5 with SMTP id 5so2675342pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 09:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=qDuwRkeQbEXLJX528lk7lgxwb3u0kB0v2O9AaaVmphs=;
	b=Ba2NxxltGD0dE7pXpUGasovsgTG7kyZb3EQXoyM3xhIkjieH0b9L1vB2QvcAMGCvP6
	v81DG3Lpnhg1DyBD2iQWUPQag9pEpYBuQaELeUZtdi95/A8N70qJSJdc8vivZawwmSvT
	tnt+XvHQiV5H8FQ7TCWcfd33EMnQkx0h/zDNY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=hXkgTeJQT3dazJ0mTfcN6vKJJyOZEV/FOLM/Ft4z9i5i6TkmS3p+Pdrs2mWRBu5KSw
	8XsFHbFyD8GDFst/6f3uEQBgD+Zkd4P8lTaUzCUj1cYWhantXB6Xt7e70huV/Q3nrqdT
	iSujL3rKXAoauZIe5MIas7OPu4yO99YCuJGHQ=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.6.13 with SMTP id 13mr635327wff.39.1266858380259; Mon, 22 
	Feb 2010 09:06:20 -0800 (PST)
In-Reply-To: <1266857709.14566.348.camel@mill.internal.reciva.com>
References: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com> 
	<20100222162424.GA27420@denix.org>
	<1266857709.14566.348.camel@mill.internal.reciva.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 22 Feb 2010 10:06:00 -0700
X-Google-Sender-Auth: 095fe0eab423ac37
Message-ID: <b6ebd0a51002220906p53b3b3b2h5257ebca50d6227c@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] git: add SRC_URI name
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
X-List-Received-Date: Mon, 22 Feb 2010 17:09:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2010 at 9:55 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2010-02-22 at 11:24 -0500, Denys Dmytriyenko wrote:
>> On Sun, Feb 21, 2010 at 04:32:32PM +0100, Bernhard Reutner-Fischer wrote=
:
>> > Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> > ---
>> > =C2=A0recipes/git/git.inc | =C2=A0 =C2=A02 +-
>> > =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/recipes/git/git.inc b/recipes/git/git.inc
>> > index 644e159..fd7b708 100644
>> > --- a/recipes/git/git.inc
>> > +++ b/recipes/git/git.inc
>> > @@ -2,7 +2,7 @@ DESCRIPTION =3D "The git revision control system used =
by the Linux kernel develope
>> > =C2=A0SECTION =3D "console/utils"
>> > =C2=A0LICENSE =3D "GPL"
>> >
>> > -SRC_URI =3D "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar=
.bz2"
>> > +SRC_URI =3D "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar=
.bz2;name=3Dgit"
>>
>> Is there a patch to add checksums in corresponding recipes to use the na=
me? Or
>> what is the purpose of adding one?
>
> I guess the idea is to make it possible for new recipes (which use
> this .inc file) to include their own checksums. =C2=A0Seems like a reason=
able
> enough plan even if the old recipes are not converted.

Has anyone thought about programmatically injecting a name to the
first tarball/zip in the SRC_URI if no sources have that name yet?  It
seems like adding a name to the primary tarball is becoming common
boilerplate, and the common case is for that to be the first source.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


