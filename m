Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pm0lc-0004wk-U1
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 10:18:49 +0100
Received: by bwz10 with SMTP id 10so3835417bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 01:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=eu5UDpqFF9mCXap6UQmBQpGqerFJLh1Tu17Y1b5UmEo=;
	b=l3J5qQRVgFo+5f5uNsOAEV5P+ebI77KaqtiqksMDIz2g1UGKcSu/D9IpOJyPcMZsZN
	PM1hlohrUl7c4QTZomL+kcp5IUWbtvtTzldxOlVzmoshM5VSMTuK0eVA0a//BA4Fw4Oc
	NtTNUCaCfWfdUiqYICtYWavijlcnGj6n1rkik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oYnHEAcFj0LPqmy69uRSY7DffaUYvH0El1jPiIAO3JKauBF3k6XxOTKbGaBqa7Q3de
	N+SUw0nTWgcmczq5bsP7UHEPxCZ+BFgrkw0grPR9ez+CT72PDFtmuyngjHkHLUAkWjm4
	JhD1TesSKvnvKqn6WZiJf6h3uc3yoXgEMfZqk=
Received: by 10.204.121.138 with SMTP id h10mr13931962bkr.40.1296983868724;
	Sun, 06 Feb 2011 01:17:48 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j11sm1367164bka.12.2011.02.06.01.17.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Feb 2011 01:17:47 -0800 (PST)
Date: Sun, 6 Feb 2011 10:18:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110206091810.GL3265@jama>
References: <1296926769-2006-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTimkAp+rAiDiiZsyhWYCbjzEaPw7sGc-zo0A3uro@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimkAp+rAiDiiZsyhWYCbjzEaPw7sGc-zo0A3uro@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gnu-config: removed absolute perl binary paths from gnu-configize.
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
X-List-Received-Date: Sun, 06 Feb 2011 09:18:49 -0000
X-Groupsio-MsgNum: 28855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="00hq2S6J2Jlg6EbK"
Content-Disposition: inline

--00hq2S6J2Jlg6EbK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 05, 2011 at 06:50:16PM -0800, Khem Raj wrote:
> On Sat, Feb 5, 2011 at 9:26 AM, Filip Zyzniewski
> <filip.zyzniewski@gmail.com> wrote:
> > Related bugzilla entry: http://bugs.openembedded.org/show_bug.cgi?id=3D=
5510
> > ---
> > =A0recipes/gnu-config/files/gnu-configize.in | =A0 =A04 ++--
> > =A01 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes/gnu-config/files/gnu-configize.in b/recipes/gnu-co=
nfig/files/gnu-configize.in
> > index be8580c..adf9c0e 100755
> > --- a/recipes/gnu-config/files/gnu-configize.in
> > +++ b/recipes/gnu-config/files/gnu-configize.in
> > @@ -1,7 +1,7 @@
> > -#! /usr/bin/perl -w
> > +#! /usr/bin/env perl
> > =A0# -*- perl -*-
> >
> > -eval 'case $# in 0) exec /usr/bin/perl -S "$0";; *) exec /usr/bin/perl=
 -S "$0" "$@";; esac'
> > +eval 'case $# in 0) exec perl -S "$0";; *) exec perl -S "$0" "$@";; es=
ac'
> > =A0 =A0 if 0;
> >
> > =A0# gnu-configize - install the GNU config.guess / config.sub in a dir=
ectory tree
> > --
> > 1.7.1
> >
>=20
> Looks ok however signoff it properly and resend. See
> http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

And please rebase it on top of master, as first line was changed few
days ago, so this won't apply anymore.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--00hq2S6J2Jlg6EbK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1OZ1IACgkQN1Ujt2V2gByX5gCdHtZNesfGyOypjz6tX8pBNgXr
H3IAoKPcchwSR3BvEnw0jC3jp+VQotiF
=k1Op
-----END PGP SIGNATURE-----

--00hq2S6J2Jlg6EbK--
