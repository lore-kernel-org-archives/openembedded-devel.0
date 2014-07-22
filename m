Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB9D70656
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 16:29:58 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so8293636wgh.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+Ri8MX+ZgKmhKHKLmJsA4FAnXcWgCZ6GIfgUSND6pxA=;
	b=XEGlkiUncJuHMCbCQxpHRNnsdCQxG94QKanFM4JFo7SYVVBR8WZwbJlHh5dDiDNQTU
	bvLrRtnMQqRwBJ46GMQ0W5Tr4hl7j22M8L9OqTHERBO/kP8NlOQZ9LvzQNbnRJjXqcAB
	LtzgCBKo9i1GassSL6keyUhRnrVYjjo3VaBL31n3CWPeFGJyCzSYgQdaEztGmqpnmBys
	7IQI/eqgkwiIC4J/Gp28CT4Y+3XpO+bgaiyBM2uWKgGFtEdrBX7PtxYvoaVZ6nt1092G
	Upv/skAvcp+k9zbpnLoUArFbssPUyNkoo5YQEXLFFme8+9Tpe8MH4SpkPrsFuFEWDgXK
	3s1w==
X-Received: by 10.180.96.97 with SMTP id dr1mr16393838wib.19.1406046599747;
	Tue, 22 Jul 2014 09:29:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm2093984wjr.22.2014.07.22.09.29.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 09:29:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 18:30:15 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140722163015.GW22875@jama>
References: <1398455613-27167-1-git-send-email-ben.shelton@ni.com>
MIME-Version: 1.0
In-Reply-To: <1398455613-27167-1-git-send-email-ben.shelton@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] xwd: add recipe
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
X-List-Received-Date: Tue, 22 Jul 2014 16:30:00 -0000
X-Groupsio-MsgNum: 51186
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zOhrINIRDRtNKIHr"
Content-Disposition: inline

--zOhrINIRDRtNKIHr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 02:53:33PM -0500, Ben Shelton wrote:
> Adding a recipe for the X Window Dump tool, a lightweight tool that is
> useful for taking screenshots on embedded targets.
>=20
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb b/meta-oe/rec=
ipes-graphics/xorg-app/xwd_1.0.6.bb
> new file mode 100644
> index 0000000..b73afe1
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
> @@ -0,0 +1,11 @@
> +SUMMARY =3D "xwd is a tool to capture an X window or screen to file"
> +HOMEPAGE =3D "http://cgit.freedesktop.org/xorg/app/xwd/"
> +SECTION =3D "x11/app"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc0cdb783e9a0198237371fdaa26a1=
8bf"
> +DEPENDS =3D "libxmu"
> +
> +SRC_URI[md5sum] =3D "6b5d48464c5f366e91efd08b62b12d94"
> +SRC_URI[sha256sum] =3D "3bb396a2268d78de4b1c3e5237a85f7849d3434e87b3cd1f=
4d57eef614227d79"
> +
> +require recipes-graphics/xorg-app/xorg-app-common.inc

This line needs to be the first otherwise SUMMARY, HOMEPAGE, SECTION,
LICENSE and DEPENDS are overwritten from .inc.

I'll fix that.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zOhrINIRDRtNKIHr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPOkZcACgkQN1Ujt2V2gBwTPgCgmPMMYW70sA4WwtRmfiDxeC4O
WxgAn3AB+Acdl9H6OERrlzeDNbZrxfxx
=zajh
-----END PGP SIGNATURE-----

--zOhrINIRDRtNKIHr--
