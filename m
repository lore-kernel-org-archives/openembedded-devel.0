Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6537706A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 15:26:29 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so43723976pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=1YZ+42EV0MmD/jQvs87rzIenmFkv/qkz09LnmPUOT+c=;
	b=Eb9xo84OIPs0LmtQBpM3R0u30OZuzM++REeYq9+dJJRNyeLL15QzswO8NMubHkjglw
	WsQBvo6ryK8ebTqzWEhx9SPv/wmE0sY25/hwaHsqP6+K2Z5fYl9SEq2ECGhXo4yujm5m
	M85mhzYG3E/NX/aGwSDsMym7VW6d88aCX6DPwPxWBKU02BnlID6TzDUXFAJnFBOp37ct
	i2xQxEan6kdBJ2C4szkdtlYG12kRWty+pe9SN4rWnOTRfXpnHnAXu2qSG17ofY1Aqh1+
	bH0d7iupEr/j1EFkjYdywdpQa0BHRZn3ZTJCgNxWqef2P0RyxhHr77w6aOUeJsZliYLr
	aliQ==
X-Received: by 10.69.16.166 with SMTP id fx6mr5610881pbd.18.1443626790231;
	Wed, 30 Sep 2015 08:26:30 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1dd2:3410:e15e:5df3?
	([2601:646:8601:4580:1dd2:3410:e15e:5df3])
	by smtp.gmail.com with ESMTPSA id
	mk5sm1286857pab.44.2015.09.30.08.26.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Sep 2015 08:26:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1443611010-25187-1-git-send-email-adrian.ratiu@ni.com>
Date: Wed, 30 Sep 2015 08:26:28 -0700
Message-Id: <BA6F6064-6A29-4E06-A39B-302045D686BA@gmail.com>
References: <1443605598-1445-1-git-send-email-adrian.ratiu@ni.com>
	<1443611010-25187-1-git-send-email-adrian.ratiu@ni.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3094)
Subject: Re: [meta-oe][PATCH] meta-networking: recipes-connectivity: add relayd recipe
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
X-List-Received-Date: Wed, 30 Sep 2015 15:26:33 -0000
X-Groupsio-MsgNum: 57600
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B3D631C0-785C-49F4-AF4F-3D1FEC29B0FB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B3D631C0-785C-49F4-AF4F-3D1FEC29B0FB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 30, 2015, at 4:03 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> =
wrote:
>=20
> relayd is a daemon to relay and dynamically redirect incoming
> connections to a target host.
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
> meta-networking/recipes-connectivity/relayd/relayd_git.bb | 14 =
++++++++++++++
> 1 file changed, 14 insertions(+)
> create mode 100644 =
meta-networking/recipes-connectivity/relayd/relayd_git.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb =
b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> new file mode 100644
> index 0000000..9ca04c4
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "Layer 3 relay daemon"
> +SECTION =3D "console/network"
> +LICENSE =3D "relays-custom-license"

can you add this file to list of licenses too?

> +LIC_FILES_CHKSUM =3D =
"file://main.c;endline=3D17;md5=3D86aad799085683e0a2e1c2684a20bab2"
> +
> +DEPENDS =3D "libubox"
> +
> +SRC_URI =3D "git://nbd.name/relayd.git"
> +
> +SRCREV =3D "2970ff60bac6b70ecb682779d5c776dc559dc0b9"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_B3D631C0-785C-49F4-AF4F-3D1FEC29B0FB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYL/yQACgkQuwUzVZGdMxRlDgCeNI5PImPDDnrs01x4uHuj05UR
VeEAnRjaM3d7lhk3lAvH1ii1BcmeB7/4
=WDwX
-----END PGP SIGNATURE-----

--Apple-Mail=_B3D631C0-785C-49F4-AF4F-3D1FEC29B0FB--
