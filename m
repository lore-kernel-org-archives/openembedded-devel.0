Return-Path: <mns@gomspace.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130107.outbound.protection.outlook.com [40.107.13.107])
	by mail.openembedded.org (Postfix) with ESMTP id 87FEF7DAFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 09:14:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=eNBlzJA9SdY3thGQzwFHS/m7hfGTpLFK3WCfJGMHFlo806L2hGymHVJ1QCaCNuiBpDOIhbS8GJ2nLNIiDFCUxy66GDqb8JXH99vX0Jif0IfGpgj3Moa9ZBajCJsznq1qj2SddMNYs1Wi/rnvtUBvx/vOMZOC+sXYJ4qbP6Zt11/K1XuS/3D1gixCuzbn5CDI+nKEOnEbc4GvIGiPxwNsiUZZFIpafEis/vkfpuaylylO5x35Fh/ypBJ0fCyaO1NTIAnMQ6sYMIe9+eHYF1fWbJqnfHXXl5Z5f8vz2g2SJGGmqKShN+rijm9qlpZEaywf1iHNTpyYe0tBv5Jnmw3gMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mJ9RGEQl8kjJwxReATSqNmfdVFP51fczgEPffUhp6AE=;
	b=hEcLvuQwB5Ff/CDWCMT88U0srMdICUlFGVaNSeKFNJWxyceNqkKo61CaBNjFOtwG2fu5o4IRoHGP2qnxlI5hKL/uzqb81K9al4OvS9EaBxr8Po1KRbW4cZddmYpFXqKeIF8N7uTZHIFMVezoIL+C4G5ZZ6JK+YBKzRqtD49p2Voxrsx+DeGnHUU3dMmWxU7O3SZ8wtXszQtvJkLqE1lnzAqeEDIw2YSRY/kebhnCcIo3hxZiLVVe4tqwHjMSDu3SpgoAS1GZwn7he6Pmc+kTIthWt1J1F+r2k6vBt4/zgTnG0iZ+Njn+defNZk+bosfm7Z8DCq95Z0PuLYMB90pnbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mJ9RGEQl8kjJwxReATSqNmfdVFP51fczgEPffUhp6AE=;
	b=U8yIKthSpuuZ634N1tbqzDYe7/y6GYMd8DfHmwZBdoxcMI1VjY9DUKMncPxprfEj8MSE4k4labFZj2WvKntzS6+srmFOQmepSF/Vkzp+50TGUrg8OKOX1DjYfZ/YMcj13EgJv1yWQ7gsVt7PAY439XKrhm+KJhTEMFFIV794s0A=
