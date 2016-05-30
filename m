Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 85EE1731C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 09:44:15 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q62so20881343wmg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ls9NPe653SBZ7BQE60Xk/CcaFKDK2uEevZOaPvZZDVg=;
	b=woYHwCFjd6cE9u/5pOsy8GQylkFa8kAOEBNH2m2ijo4I2Zw45MFhEYnJnB72QOQpa8
	hPQoNuFhWE5HQmMHGKBQw7/TWue811bs3LtmDl4AixPtW0tCvYLO990G2ef5LWBKaPzy
	La/2uQclfh/t6X1TO0YJ5NVWJdYlqZ+/friPYYK6pa2N4Mn1x7oXQrQlijursn7bVnjk
	L7kR0SEzrTdEnaVIcHm12K3JoJOL+7Bky67aYKTXv9VhRHZIMBqzBOxy7HO0+XvRigq5
	/ILpxXqa7igX9yAAB6RRo/Wb9y5nyn6Nn/kK6Alj/hM9iadVaH1Fb+/VfPear2mZL1hM
	t5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ls9NPe653SBZ7BQE60Xk/CcaFKDK2uEevZOaPvZZDVg=;
	b=WzbDhWKu3wHUlFg94bCGkOAg+B7Lo+fNcbth0rPXCr2be6A7ERmgVfKSQTUjGz78k9
	lneSI9YQ6lLQk80CrD3IDQg7HNIUyNEFlYxq1ALfCSvTtv3zWl2WAmAQQnClPwbKBSde
	/cTNCQrVwgiDtBKhQxZnQKVdx2hHrgY0VQ9iIRvExaN8usBjRwIGKD3H6ieWlVZthLYT
	knoGQIP2KWleCNzp/zixFYtkIrWLrml+inpRpCLR/2EoVMfXctkAPmHi4FQb5ZoJJgsp
	qPV2ZEMvdUBbyKjpPbEZ3DS2CQ2GARS6PlokIP6O0nrv3SPKIzknuTXRaTsaerJa71Q+
	kL/Q==
X-Gm-Message-State: ALyK8tL8ACLl7yCXCKO+JGb04DPOiImE+XRe1gIIzzLakIqM3rhe4Xqe8/GO82zN1JIevg==
X-Received: by 10.28.158.85 with SMTP id h82mr9565660wme.60.1464601455416;
	Mon, 30 May 2016 02:44:15 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lf9sm33574306wjc.44.2016.05.30.02.44.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 May 2016 02:44:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 May 2016 11:44:19 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160530094419.GA2588@jama>
References: <cover.1463501350.git.chris_larson@mentor.com>
	<3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
	<328bdd83910d94b0c35eaff11abd98838c20493e.1463501350.git.chris_larson@mentor.com>
	<CABcZAN=sp3YTzAMZFSE0RrH3ebv_xpE6w8yo7++S6fytNma+aw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=sp3YTzAMZFSE0RrH3ebv_xpE6w8yo7++S6fytNma+aw@mail.gmail.com>
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
X-List-Received-Date: Mon, 30 May 2016 09:44:16 -0000
X-Groupsio-MsgNum: 61655
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 28, 2016 at 08:41:16PM -0700, Christopher Larson wrote:
> On Tue, May 17, 2016 at 9:10 AM, Christopher Larson <kergoth@gmail.com>
> wrote:
>=20
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Rework how variables are passed in to ensure that more of our flag vars=
 are
> > obeyed, make it obey more of our target path vars, and use fewer of its
> > hardcoded flags. Also add verbosity to the compile output for debugging.
> >
> > Without this, errors were seen for us:
> >
> >     | In file included from
> > .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/syslimi=
ts.h:7:0,
> >     |                  from
> > .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/limits.=
h:34,
> >     |                  from luaconf.h:12,
> >     |                  from lua.h:16,
> >     |                  from lj_arch.h:9:
> >     |
> > .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/limits.=
h:168:61:
> > fatal error: limits.h: No such file or directory
> >     | compilation terminated.
> >     | Makefile:233: *** Unsupported target architecture.  Stop.
> >     | make[1]: Leaving directory '.../luajit/2.0.4-r0/LuaJIT-2.0.4/src'
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> >
>=20
> Were there issues with this one? I noticed the other patches in this seri=
es
> were applied, but this one wasn't.

I've seen some luajit failures, but haven't confirmed if it was
caused/related to this change yet, so I've kept it in master-next for a
bit longer until I find time to confirm it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldMC3IACgkQN1Ujt2V2gBxnswCgikgqq6RZRRSzH/dEAKgHQa2i
sbkAn0wjys2aeJN4v0KAPE/9S+fCB3jo
=ldW8
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
