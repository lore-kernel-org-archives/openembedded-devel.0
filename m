Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 86DAD72F06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:21:47 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u65so15768781wmu.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Q4pxiyIQ+TnmTEouZ8wEtd1i3zf4e+AtT9mE9HwQ32I=;
	b=rAPN571Zp3T644Aw/9EFWSjDUpMK86XbGhOwajRAq0B9bd+ImYA+srsEeXRiMMIr2J
	jPUKy4dtM9K7CPSnItkAbgEhCiV9Gc3zA85OBQOYtiFW9TuPCSuL2WGyEqFQv1bpy9Ys
	66I3XlhtOGdAwU1iB9ZvycWXCZJZvqQuRsQPANQFqxLLlyNnaRpJZoQw4dCRcocU+RZY
	tfh/C1GCfocOlK7JVl/Dxh/TL60joXJZBVeW8LFdIBQywUpJoKcTShx1IzJD8UqimTyq
	1KPoq/WeLcO30RQMlXLaLZ8tbK5CWpoY+RSJdYg3N7M3jbKQmjz0hD2Z0bk6NhgSKsXB
	p/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Q4pxiyIQ+TnmTEouZ8wEtd1i3zf4e+AtT9mE9HwQ32I=;
	b=I5I27cQton93SG+fnWD3Y0e9+no+aqc5nC78rh8SfkyAmDDkY0fEhAv3JldkhD1pz8
	44Nq3H5Hv94LzPNf9lZlriTpMi6le1HIgwEbmRVR49pnNPGjw8Fcm7VfMN31pKMxJcNo
	kSai6fsY1VFFwVp/Xpt2ZWQoqNNcS2ifPiqzguOOBgSuQrZWBv1V96D+XgAx5rlyLb4p
	FVbY2ldSYhkn9ssEEDFYH+Zz3+nvM8pu9VbQkSov3RdDa912++HF7VTuUGXl//Ktb/F1
	B4o14pgRYklZn/LXMu0SxatKRyAVG//fsEWygeOXf++ZRqXcRG2fIpTFxjH/KfVDDj5r
	j/gg==
X-Gm-Message-State: AN3rC/6pRL4umE3mdAEhH3iChczRoUlntmyULjlTx2BbE3IgY8cXXkJt
	6VqsSKe/s/odaBNV
X-Received: by 10.28.131.208 with SMTP id f199mr9265333wmd.81.1493025708842;
	Mon, 24 Apr 2017 02:21:48 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b10sm12284543wme.22.2017.04.24.02.21.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Apr 2017 02:21:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Apr 2017 11:22:02 +0200
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <20170424092202.GB3647@jama>
References: <1493024704-196407-1-git-send-email-zhixiong.chi@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1493024704-196407-1-git-send-email-zhixiong.chi@windriver.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] collectd: CVE-2017-7401
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
X-List-Received-Date: Mon, 24 Apr 2017 09:21:49 -0000
X-Groupsio-MsgNum: 66479
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline

--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2017 at 05:05:04PM +0800, Zhixiong Chi wrote:
> Incorrect interaction of the parse_packet() and parse_part_sign_sha256() =
functions
> in network.c in collectd 5.7.1 and earlier allows remote attackers to cau=
se a
> denial of service (infinite loop) of a collectd instance (configured with
> "SecurityLevel None" and with empty "AuthFile" options) via a crafted UDP=
 packet.
>=20
> Backport upstream patch from https://github.com/collectd/collectd/
> commit f6be4f9b49b949b379326c3d7002476e6ce4f211

There is already upgrade to 5.7.1 by khem in master-next:

commit e73fa36f014bef43b5036dc90ea0d6835d704473
Author: Khem Raj <raj.khem@gmail.com>
Date:   Sun Apr 23 22:20:47 2017 -0700

    collectd: Upgrade to 5.7.1

>=20
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../collectd/collectd/collectd-CVE-2017-7401.patch | 54 ++++++++++++++++=
++++++
>  .../recipes-extended/collectd/collectd_5.5.0.bb    |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/collectd/collectd/collectd-C=
VE-2017-7401.patch
>=20
> diff --git a/meta-oe/recipes-extended/collectd/collectd/collectd-CVE-2017=
-7401.patch b/meta-oe/recipes-extended/collectd/collectd/collectd-CVE-2017-=
7401.patch
> new file mode 100644
> index 0000000..9dc975e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/collectd/collectd/collectd-CVE-2017-7401.p=
atch
> @@ -0,0 +1,54 @@
> +
> +network plugin: Fix endless loop DOS in parse_packet()
> +
> +When correct 'Signature part' is received by Collectd, configured without
> +AuthFile option, condition for endless loop occurs due to missing increa=
se
> +of pointer to next unprocessed part.
> +
> +This is a forward-port of #2233.
> +
> +Fixes: CVE-2017-7401
> +Closes: #2174
> +
> +CVE: CVE-2017-7401
> +
> +Upstream-States: Backport
> +
> +Signed-off-by: Florian Forster <octo@collectd.org>
> +
> +diff --git a/src/network.c b/src/network.c
> +--- a/src/network.c
> ++++ b/src/network.c
> +@@ -1050,14 +1050,6 @@ static int parse_part_sign_sha256(sockent_t *se, =
/* {{{ */
> +   buffer_len =3D *ret_buffer_len;
> +   buffer_offset =3D 0;
> +=20
> +-  if (se->data.server.userdb =3D=3D NULL)
> +-  {
> +-    c_complain (LOG_NOTICE, &complain_no_users,
> +-        "network plugin: Received signed network packet but can't verif=
y it "
> +-        "because no user DB has been configured. Will accept it.");
> +-    return (0);
> +-  }
> +-
> +   /* Check if the buffer has enough data for this structure. */
> +   if (buffer_len <=3D PART_SIGNATURE_SHA256_SIZE)
> +     return (-ENOMEM);
> +@@ -1027,6 +1019,17 @@ static int parse_part_sign_sha256(sockent_t *se, =
/* {{{ */
> +     return (-1);
> +   }
> +=20
> ++  if (se->data.server.userdb =3D=3D NULL) {
> ++    c_complain(LOG_NOTICE, &complain_no_users,
> ++        "network plugin: Received signed network packet but can't verif=
y it "
> ++        "because no user DB has been configured. Will accept it.");
> ++
> ++    *ret_buffer =3D buffer + pss_head_length;
> ++    *ret_buffer_len -=3D pss_head_length;
> ++
> ++    return (0);
> ++  }
> ++
> +   /* Copy the hash. */
> +   BUFFER_READ(pss.hash, sizeof(pss.hash));
> +=20
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-o=
e/recipes-extended/collectd/collectd_5.5.0.bb
> index 59732db..e325835 100644
> --- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
> +++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "http://collectd.org/files/collectd-${PV}.t=
ar.bz2 \
>             file://0001-collectd-replace-deprecated-readdir_r-with-readdi=
r.patch \
>             file://CVE-2016-6254.patch \
>             file://0001-fix-to-build-with-glibc-2.25.patch \
> +           file://collectd-CVE-2017-7401.patch \
>  "
>  SRC_URI[md5sum] =3D "c39305ef5514b44238b0d31f77e29e6a"
>  SRC_URI[sha256sum] =3D "847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f13=
43b1062a4b569e88"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWP3DuQAKCRA3VSO3ZXaA
HEbqAJwIrkdKuvVBoq3Ly0uRFZmRY4WMIwCcCcw+rfbL5XIhIBPMV8OxkEcTwqI=
=Hf1p
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
