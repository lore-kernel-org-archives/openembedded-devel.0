Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB7BC4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 19:49:32 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-twisted: upgrade 22.10.0 -> 24.3.0
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Vilnius, LT (213.197.160.147)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 19 Apr 2024 12:49:25 -0700
References: <19341.1713551665064789775@lists.openembedded.org>
In-Reply-To: <19341.1713551665064789775@lists.openembedded.org>
Message-ID: <27929.1713556165630602954@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1PNpxleWiVjyT3TaIpZL"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 19:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110071

--1PNpxleWiVjyT3TaIpZL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 06:34 PM, Alper Ak wrote:

>=20
> Hi Gilbert,
>=20
> First of all, thank you for your patch.
>=20
> When sending the V2 patch, it would be great if you could also check the
> build-backend and dependencies because these seem to have changed.
>=20
> https://github.com/twisted/twisted/blob/2e59e1fb322bc4b20009443f2252ecc6d=
7c79f80/pyproject.toml#L7
>=20
>=20
> Best Regards

Thank you Alper, good catch!

TODO list I have so far for patch V2:
* Remove explicit PYPI_PACKAGE and rely on default name "twisted"
* Change python_setuptools_build_meta to python_hatchling
* Change HOMEPAGE=C2=A0from "http://www.twistedmatrix.com" to "https://twis=
ted.org"
* Move python3-pyhamcrest from python3-twisted-core to only python3-twisted=
-test (changed in Twisted 21.2.0)

--1PNpxleWiVjyT3TaIpZL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 06:34 PM, Alper Ak wrote:<br />
<blockquote>Hi Gilbert,<br /><br />First of all, thank you for your patch. =
<br /><br />When sending the V2 patch, it would be great if you could also =
check the build-backend and dependencies because these seem to have changed=
.<br /><br />https://github.com/twisted/twisted/blob/2e59e1fb322bc4b2000944=
3f2252ecc6d7c79f80/pyproject.toml#L7<br /><br />Best Regards</blockquote>
Thank you Alper, good catch!<br /><br />TODO list I have so far for patch V=
2:<br />* Remove explicit PYPI_PACKAGE and rely on default name "twisted"<b=
r />* Change python_setuptools_build_meta to python_hatchling<br />* Change=
 HOMEPAGE&nbsp;from "http://www.twistedmatrix.com" to "https://twisted.org"=
<br />* Move python3-pyhamcrest from python3-twisted-core to only python3-t=
wisted-test (changed in Twisted 21.2.0)

--1PNpxleWiVjyT3TaIpZL--

