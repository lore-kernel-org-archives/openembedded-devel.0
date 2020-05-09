Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.886.1589043979215916236
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 May 2020 10:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=qMFllXLM;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 spf.creamailer.com}: limit exceeded (domain: vaisala.com, ip: <nil>, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnW86OzOqhuzBz18QHN33iJCCaTystLQAtQlAGJW8eBVa1f83A6s7ujZp51N7PAr3IHio0YaSX0p/eAUZRxAV3RKWmisRDnkc9GMBbnfZVIWdC3be8K89d6SlPDAmpm8hxQodtBpG2qr3wBETeUNLLjfEg98ZNMBQskTsE3HPbTK81UM+XINXHkiH+fmOauIoZG/F/cq4EUl5rWMhAgB3vsyp/yWkFkp3rpIvOM9Sl/osJMlRPnz138Q2zLpZ40PMTXFNgWj81UjO9mQLwSqcS2f0cCtDa5qKu/IHXFnZXqxGoQf81XiQD62nI3eb9KDGJ61+cFZNQ24+EWKpAucNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91+PCLw+H+fAEvXoORbUPUWlmMhMA/ZyvN/QLx2sLgM=;
 b=gxsh9DwC0Mp6gX30Duv3cgflU5lQNnznhR4cuzyHDppwrsszAZfWxJTZsF1ZGQyNUBxF0ywNx+Wzqm73LdH5b919RQMiz4hdRddw7kRqPAdfN0WpYyYJQhPQTp+q8hkLwUGQFS/mCTq7PZDF6Ik4z3mzDqq4gLh9DY4NSrJcxsqFyb0BaYqOkABh8pfhSyiVZVwDFh+gEteUa8l39cb3/q7eMVePrK+FoVK6IjHDixpuMLergJ0U5fiW0cDBIvVAEvPLv5mnMnkZkzwsHbf4yPjU7X2ZEJlb7RpedkiRPQKAg6ZSS/3H9GwE9zqyVCd4kl+LayJrmEhiBJsdZ7qiCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91+PCLw+H+fAEvXoORbUPUWlmMhMA/ZyvN/QLx2sLgM=;
 b=qMFllXLMPQS0x44qO39Xu2bRg+cM9v4/VTcbfDaouLeb3jp7mXZLWNT7PiTndqt3FpjbaaLvchzNDNbPf6WXJoLFzbirEtneSIjPnPflIBWbyN9LbjzZexq5yw/umkHGVfVACg11Tr1er4Sqjnxl/BFwG6cX8z9YHnUkb509WmY=
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
Subject: [meta-python][PATCH 2/3] python3-setuptools-scm: Add nativesdk to BBCLASSEXTEND
Date: Sat,  9 May 2020 17:06:00 +0000
Message-ID: <20200509170601.99455-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509170601.99455-1-niko.mauno@vaisala.com>
References: <20200509170601.99455-1-niko.mauno@vaisala.com>
X-ClientProxiedBy: HE1PR02CA0086.eurprd02.prod.outlook.com
 (2603:10a6:7:29::15) To AM6PR06MB6198.eurprd06.prod.outlook.com
 (2603:10a6:20b:ff::26)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hel-eptripper.corp.vaisala.com (193.143.230.131) by HE1PR02CA0086.eurprd02.prod.outlook.com (2603:10a6:7:29::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Sat, 9 May 2020 17:06:16 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d8f080f-c849-47e0-e80c-08d7f43b4964
X-MS-TrafficTypeDiagnostic: AM6PR06MB4997:|AM6PR06MB4997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR06MB49979F22A8D548370FA1487A81A30@AM6PR06MB4997.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0B+Ks3z+LgX66G8H6FMWPw96uofd0ZxXilC6p0m3BtpEk7/M1VxOYJxCRqMOb9DTqpZdVOh+OhYntN4dGS86o1dtPnkdTEZif1s3XBC78kD2ZC8h26X2fDAtqo9B2EA71jnXxPctQlgo9Pa+W2Axk19qcFaKE9oP/bCDAp261bE5/qwxvN2KC8C9+ywdtG+KKcuACq2HDkiApsF3sRxR0KjujiySDlhcdz0A4JmZjVtB6wql3Sw21ZX3g8uefJN7WVEuk5EfAqmFMKQLez4EINWNTk+B8AnXEuit4GZx6KcceGAeotnXg8fSOvOpJbHtPAcMDBP+aQd9bYhspEVr4NBqm0JANIy5RCAgkKoWWuYb4NPgwBDC8v3k318w6QPvflN0jOifkMsc/QEW99KYEfbKmwMcsd9Xdt3rtPpXKVbio6eQwrToQ8mCW6Snm8ONtTqmanCMTVnktSbAEzMP08lRo/hK3UCcnG4zLycVLhrob3KQ+0vfLRltWEYX8dCr513gVHNMTjbavP64oNnlvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR06MB6198.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39850400004)(136003)(366004)(376002)(396003)(33430700001)(6916009)(316002)(16526019)(26005)(186003)(33440700001)(8676002)(4326008)(66946007)(6666004)(66556008)(66476007)(956004)(8936002)(86362001)(2616005)(1076003)(107886003)(5660300002)(2906002)(44832011)(52116002)(36756003)(7696005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ZCMdEDjzr560oth9czYnrA2pRJoQpYbjKnHDni20c1kxunuA5obE+h6KQS0Sjr5aiYJtZcRDLxx/j66CZTK9Ej1jYuGf0RnnHx3eFp7fmWxZiP3mzlIqbZholURZPTwzoqE90dUVAxgOwRxYqTJB2wZsXF7JxKQR+OPaSeiBXfLureQkmG+ZfnV3rF4hXqv2xA7pIdyemmXFZWnL9L3Ui8ceXXqvw8/on7d0j2AuiGwm0Tv5ByPhD2RfklKI5O8bZSieMXb1HtGRbc4H0MuFyl9XJwqcstS6/t+bgoRRm4YeBXjB7jurUJnkb/XOUn2D11s0DyoH8/Y7eQKvUlyZ/zvTGJIv09Z2+VSxGouOfzD7YID4yF4aXppESkzOK84bWyBGR94nAbuaJDuzHkyLmpdQdfyds/7fUWthujIxl1C9YkBsF62MVhLGLup50JZ+s88jaw0LaidpSsiB5VmiLdpEWI6v/wRqmQSRYhieXMfWuFdIimlHv1CV0tlf8zOU
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8f080f-c849-47e0-e80c-08d7f43b4964
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 17:06:17.0210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XU2ZtrNLCu4nw7BMoQep6x7Mu8koHczRjSRQGqna/qEziRuo8jUgxNULWOQkdbs/UKUh8MtGjiGHd8vNPMTxgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB4997
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

By doing so we mitigate failure when trying to bitbake recipe which
rdepends on nativesdk-python3-setuptools-scm, such as following error
when bitbaking nativesdk-python3-jsonschema:

  ERROR: Nothing RPROVIDES 'nativesdk-python3-setuptools-scm' (but virtual:=
nativesdk:.../meta-openembedded/meta-python/recipes-devtools/python/python3=
-jsonschema_3.2.0.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../recipes-devtools/python/python3-setuptools-scm_3.3.3.bb   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3=
.3.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
index c061ea2e6..a1fc3831f 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "bd25e1fb5e4d603dcf490f1fde40fb4c595=
b357795674c3e5cb7f6217a
 PYPI_PACKAGE =3D "setuptools_scm"
 inherit pypi setuptools3
=20
-RDEPENDS_${PN}_class-target =3D "\
+RDEPENDS_${PN} =3D "\
     ${PYTHON_PN}-debugger \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-py \
@@ -18,4 +18,4 @@ RDEPENDS_${PN}_class-native =3D "\
     ${PYTHON_PN}-setuptools-native \
 "
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.20.1

