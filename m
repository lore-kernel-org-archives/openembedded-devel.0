Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF67771DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 10:18:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e3so21081528wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3GmtWzvPjj68Ackvc8QkPE2GKrZ9guocpwqxv89X+c4=;
	b=ti3bgxqIImOULOIs9EfNrKbUtY5YR1sv36xhIaRRyGqC6dOR7WE1BoxkDS/p9v1pBq
	FddLj/rBzRipimXUwBpSLO+IcQ/wwv893+D42ph4c0pN9ZBO8DYO3zeOfBAwYexRVAmo
	cd336HqjGPYLze7RtVA+HaigQ9yu5N/iAmkVs1YWvGP3fbslgRKZS6g1Zi890E0GAXOS
	S8ksn8JfVE0KbTNaziYcfHd14nuCWL54EAAAvPLn7aZsXfXGgIbkrPMUus6MjLbCFODj
	we3B2odI0YoolG5tbpmblciNeNZOMarFrBlf8M402DXCFiZHsSQfL4+R5tU9dVLhFKIL
	Qvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3GmtWzvPjj68Ackvc8QkPE2GKrZ9guocpwqxv89X+c4=;
	b=ly4ozX8+w/2rZ/A2sdS0PYivkkhfGKp+ojf2Y9hM0AhqYtikIwsi9Vj+AEZ7924Was
	LmABhwMegVsYNsdgOklmbf5zkF0GX649wQE3A6lXblVyVvQvhffAO1DFsu5UBSIqLVk4
	0kSAI+hbjwwvofXn54jDwj5olPWAuxtnfgf/h+M4CaNIeafcATVej0kCdPBEv/T1uqTm
	8+q6GuqgKe3byzSwgCRlj/YyOwt4Zq4DhSWUal0g9KTX9YQGhDv3DFkD+IDN6ENckDk0
	3P9AKbBNUZGrcO6zAmbwT1eX1uhFmCTzjI9gEvGxaRY8N6ndqrqH37hhXYmL7oPePxKv
	Wu6g==
X-Gm-Message-State: ALyK8tIRuR/bEkmCkxDpcfs7RktTLPaF8ocdjk2JvoQQCLO4w+qtsdh+wgI7VAWRuLFp5w==
X-Received: by 10.28.213.209 with SMTP id m200mr5385083wmg.80.1464603483200;
	Mon, 30 May 2016 03:18:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s125sm22981094wms.14.2016.05.30.03.18.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 May 2016 03:18:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 May 2016 12:18:07 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160530101807.GB2588@jama>
References: <cover.1463501350.git.chris_larson@mentor.com>
	<3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
	<328bdd83910d94b0c35eaff11abd98838c20493e.1463501350.git.chris_larson@mentor.com>
	<CABcZAN=sp3YTzAMZFSE0RrH3ebv_xpE6w8yo7++S6fytNma+aw@mail.gmail.com>
	<20160530094419.GA2588@jama>
MIME-Version: 1.0
In-Reply-To: <20160530094419.GA2588@jama>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH 2/6] luajit: fix build issues, obey more vars
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
X-List-Received-Date: Mon, 30 May 2016 10:18:05 -0000
X-Groupsio-MsgNum: 61656
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline

--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2016 at 11:44:19AM +0200, Martin Jansa wrote:
> On Sat, May 28, 2016 at 08:41:16PM -0700, Christopher Larson wrote:
> > On Tue, May 17, 2016 at 9:10 AM, Christopher Larson <kergoth@gmail.com>
> > wrote:
> >=20
> > > From: Christopher Larson <chris_larson@mentor.com>
> > >
> > > Rework how variables are passed in to ensure that more of our flag va=
rs are
> > > obeyed, make it obey more of our target path vars, and use fewer of i=
ts
> > > hardcoded flags. Also add verbosity to the compile output for debuggi=
ng.
> > >
> > > Without this, errors were seen for us:
> > >
> > >     | In file included from
> > > .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/sysli=
mits.h:7:0,
> > >     |                  from
> > > .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/limit=
s.h:34,
> > >     |                  from luaconf.h:12,
> > >     |                  from lua.h:16,
> > >     |                  from lj_arch.h:9:
> > >     |
> > > .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/limit=
s.h:168:61:
> > > fatal error: limits.h: No such file or directory
> > >     | compilation terminated.
> > >     | Makefile:233: *** Unsupported target architecture.  Stop.
> > >     | make[1]: Leaving directory '.../luajit/2.0.4-r0/LuaJIT-2.0.4/sr=
c'
> > >
> > > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > >
> >=20
> > Were there issues with this one? I noticed the other patches in this se=
ries
> > were applied, but this one wasn't.
>=20
> I've seen some luajit failures, but haven't confirmed if it was
> caused/related to this change yet, so I've kept it in master-next for a
> bit longer until I find time to confirm it.

FWIW: this is the one I was seeing (now reproduced in public build so
that I can actually share the log).
http://errors.yoctoproject.org/Errors/Details/68382/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldME18ACgkQN1Ujt2V2gBxU3wCfd8JVSALCYusA4S2vWnYwGltF
Sd8AoItHxAlScoMoQFEqBVdjIJCL8ZWn
=+QuS
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
