Return-Path: <danc@opengear.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2E361558
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 12:06:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=TyJFivCzK/vrm9nUkQ2XpD5qta67EwCaDq8R50uZA8LrmmRdTOc2vUTYTXDTPuxj2VqrocMFG56L/IaM/Gh4WkC39yAMeavAI3mLOPGGlPO3tMGyjSLfwBeycaRq0kog8ureXDG8FBBwRS+cWbIL+njM77MOzootIJBs1jTlOipJ5HI3POCWEny+H9X8cfMEDASTCHV26Vy9nbXotXxlilHb6WMDd+UY1d2tu2J0RXHa01mMit1taFTQLr5RJNre63L3XXfnX/qgLOclbfdhRtCVHyewt5wUq4+MUYJTJgqjjCgW5u4PZZCJ0rIlzOjvMvaIjfnpy4MFEI32jcBI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Gs9Tgby7Oqix5nG3Z5J3ASz+Qeym+a//8C7dKvf/G3I=;
	b=lbbNqoIy/qjL3ogRBCiVppKVk8ajk0GTYskUux+EiaMzwY0MLosexIA2OeImIwXfHrjDwGPmVSXZD6TefB6B5zroHsOOkic0mcZnoryG9L6R90VbrV9nJ2M1H6wB6svdM4rzEBsQEeQ022FNkqTuN2drOKF4WtxCLFHsoL0QfVezEK30HV2+q2IGhP6ap3zHwmg5gY9irJb2n3QsgzTVxwpeLl6eQv1psScPyVxrBxrm0d/AqTmoCoZO3uHoKoGUtwRRDirkMUp7oMGojcJlveVcXjmii6U3WxRwcfJSpVODh18u++fVg1kvBriRS7qznOhznYMQlywtOQ6wMZkC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	60.241.24.90) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Gs9Tgby7Oqix5nG3Z5J3ASz+Qeym+a//8C7dKvf/G3I=;
	b=IQBYyiCWKX37K0S7nDEIBw3CY3dOi8bEfvSfJtNdrjV2pP47eMLuj4YFn5W2mEKkNeq1almm/f8rHYTyo8Rc6n1JuEMz1i93+FV6LkROsophd5AU6ym+3NA71yVrr+hqVY1bHj5ROSStw99TRn1RJ/2Yt1jFvGrohMaTV9iTR0w=
