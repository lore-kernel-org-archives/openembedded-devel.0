Received: from outbound-ip23a.ess.barracuda.com (outbound-ip23a.ess.barracuda.com [209.222.82.205])
 by mx.groups.io with SMTP id smtpd.web09.15632.1616980956182032655
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 18:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=tnX8Uny1;
 spf=pass (domain: digi.com, ip: 209.222.82.205, mailfrom: ben.gampe@digi.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102]) by mx-outbound11-146.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 01:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqsurfqHhNSGuwaC9ShbX5+au5WMW3fwe30Bnjnf2cU7rN/7IAVPKJ6o3oJM1izk4CNvQDPWoxBBoh60SqXlP6wcY6GRm8MQfAOLoCm+Yhmngvldbuo+CMTZs1ZXuszVllAlgqP9MF5M5rbvDXJ8JLsY2r8dP1zHUUqltS0sv67NVAmHKWYUeZUL7mySWqmL9lQHSYLpgmR/K8WCMJwYwFyG9huPeGDkj5uBfv9afY7OTMt1b2nNy22JYc5IQi6IOpuWjp/IpnC5jbvtjFNS/WrHGDky56PZwHqDmLj6pamyVXmDO+o1oNPVJcFZdW6I5T6naCQnWFNUV9biuCWPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46nAM5XRa/B3WRyffH5CjL0v3Z1nwiuGP3bro7CbRO8=;
 b=WpQY4Mrwvl3mCXXehBtxtKV23P5arWTjF5o0YZcFibiBjji2shjaqrx9pDXasVJfAWZULu6KqYRgEgG18j7sgp85+3oahZdrHLf0r0EM5UmUFi1rTSoiqigPNjIQOUcxbiSjRfpUZ9t3+E82TX1cAR6nECKhVNelTXNmaogmKgkSpEHTwmNsS5h/m6vbaATd5VzD/J8WB/x++aSOsFWW2fuaCEbmBcwOvV8cTJ+PPwb5849FfqKa/hfOx0SPRCHA4nL1inN9yCzJMb5YHqBRN+8E/aBpKq+xzIcIQglBIkb0PI8GJglvmZg9lua5BB4hwDrxXa7xTO2PkordDLbceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46nAM5XRa/B3WRyffH5CjL0v3Z1nwiuGP3bro7CbRO8=;
 b=tnX8Uny1QxhxaWbsdVwKkMQf30lEhqQZ8+E0zj2Hpu73NsLlh/vokQ+6oTjich8Oy/Q7HV/WvdH9bFz1rOroECPn/50ip4z8IvltwLPbt+62uVcQTrIpzBOeoBrBB0W9Wc/5tUe53+TgKN9lGaO8YgBgWG3uyRiiJ4Ty6jYkgSI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB3703.namprd10.prod.outlook.com (2603:10b6:a03:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 01:22:33 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:22:33 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v2 5/5] python3-uvicorn: new package
