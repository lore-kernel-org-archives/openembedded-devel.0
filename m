Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtGyk-0003lO-FH
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 13:11:34 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so311807pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kiO/7AlEEuC5K+dXZSfBp9jVfCUB3Af0z1zYnTZii+E=;
	b=LFuLN3Y7z6t36jwfjUju7wg4plLAGVmz6rqkbMWpNZdGeOeivj7d7K9LyBYVS1Av1I
	SSp9ID9keKcVBKCcBiiXl9U3n4cNTMbobviEsVrLiC4pogD8a7czlIltos1VOUUQCuoJ
	SG7ordRlT4deMzjbWTKRZqTghHQtCvjEM5AaHYBUFa7SbOcZgrutlv7ip1ASaniyPsi+
	7NxCPAxbrxAvMfiIGte7yXrgIfXr+vwJInDdJ4FSYFlLezl2j3+qrfjerEhMia5qhtgt
	qeEHRbIXOgV9xx8w8HkMNOLansgWnSrowa168snPkKogXfo7YQdeKwWQvAgWLBjt5BSg
	fufw==
X-Received: by 10.66.72.225 with SMTP id g1mr196903388pav.79.1357818972360;
	Thu, 10 Jan 2013 03:56:12 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id m3sm935636pav.4.2013.01.10.03.56.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 03:56:11 -0800 (PST)
Date: Thu, 10 Jan 2013 12:56:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110115617.GD3722@jama.palm1.palmone.com>
References: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
	<20130110112231.GZ3722@jama.palm1.palmone.com>
	<20130110113445.GC3722@jama.palm1.palmone.com>
	<CALbNGRSoDq0sqrJnur-O7=vT_-qpWZwCPYJUpK46Zc+Yiz5pXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSoDq0sqrJnur-O7=vT_-qpWZwCPYJUpK46Zc+Yiz5pXA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia/meta-oe/meta-systemd 0/3] new recipes/appends
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
X-List-Received-Date: Thu, 10 Jan 2013 12:11:37 -0000
X-Groupsio-MsgNum: 42634
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4JxvUTD846AMAZAS"
Content-Disposition: inline

--4JxvUTD846AMAZAS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:50:01PM +0100, Andreas M=FCller wrote:
> On Thu, Jan 10, 2013 at 12:34 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Thu, Jan 10, 2013 at 12:22:31PM +0100, Martin Jansa wrote:
> >> On Thu, Jan 10, 2013 at 12:43:12AM +0100, Andreas M=FCller wrote:
> >> > 1+2 resend (Patchwork was down)
> >> > 3. I have this in and working for long time
> >> >
> >> > The following changes since commit 89d5899c38ec94b0560a3496b020e45b4=
0d8251c:
> >> >
> >> >   python-distutils-extra: initial add 2.36 (2013-01-09 16:20:22 +010=
0)
> >>
> >> This commit is not in master.
> I should not send patches late night :)
> >>
> >> First 2 patches applied from previous patches on ML, thanks!
> >
> > Grr, SOB lines are missing in repo and I've just refreshed them from
> > repo just before pushing them and checked only with git diff that they
> > are still the same :/.
> Next pull request contains SOB. I don't know how Koen did that but the
> pull requests applied contained SOB

His SOBs, not yours, right?

I'm adding my SOB when I'm cherry-picking or using git am (includes appling=
=20
=66rom patchwork), but when merging branch (or git merge, git rebase -i to
drop unwanted patches) it's not added.

> >> > Andreas M=FCller (3):
> >> >       openal-soft: initial add 1.15.1
> >> >       physfs: initial add 2.0.3
> >> >       bluez4: add systemd support
> Shall I resend or wait for oe-core systemd?

I'm testing it and waiting if other devs have some comments about bluez4
one.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4JxvUTD846AMAZAS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDurGEACgkQN1Ujt2V2gByErQCfbkjhAyOAu1xRXICmCRVtYcTD
lIIAn3ESPDPO3dNgNxOkZFCQKyuQj6Im
=Z8Jy
-----END PGP SIGNATURE-----

--4JxvUTD846AMAZAS--
