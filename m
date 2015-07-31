Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 878127646B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 13:47:38 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so32908538wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 06:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ikaX4OKy4k3aiwKXLCZpiWV73k4sMs5ztdbfxnYCn2I=;
	b=eyMaBTyZhkD3DO7RF/E6M20qFSGyJFa6QyzHw6l3BmpeY8SeBJMYGWdXPYNzh5IcQ0
	A+ekXWiSWQlzuETQhDv+NKlZV4hCtsa1e/GejSPmI6VYP28cheJFW3l1dARGCxAyhZnO
	bVIzXAK/mz5nSFALsafesSpBzT45WhKKreWx6Vla0p8o6VAO23DF3eA1PuwwMYmgRmdL
	JRI1XnevQhmv8dXGgIw+7DotlprCf1cyTwbJP+OQEFY/5ATgf2bF7JTAsiTNI7eOnOmp
	n/tWLhy3hxcYBu96XDZ0N123xQUptdb7q8ecacVAzZa//0P/HPik0QlXU7HthE/7zAnI
	puQQ==
X-Received: by 10.180.19.65 with SMTP id c1mr6919427wie.15.1438350458635;
	Fri, 31 Jul 2015 06:47:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id ib9sm7324571wjb.2.2015.07.31.06.47.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jul 2015 06:47:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 31 Jul 2015 15:47:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150731134759.GA2460@jama>
References: <1438310864-15716-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1438310864-15716-1-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v3 0/8] add openlmi and it's depends
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
X-List-Received-Date: Fri, 31 Jul 2015 13:47:40 -0000
X-Groupsio-MsgNum: 56485
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2015 at 10:47:36AM +0800, Lei Maohui wrote:
> OpenLMI  =3D Open Linux Management Infrastructure.
> OpenLMI is open-source project aiming to improve management of Linux syst=
ems using WBEM standards.
>=20
> Lei Maohui (8):
>   pywbem:add new recipe
>   sblim-cmpi-devel: add  new recipe
>   cmpi-bindings: add new recipe
>   konkretcmpi: add new recipe for openlmi
>   sblim-sfcCommon: add new recipe
>   sblim-sfcb: add new recipe for openlmi
>   cim-schema-exper: add new recipe for openlmi
>   openlmi: add openlmi and it's depends

Some of these were merged to master yesterday, can you please rebase and
send only remaining recipes (and possibly some follow-up patches if
needed)?

>=20
>  .../cim-schema/cim-schema-exper_2.39.0.bb          |  26 ++
>  .../cim-schema/cim-schema-final_2.40.0.bb          |  31 +++
>  .../cim-schema/cim-schema/files/LICENSE            |  34 +++
>  .../cim-schema/cim-schema_2.40.0.bb                |  31 ---
>  .../cmpi-bindings/0001-Fix-error.patch             |  26 ++
>  .../cmpi-bindings/0001-Modify-cmakelist.patch      |  41 ++++
>  .../0001-fix-build-error-when-the-swig-3.0.6.patch | 268 +++++++++++++++=
++++++
>  .../0001-fix-the-build-error-when-python-3.0.patch |  31 +++
>  .../cmpi-bindings-0.4.17-no-ruby-perl.patch        |  44 ++++
>  .../cmpi-bindings-0.4.17-sblim-sigsegv.patch       |  22 ++
>  .../cmpi-bindings-0.9.5-python-lib-dir.patch       |  17 ++
>  .../cmpi-bindings/cmpi-bindings_git.bb             |  37 +++
>  .../konkretcmpi/konkretcmpi-native_0.9.2.bb        |  27 +++
>  ...-0.9.2-fix-returning-instance-from-method.patch |  38 +++
>  .../konkretcmpi/konkretcmpi_0.9.2.bb               |  32 +++
>  .../openlmi/openlmi-networking_0.3.1.bb            |  29 +++
>  .../openlmi/openlmi-providers/0001-fix-error.patch |  26 ++
>  .../openlmi/openlmi-providers_0.6.0.bb             |  54 +++++
>  .../openlmi/openlmi-storage_0.8.1.bb               |  31 +++
>  .../openlmi/openlmi-tools_0.10.5.bb                |  23 ++
>  meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb    |  36 +++
>  .../sblim-cmpi-devel-2.0.3-docdir.patch            |  17 ++
>  .../sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb     |  18 ++
>  .../sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb       |  25 ++
>  .../recipes-extended/sblim-sfcb/files/sfcb.service |  11 +
>  .../sblim-sfcb-1.3.15-fix-provider-debugging.patch |  12 +
>  .../sblim-sfcb-1.3.16-maxMsgLen.patch              |  14 ++
>  .../sblim-sfcb-1.3.16-multilib-man-cfg.patch       |  41 ++++
>  ...blim-sfcb-1.3.9-sfcbrepos-schema-location.patch |  42 ++++
>  .../sblim-sfcb-1.4.5-service.patch                 |  27 +++
>  .../sblim-sfcb-1.4.8-default-ecdh-curve-name.patch |  26 ++
>  .../sblim-sfcb/sblim-sfcb_1.4.8.bb                 |  82 +++++++
>  32 files changed, 1188 insertions(+), 31 deletions(-)
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
0001-fix-build-error-when-the-swig-3.0.6.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
0001-fix-the-build-error-when-python-3.0.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
cmpi-bindings-0.4.17-no-ruby-perl.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
cmpi-bindings-0.4.17-sblim-sigsegv.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
cmpi-bindings-0.9.5-python-lib-dir.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_=
git.bb
>  create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi-nati=
ve_0.9.2.bb
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

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW7fHwACgkQN1Ujt2V2gBymRQCeJUR9gLaTS3PwJN0D2v0yahiX
cbYAn2Zlm46p2gx+4LC2W6Mra4sd8gnx
=SH9N
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
