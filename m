Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 563056DC27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 23:02:37 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h10so7587912eak.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 15:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tygwHwnH/3Y2+3EcvrJi4i/I59O8/NhCPNtvyJ+ohAY=;
	b=Ng2FRDqnwbd6cpp29NHKsJxyeWrE/7jG9cZ51W0xOE9gmQP2qxosmhwMJnLV6LUf/O
	2LQi0LxcibnelXfkVJd/FHGFJkdm7ke7r+9WHbr3I3uaGOsq0FPNQWfxdnEpnnCBGTLg
	3KbdJyJ5zUhZansKL+0RKjm2kgiZmJoQurldbMFQBh5s62cjufWl949luuX4htrH5jfS
	5rx9b0k6KLImSBo5JsgM6c0Gw6By14CcA4izYRQiLCNFwMiWaoogM0kTh++hxpSY9DhS
	cHY5TTWOfzB9lJYgakb9W2YK3+Nh8qEPxrtRy/hBwNt7HDmIPUwON6EtL4jL//yxJPX0
	oHMw==
X-Received: by 10.14.183.132 with SMTP id q4mr257172eem.91.1392678157959;
	Mon, 17 Feb 2014 15:02:37 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k41sm62982445een.19.2014.02.17.15.02.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 15:02:36 -0800 (PST)
Date: Tue, 18 Feb 2014 00:03:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140217230307.GE4067@jama>
References: <CAP71Wjy4dxnDZFb3x_5zPg5HV-VOakeYtFz+8o0h2xk08R1=zQ@mail.gmail.com>
	<20140217214623.GU22890@denix.org>
MIME-Version: 1.0
In-Reply-To: <20140217214623.GU22890@denix.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Andre McCurdy <andre.mccurdy@entropic.com>
Subject: Re: [meta-qt5] why does Qt5 build with ARM_INSTRUCTION_SET = "arm"
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
X-List-Received-Date: Mon, 17 Feb 2014 23:02:37 -0000
X-Groupsio-MsgNum: 48184
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zi0sgQQBxRFxMTsj"
Content-Disposition: inline

--Zi0sgQQBxRFxMTsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2014 at 04:46:23PM -0500, Denys Dmytriyenko wrote:
> On Mon, Feb 17, 2014 at 02:27:51PM -0700, Nicolas Dechesne wrote:
> > hi,
> >=20
> > does anybody know why in Qt5/qtbase.inc, we have:
> >=20
> > ARM_INSTRUCTION_SET =3D "arm"
> >=20
> > Could it be an a low hanging fruit from the past? e.g. before
> > https://bugreports.qt-project.org/browse/QTBUG-16402 or
> > https://qt.gitorious.org/qt/qtbase/commit/a3bd9d4c0f3d9e80dbe35bd88649b=
245dca5f410?
>=20
> Hmm, I would assume that's here from 4.8 days, although I haven't tried=
=20
> dropping that line for latest Qt5... Would make sense to do some more tes=
ting.
>=20
>=20
> > as a matter of fact, for our project Qt5 (and QtWebkit) are building
> > (and working fine) when built with Thumb2, outside of OE. Also using
> > ARM instruction set instead of Thumb2 enforces Webkit to use the ARM
> > version of the javascript JIT, while the Thumb2 JIT engine seems to
> > work a lot better in our testing...
>=20
> Seems like worth the effort to re-test the need for that setting. Unless=
=20
> someone else has tried it already and found out the issue is still there

IIRC it was failing to build for armv4t (at least with 5.0.0) if someone
tests that armv4t builds with 5.2.*, I'll accept the patch.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Zi0sgQQBxRFxMTsj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMClSsACgkQN1Ujt2V2gByjkQCeJbXUNiLtMgRNNgjjumh02czO
SJQAn1T5B2oZNvfJr/zjAYPaxvfp2ttV
=ZkHt
-----END PGP SIGNATURE-----

--Zi0sgQQBxRFxMTsj--
