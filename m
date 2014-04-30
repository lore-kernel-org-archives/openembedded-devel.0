Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5548F60C22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 14:37:29 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id q8so1313241lbi.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=fX7bWzj8+dn4yPQuKa40ZJMAq/x8HbHLsYMFVdMxOM0=;
	b=CzeXGA+TNdzOiotnAcs72p5Gnmd/Jxmd3PPc89e97zp4sV+l1gX5zx9k/QPxXV0mGG
	vfWSgN7NAHBDxOx0fdGml8Rb9sS5UaQXs4XOEpiW9cXFNUKvGLQ9lk4gjl0reE1jr8s+
	j0nrgu8wptDL8P+Puon4TyKkJaUSnkYegMDJh4ru3gC3nlRPDk1OmNykVWwBldrbwmNc
	rO1Is3bkVd/tWGmcTKk4F4LAEWd/oxMaGI3O8/Jpikhowl5yA1Rj6lEVg3OhxdehQ39P
	lsTE7WaE91rKV3XcJnGUFHqanGhabYAm0yT4xTN/NDaM/yhPsShoGS08ADoTT74enBwv
	CH4A==
X-Received: by 10.112.85.6 with SMTP id d6mr3078240lbz.8.1398868649485;
	Wed, 30 Apr 2014 07:37:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q4sm26503402lbl.14.2014.04.30.07.37.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 07:37:26 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Apr 2014 16:37:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140430143741.GL2486@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 30 Apr 2014 14:37:36 -0000
X-Groupsio-MsgNum: 49605
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oQt9EtFvfmoPRfH8"
Content-Disposition: inline

--oQt9EtFvfmoPRfH8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

few people asked me when there will be daisy branch in meta-openembedded
repository.

My current plan is at the end of next week.

There are some pending fixes I need to finish testing (please review,
test and reply on them).

I was hoping for few more fixes for
http://lists.openembedded.org/pipermail/openembedded-devel/2014-March/09489=
3.html

and especially for incorrect dependencies:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/09526=
8.html
http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/09546=
4.html

There is only one change on ML which really cannot go to daisy branch
(http://patchwork.openembedded.org/patch/71107/), the B!=3DS fixes are on
edge, but they shouldn't harm to be in daisy.

I hope to get few more fixes from OEDAM and then I'll run final build
test on jenkins (3days, possibly needed twice).

If you want to maintain daisy release in meta-oe, reply in this thread
and send patch to update README files.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oQt9EtFvfmoPRfH8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNhCrUACgkQN1Ujt2V2gBw2QQCdHPF21eE6wS+inQUj+wwQSbs5
NlUAoI3fJ7+rByGd+WX09wDfl9wJF7H/
=ybz+
-----END PGP SIGNATURE-----

--oQt9EtFvfmoPRfH8--
