Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1808F777DB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 14:55:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v190so7185512wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Mar 2017 06:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=d55UrWMSd7VXffHSeLla2GGrmofMRdhfDbGIPq0j51k=;
	b=hnKlGvTQLatMwzXV4Ec2KwrgKHWXDo3CF1igJiCaS6/t1mpZpaBFiAgU1i5LV4c/F7
	agSLFoY9myvFaM0aFzIAZopiIApf4FpUWg0kZezBuI+a/8o1Wm6YnhGsrJQIcxEnAHt+
	BKR57VVdYOypAFEu8IlsaHmV0DcWNQh+IXt2S8294V1vrKg9XU0RxvLwN0Za0SeZ8Q5v
	owVJUTjBj6TNpFuSzUsnfnrb8qcXij66NYPA4GdP0RuLxHxKsjjSSyoQJZPq1gw9lw7A
	0TekzOu+s6WteEpAIHJR/cfIv0lI/BdaGTSEkJZi+DjCiI5X4ywyqb+E9QBnJayJ8AM4
	JHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=d55UrWMSd7VXffHSeLla2GGrmofMRdhfDbGIPq0j51k=;
	b=caX7fcM72v9X+zjOpY6qnZu9fjZi4Q0GNVKAafOYA1dShk1NkV3OfkdAdMqdMC5FhK
	BGamkWXg1g6wDhpbzGOTdOQZ74jyCq+xXC1oFSGFDyT1s4dOgJrUpbe7lNZj9k+iE4m2
	tdLafUqhOVuW65Y/0v0HufER1Hg46lzhUPXkV05+PiEOs38Q1PraT3zuAY5adCDO3HZj
	BbVkzAGqFBwtzuSggPhie07hNGC0upBOs402ScA0H3QsTxgzWbeSXMzaA9tGxJUSqjc2
	dwTFka2m8MSunCwA5QOLn+OIlmOwR/2S7Zz+0kd4frMUvXwaN2D8bqjyAzkWqmpB4Phb
	2f8g==
X-Gm-Message-State: AMke39ku5Pd2LsfxdEwsJE55Nx0NapAQGEE3v2j/OM2OfA+H+nXHdT4PAMQYb1NHXCJxjA==
X-Received: by 10.28.134.203 with SMTP id i194mr3419727wmd.58.1488639343505;
	Sat, 04 Mar 2017 06:55:43 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	d75sm7312226wmd.25.2017.03.04.06.55.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 Mar 2017 06:55:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 4 Mar 2017 15:55:44 +0100
To: Alejandro Mery <amery@hanoverdisplays.com>
Message-ID: <20170304145544.GE3025@jama>
References: <20170301141908.166857-1-amery@hanoverdisplays.com>
	<CF323D845261FD4F9B1E99738125033460DE2603@maildb.hanover.local>
	<20170304115347.GC3025@jama>
	<CF323D845261FD4F9B1E99738125033460DEF731@maildb.hanover.local>
MIME-Version: 1.0
In-Reply-To: <CF323D845261FD4F9B1E99738125033460DEF731@maildb.hanover.local>
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
X-List-Received-Date: Sat, 04 Mar 2017 14:55:43 -0000
X-Groupsio-MsgNum: 65678
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T6xhMxlHU34Bk0ad"
Content-Disposition: inline

--T6xhMxlHU34Bk0ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 04, 2017 at 01:35:40PM +0000, Alejandro Mery wrote:
> On 04/03/17 11:53, Martin Jansa wrote:
> > On Wed, Mar 01, 2017 at 02:22:29PM +0000, Alejandro Mery wrote:
> >> On 01/03/17 14:19, Alejandro Mery wrote:
> >>> https://www.python.org/dev/peps/pep-3110/
> >>>
> >>> It's backward compatible with 2.6+
> >>>
> >>> Signed-off-by: Alejandro Mery <amery@hanoverdisplays.com>
> >>> ---
> >>>  meta-oe/classes/gitver.bbclass | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.=
bbclass
> >>> index e7b5155ee..b677996ea 100644
> >>> --- a/meta-oe/classes/gitver.bbclass
> >>> +++ b/meta-oe/classes/gitver.bbclass
> >>> @@ -27,13 +27,13 @@ def get_git_pv(path, d, tagadjust=3DNone):
> >>>      gitdir =3D os.path.abspath(os.path.join(d.getVar("S", True), ".g=
it"))
> >>>      try:
> >>>          ver =3D gitrev_run("git describe --tags", gitdir)
> >>> -    except Exception, exc:
> >>> +    except Exception as exc:
> >>>          bb.fatal(str(exc))
> >>>
> >>>      if not ver:
> >>>          try:
> >>>              ver =3D gitrev_run("git rev-parse --short HEAD", gitdir)
> >>> -        except Exception, exc:
> >>> +        except Exception as exc:
> >>>              bb.fatal(str(exc))
> >>>
> >>>          if ver:
> >> I forgot to mention, I'm having this problem using `morty`
> > Next time, please send version applicable and tested in master branch f=
irst, then
> > you can request backport to morty.
>=20
> sorry about that. does it help to send (tested) patches against both?
> (master and morty) or backporting only happens after the change goes
> from master-next into master anyway?

Normally only after it's tested and merged in master.

You can send both at the same time, but then release branch maintainer
needs to check and hold the change until it's merged in master (or
update it if it gets updated before merge to master or even reject if
rejected for master for whatever reason). So it's easier for maintainers
if you send it after it's merged and you explicitly say which commit
=66rom master you're backporting to morty.

> > I've applied this manually to master-next now.
>=20
> thank you
>=20


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T6xhMxlHU34Bk0ad
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLrVbgAKCRA3VSO3ZXaA
HGJOAJ9WeUzkS2T20lBIgE3m0oEnojWNegCfYUk4Quwq5KdV6bywmJUqmL3kTBk=
=iNeQ
-----END PGP SIGNATURE-----

--T6xhMxlHU34Bk0ad--
