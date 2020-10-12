Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.30166.1602463588212385310
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2020 17:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YMQvtzmT;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: babak.sarashki@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2OL49TfsctPcyRZz+50NDma89YOT+4UzYVMOq/RrccQGeC9zMQ/AvEhZz9HWAgqQskpXqeEv3Ig0ijP8kVxg9b7LlbMiuuYbPaBbTUP9z3OtcANBvCQ2gwmz3nxfM3a8wKyskFWtlHANV8tO71A0YCnz0NRdFAzN3i8F7YwDTtfOgmH6nPniaDrlUTm6W1xkpBi22smgjljw2b3QOvxd/9AjsEWM7ivIEx7bLwdtfLt+Okenvy/qmrDNJTel8Whk1GTrEpxQeCnhbWrjW1+AmY/V/1NNnvAdf9uz++oA4r4t7QZYD4iH6t2/ArbFo+OicbmmJKBkeXpZwwCw6oZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUYy706atXu30SlTCrofTqpnJNLTcwhXKTBCbiIaSVU=;
 b=hagG1FRxwUJ3DAnZpaf2RZK/bEMDjkjOUIxYFQBDSYLoGE8rzmct9nxJqfEV3GYGmNUEuiP9C0RcB1Gln0QdyHjxISj/60UdQDvOiRvYqu4paXJUAdAR9C9BYnPphzChkWjpD0Z3f0BvpuB7NSkR43+lWE4CBhD0wymR85HHJx5BP6HOUvyG1FqjknCM3Dyg6563xH9oqkwtyyhYzV2yKSAAxaVrZfpg8lrR6ibOs+OuRkT5CcnZzz0q5CuCbuHXE74uu6qq4lT99FCHxHHEWIaHgAKREUBS2eiobm/g6e2Ws1oCiy/1HTIw6qQdXq3aao8a3iJ9thTrpsomMtOfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUYy706atXu30SlTCrofTqpnJNLTcwhXKTBCbiIaSVU=;
 b=YMQvtzmTMylFMNPQHU1MDEPP/F+fb9J/HialvYHL/GBckTfGQMBucj1ejNaNtNSoWofEC6xGkoYweNuNHWsgncowO73J8+ok0ce00tMmzu6Vnhczb4eHY4wwz3m92WCXnrnJYix1hQUQKDOTQBI3QJieAJ2+Pdz7CLSdQnqNC0k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2855.namprd11.prod.outlook.com (2603:10b6:a02:ca::26)
 by BYAPR11MB3333.namprd11.prod.outlook.com (2603:10b6:a03:19::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Mon, 12 Oct
 2020 00:46:27 +0000
Received: from BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360]) by BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360%7]) with mapi id 15.20.3455.028; Mon, 12 Oct 2020
 00:46:27 +0000
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Babak Sarashki <babak.sarashki@windriver.com>
Subject: [meta-python2][PATCH 3/3] package-vine: add recipe version 1.1.4
Date: Mon, 12 Oct 2020 00:46:03 +0000
Message-Id: <20201012004603.990-3-babak.sarashki@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201012004603.990-1-babak.sarashki@windriver.com>
References: <20201012004603.990-1-babak.sarashki@windriver.com>
X-Originating-IP: [71.198.98.210]
X-ClientProxiedBy: BYAPR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::42) To BYAPR11MB2855.namprd11.prod.outlook.com
 (2603:10b6:a02:ca::26)
