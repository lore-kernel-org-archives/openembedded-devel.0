Return-Path: <mns@gomspace.com>
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40138.outbound.protection.outlook.com [40.107.4.138])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF657F8A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 08:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EeCF6M2/wZKoY2cn7WpAGl2l+09nhD8WGGaW3/Z6od4JrD8OXv3uipo/dMesfxFTO2gfncCg8r10elCWnQw3u/WWbmW6+xTq+FGpJN7KN8VyLqi+zWTqpS2Ctnud5ns5pVzyUeMkgipGs082C/U3d63OaGA84b8tWI165a81NvVUyx4GIp0EFItS55p/IjfR/CeiUepJIn+18GlTjYFD/s0n66SHVwCAYH34QqyDikxKjP/12QOHgFVMYPsyCOzDpBdpiSKJd2bYObtn9WGbFJ+bU8/8VcpszPvLqX28RTLfohOB//dF+NDYkoUN+WliyQfG/fXUkeDRsno87reV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DuV0cWj4j3WO/iY0Bo13l3iXSk7koNICq+bbOaqDyTU=;
	b=Oe6OL3X76TkRFpeCM4J+L1LjMVrqE+2zaR2Nc8GYlCHsQ/15Fq+YKlvzuHToS7KTXhw/bxMFV6FmxuECgmHul/7+Y6YJ1KmalvSBi/LQEV0MyzzBhl1SRizaO4vuchh28CDLNm9bzXVw2kM96tBtiKVn1HKs7R04Io3DrvLdWzIWb+BkaDBH/njaRTh7VnirJjl/e0nFOkj5PTNQpjsiLDU+6XPyxKAd/jxfv+RMv2Qz/tab0LGXPBkv6avU0tQzGyP0CVh/8JjBRCd0C/tZ3RUmhzTzf/asMPGcKMmzV/3epw/ie+k3TzeXUbB3dBoccnvpdNqp/r1X0d7v1KHasQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DuV0cWj4j3WO/iY0Bo13l3iXSk7koNICq+bbOaqDyTU=;
	b=wV+c1thiwUC/wpIHVu5eWURxv0U0Cge+irP6muYXXM3Wtkp3JPFE4wJ/O8+n2Stdk+YFAguVi7c2EOmgjlA1Okb6rsP9Fhc3UWkvz3ApW99NEBv4Ny2MPY9QTHnatVNnDmERZJYtkDAPNGmHkAhswQ+r7ZBC3h0Wd7PuQ9cC78w=
