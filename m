Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DFED97759A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 11:53:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z63so4517492wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Mar 2017 03:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Obv7k9z9F5upVIITSHgf5wE5mxoIjuH6/L0f851GCnw=;
	b=E/mm+WgrzaHo8UV5w+/DwBRbqCqBKEAUTTHK/Sj/HWjOvO6dMIXnnGxgesY6HYWOOj
	YdeI8FFQ+vnmQ+d07xSAlljtEHXNn6u9OCPNiDi83tzq9zqixBTjvCDspNJ+e95E1qzn
	lUp/EaWb6+C/mvkrvOC+ZqBp0P1M2m4INEqUnIhChgigWn4vOUYVla0RIAwod4Zm9htD
	qNZrdu9kQwqTZm8YgndkLZPWgimANAVb0Rv8DyEVKI13nnsiHrfRqsXAoSmAH7H00SnY
	cx1kMsTUOfzElo44rG2sllhmmpkhwFxd4hAuW4OeYBG/pqtM/lNlnoMwTHokufNfKNUY
	kDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Obv7k9z9F5upVIITSHgf5wE5mxoIjuH6/L0f851GCnw=;
	b=nN/N/bHCIxEnxjId5ulMHA53Y5uU35MwbC0NNjWBmN6XLhc2f6f+O3LL2ckA39lD7c
	DYc9RPVUSdNU1+gRDsGA7bLHKu1+V4zGBMb+H2yHoqijGCtjnWqfXO24uvEifuxLwJEl
	eBAaQVy45/YG566FzzBer3oeV3vutgi0qF6Mc67Ewjw+AijEN4HfVpg23Zv5q/NYLGZ1
	wDVLU2ZEjqUMWVKnccE/urH+KkIuzGYPdHw3hGwz4lruZbF8vW6PCeOSRtOUuwwXnrcJ
	9F9ihmJdfUFPjpHfqEgcCS/pLz3a1KpDIe+fUDH9pp3a8dTgcjtCVk56g5YDLx/lJe9s
	sYmQ==
X-Gm-Message-State: AMke39n1HVLy8mFiwDUrYoGmQ04i3dmemWwYIi1QkdERMxTegbbc50GXugVHoywi//MCKw==
X-Received: by 10.28.21.81 with SMTP id 78mr6071128wmv.138.1488628426496;
	Sat, 04 Mar 2017 03:53:46 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	191sm6801777wmo.21.2017.03.04.03.53.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 Mar 2017 03:53:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 4 Mar 2017 12:53:47 +0100
To: Alejandro Mery <amery@hanoverdisplays.com>
Message-ID: <20170304115347.GC3025@jama>
References: <20170301141908.166857-1-amery@hanoverdisplays.com>
	<CF323D845261FD4F9B1E99738125033460DE2603@maildb.hanover.local>
MIME-Version: 1.0
In-Reply-To: <CF323D845261FD4F9B1E99738125033460DE2603@maildb.hanover.local>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: "amery@geeks.cl" <amery@geeks.cl>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gitver: fix try/except syntax for python3 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Mar 2017 11:53:47 -0000
X-Groupsio-MsgNum: 65674
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline

--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 02:22:29PM +0000, Alejandro Mery wrote:
> On 01/03/17 14:19, Alejandro Mery wrote:
> > https://www.python.org/dev/peps/pep-3110/
> >
> > It's backward compatible with 2.6+
> >
> > Signed-off-by: Alejandro Mery <amery@hanoverdisplays.com>
> > ---
> >  meta-oe/classes/gitver.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bb=
class
> > index e7b5155ee..b677996ea 100644
> > --- a/meta-oe/classes/gitver.bbclass
> > +++ b/meta-oe/classes/gitver.bbclass
> > @@ -27,13 +27,13 @@ def get_git_pv(path, d, tagadjust=3DNone):
> >      gitdir =3D os.path.abspath(os.path.join(d.getVar("S", True), ".git=
"))
> >      try:
> >          ver =3D gitrev_run("git describe --tags", gitdir)
> > -    except Exception, exc:
> > +    except Exception as exc:
> >          bb.fatal(str(exc))
> >
> >      if not ver:
> >          try:
> >              ver =3D gitrev_run("git rev-parse --short HEAD", gitdir)
> > -        except Exception, exc:
> > +        except Exception as exc:
> >              bb.fatal(str(exc))
> >
> >          if ver:
>=20
> I forgot to mention, I'm having this problem using `morty`

Next time, please send version applicable and tested in master branch first=
, then
you can request backport to morty.

I've applied this manually to master-next now.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLqqywAKCRA3VSO3ZXaA
HERlAJ45bmlh/QJ5r09xjvDlI8yyAMV56wCgh1kOCQVI6zsR5LXZa/h01etA2PI=
=O1wx
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
