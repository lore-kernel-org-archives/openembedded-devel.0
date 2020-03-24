Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.293.1585090151533401776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=i9WWXI3d;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAzTMTt5wWzFWownr8Ktf9P/XSD3EOTM6BFEQxFvOpZkGJsuSaD8hlp6vB6xj/qkxaqIk7gtjBxYbSiQONVGQfVM8/d3JpvCsLwmbdSlVcdkcjqJaAESDqqsZtXxT8nEa5FCGVFiIh8SkGU8/iN5AFjfstVgbdMVV9M9g/TzQwWcYvOrWnB52lppRhhtfjRvCwjPWARCCamF6uu3yDLNJhSaKD1pOd057J5kvKSmg3YpaE6DrwR/21KzkA6z9LFN476+KCB8cZv2zdExK38Eokl0AZthK8JpllVw3RiMlII6lDldHC2bCZ7ZZYWY6ccPHFHErxMxyowGkXzmp3sKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8In/nLm8yB/4l9DX9PvtMrNaSrdKkbpNIb3I7zLNE58=;
 b=Yoa0Ja30267r6xzlC8c5vuJFnh8RFEKJrPMRLJc9Rtj1LdlPtCgaIIRH2+FQLReG5ZgwGxfiOElYf1X2n7sILWCNF8c1MCxNA/J4Xabq8JGKGZuf39DnE+ST9mgCS0xKFP6S3GmpIuSv814hc9T9EXEZBKCrBJJ4oOFPWXTtbGwVIgESdIC3HjZNv7ITeCwk9Q1XAX8Qm7dNhYhmUyvswjG91p7mX9kttj3Rx2YAV200ZeKP/OQ/x6d65evStEVSFRRke/N7GVY1zynZ32TFhZ0pSJJ391PDsAnBIBG+8EVdHfx8f0Wfu1DjGSIeNnSx9+En7Re+vhDPYj15lWnViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8In/nLm8yB/4l9DX9PvtMrNaSrdKkbpNIb3I7zLNE58=;
 b=i9WWXI3dmd8D9uONAI6uWacmuQ4NI5lROqTg2iuyxz2Qeezn4U9G7RWmvodZtaUdzOwSn9zCeUlyNScdNgFu7KYbmddAoM37B/aELSYARa26QQDpWnTWPt22lKXqek20yxsrdUujKA9yZutT0sO2Bj+GnbSErZWWMyfFYr1FBp4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2169.namprd18.prod.outlook.com (2603:10b6:907:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:13 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:13 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 12/17] python3-polyline: add recipe for 1.4.0
Date: Tue, 24 Mar 2020 15:48:38 -0700
Message-ID: <20200324224843.752394-13-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:12 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4fbb54a-0f1a-47ff-fadd-08d7d045928a
X-MS-TrafficTypeDiagnostic: MW2PR18MB2169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB21697B3C06C27E2D7B460294ABF10@MW2PR18MB2169.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(366004)(136003)(346002)(376002)(6512007)(66476007)(66556008)(8936002)(6486002)(52116002)(4326008)(36756003)(316002)(107886003)(66946007)(6506007)(2906002)(8676002)(81166006)(5660300002)(81156014)(2616005)(6666004)(6916009)(186003)(16526019)(1076003)(478600001)(26005)(4744005)(86362001)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2169;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ep9p4wjMZyY4odfkr8m3LkQTROZ4WOw1HBBgABYI0rB5gju1neLXAjkcuVKUCseHFBsg1523gcnVGV5y9vsboN/y5fKqm+slx4MQljnULXRdPb6izzQkYEVqpW9GDM0K8MhwcEPmGjOZwyz/UZvgvFqOMlrzd/immRJgyqKPfyoXViVq549Cud/kXAYjraDW32jQnX7DD01CPxBeP1LfkLUc5Jm/F//wiDzCfLLHOYsxnO+xl8AabRtCvwZ+snmQuewpY8xrvaFMD7B/lF8oZGvdBixXUf1PWv98KV/cz5I4PiVpDCUWXlUUcnrgaa9AaelZp0uhsM5G1eF9pTADNEgPAeq+6o12X8bp5GLxlmwGDKeozzPczaIadE7ex5YviRMkXC9H8wBfoyoniVlXih2v6k1DeYNBhMmDIBGEfaZvebmrbpIpRNXv5QNyctEkuPPt80o9gFO9keX5DI3o3OhgEOgN5buZMST37LBux/pDB37HzAJkby1oGNjwiZ8222kem9/EGl24QQmnkdoKPw==
X-MS-Exchange-AntiSpam-MessageData: 
	v6CWmW1yxALIE0ID9LD9sjdZdXTq6EvwEFA+3JLmJtj7iqSF2r0N2HDCxUWD04yA3c4aAuy+RuIYtMicYkMDlf5Fyz2WYYA3AEvHltdebfWdC1M74PldvIHhKzgFGshtrT2IpO/wqaZG2WE+qXplIw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fbb54a-0f1a-47ff-fadd-08d7d045928a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:12.9364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Y91irE4aGJSaDinkj0i+9eFwbk5fDr3Pbkytguh2bQB55W1OR6ey7/KS0QC9dIB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-polyline_1.4.0.bb                | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-polyline_1.=
4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb =
b/meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb
new file mode 100644
index 000000000..3b3e2071f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-polyline_1.4.0.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "A Python implementation of Google's Encoded Polyline Algorith=
m Format"
+HOMEPAGE =3D "https://pypi.org/project/polyline/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fbd13500cabd06dd751ba6b2be304c=
6"
+
+SRC_URI[md5sum] =3D "b97c57378605c4a856c437569f95a0cb"
+SRC_URI[sha256sum] =3D "7c7f89d09a09c7b6161bdbfb4fd304b186fc7a2060fa4f31cb=
3f61c646a5c074"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} +=3D "python3-six"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

