Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA197687B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:45:32 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so40118527wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U7yzUnvFkqYbCRz7epRRFsEEHzjJ1vYAJlPYU2rNIJA=;
	b=karipZeUy922u570J8BF8Ejgng1dMlgrg08l2Qn2t9u3nJ3YH3EDn1+D5yJrxY9xGQ
	+QmioXCdpyf0ak46eWXT4+HW8JEuLgOi3S8trd+5SAWAOdW1JtpNlaRgl2Ns9qjBbMGB
	22HL/xftsl3eNS4wIh6ByvbdbCxvNLZC/uWRAXazcs6k6NyqE4renHTK3yTOV7JJoMp2
	ZROvaFQA3Rg3rVfQqSfv2yHALJFA5DZ3tyrec08KrturarLnvjPDpnEkO3Wa/ukaB8jf
	jdFCJ7pnTZOndTR0RayRrDOM95jSjgMQRujricTp5wRK6N5KekvKitI/yA2kOtl0Kl+X
	0YYA==
X-Received: by 10.180.88.37 with SMTP id bd5mr5587614wib.82.1442598333048;
	Fri, 18 Sep 2015 10:45:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id it4sm9971503wjb.0.2015.09.18.10.45.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 10:45:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Sep 2015 19:45:58 +0200
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20150918174558.GC2385@jama>
References: <CAP9ODKpdOtyML72GCOjR5LmNn6KZCOwrGchwYSreqCEOzd15Yg@mail.gmail.com>
	<20150918120900.GB11095@jama> <55FC4300.80503@gmail.com>
	<CAP9ODKr-7nQqHXc8m121jxOWWTF3MXTnTDfqrfurxRn2DJEX-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKr-7nQqHXc8m121jxOWWTF3MXTnTDfqrfurxRn2DJEX-A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Fido backports
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Sep 2015 17:45:35 -0000
X-Groupsio-MsgNum: 57466
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline

--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2015 at 02:23:02PM -0300, Otavio Salvador wrote:
> On Fri, Sep 18, 2015 at 1:59 PM, akuster808 <akuster808@gmail.com> wrote:
> >>> If noone has objections I would like to propose the backport of:
> >>>
> >>> # Upgrade
> >>> 2c57f950a
> >
> > Is going from 0.9.2 -> 1.2.1 bug or security fixes ? Give me a real good
> > reason to allow this.
>=20
> Neither that I am aware of. That is why I split those two as I knew
> this need discussion.

OK, then I would prefer you to keep them in local backport.

There were few exceptions to this rule about no-new-features, but they
usually had some good clarifications or were at least some minor
upgrades to newer bugfix release.

> We need this for one project and we can keep using a local backport;
> this was just for reduce delta for something which seems safe.
>=20
> >>> # New recipe
> >>> 2315f412f6
> >
> > I thought adding new recipes to a maintenance branch was not allowed ?
>=20
> I think it depends on situation. I think we ought to avoid adding new
> features when possible, specially for old branches as this motivates
> people to upgrade.
>=20
> Have said that, I am biased here so I prefer to not argument in favor
> of inclusion or not. As the upgrade, we can keep a local backport for
> it.

With new recipe my thoughts are the same as above, if we all try to push
our backport delta, then there would be too many changes and eventually
more regressions in release branch - only if many people report that they
all need the same feature backport to resolve some needs, then we should
make exceptions.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX8TdQACgkQN1Ujt2V2gBydIACdF97nn5kEaQPFmliYN16YtFOA
Vv8AnAgQ2R2+tF81vv5Qvllyn0/i1IzX
=R2SN
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
