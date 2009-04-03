Received: from [74.125.46.156] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LplBp-0001Kp-NY
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 17:20:38 +0200
Received: by yw-out-1718.google.com with SMTP id 9so784173ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=0qRATeICewNqQHrMnBVkz5cDsXBXzSY7z9Q7Eecccyo=;
	b=S+9RQ3bzu89XSToM3viUDFrX1k2wGn4xItbD2UQu1UQ1eqYwrala5WSLlEBZi0CJNz
	i6X2fiiAtHsrv88dY8LI0nyUeLL6Cqv/750ekcYE6yvTr9FBl79HTpqu1zVOPV0PXC6L
	p1oIcsYT/psmi9CwTf3PrMzNp5TkDZFLZ4jHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=r4/AhGamhx7B8Qn3SLoROHs+dOcG0zLNJV9WFoU5/0b/xK99NDDPgtasLoA23GrxHf
	jQ7zrQ34hGu9On+e+pmRZrcZ/d17Z8xynXDRDVW+LsHZ2/QvzwymwjYSlrTgJwa6W/q4
	ZmKb1eI6A3wdvsIC/94zzU2eNXzBbSDa04P9I=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.13.9 with SMTP id q9mr2352937ybi.204.1238771865314; Fri, 
	03 Apr 2009 08:17:45 -0700 (PDT)
In-Reply-To: <200904031054.28977.hs4233@mail.mn-solutions.de>
References: <12386320381719-git-send-email-clarson@mvista.com>
	<200904031054.28977.hs4233@mail.mn-solutions.de>
Date: Fri, 3 Apr 2009 08:17:45 -0700
X-Google-Sender-Auth: b71df62036f8142d
Message-ID: <b6ebd0a50904030817n2c1737e0m300eac0babcd43db@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.156
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 1/2] bitbake.conf, collections.inc: Add COLLECTIONS 	mechanism w/ a sane default.
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
X-List-Received-Date: Fri, 03 Apr 2009 15:20:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2009 at 1:54 AM, Holger Schurig
<hs4233@mail.mn-solutions.de> wrote:
> On Thursday 02 April 2009 02:27:17 Chris Larson wrote:
>> COLLECTIONS =3D "${@' '.join(d.getVar('BBPATH', 1).split(':'))}"
>
> Why do we need a new variable here? =C2=A0Can't we just use the
> equivalent BBPATH.split() =C2=A0?? =C2=A0Or is there a use-case where it
> makes sense to have BBPATH !=3D COLLECTIONS ?

Yes, there are a number of possible cases.  For one, consider someone
with a ~/oe, under which they have multiple work areas, each with
their own trees.. say, poky, a local company specific metadata repo,
and upstream oe.  Also consider that ~/oe is in BBPATH, so that
~/oe/conf/site.conf can be used for those trees.  This is exactly the
setup I have on a few of my workstations.  If I were to let it use the
BBPATH based setup always, I'd always have *all* the recipes from
*all* those trees being parsed.  Not optimal.  In addition, the
followup patch to facilitate archive based collections wouldn't be
feasable in that case.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