Received: from SN4PR0701CA0014.namprd07.prod.outlook.com
	(2603:10b6:803:28::24) by SN6PR1501MB2176.namprd15.prod.outlook.com
	(2603:10b6:805:10::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23;
	Wed, 19 Feb 2020 12:06:47 +0000
Received: from SN1NAM04FT055.eop-NAM04.prod.protection.outlook.com
	(2603:10b6:803:28:cafe::d4) by SN4PR0701CA0014.outlook.office365.com
	(2603:10b6:803:28::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via
	Frontend Transport; Wed, 19 Feb 2020 12:06:47 +0000
Authentication-Results: spf=pass (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=opengear.com;
Received-SPF: Pass (protection.outlook.com: domain of opengear.com designates
	60.241.24.90 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=60.241.24.90; helo=postman.bne.opengear.com;
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT055.mail.protection.outlook.com (10.152.89.20) with Microsoft
	SMTP Server id 15.20.2729.22 via Frontend Transport;
	Wed, 19 Feb 2020 12:06:46 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id B614FF25A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 22:06:43 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 9BC9D422E2C0; Wed, 19 Feb 2020 22:06:43 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
In-reply-to: <1d4e0221-9376-b5e5-9a85-9c59559e0c43@gmail.com>
References: <20200211060834.19790-1-dan.callaghan@opengear.com>
	<20200211060834.19790-2-dan.callaghan@opengear.com>
	<1d4e0221-9376-b5e5-9a85-9c59559e0c43@gmail.com>
Date: Wed, 19 Feb 2020 22:06:16 +1000
Message-Id: <1582113683-sup-6451@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:; CTRY:AU; EFV:NLI; SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39850400004)(199004)(189003)(44832011)(6916009)(8936002)(8676002)(6266002)(6666004)(356004)(966005)(478600001)(53546011)(5660300002)(33964004)(2906002)(70586007)(426003)(42186006)(36906005)(235185007)(7636002)(21480400003)(336012)(70206006)(246002)(316002)(26005)(186003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR1501MB2176;
	H:postman.bne.opengear.com; FPR:; SPF:Pass; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b09a4e97-d2c6-4fb8-64fc-08d7b534319f
X-MS-TrafficTypeDiagnostic: SN6PR1501MB2176:
X-Microsoft-Antispam-PRVS: <SN6PR1501MB2176C0E15B075C3B99F9ACA4B8100@SN6PR1501MB2176.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0318501FAE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Q449UXeJr9WeBs7NEv6K4wzsjWOrZ6sHUvJFfvHCw0pg9dLI1NedYgBOu78PGHEZY2scQGemNKYi8oTsAOzVMq+EttZVq9R82XVDt40PeDs6Tp38bH99AyjwMWlhfLk5FLdoK0+sALdfGA7YB+1wSQcjvVwODQtvx64Nf3roOcydBRR8foJr4a9HBWQZQNs+RvQIKY9fMKj5m3nLI7DvkNkp/iVWz4tI/ZyPQB06KvHp4zKl45NqUHFh3ccKAEyvpXHOc7KKXsRSOFjcOpzoyOyYhzxdN9WPFBFRyjF8nJUXMWYlRYz9qTy0mX1Czoj+7vrnQC0yqe113z1cSxXYyTBeJQTc7VK5di74ltSlShhSvofa1uWmx6cuWwcYvH9kEA4Ks5oigI3K4x1OXz0UfK0ejJ0ARAP2TpKVGG0qa/QlhMrqaJ1OFkPhq5rXt1mQhhkJein/78QxsaUCq4qPYIQ5E/kUUaNoJ8WDeiiw1zpox7VyXv94hVXeRZMCHoUTUk3GmqNAm1AEbpsdbh6aA==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2020 12:06:46.7623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b09a4e97-d2c6-4fb8-64fc-08d7b534319f
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR1501MB2176
Subject: Re: [meta-networking][PATCH 2/2] quagga: install tmpfiles snippet to /usr/lib/tmpfiles.d
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
X-List-Received-Date: Wed, 19 Feb 2020 12:06:48 -0000
X-Groupsio-MsgNum: 82907
Content-Transfer-Encoding: 8bit
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha256"; boundary="=-1582114003-615983-3709-9506-1-="

--=-1582114003-615983-3709-9506-1-=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from Khem Raj's message of 2020-02-11 16:44:45 -08:00:
> On 2/10/20 10:08 PM, Dan Callaghan wrote:
> > Package-owned tmpfiles snippets belong in /usr/lib/tmpfiles.d,
> > /etc/tmpfiles.d is for administrator customisations.
> >
> > Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> > ---
> >   meta-networking/recipes-protocols/quagga/quagga.inc | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/me=
ta-networking/recipes-protocols/quagga/quagga.inc
> > index 2673a8976..f35b27160 100644
> > --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> > +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> > @@ -116,9 +116,9 @@ do_install () {
> >       done
> >
> >       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', '=
false', d)}; then
> > -        install -d ${D}${sysconfdir}/tmpfiles.d
> > +        install -d ${D}${nonarch_libdir}/tmpfiles.d
> >           echo "d /run/quagga 0755 quagga quagga -" \
> > -        > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> > +        > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
> >       fi
> >
> >       # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
> >
> =

> Fails packaging
> =

> ERROR: QA Issue: quagga: Files/directories were installed but not
> shipped in any package:
>    /usr/lib/tmpfiles.d
>    /usr/lib/tmpfiles.d/quagga.conf
> =

> =

> http://errors.yoctoproject.org/Errors/Details/390597/

Oops. I will send an updated patch.

I wonder if OE-Core should have a directory variable similar to =

${systemd_system_unitdir}, say ${systemd_tmpfilesdir}, and put it in the =

global FILES list? Right now the recipes in meta-oe use a mixture of
${sysconfdir}/tmpfiles.d and ${libdir}/tmpfiles.d...

On second thought I am not quite sure if it should be ${nonarch_libdir} =

or ${libdir}. I can't see anywhere that the systemd recipe explicitly =

configures that directory at build time, but in our product
systemd-tmpfiles winds up looking in /usr/lib/tmpfiles.d which I assumed =

was ${nonarch_libdir}/tmpfiles.d.

-- =

Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

--=-1582114003-615983-3709-9506-1-=
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8/IWiXUxKipVpVyoQuSr4gkXmaQFAl5NJLgACgkQQuSr4gkX
maQ6ehAAjPzdasM+o1cA/9kjHgST0vZI+vAUrrGtwX2f3YHokhKXNw8vOshzljdP
pSrzO3yCVz9NuR5p3uzNR0CHiWvO8u6gtHTD7iOd5Xzai5JChFRIxN4ASYL6n8bk
mmCaoAtdTf7AslQ89BW9okerAPSLKO3weO73Cjpi5Z8QRiZi0KcG6MZ7f1hgG3IY
ae2uvBwOTEbcNGLh1YBYH+5QwmbWcX67yvZj33Ct6fu53lHlbvLdHN0f06kWELYF
vIIrw2zQPjLOvB8K8j2zYjk9AKyN2UZE39Idcw8MLiLMnpmsl6YuugsEgzdNp+ca
9xIf38ZFtjkhhDLeS2Sww8ihXPloVajeIr1ai629Ku8iqnmvWBBi7JU4tFORt5mk
dpKgN7KVBrB9l7+V61J7xT+qcEItVsh4FlPfgoNPbADAw6qrhJlB+RQwyEThsMHL
IiDtpTU3Guz0aMFpzhGk0UWgxFc5CBwdXSJZwQnptraSlfhHGsUiotc0TqBWtiHF
zXQu7n65S0JPh+VQA13CF0QicFf6XnNQvX53UClpSu/gwHcFeOlaAo2Q0xcCU32R
ytqRMe5+lEjVUtbX2K6P831xqMjJNWeUWVyioEH4scpTQBtUkCdiaKxQBUO92JUw
R99nTu3edRPDbenzC5LP9JKcmg3blKayxBGAM/ZuzOP79d8s1xw=
=es/v
-----END PGP SIGNATURE-----

--=-1582114003-615983-3709-9506-1-=--
