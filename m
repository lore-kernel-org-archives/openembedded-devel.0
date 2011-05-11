Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QK3jb-0003Tc-O7
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 09:21:27 +0200
Received: by fxm19 with SMTP id 19so163538fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 00:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=iD5L6MFeK6HQxuWR5dkiihCOXVjoiCpNHIuFK8dPxPI=;
	b=CTOIsIxo9cMO6p0H4LEWagPXtbHcdSPb80KKbBXZVouarkvhTVUl1bn1Jqz8rWStjr
	cqjlwTdQjrwOA1RjJCiy9Ja4Piq9Yjen6GRbtK848t6HLh5scp+bTAuPIneS3Wawf2qE
	ecgZxWSVqzcGs23SrlawT0CFqV5kMqRdAnj1s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=p3vLyrYVPpsFIr65XR4b8tN6ASCGJmaG3sq20MN31iigXES8Z+5J1e8La5Hg9Q+6Oa
	La1Y589kI/Jj1WVNtklsXHcte5L8wQDIDIYd3b4t1ZVN0NQ08qWZ/vPmJDqpHSRSa7jf
	m8K0CWAxrf+z9B/MmfW4npDP63JLgCuY4POHQ=
Received: by 10.223.55.200 with SMTP id v8mr275244fag.82.1305098317636;
	Wed, 11 May 2011 00:18:37 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c24sm2633723fak.31.2011.05.11.00.18.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 00:18:36 -0700 (PDT)
Date: Wed, 11 May 2011 09:18:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110511071830.GD5171@jama.jama.net>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
	<fe1c32740aeeb35847e5da470d9dec1583ba9610.1305027503.git.Martin.Jansa@gmail.com>
	<BANLkTik6=EJ0vt59kQM2KR0GJji1M+nvdA@mail.gmail.com>
	<BANLkTi=HNBoTJQ9CFK4nMYHLQHcL9o2Tjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTi=HNBoTJQ9CFK4nMYHLQHcL9o2Tjg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 4/9] xinput-calibrator: add new version 0.7.5 and include .inc to recipe directly
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
X-List-Received-Date: Wed, 11 May 2011 07:21:27 -0000
X-Groupsio-MsgNum: 31903
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline

--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 11:41:31PM -0700, Khem Raj wrote:
> On Tue, May 10, 2011 at 11:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Tue, May 10, 2011 at 4:40 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > this is causing some gripe.
> >
> > $ wget http://github.com/downloads/tias/xinput_calibrator/xinput_calibr=
ator-0.7.5.tar.gz
> > --2011-05-10 23:16:17--
> > http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-0.=
7.5.tar.gz
> > Resolving github.com... 207.97.227.239
> > Connecting to github.com|207.97.227.239|:80... connected.
> > HTTP request sent, awaiting response... 301 Moved Permanently
> > Location: https://github.com/downloads/tias/xinput_calibrator/xinput_ca=
librator-0.7.5.tar.gz
> > [following]
> > --2011-05-10 23:16:17--
> > https://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-0=
=2E7.5.tar.gz
> > Connecting to github.com|207.97.227.239|:443... connected.
> > ERROR: certificate common name `*.github.com' doesn't match requested
> > host name `github.com'.
> > To connect to github.com insecurely, use `--no-check-certificate'.

strange here it finally resolves to cloud.github.com with common name
matching

wget http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-0=
=2E7.5.tar.gz
--2011-05-11 09:13:11--  http://github.com/downloads/tias/xinput_calibrator=
/xinput_calibrator-0.7.5.tar.gz
Resolving github.com... 207.97.227.239
Connecting to github.com|207.97.227.239|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://github.com/downloads/tias/xinput_calibrator/xinput_calibr=
ator-0.7.5.tar.gz [following]
--2011-05-11 09:13:11--  https://github.com/downloads/tias/xinput_calibrato=
r/xinput_calibrator-0.7.5.tar.gz
Connecting to github.com|207.97.227.239|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://cloud.github.com/downloads/tias/xinput_calibrator/xinput_c=
alibrator-0.7.5.tar.gz [following]
--2011-05-11 09:13:12--  http://cloud.github.com/downloads/tias/xinput_cali=
brator/xinput_calibrator-0.7.5.tar.gz
Resolving cloud.github.com... 205.251.205.31, 205.251.205.41, 205.251.205.9=
3, ...
Connecting to cloud.github.com|205.251.205.31|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 355313 (347K) [application/octet-stream]
Saving to: `xinput_calibrator-0.7.5.tar.gz.1'

100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>] 355=A0=
313      624K/s   in 0,6s

2011-05-11 09:13:18 (624 KB/s) - `xinput_calibrator-0.7.5.tar.gz.1' saved [=
355313/355313]

but maybe my wget should also check certificate before accepting 302

$ wget --version
GNU Wget 1.12 built on linux-gnu.

> >
> > Which seems to be a known problem with wget as described here
> > http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D409938
> >
> > So one option we =A0have is to cache the tar on angstrom mirror.
> >
>=20
> or we could fix it with patching bitbake.conf something like this
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/commit/?h=
=3Dkraj/misc-fixes&id=3D570e4eedba1c7de84db20de8f2c8730ce6c8a249

looks reasonable as we're checking checksum on downloaded archive anyway

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3KOEYACgkQN1Ujt2V2gBwP3wCfX9wvLp6F5Gq6/VzZPbogd5It
rtQAmwTjDVKD2x1D/VHFmxl5AmBrtXiM
=RyS9
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