Date: Mon, 29 Mar 2021 11:21:43 +1000
Message-Id: <20210329012143.2580564-5-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329012143.2580564-1-bgampe@digi.com>
References: <20210329012143.2580564-1-bgampe@digi.com>
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYBPR01CA0170.ausprd01.prod.outlook.com
 (2603:10c6:10:52::14) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYBPR01CA0170.ausprd01.prod.outlook.com (2603:10c6:10:52::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 01:22:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 818786cd-ab5c-4f65-8513-08d8f25120f6
X-MS-TrafficTypeDiagnostic: BYAPR10MB3703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3703DAD9D455BD14A3A047148F7E9@BYAPR10MB3703.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jwy3urTTVcITf+gSuIkyjzci4+5xl0uocc2zXKIwXAJe3Evq9WoHyQZKFJDYuht6kG8YI7y3vrocbbjeoYek9SeEP05J0MT4GxdfZuWtZCGfWTga7QczBjkT/XETrxy8pdN+DuEVAfR/mrLZlxYY3kMV314vJuBF9eUiJD/0HiB+g0G0B8CeL3MyjxM6h2LzMcyxkD4Cef3zI44rNyApKwNCGln10QXMfa8/xg0nD4VGdZvHkZFQ5GgdCrsSCfKkuR7XGdvAJu+s4G3fZ3qvtPohlwM8v5BtKK7/ugTE5sAOMIBTN7itYbaFkYNvmf53FpEtBHIaa/tFID4VJ5Y67T+jex7h3vr7FQABB55oWoxM+EhqAFuZahPywcz7sU7fV84dy1H/K/x8aDRM5OilineaQ0tx6b2G4FV5b/9xcnNnCOMaIBYOmS3W5uYqe96d4dvXpCCf/HgS7OdJlkc0+uObAZSEuRQqhgBqlONbiaO/nd+BdUrNCkRL7X0lWQ8E5THtMmdJFqjAwR4fcOW4G202HBTAWakT6i21K6VR2WMYWspmQL/yx2+eHzY8mNdaEpDKJxg+pFDeJ2IOtVNahpPVFOApJeyqLA+6Z94CBWZlLoOIPA6krnqwAV/oDAZxZ1Wkzwj1UUbh490pNdQcrNpyzFdmuh3dZM7cFIUbeufuhZKuq6YOBSqvpxZc8GocmyCWOJCYzA5xKYe+SNo3ctopvkhZ5E5e6eBLSy/aqLI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39840400004)(136003)(6506007)(1076003)(8936002)(956004)(2616005)(38100700001)(5660300002)(6666004)(66556008)(26005)(6512007)(66946007)(316002)(186003)(36756003)(66476007)(2906002)(16526019)(107886003)(52116002)(6916009)(6486002)(8676002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?F/W7ajvwFqKD8Iu4RtyBhRxV7DJZMZc66kxYHhlPmyxjhNDdAUCYOSMJmaGA?=
 =?us-ascii?Q?i+10B9HJ6hQ63sv1Pgy5Er/SqMb7o25s2aNIm2rAf1NYvNpJIynQaDbrql2z?=
 =?us-ascii?Q?+UAh0q+m55PEEvxDSlDaNjUzPtWdhyZMXCnV/+de2jHQGpZdFAbDXVGHMOVC?=
 =?us-ascii?Q?I9MvqI3zzPoirATjMEfqRxtmUn/drkwtyPGNWBrN1vAx0yy0v02nXOq93nXY?=
 =?us-ascii?Q?apotzBQVPHcb1O2+knQRfERWxRCmX2X0rZUeTY2l0bbNwBArqaX4QACvqVJW?=
 =?us-ascii?Q?Nqrw9vvrEkZCr6k/jXlDzI56qsev9tCjf06DkVc05fMpLH3yxp1GAtm9fo+t?=
 =?us-ascii?Q?IP96/QVPE8PiarH5bJjfjfVHQFSA1PrDghYT+cja1ghN7K51p7t2yEzsJ6S3?=
 =?us-ascii?Q?BrYN8e9X3Ckn+dct4aKKBcpdTrSaABoATf2hb3/035s5mcqLCFnM5wiOM/Jb?=
 =?us-ascii?Q?xnOM7pKsjzX6W+5zt0WlfrHjd49DxGEWH8yPC0M13kVW8JFuo2gMvAiNfWkk?=
 =?us-ascii?Q?AYdWvqKAJIvV3nHkQ8DT1Dzy3qgezBp+nx6pGBm7vTpIFYbVW1lhnkwfevxM?=
 =?us-ascii?Q?SVigkthNvsoT5XPNDSlUJ3edV65MBmcUee37sJfPQLwgk9C6HAm4sxT1KgBw?=
 =?us-ascii?Q?Wqbzl3iMIP8ovU5EfOQokpm28V6aXUPrmu0a46QT/xqWOA+mnZdTyj08+ag6?=
 =?us-ascii?Q?ZXkeenEcFR9D8vlg0oQPUm7RVSnINemlOdJEpM2XzZBkJFoK5xPHOOe5qCPc?=
 =?us-ascii?Q?suwGm+z3unuOOmwXWPNg7zUGtTAlE+ravVQclvUuwy6G+qpvCXgDDjmcjVtC?=
 =?us-ascii?Q?QtszlBefjM5bnduI1JmMyYvO5bA6EJL8ayw0EDcqeDVRC/atX8ENbHvKIaBN?=
 =?us-ascii?Q?8VKueUjzGYYXJgVE30n4TG3Ly0aCi5lfemvo5tzCPQVwsvE1gj4lLejp8EPh?=
 =?us-ascii?Q?CBkAdKEjeetUN5V6EKidsK9cCBaW6jCW8A1TsMWg+ONLq/40UizkLMZju7lN?=
 =?us-ascii?Q?ovo/wWt4l1c6kbYQHRzEp7Fnv4mfSjvv0jqIrl26zZgyFtl4AC0KasZTvPau?=
 =?us-ascii?Q?rJfn8JS1rMnV0XEAH89R8HXSeRyybzC6osjHebIb45HlJD89zNML2J4kUPEp?=
 =?us-ascii?Q?1spLZ7OWMdAhjDKlL+SBqEFimo86tfvPD/Si20n/D1UH/Fl14OqkaqaiCPOS?=
 =?us-ascii?Q?7fCnSTzD2Vx/hfUKDcl6yMehJVn7BMKonx5ROzGjyxzOzmOovOE8B66eF/bH?=
 =?us-ascii?Q?q/hVTXdD6CFzO/YurENtWQjIvdUNivcbbieOBdso60LWFysaVDiCB6O8Birh?=
 =?us-ascii?Q?6ER1Wab+U2frWH/hucoblyLT?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818786cd-ab5c-4f65-8513-08d8f25120f6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:22:33.3424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nv6zXtU9qepuzQTZS43Cdht9XQ5zQ7ebTaALM/An1UG9HBIAVj1fe4sGRB7gzUrL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3703
X-BESS-ID: 1616980953-102962-5418-23941-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.102
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231164 [from 
	cloudscan9-121.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add recipe for python3-uvicorn: a lightning-fast ASGI server

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb   |  1 +
 .../python/python3-uvicorn_0.13.4.bb            | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index bf270df46..45f93b6dd 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -427,6 +427,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-unidiff \
     python3-uritemplate \
     python3-urllib3 \
+    python3-uvicorn \
     python3-uvloop \
     python3-vcversioner \
     python3-versiontools \
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb
new file mode 100644
index 000000000..e2d0c8bb9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.13.4.bb
@@ -0,0 +1,17 @@
+SUMMARY = "The lightning-fast ASGI server"
+HOMEPAGE = "https://www.uvicorn.org/";
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=206119e27d6b034e7ce70d73063c82a8"
+RDEPENDS_${PN} = "\
+    python3-click \
+    python3-h11 \
+    python3-httptools \
+    python3-typing \
+    python3-uvloop \
+    python3-websockets \
+    python3-wsproto \
+"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "3292251b3c7978e8e4a7868f4baf7f7f7bb7e40c759ecc125c37e99cdea34202"
-- 
2.25.1