Received: from VI1PR08CA0200.eurprd08.prod.outlook.com (2603:10a6:800:d2::30)
	by AM0PR08MB3603.eurprd08.prod.outlook.com (2603:10a6:208:e2::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20;
	Thu, 7 Nov 2019 08:52:59 +0000
Received: from VE1EUR01FT008.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e01::206) by VI1PR08CA0200.outlook.office365.com
	(2603:10a6:800:d2::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via
	Frontend Transport; Thu, 7 Nov 2019 08:52:58 +0000
Authentication-Results: spf=fail (sender IP is 79.171.149.172)
	smtp.mailfrom=gomspace.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=gomspace.com;
Received-SPF: Fail (protection.outlook.com: domain of gomspace.com does not
	designate 79.171.149.172 as permitted sender)
	receiver=protection.outlook.com; client-ip=79.171.149.172;
	helo=gomspace.com; 
Received: from gomspace.com (79.171.149.172) by
	VE1EUR01FT008.mail.protection.outlook.com (10.152.2.67) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.20.2430.22 via Frontend Transport; Thu, 7 Nov 2019 08:52:58 +0000
Received: from Ex01.gomspace.lan (10.0.1.60) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Thu, 7 Nov 2019 09:52:58 +0100
Received: from Ex01.gomspace.lan ([fe80::21fc:471c:6190:5f20]) by
	Ex01.gomspace.lan ([fe80::21fc:471c:6190:5f20%4]) with mapi id
	15.01.1466.003; Thu, 7 Nov 2019 09:52:58 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: Adrian Bunk <bunk@stusta.de>
Thread-Topic: [oe] [meta-oe,thud][PATCH 0/6] libiio: backports from master
Thread-Index: AQHVk9Czfzm5XOy1Sk2Wglb3BDW9T6d8iOQAgAAAtwCAAVPKJIAAiL4AgAD901I=
Date: Thu, 7 Nov 2019 08:52:58 +0000
Message-ID: <074a439a39f44236975804c89e7cdc7a@gomspace.com>
References: <20191105120031.6579-1-mns@gomspace.com>
	<20191105135512.GB20425@localhost> <20191105135746.GC20425@localhost>
	<ac4526ac0f8848e2b7984e032f11dc29@gomspace.com>,
	<20191106182320.GA14721@localhost>
In-Reply-To: <20191106182320.GA14721@localhost>
Accept-Language: en-US, da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.8.211]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(396003)(39830400003)(376002)(346002)(136003)(1110001)(339900001)(189003)(199004)(316002)(8676002)(47776003)(76130400001)(5660300002)(508600001)(486006)(446003)(70206006)(11346002)(6116002)(356004)(8936002)(6916009)(70586007)(2616005)(476003)(8746002)(36756003)(23756003)(33026002)(2906002)(4326008)(81166006)(336012)(81156014)(14444005)(186003)(86362001)(108616005)(24736004)(126002)(76176011)(14454004)(7736002)(26005)(50466002)(305945005)(6306002)(21086003)(102836004)(105606002)(26826003)(3846002)(40036005)(229853002)(53416004)(966005)(6246003)(142933001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR08MB3603; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad9641a2-5d9b-48a3-e7d8-08d7635fe3a5
X-MS-TrafficTypeDiagnostic: AM0PR08MB3603:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <AM0PR08MB36030BD84D52CE7BE899D0D9C4780@AM0PR08MB3603.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9EQqE+zVf7gMccDp/2As00k+G6mKGvzjzdG1y/cqFzF3YFmNBJkZaKpnK5YyNJEb79BIiB3uSfDgD3J5uHGLC2jCWOE+IK5wfXkSVueqkarENv5PVTzf6dN5zmMC2E3Hb2IP6REAAeLpODfNzcR2jt5w1h+4lGYZ3YFGUprB+RLVexuQwume4Jz64x6/HxE11WcyQlLPyCSuEXQP5KZUE2MgB2hm8BF4Gl7KAZg0/oPF7flfoAZk9QlZ/aMEuuBDTu+oBLB7JIlPA60PupIJ9Y4EYzYF7h1WPtd28t3z+KXh30cJJYvGkXHpfFF7TPcq3Fy99KDLhipeUNgNsu1MZe6whh8mocxPsXLmkVYRCF381WQRHNQLK2vNl3mpksDhwVowGJ47hTTflCnBaCHAYssuWiftgClmIKQQ9tokDlckU3oQRk1COke2DJ1D1maOVXq64vZrZ1UQyyXF0sozUm+5i32EddpTjazAhLKAvdE=
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 08:52:58.7537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9641a2-5d9b-48a3-e7d8-08d7635fe3a5
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3603
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe,thud][PATCH 0/6] libiio: backports from master
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
X-List-Received-Date: Thu, 07 Nov 2019 08:53:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 09:14:46AM +0000, Martin Siegumfeldt wrote:
> Hi Adrian,

Hi Martin,

> I see - can you please confirm that this constraint applies to Zeus and W=
arrior (which is also stable according to https://wiki.yoctoproject.org/wik=
i/Releases)

I do not have any special authority on that, but [1] applies to all
stable branches (including warrior and zeus).

> What I am trying to achieve (from the thud baseline) is to get libiio pyt=
hon3 bindings built. Now, most of the variables from libiio_git.bb can be o=
verridden in an append file, except for the 'inherit pythonnative' statemen=
t that dictates python2 bindings to be packaged. AFAICS, this leaves me wit=
h the only option of, not appending, but to define my own (.bb) recipe in m=
y layer taking precedence over the one from meta-openembedded - a suboptima=
l solution I guess.
>
> Anything I am missing?

One main purpose of a stable branch is that a user upgrading on a
stable branch should get bugfixes and especially security fixes,
but no regressions.

When you create your distribution or upgrade to a different Yocto stable
branch you might get breaking changes and things you are using might break,
but this is not supposed to happen on a stable branch.

If you need to backport functionality from more recent series you can
always backport this into your layer. I usually have a recipes-backport/
in my layer that contains functionality backported from more recent
series, in this case I would have a recipes-backport/libiio/libiio_git.bb
with the recipe copied from the current master. Once you upgrade your
layer to Yocto >=3D 3.1 you will be able to drop this backport.

This might sound like a suboptimal solution to you, but it avoids the
risk of breaking anything for the many other users of this stable series.

> Thanks,
> Martin

cu
Adrian

[1] https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance#Policies

--

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

Hi Adrian,

I understand - I'll probably go for the 'recipes-backport' approach.

Thanks,
Martin=