Return-Path: babak.sarashki@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (71.198.98.210) by BYAPR07CA0029.namprd07.prod.outlook.com (2603:10b6:a02:bc::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.25 via Frontend Transport; Mon, 12 Oct 2020 00:46:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 224b3b96-7633-4f7e-67e8-08d86e484088
X-MS-TrafficTypeDiagnostic: BYAPR11MB3333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3333257AD9525B90B6FD54D186070@BYAPR11MB3333.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t8iQfK6RTX+7+DDhLOFhUQZRVnSIStmqKUSysJs4nidzI1fo8/dql8IyO8O9Ca5hZrfV6G3ia1uruBCr5izNbVxLlPRPRyp1dycYuJvhsMh9zvKUyxdy6a/mGEsEQ1xWkm6oVyE8KsWi9nrkr02JJg/QcRR/oSm/NQSt8hMkf1ucNoRbOhSEmFC31mM3setk+12tM9NEe1GDDTzag/oFVjfJ0bzgiJ58Ahh3NL7ej2eubJHQH4VCPR5na14pSAo41Nm6AqePNkU162x2SAK4qoXBFC6a6colYv4GftCaKU+yq4AWGXKx6JVPOSLplugl5IsYd6238/mO4dODWT+C/Bf1mHZx6dogyWEh8oY8SpIv8eSh5h3qlHOnis5IlIWXltXpE0KPXOkcEMw9kcABivDmZ/zMHwqAIrwco4YldzdssH7PZGACZN6NUzEVjoI5UcauvM2vd+p7Wjl1yOBetg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2855.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39830400003)(136003)(366004)(478600001)(4744005)(69590400008)(4326008)(316002)(107886003)(52116002)(36756003)(956004)(1076003)(2616005)(2906002)(8676002)(44832011)(5660300002)(86362001)(6916009)(186003)(6512007)(83080400001)(16526019)(8936002)(6506007)(66946007)(66476007)(66556008)(6666004)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ekNyQ7oa/MvqW9u+lBX/KljxBUjAelsONAOWLdqNonrNIzOwXFFzX3zkeWZNBe94wNdfxvpZdIFeCGj4UU4nWldYjd8oZY5GGFBNazyFfJRXHW0nuYoWapJtviFRspB4W7byp2pDB/l2VH2ffThkGAijzriKK0Ve+g4JcGU43A/KxnZWADqKOOT8WDqmWRVXiQ4kAEbKQc+wJjTxXIwymGUPnHmDzU5pe6qoSyonaRqZNoQKav7uPMn1Zi6KjgU610+89b21PZXX6yhDWWUMTIq5SqN45EicMiFHZmU8BAi73UmXbqWTwwPMQz52v3IJWjZ/1hNvZMdMaZh4mNP5rJn/TM0ZKLplAyFM3UEpM2dgAc2GgWdbk+5qOVyQZkHQwn2zfyjoiSaw2uB5FawjuNLbSO6nJRVBhoJCiuDGxpK+CkU9ZwL6l0aCLa6/UAkqKGNVM8ZavOoo0DMa8P+D02MVhptV8FY1NwS7WO9r1qgaqjJhWY2NYzoXJNVLbb5Luz8gsd2eHwxpRt0EbRUsOeqU8q6bzLmvc/c49kMnxRx0CbLw356dKP0C+zcA8ttI/9gjaVlb04QAYg4Br9VXVphteAH/bJz+0zzbr5jQnsI9RwpYgB/eFbFeAh2GqBYQ6B+WFFQ7J6znocGxgbRX2A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 224b3b96-7633-4f7e-67e8-08d86e484088
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2855.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2020 00:46:27.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVqfpm9/00XMuby5dvR8wxZVNBQ3Dp+msKsbYxHXL4qzBoBmDK2eG9ocWe8/Iub+5gwZWU2fpeCzMdx703tU0t6UGlio3ahyFUq4aSsi5lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3333
Content-Type: text/plain

From commit 1848f000bad47d98900ef945c76c750c3edf1a1f in meta-openstack.

Signed-off-by: Babak Sarashki <babak.sarashki@windriver.com>
---
 recipes-devtools/python/python-vine_1.1.4.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-devtools/python/python-vine_1.1.4.bb

diff --git a/recipes-devtools/python/python-vine_1.1.4.bb b/recipes-devtools/python/python-vine_1.1.4.bb
new file mode 100644
index 0000000..268675d
--- /dev/null
+++ b/recipes-devtools/python/python-vine_1.1.4.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Python promises"
+HOMEPAGE = "https://pypi.python.org/pypi/vine"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6fadb0e48ceb84b571372dd706ed76a0"
+
+SRC_URI[md5sum] = "9fdb971e7fd15b181b84f3bfcf20d11c"
+SRC_URI[sha256sum] = "52116d59bc45392af9fdd3b75ed98ae48a93e822cee21e5fda249105c59a7a72"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN} += " \
+        "
-- 
2.17.1

