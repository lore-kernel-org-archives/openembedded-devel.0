Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.886.1589043979215916236
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 May 2020 10:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=kBMS0aRa;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 spf.creamailer.com}: limit exceeded (domain: vaisala.com, ip: <nil>, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTO/co8y/eRttlxaq1Ylo+UHSxDNAPjR5/+bDCVCLUpRyQIaxJAAVORVLgIE0pz1TqApI7sag9g39VEQnYBsNhBmHflCMho/qkETPZWfuYobaHMYg4bRtV8/BsMuD9QexzsQKH5dxuXHEJG2u53AggObY7jg2YhfTm1yn+fTVXg+w7k7MTL8vQNbvKG3kFkltGQS3X4wsmUwM4NI3PEgUqj8k5WbJ3lUPnJOky6sD7k+PGiGw8opkKz2RvRxiXE/eg3Bjsmw/YYInrJtHkT7NifgEjnHTFq0+2P2JQYxOmn6msmFfGZvz1XTwCrxGZS5U5Mvz4ruoLRf1vdLw0dmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKqj0pUF2xSzoFDXczw+8krhwigBTx+zcHOrt4sl704=;
 b=S3RV7uaoVT+ualB3pK4tHqoa0c9XX7IyYU6M609tzvIZulURyKDpWm3c2ihB3DPrXbUw9e6B9RSeic7UrqD5I4ISoy6fv8AElOqG7qgz9IRP+HXtEvekCwN8nh1SXEpLl33LZ7XzDDNmkL/hMBCqJcSaZKmnJ3NrZrxJV4ayKHk5ODGoAJYX4iFJ9A41tZTQjZEzbTn5hUFkcMAK2QmJ12M7EyYKNl3/PmMphP5NBXaIfSFrccDzLajzkPmiWxLUfIFrnrRnH/IoAjKNIm1Hrd6cwFEEwVw8aSUyG2HDLqXGWnyzfvtikJv7lPjB+Ru8dSSlYr8E9yoqt9uOSsMCWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKqj0pUF2xSzoFDXczw+8krhwigBTx+zcHOrt4sl704=;
 b=kBMS0aRa+/xpxE/aYLtmLXjlC2FjQKVyWDVclXswndX7FByAtTfBfaAWbuHXe6y8+bwpYWA1HC5vOv+uXX/BA0cKSmyLzmwaMYkGT1giaomSskACLb+30J9+bqOJumBpFxJpeKQnKWTpNGM+xbZiGaPUvcErFZqE/XlZOB7bgVU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from AM6PR06MB6198.eurprd06.prod.outlook.com (2603:10a6:20b:ff::26)
 by AM6PR06MB4997.eurprd06.prod.outlook.com (2603:10a6:20b:68::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Sat, 9 May
 2020 17:06:17 +0000
Received: from AM6PR06MB6198.eurprd06.prod.outlook.com
 ([fe80::a1db:6da:abd2:860d]) by AM6PR06MB6198.eurprd06.prod.outlook.com
 ([fe80::a1db:6da:abd2:860d%5]) with mapi id 15.20.2979.033; Sat, 9 May 2020
 17:06:17 +0000
From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 3/3] python3-attrs: Add nativesdk to BBCLASSEXTEND
Date: Sat,  9 May 2020 17:06:01 +0000
Message-ID: <20200509170601.99455-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509170601.99455-1-niko.mauno@vaisala.com>
References: <20200509170601.99455-1-niko.mauno@vaisala.com>
X-ClientProxiedBy: HE1PR02CA0086.eurprd02.prod.outlook.com
 (2603:10a6:7:29::15) To AM6PR06MB6198.eurprd06.prod.outlook.com
 (2603:10a6:20b:ff::26)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hel-eptripper.corp.vaisala.com (193.143.230.131) by HE1PR02CA0086.eurprd02.prod.outlook.com (2603:10a6:7:29::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Sat, 9 May 2020 17:06:17 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2e30cf1-6841-4a83-15b5-08d7f43b49c2
X-MS-TrafficTypeDiagnostic: AM6PR06MB4997:|AM6PR06MB4997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR06MB499780D1B620BBC2AD04C22F81A30@AM6PR06MB4997.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k+w/WUKx7URmTMkYeem++4hHV2SDs5x2mwT4ETy//2Nss/SE3UMeoZFDwyyssmKKhAMwKiXV72y4bKRqx5/Le1FzB6gNW4OUyDGOWafAoQNZM86ir8ToHILAxcmxV8+P3kQi/vRKhJ8wUVu153jzrh9Gr3j37+3SwG4L3yfa2mmp/d9Hau5Q7J8KZ3elGE3nSQ8hbPLpDijtVmX/Mk4Qb37SkpXK8ZW2xgsPbZ+VRy+9Bsp3m2umoLHWG2wg/GFrFeAqY7TwDofGcWTH3BR3C1ONXofcft1lR8sCzyhake5OcWmI9o9B22CkfU6YVtN9qibN7I/kZLC85isFRnZTU2y+Ff+4UXOw/V/zEZkqTZhRnat4nmdwp49CdE1JTOEUFIPrz04VpsT1JJ7dFaeNtXa1MOzuEbusWgBx+QWtcR5zCc099pYNgFKpsEW/AsiUwMLZYXSp/s8PzOiY/c2ZqA6y3a2R0yVMHQIYBCb49HJFSeu8MKyyx7oXjbdDHXPWvUQf4autvop42MoT9vQ8XQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR06MB6198.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39850400004)(136003)(366004)(376002)(396003)(33430700001)(6916009)(316002)(16526019)(26005)(186003)(33440700001)(8676002)(4326008)(66946007)(6666004)(66556008)(66476007)(956004)(8936002)(86362001)(2616005)(1076003)(107886003)(5660300002)(2906002)(44832011)(52116002)(36756003)(7696005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jz3Km3wu2d22ukPcauJZGqlRonVAOiFoyWecJ/9v6r9Nnnp3HcUcoHLelD7+bGP+bq8htNsBfCiCUpTotyNDNZM3LMbrxodH1DfTq2dTWNLQRkL6/WcUwEw2VPU27fixdduFBJfBgf38Tw7ope1eSfNZ2UYfhZvPOe+xNGq+qclhUi7CN5Wgv+8bsMXKqQtxuPIbxMfER7IEsrd1/CPMUPXwNyF2xR4aTI1WHsr571WIo9debGIwKMxryd1RHh3if/w/fwLvC7vAoOwimuub4fCD9iq8hMsAWFIVw9TvMKbXAYG8P1oRbEwDH+mmypxzIbEejebmn/8zdXVLSGBbE0mm8M2dBdYZTsjuvKTYJifHKC2+DTeQDFZT37CVgr0nIx5KpgyqV2t3WEgItNYGCUPhWO96FKbF+NCxjZ+P8o60HMQbx1E9OHod/Pu2s73hX8V1PubOnaALy6cls3ZcupEANjyIa92My+C5siB5a35oigZlrjWVlOX70DYm44uL
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e30cf1-6841-4a83-15b5-08d7f43b49c2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 17:06:17.5997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwbbpxmuAoVoC6UcPAxBVY8/pltNC/BVfcwgkoQjjTV9IpXfqPp4eq+osOyvEp+BYjsoyFItpHybBJszV9dxsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB4997
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

By doing so we mitigate failure when trying to bitbake recipe which
rdepends on nativesdk-python3-attrs, such as following error
when bitbaking nativesdk-python3-jsonschema:

  ERROR: Nothing RPROVIDES 'nativesdk-python3-attrs' (but virtual:nativesdk=
:.../meta-openembedded/meta-python/recipes-devtools/python/python3-jsonsche=
ma_3.2.0.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb b/=
meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
index b3739fda8..7ff8049e5 100644
--- a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
@@ -12,5 +12,9 @@ RDEPENDS_${PN}_class-target +=3D " \
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-ctypes \
 "
+RDEPENDS_${PN}_class-nativesdk +=3D " \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-ctypes \
+"
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.20.1

