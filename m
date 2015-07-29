Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3C64873D13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:56:11 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so30113943wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 07:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ulv1j5xS8mhJM/4ru8gkcINm05DjQjvkn3bG/SIo9iw=;
	b=UYatazAb5AvOFOMdqzeFKUe4M0hkqtxQydwF5TFekJLMiNS9nkW7t5e16ckIDy9pAK
	KclFWxdgxXerUTliFXMcnpPZoTLljmky/XXWdUJerUSw0hzmGFditdKzgJAKqhbYrh5N
	akPAzDqf675UX2JwV7BL+m52pCnQ9QGuUm+5szQLicMcufkYkkihHV2oWFSbZrrfn5IK
	jjADaNT3LLXSVKU0yqGsSjVxShSQrShX9aNG9YXcaSGTuwEWoJklppAD2T4Dpt+f1/Kg
	/koh/AigIrNHjd1MQA5a+m22fFHNH8zvcki0Bd2arszgawNNfM+yEUW/Aq74xGiOkuuN
	XdYg==
X-Received: by 10.194.60.131 with SMTP id h3mr76767682wjr.156.1438181770450;
	Wed, 29 Jul 2015 07:56:10 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id s5sm24770735wik.2.2015.07.29.07.56.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 07:56:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Jul 2015 16:56:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150729145618.GA12478@jama>
References: <1435571855-62168-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1435571855-62168-1-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 0/9] add openlmi and it's depends
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
X-List-Received-Date: Wed, 29 Jul 2015 14:56:13 -0000
X-Groupsio-MsgNum: 56427
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2015 at 05:57:26PM +0800, Lei Maohui wrote:
> OpenLMI  =3D Open Linux Management Infrastructure.
> OpenLMI is open-source project aiming to improve management of Linux syst=
ems using WBEM standards.

Still fails to build on jenkins, logs in:
http://errors.yoctoproject.org/Errors/Build/7660/

> Lei Maohui (9):
>   openlmi: add new recipe openlmi
>   cim-schema-exper: add new recipe for openlmi
>   cmpi-bindings: add new recipe for openlmi
>   konkretcmpi:add new recipe for openlmi
>   sblim-sfcb: add new recipe for openlmi
>   sblim-sfcCommon: add new recipe
>   sblim-cmpi-devel: add new recipe
>   cim-schema_2.40.0.bb: delete
>   pywbem: add new recipe
>=20
>  .../cim-schema/cim-schema-exper_2.39.0.bb          | 26 +++++++
>  .../cim-schema/cim-schema-final_2.40.0.bb          | 31 +++++++++
>  .../cim-schema/cim-schema/files/LICENSE            | 34 +++++++++
>  .../cim-schema/cim-schema_2.40.0.bb                | 31 ---------
>  .../cmpi-bindings/0001-Fix-error.patch             | 26 +++++++
>  .../cmpi-bindings/0001-Modify-cmakelist.patch      | 41 +++++++++++
>  .../cmpi-bindings-0.4.17-no-ruby-perl.patch        | 44 ++++++++++++
>  .../cmpi-bindings-0.4.17-sblim-sigsegv.patch       | 22 ++++++
>  .../cmpi-bindings-0.9.5-python-lib-dir.patch       | 17 +++++
>  .../cmpi-bindings/cmpi-bindings_git.bb             | 31 +++++++++
>  ...-0.9.2-fix-returning-instance-from-method.patch | 38 ++++++++++
>  .../konkretcmpi/konkretcmpi_0.9.2.bb               | 33 +++++++++
>  .../openlmi/openlmi-networking_0.3.1.bb            | 29 ++++++++
>  .../openlmi/openlmi-providers/0001-fix-error.patch | 26 +++++++
>  .../openlmi/openlmi-providers_0.6.0.bb             | 54 +++++++++++++++
>  .../openlmi/openlmi-storage_0.8.1.bb               | 31 +++++++++
>  .../openlmi/openlmi-tools_0.10.5.bb                | 23 +++++++
>  meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb    | 36 ++++++++++
>  .../sblim-cmpi-devel-2.0.3-docdir.patch            | 17 +++++
>  .../sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb     | 18 +++++
>  .../sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb       | 23 +++++++
>  .../recipes-extended/sblim-sfcb/files/sfcb.service | 11 +++
>  .../sblim-sfcb-1.3.15-fix-provider-debugging.patch | 12 ++++
>  .../sblim-sfcb-1.3.16-maxMsgLen.patch              | 14 ++++
>  .../sblim-sfcb-1.3.16-multilib-man-cfg.patch       | 41 +++++++++++
>  ...blim-sfcb-1.3.9-sfcbrepos-schema-location.patch | 42 ++++++++++++
>  .../sblim-sfcb-1.4.5-service.patch                 | 27 ++++++++
>  .../sblim-sfcb-1.4.8-default-ecdh-curve-name.patch | 26 +++++++
>  .../sblim-sfcb/sblim-sfcb_1.4.8.bb                 | 80 ++++++++++++++++=
++++++
>  29 files changed, 853 insertions(+), 31 deletions(-)
>  create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema=
-exper_2.39.0.bb
>  create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema=
-final_2.40.0.bb
>  create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema=
/files/LICENSE
>  delete mode 100644 meta-networking/recipes-support/cim-schema/cim-schema=
_2.40.0.bb
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
0001-Fix-error.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
0001-Modify-cmakelist.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
cmpi-bindings-0.4.17-no-ruby-perl.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
cmpi-bindings-0.4.17-sblim-sigsegv.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
cmpi-bindings-0.9.5-python-lib-dir.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_=
git.bb
>  create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konk=
retcmpi-0.9.2-fix-returning-instance-from-method.patch
>  create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.=
2.bb
>  create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-networking_0=
=2E3.1.bb
>  create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers/00=
01-fix-error.patch
>  create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers_0.=
6.0.bb
>  create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.=
1.bb
>  create mode 100644 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5=
=2Ebb
>  create mode 100644 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb
>  create mode 100644 meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-=
devel/sblim-cmpi-devel-2.0.3-docdir.patch
>  create mode 100644 meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-=
devel_2.0.3.bb
>  create mode 100644 meta-oe/recipes-extended/sblim-sfcCommon/sblim-sfcCom=
mon_1.0.1.bb
>  create mode 100644 meta-oe/recipes-extended/sblim-sfcb/files/sfcb.service
>  create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/=
sblim-sfcb-1.3.15-fix-provider-debugging.patch
>  create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/=
sblim-sfcb-1.3.16-maxMsgLen.patch
>  create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/=
sblim-sfcb-1.3.16-multilib-man-cfg.patch
>  create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/=
sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
>  create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/=
sblim-sfcb-1.4.5-service.patch
>  create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.8/=
sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
>  create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.8.=
bb
>=20
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW46Y4ACgkQN1Ujt2V2gBxJkACfRv/4LoumoOHYJp+bhowgeytf
fWkAn1WlBn99FGV8WuLohYzvoQHpHHAE
=uj6/
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
