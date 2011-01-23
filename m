Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@gmail.com>) id 1PgxUh-000758-UE
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 11:48:28 +0100
Received: by qyk36 with SMTP id 36so3144147qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jan 2011 02:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=OUCyQ9nzv0K7U3VNsV1dyzQ07c8mEolDnUcfhqxfgNs=;
	b=Zl7jvP+kyvMxSywZ354NyWwikgo1gFns6IoKm6Lx/cpSd358N+grxRGf8LksaA/6Gq
	cdzX2ZqpDW6NkW+uXDEFU/1hJZd1JPPpY+b7LVkazDXajkHUMOg8HsuIdOosWUYDub7P
	0jLwMM+q8Q2LnMkm9UDRnEzL7PkdrnR11JofQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=mL4zBPz3dDsnEHV94tgP1Y4L3WAw+hdGW4O1zi4oLsLyiU4ivZ+YVdx7JXfKYjQBv8
	BvZOXfbwFi2Yq+mIcr+b/NsYnYPwOyz91A8xGtgB7C2EGn1xMjrsYIJQ+YfG3dpFvxXS
	BW0j6HC2ZZH9ZIlQeStnuvdSgHajOtHCISido=
Received: by 10.229.225.18 with SMTP id iq18mr2619216qcb.26.1295779663212;
	Sun, 23 Jan 2011 02:47:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.232.2 with HTTP; Sun, 23 Jan 2011 02:47:23 -0800 (PST)
From: Alessandro Sappia <a.sappia@gmail.com>
Date: Sun, 23 Jan 2011 11:47:23 +0100
Message-ID: <AANLkTimV1XX+yS1W15PSwnpKEpipSwxh1m6CHWFLsXVF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Corrected a typo in qtdemo-init script
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
X-List-Received-Date: Sun, 23 Jan 2011 10:48:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear Paul,

> Date: Sat, 22 Jan 2011 16:09:11 +0100
> From: Paul Menzel <paulepanter@users.sourceforge.net>
> Subject: Re: [oe] [PATCH] Corrected a typo in qtdemo-init script
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <1295708951.3850.166.camel@mattotaupa>
> Content-Type: text/plain; charset=3D"utf-8"
>
> Dear Alessandro,
>
>
> Am Samstag, den 22.01.2011, 15:59 +0100 schrieb Alessandro Sappia:
>
> please take a look at the commit policy regarding the commit
> summary/message [1].
>
I'll repost the patch following the rules (sorry about that).
> > ---
> > =C2=A0recipes/qt4/qt-demo-init/qtdemo-init | =C2=A0 =C2=A02 +-
> > =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/qt4/qt-demo-init/qtdemo-init b/recipes/qt4/qt-demo=
-init/qtdemo-init
> > index ee84be2..affb958 100644
> > --- a/recipes/qt4/qt-demo-init/qtdemo-init
> > +++ b/recipes/qt4/qt-demo-init/qtdemo-init
> > @@ -3,7 +3,7 @@
> > =C2=A0set -e
> >
> > =C2=A0if [ -f /usr/bin/qtdemo ]; then
> > - =C2=A0 =C2=A0 QTDEMO=3D"qtdemo > /var/log/Xsession.log 2>&1"
> > + =C2=A0 =C2=A0 QTDEMO=3D"qtdemo > /var/log/Xsession.log 2> &1"
>
> What is wrong with this? Errors are sent to standard output and the
> version without space is the one I know too.
Busybox shell (installed by default) needs the space, while full bash
doesn't complain
in both versions.
Busybox complains with "sh: 2>: unknown operand" error if without space, wh=
ile
the space version works without any issue.

Regards,

Alessandro


--
Alessandro Sappia
a.sappia@gmail.com


