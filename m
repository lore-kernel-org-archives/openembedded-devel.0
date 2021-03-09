Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.58])
 by mx.groups.io with SMTP id smtpd.web09.5311.1615271784445213800
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 22:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=CG3mYHUL;
 spf=pass (domain: kpit.com, ip: 40.107.139.58, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuhBzB03QPBFOl2YxtObe4Kq+TZRQAGeXA+cCgQQk06oPstC/wNh1rDmAGeUSyPwHs4hMl9SOTPM05tOnymuKHPjN7Kqm2OEtx1yR/p3JHtMeRsBm8/KaegENnLjHSq+9jWINYlE0uPLL80umzwvoeo2NpOp+fa0hJxJBE7rawrwAlV+uTSoypz2KMu4Vm8Pi9mb9CnreTRElpU+A8y/pRFXwS1PhavlNE+45dtLxMFzAOZpEbftqx110LSFPDxRk7cn5rFGljaa73n9fHIkzDGtiPKh5Olyw1SrlRvDSsYYNAzlaIsP1SahkM1IPALtq08I6WFiTpoEMaHq9SkXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvCT+cNdb9egtxDEpq8xvuidvju6voKAlYaHcUeG2uU=;
 b=cWB7BUvcEvfQtH4vtA5KdWmYspfaApDN4gVA4F2B1AMnKzPF00ej4ulCo43/w76M8g7ppzvJ/etfyPGgL1TTpCKp2IoktZnmJUWL6nuw2aISq6GiyV26UuVBt3Zho2eROQvDplU4VyXkNtLH28wLhULByCrzPLmS87xMblTe5MFwAYttfpTxuUkFyWQLdOSFbWQeFWOyQUUqzfG7xhv0Edn0AsfPttyE9D9xS/x1n+PG5T4Xg5BhDeS8NVFJXhPvOSlBLlDj7KpR73SMImAXFZ6jMHC8d1TUE4cOSaNoiCZoZZcy2ny3dPiZ9xga5xkkl3SMa4GgSX4oMfKVmu/MMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvCT+cNdb9egtxDEpq8xvuidvju6voKAlYaHcUeG2uU=;
 b=CG3mYHULMHozeaxczbG52bAKAzaDPb81L5VDXn/yUlD3z8p558E8xztHfvtoBT5A67UjMOmO6FXNBgtQnpSwLaS4Ke4RL0FsaI4r7fb6Fv3Z+BzA3cyMUfi1FiEY20ckKkiRXvrxG/FeChbmkclxYoS5VPBOCOcHWMRqAga4CJQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BM1PR0101MB1186.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:26::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Tue, 9 Mar
 2021 06:36:10 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 06:36:09 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [meta-networking][meta-oe][master][dunfell][PATCH] mdns: Whitelisted CVE-2007-0613 for mdns
Date: Tue,  9 Mar 2021 12:05:13 +0530
Message-Id: <20210309063513.10410-1-Sana.Kazi@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:1b37:d4e8:5473:ab72:67ef:ca3b]
X-ClientProxiedBy: BMXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::35) To BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::17)
Return-Path: Sana.Kazi@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:1b37:d4e8:5473:ab72:67ef:ca3b) by BMXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 06:36:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a27093a-d7ba-48a8-2458-08d8e2c59fe1
X-MS-TrafficTypeDiagnostic: BM1PR0101MB1186:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR0101MB1186D7F760D1757D2875B0C099929@BM1PR0101MB1186.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6tzl6HsjDr3FWrB22reqk5a1QNcGoGDdH2GDEjtND5vK2WnhXOsWOcRyUfVgNd8G9CI8VLmSwNQpS48dPREiWdmEAVghYQmkW8UCkJJs50byN9WSHshx/Pxg5fm4i7Kk0pzAoCQjSUcbcM3O34z5bDPn82B6t04Q6q29G9qmhxfnrj/DL+Q8jfWhUSmBgAZbpgvsxGWvdA7l7vX7HqxsKowJnas17IdSpC6kFlcCYndSl/ef4ptTvbZD6TiESs8w/BacXguBNUiNtp0cut4BJ0SicO5i3f7zmE3VQarT99JyPtNlz8b8mdyarAGF9PvBMJO4Po67IvNEraJCaQufuB5Y0jwE6r5JKFhyfBzk8DSBVPE0sUzW5qJ5bCOzZKykF9YfYN5r2/GKarqnjW+lsXZpGnW889pyhEOWOqsMuxhlnZawb2lTR5h0qQM8xY97qxPzxj7hHFqOI21MaRltbKRFw5Mdl4PN304r1iiLOJkNf5vCvDWJv3WkLrwdmFyHceKhy6AdpMwzBOM2intiQr9GjLVmwQ1XJv2Bwd4D4YCGh6ePIuDB7jAsdAARSrDEFSq8aFva84U/eVOlHWViZKvS0ZEiUWSwJ0rVCge5QbdDYxoh4YVbTwDzbmVa8LAGIBiBm7c0E13vz3xzfaomB1zEjp0moE7oyq4JIl6d8K0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(478600001)(966005)(66574015)(5660300002)(66476007)(1076003)(66556008)(8936002)(66946007)(186003)(86362001)(107886003)(8676002)(83380400001)(4326008)(52116002)(16526019)(316002)(6666004)(69590400012)(36756003)(2906002)(6512007)(6486002)(2616005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4c4qUfF3EbwoZrqe+PEMqwjPl4V6qh3Fjqb9Y7MP0mEhTbM+Fj12qCpiLG8Q?=
 =?us-ascii?Q?MSxkx3OUyHmdaXPQNM0FjpnZEPEO3TtwIljMU76g8WRJlOURc9qGqHZMe1MX?=
 =?us-ascii?Q?9pFeQAc0tJ2eoqBxJl/4BC2e0dQito67d5uOGdKC6U8YOt+B92ES9Acsngbe?=
 =?us-ascii?Q?QOn7dYXJd0b1D79+bY1MYJxXq7nbAWZkzP8XTbPvR8zC42ZPi1SLbBCg7+Jf?=
 =?us-ascii?Q?uFNYZvcboYHKEbfcztrG+NIS004I1tpiZAR3/Prnd8NO+S/eeGtKjxAedwdk?=
 =?us-ascii?Q?GtQ4oSMjENzzfrVcGLlqvXTmavXW3mqkkCpDxJIHHoBUzVQuwY8PQAXET7Uw?=
 =?us-ascii?Q?1hG1xilfPgFdnFJO9vmUr8rx8m0uXgw6Ww2DM1hqI+GtN1IonVW6l+egTrYy?=
 =?us-ascii?Q?sSm+n/+ujwhhxy8DpIe1dGGc41HdG+0DeFciZO5FMRnK5UxnW4nE3Xzi2Tbq?=
 =?us-ascii?Q?7JaOVT8GFa290/Om3SydJOV1oXv3Z0+xSlXplGKQ5mJ3tvrARJrngXtCdaut?=
 =?us-ascii?Q?Twb0UDaec7dyYhLUDU88j3LZPzFvnI0ucvsOI6dQHalDoyMcb2AEbQJpDtM2?=
 =?us-ascii?Q?+pmwcuVyc7jtSV0KGiMvInWNnFJuFPsqoltrhvvFDUCuYnsos4qJGQQHqJwd?=
 =?us-ascii?Q?4sX1UwrOfzq9HFJcgqe9VKLGPN8fjFKA8MahZg/qLJyJe5RkfRQFMdjAy7TV?=
 =?us-ascii?Q?2cCFgUxhc8/kS9GVAQKf6uhGFApFCPlGdfxsd5wYCfhOj/hl56aT8i5K+QTp?=
 =?us-ascii?Q?Jgh1iRRbeu9XQULzBLu3IAuoyvFISWGbmO4HGTHElWFqwk+E8LUTK8D8p/Na?=
 =?us-ascii?Q?dx3tL5/y1kqzwI6fMH6xzP2KZrwEv4/rYQXMWfo81l8+tnxJ0EAEaMuq6ykx?=
 =?us-ascii?Q?AhIZq1f/TStvsqXhLXY1KHfYI3vzOwrl88AG3UbuFCLiZJ8bEmFaDN8kL505?=
 =?us-ascii?Q?3s42WGN+nauz4ClyVjAV5JllrgUU8uCcJ1N+PFUNdtM8h0couKWlKBcTiEEl?=
 =?us-ascii?Q?/3TebPPXTiZzsbmtqFU85nBFDBe+GRarW01B/bcqoAXva2Wr8BZ4UnRm9uTC?=
 =?us-ascii?Q?8G0M7GB8w6wgAZwuKM6waQfmijyEcnboYiMIHOPbgPS1GYWTjbFDKR+hGqd1?=
 =?us-ascii?Q?05GCW90p5wUDCS4o2eBmfyW3tVjO/QUk4PLWa2P4YnIa0rrDReRVhrQxK6hO?=
 =?us-ascii?Q?vZEX/0vxMbUBUvMStiAP0FIhvyjAo9TVGcGbygJS+f3yoo7doEbKYWjoMJbd?=
 =?us-ascii?Q?3RABK6DsArH7MzPsQfnzmsGHZSRk639ffyNv+WSADfS9KUog7HO9VmryBFhJ?=
 =?us-ascii?Q?z296sy+tK45hKfzEZoSgycEy50nBQoyeI/mK7r8j4DSPugXrRF5zh4+YiyMr?=
 =?us-ascii?Q?kp1DaaAE43KHaPTtjzisKfZatn0j?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a27093a-d7ba-48a8-2458-08d8e2c59fe1
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 06:36:09.5769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyK9x+vm8/QX25jo0cSgWtG+xQJrdc3JC/LgIA/v2sI774nuTsWQPt0KrXQfiMzj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1186
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

CVE-2007-0613 is not applicable as it only affects Apple products
i.e. ichat,mdnsresponder, instant message framework and MacOS.
Also, https://www.exploit-db.com/exploits/3230 shows the part of code
affected by CVE-2007-0613 which is not preset in upstream source code.
Hence, CVE-2007-0613 does not affect other Yocto implementations and
is not reported for other distros can be marked whitelisted.
Links:
https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-0613
https://security-tracker.debian.org/tracker/CVE-2007-0613
https://ubuntu.com/security/CVE-2007-0613
https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
---
 .../recipes-protocols/mdns/mdns_1310.40.42.bb       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb b/me=
ta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
index 445ed87e4..60bc26bf1 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
@@ -27,6 +27,19 @@ SRC_URI[sha256sum] =3D "bea29e1616cd56ccb8f88c0fad2bcdc4=
031f4deb2d899c793e2f27a838

 CVE_PRODUCT =3D "apple:mdnsresponder"

+# CVE-2007-0613 is not applicable as it only affects Apple products
+# i.e. ichat,mdnsresponder, instant message framework and MacOS.
+# Also, https://www.exploit-db.com/exploits/3230 shows the part of code
+# affected by CVE-2007-0613 which is not preset in upstream source code.
+# Hence, CVE-2007-0613 does not affect other Yocto implementations and
+# is not reported for other distros can be marked whitelisted.
+# Links:
+# https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
+# https://www.incibe-cert.es/en/early-warning/vulnerabilities/cve-2007-061=
3
+# https://security-tracker.debian.org/tracker/CVE-2007-0613
+# https://vulmon.com/vulnerabilitydetails?qid=3DCVE-2007-0613
+CVE_CHECK_WHITELIST +=3D "CVE-2007-0613"
+
 PARALLEL_MAKE =3D ""

 S =3D "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
