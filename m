Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B7F1360116
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:29:51 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l68so26929406wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 07:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=AxsE03X5beJ/l8ZYtEN3eam+RBg0fHBvfPbzqr2Rhv4=;
	b=nzLG7OjIvJ4qbyf8t1hNNpTmhpDy1yo7WhcQfybWhvSH+P1FRwtqu6HtlN1UCbyg6o
	fJKKyEnIzhJgo6diAuRawk7ki2CoplCPYlkz5IAgln6dk46j0I49ivFUZT+HMzwbdWPk
	KqNzm9MiPGgysmd0AUpaUBbI08rtYXW74AJXROS3QiIFu8SYn63bVyBodQBDTGyt2g06
	YtH4GiyuDLtVjoNOv690KS8dSZ3Iktfypd/hVEJPIA/pg52Sn2d5tqsdfuOxI/9aJ8Cz
	169JXmaYjAsFxTrldhmZ56PYweXrebd6+A1PxyKdf9wKvvXzCxqDign0fnd2Sl31irYn
	Ukhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=AxsE03X5beJ/l8ZYtEN3eam+RBg0fHBvfPbzqr2Rhv4=;
	b=KG+v+LZGVTfCGlKWKYjPvebVd0paNYwzti0DR2cuOWQRin3G25I/cpjMe0qRzWCjBT
	OpE3pgGZ+4MVGEphgZ9Jv3yS2tD3m/NQj7ybMns3bwWefZ9UNUoSjsWfaInadUsXx6ph
	E3uxFMga6J5YrIpmCaG+bsx21uzB3u4OA67BJ+UgtLnXleyDH3/4mllJb/ocYlfMX59E
	7sve4/UTmJphpCIlxnQetpO6fGdh+l3rr8GDrBKsFwD8OvyZ22Z7fZFoRHdSDJCEdwTn
	I8IGcpi19kU1EAjLPdrOv1uB/cradO0PbzOAV0qMv4egk2Xkn5SlUj5qc3rHXabNu0e/
	NhDA==
X-Gm-Message-State: AD7BkJIq1T7khW1l9QLzxX8g30blLP7DFTBx2lS/KIut/hKS/i8SYt8o4CjeOPbS1D0z7g==
X-Received: by 10.194.242.202 with SMTP id ws10mr3837319wjc.3.1458743391796;
	Wed, 23 Mar 2016 07:29:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u202sm22601567wmd.24.2016.03.23.07.29.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Mar 2016 07:29:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Mar 2016 15:34:22 +0100
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20160323143422.GC2565@jama>
References: <1458556296-2809-1-git-send-email-ricardo.ribalda@gmail.com>
	<20160323101240.GA2565@jama>
	<CAPybu_1-CCqMjSRC5it6nLL+SWzP7WfJEL6S5dY=Wjn4unon3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPybu_1-CCqMjSRC5it6nLL+SWzP7WfJEL6S5dY=Wjn4unon3g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] opencv: Add missing dependencies
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
X-List-Received-Date: Wed, 23 Mar 2016 14:29:51 -0000
X-Groupsio-MsgNum: 60624
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline

--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 02:05:41PM +0100, Ricardo Ribalda Delgado wrote:
> Hi Martin
>=20
> On Wed, Mar 23, 2016 at 11:12 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>=20
>=20
> > Still shows:
> > WARN: opencv: libopencv-dnn rdepends on protobuf, but it isn't a build
> > dependency?
> >
> > protobuf support in dnn probably depends on something else which is als=
o autodetected.
>=20
> if I just clone a clean version of meta-oe and meta-core and do a
> bitbake opencv i cannot replicate the error.
>=20
> Any idea of how to replicate it without having to do a bitbake world
> before bitbake opencv?

Check temp/log.do_package if you see protobuf dependency being added for
libopencv-dnn package.

If not then read configure script or sources to see what in
libopencv-dnn is being autodetected -> then build these autodetected
dependencies before rebuilding opencv and re-check the log.do_package
file.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbyqW0ACgkQN1Ujt2V2gByfFQCfT56+nsEpforYqpLdlHw6gzwB
gmIAnjlwe7DBZXzbGdbu7xSlgPfUQPvV
=FEko
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
