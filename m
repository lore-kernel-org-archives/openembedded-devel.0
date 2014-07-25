Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id ACF1E6AC77
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 10:06:04 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so704833wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bIii9Zf7D/gbfAJyCzxd4MsD6V9ecVrYVox0Ppf2cJQ=;
	b=CveRjyxpegv17/NT1gP108KwD7L0GXgv+Mkju1Y6NyJhVKJKdhVPgeQoE4g1pKFTQK
	jyorzbVI3TIegKuaV37W/7O67YfWToh6ElecXPtEsIr5Cjxg6TiV3wZjEDWUGXF0YYGk
	Aa6GXkq5FbURMSgzJFK36fNjsQHZZDHcYtY9mXLBDKmKig2hoXJgkmjst9FwNr71T5ea
	Cgju+6ri93Xz+Mm8Un1dqZevCeOGbVuIwO9kr7xDKNK/YXHAf5aoTU+kXwbIhdDh6OcE
	I3lrJukpB3sPxlESYCbaaOhq+adDIw8Gmicnj9V+SY6G/bqvP2Y1cRIHVw7EdQMCO1np
	sOCg==
X-Received: by 10.194.87.10 with SMTP id t10mr20416660wjz.82.1406282764826;
	Fri, 25 Jul 2014 03:06:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w9sm4055053wif.12.2014.07.25.03.06.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 03:06:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Jul 2014 12:06:22 +0200
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20140725100622.GT2492@jama>
References: <1406184181-23969-1-git-send-email-rongqing.li@windriver.com>
	<20140724110231.GG2492@jama> <53D1C2F6.4010905@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53D1C2F6.4010905@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] openvpn: not use the hardcoded libdir
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
X-List-Received-Date: Fri, 25 Jul 2014 10:06:07 -0000
X-Groupsio-MsgNum: 51250
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b2s+RKoBicgQlNJs"
Content-Disposition: inline

--b2s+RKoBicgQlNJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2014 at 10:37:42AM +0800, Rongqing Li wrote:
>=20
>=20
> On 07/24/2014 07:02 PM, Martin Jansa wrote:
> > On Thu, Jul 24, 2014 at 02:43:01PM +0800, rongqing.li@windriver.com wro=
te:
> >> From: Roy Li <rongqing.li@windriver.com>
> >>
> >> it will lead to QA failure, since .debug dir can not be installed into=
 dbg package
> >>
> >>      ERROR: QA Issue: non debug package contains .debug directory: ope=
nvpn path
> >>      /work/core2-64-wrs-linux/openvpn/2.3.4-r0/packages-split/openvpn/=
usr/lib64i
> >>      /openvpn/plugins/.debug/openvpn-plugin-down-root.so [debug-files]
> >
> > Can you please check this floating dependency?
> >
> > snort/snort/latest lost dependency on  util-linux-libuuid
> >
>=20
> Hi, martin:
>=20
>=20
> This patch is fixing the openvpn, not snort, it should be a good fix.

Ah sorry, I wanted to write it in your next patch which is changing
snort.

> About snort dependency, snort will check if util-linux-libuuid exist or
> not when do configuration, and no configuration options can control it,
> so PACKAGECONFIG can not be used on snort, so I like leave it to wait
> until I have time

OK, I won't block it because of this dependency, but if you're using
snort, then please fix it when you can.


Thanks

> >>
> >> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >> ---
> >>   meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb |    2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb =
b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
> >> index a3322a0..48e04b7 100644
> >> --- a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
> >> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
> >> @@ -28,4 +28,4 @@ do_install_append() {
> >>
> >>   RRECOMMENDS_${PN} =3D "kernel-module-tun"
> >>
> >> -FILES_${PN}-dbg +=3D "/usr/lib/openvpn/plugins/.debug"
> >> +FILES_${PN}-dbg +=3D "${libdir}/openvpn/plugins/.debug"
> >> --
> >> 1.7.10.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b2s+RKoBicgQlNJs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPSLB4ACgkQN1Ujt2V2gBxMVACfd1H2qJqawLoFRNwGhL+8ESAX
tVMAnj1DFuBw5fgjwPLe03LPuWzgpkrf
=1QXw
-----END PGP SIGNATURE-----

--b2s+RKoBicgQlNJs--
