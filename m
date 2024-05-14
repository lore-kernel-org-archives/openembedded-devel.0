Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCDAC04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 15:38:04 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.19094.1715701080305378218
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 08:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 44EFavrv007168;
	Tue, 14 May 2024 10:36:57 -0500
Received: from [192.168.3.156] ([192.168.3.156])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 44EFauAR025269;
	Tue, 14 May 2024 10:36:57 -0500
Message-ID: <9f3e2f66-0ef3-497f-9eb0-97fa35861eeb@kernel.crashing.org>
Date: Tue, 14 May 2024 10:36:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][scarthgap][PATCH 1/2] python3-twisted: remove
 obsolete python3-twisted-flow
Content-Language: en-US
To: =?UTF-8?Q?Gu=C3=B0ni_M=C3=A1r_Gilbert?= <gudnimar@noxmedical.com>,
        openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20240506185443.3715-1-gudnimar@noxmedical.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20240506185443.3715-1-gudnimar@noxmedical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 44EFavrv007168
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 15:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110395

I see this change made it into meta-openembedded master.  But hasn't been=
 pushed=20
to scarthgap yet.

I've having a problem with this recipe in scarthgap, and so far it looks =
like=20
these two changes do fix the problem I'm having.

The two commits I cherry-picked back to scarthgap and tested are:

bd1b5cde348dbc20e3d332de69617a8a95fe5ff3 - python3-twisted: prepend split=
 PACKAGES

3fd6f0feec002c85df23b37c04d745a43674ee66 - python3-twisted: remove obsole=
te=20
python3-twisted-flow

This resolves the issue I was having.

--Mark

On 5/6/24 1:54 PM, Gu=C3=B0ni M=C3=A1r Gilbert wrote:
> The flow module was removed in Twisted 9.0.0 a long time
> and currently does not install anything. Let's remove it
> to cleanup the recipe.
>=20
> This commit also removes python3-twisted-news package because
> the source files were removed in Twisted 21.2.0. All other
> files which no longer exist in the source are also removed from FILES.
>=20
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> .../python/python3-twisted_24.3.0.bb | 18 ------------------
> 1 file changed, 18 deletions(-)
>=20
> diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0=
.bb=20
> b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
> index e5223ccd6..ba5bb04db 100644
> --- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
> @@ -22,11 +22,9 @@ PACKAGES +=3D "\
> ${PN}-conch \
> ${PN}-mail \
> ${PN}-names \
> - ${PN}-news \
> ${PN}-runner \
> ${PN}-web \
> ${PN}-words \
> - ${PN}-flow \
> ${PN}-pair \
> ${PN}-core \
> "
> @@ -66,11 +64,9 @@ RDEPENDS:${PN}-test =3D "${PN} python3-pyhamcrest"
> RDEPENDS:${PN}-conch =3D "${PN}-core ${PN}-protocols python3-bcrypt=20
> python3-cryptography python3-pickle"
> RDEPENDS:${PN}-mail =3D "${PN}-core ${PN}-protocols"
> RDEPENDS:${PN}-names =3D "${PN}-core"
> -RDEPENDS:${PN}-news =3D "${PN}-core ${PN}-protocols"
> RDEPENDS:${PN}-runner =3D "${PN}-core ${PN}-protocols"
> RDEPENDS:${PN}-web +=3D "${PN}-core ${PN}-protocols"
> RDEPENDS:${PN}-words +=3D "${PN}-core"
> -RDEPENDS:${PN}-flow +=3D "${PN}-core"
> RDEPENDS:${PN}-pair +=3D "${PN}-core"
>=20
> FILES:${PN}-test =3D " \
> @@ -152,12 +148,6 @@ FILES:${PN}-names =3D " \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/names \
> "
>=20
> -FILES:${PN}-news =3D " \
> - ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_news.py* \
> - ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_news*.=
pyc \
> - ${PYTHON_SITEPACKAGES_DIR}/twisted/news \
> -"
> -
> FILES:${PN}-runner =3D " \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_runner.py* \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_runner*.=
pyc \
> @@ -176,15 +166,7 @@ FILES:${PN}-words =3D " \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/words \
> "
>=20
> -FILES:${PN}-flow =3D " \
> - ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_flow.py* \
> - ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_flow*.=
pyc \
> - ${PYTHON_SITEPACKAGES_DIR}/twisted/flow \
> -"
> -
> FILES:${PN}-pair =3D " \
> - ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_pair.py* \
> - ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_pair*.=
pyc \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/pair \
> "
>=20
> --=20
> 2.34.1
>=20
>=20
> Warning: Copyright Nox Health. This communication is confidential and m=
ay=20
> contain privileged information. By the use of email over the Internet o=
r other=20
> communication systems, Nox Health is not waiving either confidentiality=
 of, or=20
> legal privilege in, the content of the email and of any attachments. If=
 the=20
> recipient of this message is not the intended addressee, please call No=
x Health=20
> immediately by calling (+1) 888.505.0280
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110261): https://lists.openembedded.org/g/openembed=
ded-devel/message/110261
> Mute This Topic: https://lists.openembedded.org/mt/105945946/3616948
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

