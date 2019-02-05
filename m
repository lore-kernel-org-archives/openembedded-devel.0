Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 37068 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Feb 2019 11:20:51 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780043.outbound.protection.outlook.com [40.107.78.43])
	by mail.openembedded.org (Postfix) with ESMTP id 667107BEAD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 11:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2Gl46rr9+qAGdQWfK/CkpcWAUcDC2XEYQQc1yNWbfto=;
	b=pccsGjWIC5UzaRxNsT7jY/rrvu7D+2tImBFVvT39/2EcKFHmmIFmQNLAstQOh0YaCGDcvts1CUVeShepXyfmgFExG6H1Rq0vi+dp9zE/s6xR60FWH0/V69mJP5TNEmzrVP3Yru+nifeOGJQ23ZUvNqkNcE6fEYnLgPIUQWDF7uw=
Received: from BL0PR02CA0119.namprd02.prod.outlook.com (2603:10b6:208:35::24)
	by SN1PR02MB2158.namprd02.prod.outlook.com (2a01:111:e400:7a48::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1580.20;
	Tue, 5 Feb 2019 19:57:46 +0000
Received: from CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by BL0PR02CA0119.outlook.office365.com
	(2603:10b6:208:35::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1580.20 via
	Frontend Transport; Tue, 5 Feb 2019 19:57:45 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT006.mail.protection.outlook.com (10.152.74.104) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Tue, 5 Feb 2019 19:57:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:36820
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gr6ql-0002LP-70
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2019 11:57:43 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gr6qg-00032t-3J
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2019 11:57:38 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x15JvbIR030964; Tue, 5 Feb 2019 11:57:37 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gr6qf-00032j-3P; Tue, 05 Feb 2019 11:57:37 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Feb 2019 11:57:35 -0800
Message-ID: <1549396655-24256-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(136003)(376002)(396003)(2980300002)(189003)(199004)(8676002)(476003)(126002)(81166006)(486006)(478600001)(2616005)(426003)(356004)(106002)(316002)(54906003)(16586007)(48376002)(47776003)(50466002)(336012)(2351001)(186003)(6916009)(26005)(77096007)(50226002)(106466001)(9786002)(51416003)(4326008)(107886003)(7696005)(63266004)(2906002)(36386004)(305945005)(36756003)(8936002)(81156014)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB2158; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT006;
	1:ybNVKMICv2co4FD0J3TPr1i7gTdR8eloX4r2FWAOdurRxpI+5PQBxX1KDwNwlCsX/mtTNFauT8nrzrUvS7bj9Kn+RqPhozpc9POkDZ19NjJ2tOOAWy1dvqYQcm3fiRGcHUsERWduPXEZ4rC89V1ZDA==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c822c9f5-300f-431d-415b-08d68ba43266
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:SN1PR02MB2158; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2158;
	3:vWO9H7/3eMwA+elQyyLYY+Q9gW7sEJ0SGijoaBQxB6/Sk3hsxwIVhPaQotzfqC8bDoLKbrrbvJFk8pflam2hZc3rxIRAD5T2f/Kf40+hUZLITIN2GMVYVgLN5HgF9l1vNe6I0STnDiH+5cqVnSWnuPr0gRupXqOKe3aqKon6nRMzKoIkdtaOzVUXIuGqbx6qPTbvhEd2TBcR/tauNpRe+L0xRecV1uOe5RXKXpEi/4MUwPj6usQMm6ZuuYCnofB0rLUCV/uEMLDqrlmHDAIlnuOnmmwNU8AgsznCWj5s07MFLDTxx1DHk3S2bmb0JTyF5PkQQ+Jcd+aWxmhtyzYCiiadxRidgDV59GhgTeBQJjn5tyh7GsU4mk6JTx/naQnV;
	25:zRI4+Mjn29m6+SuPqzOa+w0d0db+rMkO4X6GsnFh4aKAP0Mw7g2i2oXCjd0YAQxtg1brJFy4TeAntPaIwHNaDcM/n5leGacyAeiO6qaqek0QqxXeWYX7rHS0x453PBanh04jZeuL5fPTHNwa3EMQKIyzh2gEN42JBE+E2/6Xb3o7xQ3zA2hLwQVIXWy3C/4dtskeAmfyKlyy3w5fPzso8InHZwIuzU6VarVW/2o4HNd2W2CiENvr/kiJ8icwV1d5SMdMqi9TB2X950lTWg9Q9vOUGiPufz96SgY4WkvvrMMpOjcN+riyzrgthvsPJrz8w6fciIGFkI4l4FYgEO4Nwg==
X-MS-TrafficTypeDiagnostic: SN1PR02MB2158:|SN1PR02MB2158:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2158;
	31:3Kfn3iKBbKJmelqoLy7QnhhYVVNHAiHNy87eTbRjfN92Lxkk6hyHobubl6CAjZaX+Cg49Vuo4VJr1KoEcWYbuT1m/aGcAIT+dDkBtGI5tUzg4Gi0zTQb99/R9t1wKdJYbdxfvEYGsBqqi5yn3xHETVSTqqTTIqhDaxwxJoXx8nMvKKeDDJnGFWoS+lRO0j4jkjUhqm4Rmq2+ZcbYKU/JlxRr9hN1Fq+Fe00wFSFH0io=;
	20:emYR+AykVkzT9dUbB9S7uUed+ziy/qnSPran2EEGitOkOb/PsiICp431bx0t+mtaTIEhG5W9oCgj8NuQkCm3u47YW/NMldYiQ+BJc8TNxgmXXsDlD+ofXUD2n+cZDIW20rdDPgfkJ+K7AFdxzDj8tfiNUgA+i8XRfy9gUY4Mc2kACY3xG6/OcJv+VZrKpjAjPiGBcirShhhPiOWPuZ6lm+1JNHu9YITzQxGfVE7CHpBCYt9Eq07atiZl65knK8jgkQ5qgJufnvB4Ct2Gm2i3pXayB57BDRsDEYNElGeEqoGXXAWmvAi20ss+2L1iVkJ/aSqTZ7oEa3THY+64h7jklJSnByv39Tbfi6vpkVsEd0znwgc6sjncUmFktqo3RQHshwo0qjTRO6GUPOO3fZYzdVZFh8zqiv039NgcvEdWWWpYFXwgwsmd6u3ixqFJ/QmXwuuNcSEAuc0BU5rq1c2COUBHorEYU8tGQPseQHjbI8+4ZYYT1FCC4OsSb8prH6zu
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN1PR02MB2158E182973620F9D6BD9335B06E0@SN1PR02MB2158.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2158;
	4:nEd9e1E/NjLtkTchGhuyelDfnNhDyUC3wkGagYiyIWXOYPuZh74uOhxnkSRNcDZrtQXB61vXDI0ixhr9/ZllZITtwxS5mcKQ0znAHot1cUXf24I4Nzbj96WM86pU+BWhLxUfXC28rVa6bjqKegH/jP/ZBfZKyzjTjSJWDCfqqibDRTqZzBaU28mHU3DOfa7mmZBHVR1frqDzmuQngYQXtCuuNx8dmw8ffQNTAyh7KsQ/RzkBsGiWA22JbPIU70e/uid6n2KAIqa9p4SM4ZKGzj6P0QFTwS5yCROIRylt0hoi6CN05r1DGdSi5NjLxrsl
X-Forefront-PRVS: 0939529DE2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB2158;
	23:it7W50i8+RUzo99laFG65+1kMIT5nAifZoNOzPsIN?=
	=?us-ascii?Q?VG2D+/uBoJ8kLrrBuM1wPyyTRvUWWk7LI7uFRUrdlV2zYmH486F/B13vfBwS?=
	=?us-ascii?Q?iJEWyCagjlqGCXB+koqPcxX/95rmvpJ5HBfdLYxH0j2UUL34ze0THrdmXLp4?=
	=?us-ascii?Q?MVRBcc+S9ImvmNVKPWzKTDA2nDizEcuunHDmSys04O9e2+eJtcMI2aXe2kjo?=
	=?us-ascii?Q?nfiXwANehfcIArTEznsqKiF3CnwWDFdPDN+G4zacaoaaK9RdJ1W08HuMBybJ?=
	=?us-ascii?Q?7lqZ9sDHHy4v0x+x6War+SXEGycWP9TaRZBqt0W2jGjpYsbuHIq8ksII35yI?=
	=?us-ascii?Q?bqDtoyNt6icD+ZcPF5WVnjVwGO8qv039CRJ54iO3+PIiGPc0fnNc261rgsk4?=
	=?us-ascii?Q?ZuEBLUf/kAv++D7GGDTHoHKghG9h9Sb8pv+InIovwb2y/nyNkebQX6U9rylG?=
	=?us-ascii?Q?QGLCK+fEL3GSv0lWKjMrXAyItyzXQrVpDV0L2KBWcEOMxvnPziwXvqCbulJF?=
	=?us-ascii?Q?KsD7DGZL+XkfiUqmqn31rI/UhgshZsQ0HxRoB7oNFVvuYvlkPfEInmn95P8p?=
	=?us-ascii?Q?igjQsB/X3FVpdL3WO4e+ugLtI0pZEZhung4NU0n6RZEy/AlWQF5IbKNLJDPv?=
	=?us-ascii?Q?y5alf53bftD/JMAAA0ksaFh+/hvE9TgXndvUwtOYjzjaNRylwhsa+EaaLzn+?=
	=?us-ascii?Q?nAMOZN28qP/MBx7yjsZ+hbweCJ4Y1lte9Xqxy5cNOdjaSjr6W7T3p3w83TVu?=
	=?us-ascii?Q?eOEPVMhdI/0xgtQh2vakUl9CCHzrW3LlQD748LXvLXEs7l1PMjJT45Vc+Bsa?=
	=?us-ascii?Q?tcodHRW3lw92G1Vvb9qUlnO0Hu2yUtO00CsbDTqhZQsUkYzea8cX+1JQsnYL?=
	=?us-ascii?Q?mFTdMATBxbabp23ybStxNwyu1nMIanW3H1AJKMRWgCuzkpD/dwstoQAeDHdu?=
	=?us-ascii?Q?3F5eDPSI4zBJ6DIKSzNCPB+WPRFnqQs5w6vDXzqREW36wgJN8cW3TGhGtYIl?=
	=?us-ascii?Q?vr884jiRGOgBwIqlWzOW2W34iGTADfk2L2rrX/mcqMeDw=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LW7fzLvMOO2B2dcYxAew+2yhxJw5V5zpeS0QOSzo9OjJWCA4uPdrgQrnF8DB5kEaj8a6V5BR+KVUC/ErUJRUddberCoaV8MY1wWxNEJXYRKemCH1fIU8VzpVIQdBsUej+tpiCCLZkQ1GI5QNF9h1/8LTY99RiQs1wdgkf5Yzr9kxvTTaDwNAxW7uYWngQ//quDgF5j4QW00hFClov3KwkNcNUdPg2NPR8IBqIfkQq9dBEQbJobb5QIYzpfbYmi667O0dl6LllLnmp/8+ILgwQ9fQLIMRb0TedRzNXeK+RusdjQTJr3Cy+rkrxhIHxgJObAA9kWhmhC/D9HWsocJ7sspjDw3PpUCB+G4YgMzVZzatTqD8MhoXoEn9wCmnLqwirkwQ3Ijaa/m/MgUAGZtx583O1LZogrzPYvW45FAsBic=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2158;
	6:APxjPI6QErh5WANki5XwL+s85jOK8i2obegxicwDtDAZkKI73M3WYvVj5X0Mib4Vcefen6eQztXXTFOHS5RnVix401IWeY22YLciEMe85PhAp3hFpdGEZ7sKqNB5t51E02dg+4MIOsjKLL8SFMGVaSWVfadnRPFGiESiB49IPvOsR4xnM/QURyhsOnCBzDLiLb8Z2ssLYX+e8I8nKRM1LLlYGu1phVu1NoO9AkvbgOlIDcQULWQm+BD6IwjqijXdFunFyEzYOJc+tedlB+NDbYqZJGB5qUFUg4MBIi/s8UiokLQS84F/dEvcPsGzuV3o0nOuMYcWI8bYI6U0z6Kmt/LTtKQCnfq83rHQwxXF/iN7xA2WBsjYdl+gn4LVJehgVOs1r3JqOJxhK+Tnkvag6szdWlMQ7xdIlUtYaYVOJWDBJopQ7oF2D/oPfcJDBFskxAhuWp9I1n14nRkXsQXfuQ==;
	5:/jEdgPoxgDXs/nB19jxWRYMLmJBvZe4qNyFgZ0H1DQMngBDX/pQ0qYeOpfC7wIJhqPjAT9hWcf5AGSg0ScIzzLRTmBcADthpsKMi7ovC8iGEzN+VUiqcPK+nE6QKFV+RAyBEqBLsZK+kBPJZa+6P/wTRtCJybxwOuRYrCG+AF4vy8wT5Yxn7KRSN1NveHsF+mQSNA9pc6EHnqHSizW67/A==;
	7:R897o5qa3kMh+Sv2+T13RHpuFvwKQq9gr6Sxo8H1ka/jM87kocZ6c0yKwN14C2wRN9Z7aqVNIXL5gG7tALhiU5Z4OS7HuSPHrNeqkLTbpPF+Ot6aPS7T1VC0HU2KMbq0PlaOxDcOYmDiBSXaQjzmFA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2019 19:57:45.0869 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c822c9f5-300f-431d-415b-08d68ba43266
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB2158
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2158;
	23:HGUX0AvuFAdopv2wz9A26W/sy3kisg8kMx1jWkz3RjvVFb2pRE78Tq9/SDvvozV2m6Utuf7GJThcX3loJbDcJH0EcAKjeF5GpZuvUXhsnmbwd0ogfny5RUbizMbCwQy3BQ5FIZdJ6Xjv6yVA0/LsXQ==
X-OriginatorOrg: xilinx.com
Subject: [meta-python][master][PATCH] python3-twitter_3.7.0.bb: Yocto recipes for tweepy packages
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
X-List-Received-Date: Wed, 06 Feb 2019 11:20:51 -0000
Content-Type: text/plain

Yocto recipes for easy to use python2 and python3 libraries for accessing twitter APIs

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 meta-python/recipes-devtools/python/python-twitter.inc  | 17 +++++++++++++++++
 .../recipes-devtools/python/python-twitter_3.7.0.bb     |  3 +++
 .../recipes-devtools/python/python3-twitter_3.7.0.bb    |  3 +++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-twitter.inc
 create mode 100644 meta-python/recipes-devtools/python/python-twitter_3.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python-twitter.inc b/meta-python/recipes-devtools/python/python-twitter.inc
new file mode 100644
index 0000000..f5657ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-twitter.inc
@@ -0,0 +1,17 @@
+SUMMARY = "Twitter for Python"
+DESCRIPTION = "Python module to support twitter API"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0307fffd8c4d9946c029daa1426d26e7"
+
+SRC_URI[md5sum] = "c6dc2f315ded761aafc96bea3351c7f6"
+SRC_URI[sha256sum] = "fe85a79f58a01dd335968523b91c5fce760e7fe78bf25a6e71c72204fe499d0b"
+
+PYPI_PACKAGE = "tweepy"
+
+RDEPENDS_${PN} += "\
+        ${PYTHON_PN}-pip \
+        ${PYTHON_PN}-pysocks \
+        ${PYTHON_PN}-requests \
+        ${PYTHON_PN}-six \
+        "
diff --git a/meta-python/recipes-devtools/python/python-twitter_3.7.0.bb b/meta-python/recipes-devtools/python/python-twitter_3.7.0.bb
new file mode 100644
index 0000000..6a28b08
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-twitter_3.7.0.bb
@@ -0,0 +1,3 @@
+require python-twitter.inc
+inherit pypi setuptools
+
diff --git a/meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb b/meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb
new file mode 100644
index 0000000..c2e4d2e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb
@@ -0,0 +1,3 @@
+require python-twitter.inc
+inherit pypi setuptools3
+
-- 
2.7.4


