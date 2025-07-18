Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026F8C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 15:04:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.23091.1752851083514616634
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 08:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=kMB6jDPp;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56IF4c5p735164;
	Fri, 18 Jul 2025 10:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752851078;
	bh=bgTzSZjSP9YM+k7orapfIdcg5OkTYJYEyBtqJ6R015c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kMB6jDPptF5sm9bbn0Rr4dNAec+C8lZ3YigzutGnEmigaM3KTfIHL8Su4vKTx1VRd
	 OrHmS2K0XG53mFLK0Kwy32aRBuTEQDGVrv/IwlvqlC3O/3s/vshaex1hNjxRAXaVg3
	 G4WriVvi4BH9O6ad9XAG545MUPuAPvJUnbMLmSeA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56IF4ccM1096039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 18 Jul 2025 10:04:38 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 18
 Jul 2025 10:04:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 18 Jul 2025 10:04:34 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56IF4YNB3998954;
	Fri, 18 Jul 2025 10:04:35 -0500
Message-ID: <837596c3-0e05-4dda-9a4e-6317b77b315d@ti.com>
Date: Fri, 18 Jul 2025 10:04:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [oe] [meta-oe][master][PATCH 1/2] ktx-software:
 Add recipe v4.4.0
To: Ross Burton <Ross.Burton@arm.com>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20250717195712.2538506-1-a-christidis@ti.com>
 <20250717195712.2538506-2-a-christidis@ti.com>
 <954162A2-F72C-4EB2-B340-D4B709F2D8EF@arm.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <954162A2-F72C-4EB2-B340-D4B709F2D8EF@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 56IF4c5p735164
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 15:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118630

Dear Mr Burton,

Thank you for the feedback ! I've implemented my changes and just=20
emailed a v2.

Kind Regards,

Antonios

On 7/17/25 4:14 PM, Ross Burton wrote:
> On 17 Jul 2025, at 20:=E2=80=8A57, Antonios Christidis via=20
> lists.=E2=80=8Aopenembedded.=E2=80=8Aorg=20
> <a-christidis=3Dti.=E2=80=8Acom@=E2=80=8Alists.=E2=80=8Aopenembedded.=E2=
=80=8Aorg> wrote: > >=20
> +LIC_FILES_CHKSUM =3D=20
> "file:=E2=80=8A//LICENSES/Apache-2.=E2=80=8A0.=E2=80=8Atxt;md5=3D0f9cda=
00f501b4995fb04b5a5d896060"=20
> > +LIC_FILES_CHKSUM
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uXdrPbcPVq1VCkXK_=
DPNv9gWQ_zx0TCavHxQzT66vgoXPffw_hc7UeFZm6-mle0j8911K3f2Z-ofH3gv-otHbVdNf3=
GEVw$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On 17 Jul 2025, at 20:57, Antonios Christidis via lists.openembedded.or=
g <a-christidis=3Dti.com@lists.openembedded.org> wrote:
> >=20
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/Apache-2.0.txt;md5=3D0f9cda00f=
501b4995fb04b5a5d896060"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/BSD-1-Clause.txt;md5=3D2d02971=
24cf897c3dd4bab7bd7912adf"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/BSD-2-Clause.txt;md5=3D1682a4c=
99124cbf1ddb401224ace3c9a"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/BSD-3-Clause.txt;md5=3D5fef900=
6fcd0a605932b72918e7a2a8f"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/BSL-1.0.txt;md5=3De4224ccaecb1=
4d942c71d31bef20d78c"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/CC-BY-3.0.txt;md5=3D8a2ab71e29=
14c55986c228f0713fa7c1"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/CC-BY-4.0.txt;md5=3Dbef932701f=
4aa5f6295ee7ab0f178fa1"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/CC0-1.0.txt;md5=3D63a27073ad0b=
2673cf8d55b9e6e93971"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/MIT.txt;md5=3D38aa75cf4c4c87f0=
18227d5ec9638d75"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/Zlib.txt;md5=3D29cdb8962f7c50a=
53723ba132dd0f487"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/LicenseRef-Cesium-Trademark-Te=
rms.txt;md5=3De726b098fa91a5d873290df256cee9d3"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/LicenseRef-ETCSLA.txt;md5=3D0c=
10bc2148b5cc349d931e78b1d5d2a7"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/LicenseRef-HI-Trademark.txt;md=
5=3Dd941219d000396780f9c851f062a9be7"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/LicenseRef-Kodak.txt;md5=3Dd56=
356a4481789b9a0361b68b87df97d"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/LicenseRef-PNGSuite.txt;md5=3D=
8d31bcaab4e0ce8a1be335f4931ea942"
> > +LIC_FILES_CHKSUM =3D "file://LICENSES/LicenseRef-fmt.txt;md5=3Db9257=
785fc4f3803a4b71b76c1412729=E2=80=9D
>
> You don=E2=80=99t need to checksum every licence text (especially stand=
ard texts like the Apache-2.0), but instead the file that actually declar=
es what files are licensed what. This could be a top-level LICENSE.txt, o=
r a comment in a representative source file.
>
> In this case, it's probably the reuse.toml.
>
> Ross

