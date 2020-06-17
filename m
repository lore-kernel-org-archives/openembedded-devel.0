Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.45])
 by mx.groups.io with SMTP id smtpd.web11.2277.1592354833215397380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2020 17:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=S76n5BAr;
 spf=pass (domain: xevo.com, ip: 40.107.237.45, mailfrom: rrowe@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIOush0WBQF/oe9mxoekg6gM3ih7KbZyy+Y4voLcoOLyK9/s17GLMFjZu0EAbIYJh2GF9l2a4m7pWunlgEDT22tsc7X/utYhMgu/t1QAasp6P6oyvg/vRKDdBj0qzCJMTe1xge0lpclnBaXtVZXNkWI/GYce/s4YqbGKn5igIMvFLT2WIYT0Z3tRkrknxt6gaAprqOB79HAb2Qj7S6V0EH8ZjKo1zx2xvjxBEkDz946IZhmj7nqzsH+AN93wkB/PNLOfp91eb5wCysH/5IY2iKUmzM7pCdOIFv02I1JSm7k4t2FQqqf1kwZ5+Iiv5vaCeQP44r8Lodaco/ynos2pLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSp6XFNMGkWyFqQcVANJvnr2Hq8Fl6ibBla++T8+r9w=;
 b=hLVtindLJFGUSJt6BMDj0nqjMzm8CE3ka4sm2RAx6QljjwAsAHrtDjLbXfBCHuyR2EifHcJPhkCcD62G6ochitinzvoyw1oYHVnV4Z2dmVjJfBNoTybGqm3TNFki2lJrQrXsw/CbCnmgtSMRsamf0Vlp+oiZuHDFX30+R+Cmz3JX3jxEi6pEtDqsdZgbH+27tgUW70oPN2xmqqJAgK4M+CyN1rE6LH8DrEqnCP1bwB0DWvqPGO8ggEGikxmp7+dlvXU2mLjMypLT/wSe15NOVv+nfaxar0507Z/tzkQEde4VBeWbsAHxc5UHz5P2d1UNGmMtp5H/4EyAvW43Egc4sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSp6XFNMGkWyFqQcVANJvnr2Hq8Fl6ibBla++T8+r9w=;
 b=S76n5BAryZU1n1NgAOKHWjE0FZ1CojtlwPY4soBXpiKInvhycsYSIsyLr+tYFyh94kEsqmi8U5YpIzwTLHHpfzqXLWAXKZQB/GP73ZWIAv2fnkwYj0KMbR69Nc+tNgYDTBd0zHU6b1nbDXFnlcExXW54pA0hfFvrW8jMGFvCLCk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MW3PR18MB3659.namprd18.prod.outlook.com (2603:10b6:303:53::19)
 by MWHPR18MB0992.namprd18.prod.outlook.com (2603:10b6:300:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Wed, 17 Jun
 2020 00:47:11 +0000
Received: from MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050]) by MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050%5]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 00:47:11 +0000
From: "Ryan Rowe" <rrowe@xevo.com>
To: openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com,
	mkelly@xevo.com,
	Ryan Rowe <rrowe@xevo.com>
Subject: [meta-python][PATCH 2/2] add python3-argexec
Date: Tue, 16 Jun 2020 17:46:48 -0700
Message-Id: <20200617004648.43633-2-rrowe@xevo.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20200617004648.43633-1-rrowe@xevo.com>
References: <20200617004648.43633-1-rrowe@xevo.com>
X-ClientProxiedBy: MWHPR08CA0046.namprd08.prod.outlook.com
 (2603:10b6:300:c0::20) To MW3PR18MB3659.namprd18.prod.outlook.com
 (2603:10b6:303:53::19)
