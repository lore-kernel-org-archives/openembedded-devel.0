Return-Path: <joe@deserted.net>
Received: from mail-qa0-f44.google.com (unknown [209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9C51D60703
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 14:51:37 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id j7so4129541qaq.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2014 07:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=WYUuqrIcuaiVOvNwKpaPQCK9C90sbJ+k7jobNdUlGOI=;
	b=PzakXbRWCdvZAIWOet99UWKngrBmA1/aDl/b8MRCRgcUFAisqWt2TZUOrG9zInDHh9
	mQ1lwrU17ssWSMybcZbt6bJorwFUQlm39gMf4WadL7k0E5yh05jBnITo3p+r2HpkwvuI
	ukXRYllrcZZso1fZBEWdg2LHU765vVGO+6E0TZri2S9sQaeDgvnAYFYAhoFsNDMj0CKf
	jj7Uo+nP1SVtA7fBQQQMAgEVlreBgD/GBCo94Fl0VAAOaNZxSW/CM4HqZ+MpDrrMypys
	HL4BpewGATngrbR8ua2vbT6l760xYoFyq3s0YcFlIMWNethR4trmyNB3Lssqk7+tV/jV
	fhMA==
X-Gm-Message-State: ALoCoQnOqmupO08ezf+xY4iHPg/5Uw84t0kyqxyeEX1XpRiIJfEwb8Ql2p6aUaDrkfKcrmiU5QS5
X-Received: by 10.140.87.5 with SMTP id q5mr14153995qgd.43.1399645218728;
	Fri, 09 May 2014 07:20:18 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id h90sm4116099qge.0.2014.05.09.07.20.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 09 May 2014 07:20:17 -0700 (PDT)
Date: Fri, 9 May 2014 10:20:15 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140509142012.GB3770@deserted.net>
References: <1399626350-21897-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1399626350-21897-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH] strongswan: Security Advisory - strongswan - CVE-2014-2338
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
X-List-Received-Date: Fri, 09 May 2014 14:51:40 -0000
X-Groupsio-MsgNum: 49816
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline

--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Roy.

-J.

[[oe] [meta-networking][PATCH] strongswan: Security Advisory - strongswan -=
 CVE-2014-2338] On 14.05.09 (Fri 17:05) rongqing.li@windriver.com wrote:

> From: Yue Tao <Yue.Tao@windriver.com>
>=20
> IKEv2 in strongSwan 4.0.7 before 5.1.3 allows remote attackers to bypass
> authentication by rekeying an IKE_SA during (1) initiation or (2)
> re-authentication, which triggers the IKE_SA state to be set to
> established.
>=20
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2014-2338
>=20
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../strongswan-5.0.0-5.1.2_reject_child_sa.patch   |   36 ++++++++++++++=
++++++
>  .../recipes-support/strongswan/strongswan_5.1.1.bb |    1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-networking/recipes-support/strongswan/files/stro=
ngswan-5.0.0-5.1.2_reject_child_sa.patch
>=20
> diff --git a/meta-networking/recipes-support/strongswan/files/strongswan-=
5.0.0-5.1.2_reject_child_sa.patch b/meta-networking/recipes-support/strongs=
wan/files/strongswan-5.0.0-5.1.2_reject_child_sa.patch
> new file mode 100644
> index 0000000..ab95992
> --- /dev/null
> +++ b/meta-networking/recipes-support/strongswan/files/strongswan-5.0.0-5=
=2E1.2_reject_child_sa.patch
> @@ -0,0 +1,36 @@
> +From b980ba7757dcfedd756aa055b3271ea58cf85aa6 Mon Sep 17 00:00:00 2001
> +From: Martin Willi <martin@revosec.ch>
> +Date: Thu, 20 Feb 2014 16:08:43 +0100
> +Subject: [PATCH] ikev2: Reject CREATE_CHILD_SA exchange on unestablished
> + IKE_SAs
> +
> +Prevents a responder peer to trick us into established state by starting
> +IKE_SA rekeying before the IKE_SA has been authenticated during IKE_AUTH.
> +
> +Fixes CVE-2014-2338 for 5.x versions of strongSwan.
> +---
> + src/libcharon/sa/ikev2/task_manager_v2.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/src/libcharon/sa/ikev2/task_manager_v2.c b/src/libcharon/sa=
/ikev2/task_manager_v2.c
> +index ac3be90..a5252ab 100644
> +--- a/src/libcharon/sa/ikev2/task_manager_v2.c
> ++++ b/src/libcharon/sa/ikev2/task_manager_v2.c
> +@@ -780,6 +780,15 @@ static status_t process_request(private_
> + 			case CREATE_CHILD_SA:
> + 			{	/* FIXME: we should prevent this on mediation connections */
> + 				bool notify_found =3D FALSE, ts_found =3D FALSE;
> ++
> ++				if (this->ike_sa->get_state(this->ike_sa) =3D=3D IKE_CREATED ||
> ++					this->ike_sa->get_state(this->ike_sa) =3D=3D IKE_CONNECTING)
> ++				{
> ++					DBG1(DBG_IKE, "received CREATE_CHILD_SA request for "
> ++						 "unestablished IKE_SA, rejected");
> ++					return FAILED;
> ++				}
> ++
> + 				enumerator =3D message->create_payload_enumerator(message);
> + 				while (enumerator->enumerate(enumerator, &payload))
> + 				{
> +--
> +1.8.1.2
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.=
bb b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
> index a2a2333..f8116e3 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.1.1.bb
> @@ -9,6 +9,7 @@ DEPENDS =3D "gmp openssl flex-native flex bison-native"
> =20
>  SRC_URI =3D "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
>          file://fix-funtion-parameter.patch \
> +        file://strongswan-5.0.0-5.1.2_reject_child_sa.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "e3af3d493d22286be3cd794533a8966a"
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNs5BwACgkQwFvcllog0XxBEwCgikrdwmFsUhq5cnZKAH5VG6cy
wAYAnA6fhWXLxUEYM9d4yW8CFXGjIERp
=/p/D
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