Received: from DB7PR08CA0005.eurprd08.prod.outlook.com (2603:10a6:5:16::18) by
	DBBPR08MB5222.eurprd08.prod.outlook.com (2603:10a6:10:dc::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Wed, 6 Nov 2019 09:14:49 +0000
Received: from HE1EUR01FT029.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::203) by DB7PR08CA0005.outlook.office365.com
	(2603:10a6:5:16::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via
	Frontend Transport; Wed, 6 Nov 2019 09:14:49 +0000
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
	HE1EUR01FT029.mail.protection.outlook.com (10.152.0.155) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.20.2387.20 via Frontend Transport; Wed, 6 Nov 2019 09:14:48 +0000
Received: from Ex01.gomspace.lan (10.0.1.60) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Wed, 6 Nov 2019 10:14:46 +0100
Received: from Ex01.gomspace.lan ([fe80::21fc:471c:6190:5f20]) by
	Ex01.gomspace.lan ([fe80::21fc:471c:6190:5f20%4]) with mapi id
	15.01.1466.003; Wed, 6 Nov 2019 10:14:46 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: Adrian Bunk <bunk@stusta.de>
Thread-Topic: [oe] [meta-oe,thud][PATCH 0/6] libiio: backports from master
Thread-Index: AQHVk9Czfzm5XOy1Sk2Wglb3BDW9T6d8iOQAgAAAtwCAAVPKJA==
Date: Wed, 6 Nov 2019 09:14:46 +0000
Message-ID: <ac4526ac0f8848e2b7984e032f11dc29@gomspace.com>
References: <20191105120031.6579-1-mns@gomspace.com>
	<20191105135512.GB20425@localhost>,<20191105135746.GC20425@localhost>
In-Reply-To: <20191105135746.GC20425@localhost>
Accept-Language: en-US, da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.8.211]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(136003)(346002)(396003)(376002)(39840400004)(1110001)(339900001)(189003)(199004)(21086003)(70206006)(356004)(70586007)(8746002)(50466002)(5660300002)(305945005)(4326008)(7736002)(8676002)(6246003)(126002)(966005)(508600001)(476003)(36756003)(81156014)(81166006)(40036005)(316002)(108616005)(86362001)(105606002)(53416004)(336012)(14454004)(6306002)(6116002)(33026002)(26826003)(486006)(6916009)(102836004)(446003)(2906002)(2616005)(76130400001)(11346002)(23756003)(14444005)(229853002)(47776003)(26005)(3846002)(76176011)(24736004)(8936002)(186003)(142933001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DBBPR08MB5222; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa48ddf2-04df-4a28-e7f7-08d76299c5fe
X-MS-TrafficTypeDiagnostic: DBBPR08MB5222:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DBBPR08MB52227065B95B39472EFE7B99C4790@DBBPR08MB5222.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KMrFBVp829DnkWOkMwa6M2B3Y5DGiqN1MUY9IuxeSjd6vqnwUjt0Qfop4hkqiQFBQRO7b2u7cpGAhvS3Gxnv0SbYAYicr3kOGPrkQy4LQZJb26YkYSzb2uoYPINFx9f3NBCp3zm7OL7BRtbnDqXNYDiT+39zbixlG+970laxUi5LXm7rZZOk8bu4DNO5GFHoU4I7kWZ8m2H362B/mB/PaOW+KxJBFKwF973ydSQlUMgmSNT8oycMcDdz4R/wnRYO6Aqpx/qIo/yQbSxy6sXGs46I/z5TjWm74jK0K6KVHaDz16cqXR4dFmZLTHvKC9jfNhn6Jwu5NLPSfPTLzlunH2tt0yg0p9zD/wc84Gkth+BEWQGIm1EPpcBFKG6lMMH5NZuQh5/oaVDRHjQSX4FOsbz2oK76AdZwfVCdQuffm3I2YQXybH1852Ci0VTZ9q9k0EGBhAJf9y2yUH3SlGqTKR06njHeETgI2/pHS1bODfE=
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 09:14:48.6198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa48ddf2-04df-4a28-e7f7-08d76299c5fe
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5222
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
X-List-Received-Date: Wed, 06 Nov 2019 09:14:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2019 at 03:55:12PM +0200, Adrian Bunk wrote:
> On Tue, Nov 05, 2019 at 01:00:25PM +0100, Martin Siegumfeldt wrote:
> > Backport libiio patches from master bumping libiio to v0.18 and
>
> Upgrading on an upstream stable branch can be OK,
> especially when this is the lowest risk way to fix CVEs.
>
> But upgrading to new releases on the master branch is usually not worth
> the regression risk - the default is to avoid changes in OE stable branch=
es.
>
> > allows building python3 bindings
> >...
>
> No new features in OE stable branches.

And even more important:
No removal of features users might be using.

Like the Python2 bindings in this case.

cu
Adrian

--

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


Hi Adrian,

I see - can you please confirm that this constraint applies to Zeus and War=
rior (which is also stable according to https://wiki.yoctoproject.org/wiki/=
Releases)

What I am trying to achieve (from the thud baseline) is to get libiio pytho=
n3 bindings built. Now, most of the variables from libiio_git.bb can be ove=
rridden in an append file, except for the 'inherit pythonnative' statement =
that dictates python2 bindings to be packaged. AFAICS, this leaves me with =
the only option of, not appending, but to define my own (.bb) recipe in my =
layer taking precedence over the one from meta-openembedded - a suboptimal =
solution I guess.

Anything I am missing?

Thanks,
Martin=