Return-Path: rrowe@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from CASE.local.rynet.xyz (73.83.210.194) by MWHPR08CA0046.namprd08.prod.outlook.com (2603:10b6:300:c0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 00:47:10 +0000
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-Originating-IP: [73.83.210.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc374c63-a133-48a9-c175-08d81257f850
X-MS-TrafficTypeDiagnostic: MWHPR18MB0992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR18MB099282974837F41B3492929ACC9A0@MWHPR18MB0992.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+reu7WjtxJVQiioVMG/oyT7xjca+ZkJYb0KvEQMPgAGvMv4Hmdi4X8+gCwqFdS8Iv1sotTLfrf3BtDddC0mvgHziI3rF7pGUF4OX2W2VvphK6tiH96URq/yV/MWOqPIktdLPZg8Pr3p3+/dN/6wK6/2e+FM2Vmg+FuUxEVqnUIuHRTP+nMZJFFkem4GigEMOZfCr4LHwrRWZFGgLwS+NX3LBbvrTYjwx1KhD9/43/PAlRLAOS58F8sctpgbEKfgzZf9Ctora4LDlhsyVZwfP38XbaUKv2kHCBIIUkpPhGD2+ULrtJzqx4EPSeXpODC4jw5AtMh6AAHTtQC9wk+6qLkc4ZaC0hYGIBKJSX64acBUgEzA40KZKYt1yM9gax1jSUPrjIOAAT83EbMxExMedCT0ygx+sI3ZUBTItQ7YfkUPgFNeDn94i7ysHCkEMZUKeWtHQ8WAaX8aE0YYGUxi6lA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR18MB3659.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(366004)(396003)(39840400004)(52116002)(6512007)(26005)(36756003)(478600001)(1076003)(8936002)(66946007)(6666004)(86362001)(66476007)(2906002)(66556008)(6486002)(316002)(8676002)(186003)(16526019)(5660300002)(2616005)(107886003)(6506007)(6916009)(4326008)(956004)(4730100016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	P5BOPPWfusOLKZhDWUdQIag6ZvY5rs9z4sXQc1QiZUTM/O4jnyeE6AGX8CXJzdE9mwGJfcIPG7O6zO82hWFGxy8z77t1pZ6E/4z1xJ11uG7RYAxO6338ehm5VaWizL6hgsK1NqCmZE9pAmFQGGe6+LSKetJAGNxU5ki86wrSRj1xlXz+axLTVfvzgeg1k+kXke+LQaNnzBSjWQmH/aSlylTTCI3Tz75nff8pjWAI8tI1DrVOcIm17iyNv/l5F6Le/PNSBBCZhyfOy/Pcum+ucHHx3ltEYJzGVYMe08UGGowT1WKHmoLoLK/BbF7sbQj+8Azvau9YvQIyjuYo5CclkKD2mf0zeCCB9Qo2LdXUwsEky9DiuSwYIM/005UD+Bud5Q/4TXCFzzjMkHyDjA7eixlnCoYKV5c3VYkuPVTgvn0C+7cHZxWTbEP38z1qrDMctIVQmumYGhyzeRrOYOz+5REAuCwLqZAuiIQoefVp5VU=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc374c63-a133-48a9-c175-08d81257f850
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 00:47:11.5519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQeEqk61HoH3yz1TXennW19xxL1O2SyrG7SEyTrPEZ5oY5hU244sp4wvH3ueTj8l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB0992
Content-Type: text/plain

Signed-off-by: Ryan Rowe <rrowe@xevo.com>
---
 .../python/python3-argexec_1.0.2.bb           | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
new file mode 100644
index 000000000..64fbf58c4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Expose your Python functions to the command line with one easy step!"
+HOMEPAGE = "https://github.com/XevoInc/argexec"
+SECTION = "devel/python"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "9fac09884c54db79e57ab80f0c423794"
+SRC_URI[sha256sum] = "e271286b280f930aeaae7496454573f8029c3f48ef1dc47c780155dd4a7b9e7f"
+
+DEPENDS += "python3-setuptools-scm-native"
+RDEPENDS_${PN} += "\
+  python3-typing
+  python3-dynamic-dispatch
+  python3-typeguard
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.2 (Apple Git-113)

