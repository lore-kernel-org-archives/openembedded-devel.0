Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 49984 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Feb 2019 18:39:06 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820082.outbound.protection.outlook.com [40.107.82.82])
	by mail.openembedded.org (Postfix) with ESMTP id D9DDB65CF3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 18:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2Gl46rr9+qAGdQWfK/CkpcWAUcDC2XEYQQc1yNWbfto=;
	b=JT77/IHJ+hXPWtmvd4i2kNRU8/eAtcmI/NxRAu8NKYx3bNRIHzueCiVGHTnhk3vuWdpR3LLWylcCvdSTQo+jb1lEUoUlzhSDl2DBgk/DM20NT0V6z6VlfD2Nzn438N166vNY8BiQX2AFA12Mixh5htVFO3CgFdnsc7Nmzl47hCA=
Received: from CY4PR02CA0028.namprd02.prod.outlook.com (2603:10b6:903:117::14)
	by MWHPR02MB2653.namprd02.prod.outlook.com (2603:10b6:300:44::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1580.22;
	Wed, 6 Feb 2019 00:04:15 +0000
Received: from CY1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by CY4PR02CA0028.outlook.office365.com
	(2603:10b6:903:117::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1601.17 via
	Frontend Transport; Wed, 6 Feb 2019 00:04:15 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT028.mail.protection.outlook.com (10.152.75.132) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Wed, 6 Feb 2019 00:04:15 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:36898
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1grAhK-00040i-NK
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2019 16:04:14 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1grAhF-0006WF-JA
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2019 16:04:09 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1grAh5-0006TD-EQ; Tue, 05 Feb 2019 16:03:59 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Feb 2019 16:03:58 -0800
Message-ID: <1549411438-12849-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39850400004)(346002)(376002)(136003)(396003)(2980300002)(189003)(199004)(36386004)(8676002)(2351001)(50226002)(305945005)(16586007)(54906003)(7696005)(106466001)(4326008)(316002)(63266004)(51416003)(106002)(48376002)(50466002)(2616005)(6916009)(9786002)(26005)(77096007)(426003)(36756003)(47776003)(336012)(126002)(476003)(356004)(486006)(2906002)(107886003)(8936002)(81156014)(478600001)(81166006)(186003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2653; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT028;
	1:Vh2Dcx5b1S28Sp4ciMgbzge4O+cUNqTGd/I64Ecp2tkwzTnY0CtPki/Ev884mhhwMdX+t6AF6fVWk8+uKkFCsaeaHaoeTkWifLPXWNZ5PgdpcWoO9064gJcavp2Cl4dAe2aG8Z7kTB7FzDkZOm6e5dYgtW1Sk3KWcIGcAeSeGHI=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 629422b1-74bf-4a9c-4c15-08d68bc6a1bc
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:MWHPR02MB2653; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2653;
	3:/ky549oc42X7rGGZ2kvIjUoR2vuTZN47+4BLbTvISlLaLcDyuFDlFDH3silNh36OMJ13N6nwlGeqhzOAmCEzhnhRuRI1Zob61szBSOCiOlAZG2I3PGibpXudZEKbyDeRbnGGoeo/gBz2n78kMNELPyfWrFjRJL7Lh/AHxWqpmaifSKY4E8fQhL8c+tzJAzRLKaXoJ5Eu1SCzJF0Qs1q6zbjDMVwwpYL852uQjL2z3kj+xY+hV4GVySKFac3twG69WNJBhGRhfHtot7q+hrosAhp5oXzOmzoCeLlxRrKAfveGNOUqIBDCYmr3bPK7B53Wt+zHFwM/v4Zy3aKnzxEqEyy/zx5/8hhR4+UG0kzUxP5AIEYm/C9DkVI0ucbIQbnp;
	25:veXQj4c/v9B7NDhW0dLk+mVNM802OurOUjW5vO0BKKK77UOSsFdBWjw9DfP6YkGzlMLRyRuV/2HDASjOQpn6sQM3JPrltDqIXhFBT+zp0kXyuUAjDjaxuRpaNthmXhnKNRK4hvt7W9grAAkMbvUdrLGOo0DGQeOq0GA81LkI6WG5kP1fjWH4ApOYgwQcsKaeh/nf4QzuRpe3muKtAqyDFpZZ1beSN6lGkc2Sc31M9YNUXS9Q5CieTgiR4556+Jprw6qyDDhG2xYd019MWCzIDxJe8HHGN8oyAMbaSl4JBK3IJS7VmM3N5QgGjve1nAXwE9/Zw3YbWU0B3h085YknFA==
X-MS-TrafficTypeDiagnostic: MWHPR02MB2653:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2653;
	31:8dMHDI34swunI7pDFUf0tlmr89Nyip7yExjZl/f92HKLd1A8uN5Lpr78MQ0Iat2odpZQM6KDIed6NIjh9nl80ssnjL2SX4YvUxyadHWEnj8cWI4gWv/WhjNKS6/2Res7JT+xfMaqIiU2+K6H0IK9hhsvcZUKETd+j8des7GBNLDpolaMavtMzYnmaokOfBY8dZwf7ln1pE7zmNpJN4SdLVHCrJoN7hNTls3B9tjfBBo=;
	20:luoHsv9Tqo+x/uLtaOfgCZodLcclmwMKTdG2dK+tsMDOhVI9rN2Q8NYtMMVdKCayidioqqcQED/0BysGhpM5oAIktPXmSpZpVBLZuaP3gnTbpIQPH/QsHACm1KuSNAdRsKnFxqEdUpamoXSjJZ9SmMWK2LgekcRTX5CwgStxU95NCbdxtcR6h4QhWoaas450QA63Cl6RNbMbp7Xbx7dDn3HLHtxXrgLZxharW02JQeJhccx+kBcFhGKcVdMUp/SWEQnLz/A2usW6BqP7+OEm9a0BsHHJdZeTf0mew88CU2Rg8VKy83keG0XCeszpdOIqr9u3S51WZWhLXA6thphd4bcYjiy9CgYXS2eajpqKvQbley0NpQcSmwRU1sFKGVFZk19Z8paNzCd9nv17MNrMWVktXQhZIIacBb8t2qQ2YU6PmzJme84B8YIUTdSnnvLKyUguaH/ayS4iN0Ulhnreq1sVtNq5rD18ghoRIXKxPy/KVfVplOfjD99uFdJgS6aY
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR02MB2653D7EE60CE148589C1CE7BB06F0@MWHPR02MB2653.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2653;
	4:kFtIq/EMa21Z/Gcae8nBdh1VAgvuWivJJszniZjj34Hkqq4hAebk+TQk5L/zn23nWQ0RqKutoRdUZXTSc7ONm24ZiuGpfvRvqxiAINZOCRtwp1ixPnzP6nDDGgK1FxTrq0Y2Rz0UijAuHygFC0YTM3FdRWprqADwahMbeT0B1NcPPI0y7gNRH8g8t5OVwuGGCCWAR0rRXGIaKOZkf3Y3gT4qXopSYjYcG61PO1OilEs8hRdbvSMM+gGAuAsQuCEhk20LBtiDgujG9OizFreOnxgHmbCngs8UXXVT36lcL9zHCS9h25aNExmmMoWdHsGM
X-Forefront-PRVS: 0940A19703
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB2653;
	23:Jp0/OTs+9H+FBFRLdV3cdf3SDm7CAUylD+8fwjDtN?=
	=?us-ascii?Q?eYN/JZDi37XoyXNbO64f2kM1Mp9fucOVAXnXK1DN8XbpTR2+w/43ZwpfSap6?=
	=?us-ascii?Q?ykUAzlE6GhW9x487xydaqgUO7wLIUDol+BLewH44fPQufw7RjsZ/SIED62LN?=
	=?us-ascii?Q?YaEGaJQRX38sZeJp95TZ/Eb5iAh6gylQ9RFkhtdN+6468DnAXsSeV/oWHJ4L?=
	=?us-ascii?Q?hncjD2PLFE8Zqr8OXG2jQFCQlyMFVV12Q5Wh15dNMnpOcotct/w+cLDYUYmz?=
	=?us-ascii?Q?wiYRLrMqOo3krkcl4G478eOxmv4UVu/cmrShomaYhSDG6aZuO/Z1V6KEcBtP?=
	=?us-ascii?Q?401i5K4WfazMn7UYqk604UjvDMBzEAYeF5PkCvELhcS7z8PQ/9yRPMz+ixay?=
	=?us-ascii?Q?NefXF94M7E5OBjqrOT7QToFvW/XWI6ao/mlt5mpsBPOMJKKqDRu/g5wSyigK?=
	=?us-ascii?Q?McM6MW6rP6U35+wg42IRnQ00aUOpXep4mAwaZ4uLfYq6OKjqr+6gW3aOMrFL?=
	=?us-ascii?Q?e5hNaYCR4vbROBPtLmwjZWE2HjnRZDxtDtnPRPhZD5Yowo/LAuUqOBG3An1h?=
	=?us-ascii?Q?zRAZFQJ1XPirDgtjPQuj/xZzgEL/6/2z7C9w2ShLQVxBPWlbKl1+cbAyfNRs?=
	=?us-ascii?Q?JhjdqXIeCHgU48JEcKxWjjYVy7eUmOqVodiKM+3GRMdga8Jx7fPDypLA3pni?=
	=?us-ascii?Q?BeMFCyc0faNo3r5dxMQbjJVm04EjkEZSwSau7GzyD6dp7Vt4GVjeVwnDTVxR?=
	=?us-ascii?Q?9VA62dVnzIOpCI0dryPIbmqfUe0j9aLU3Q/9/QnMyFqUuevkFuDoB/Wku+bE?=
	=?us-ascii?Q?R0ym+1tswGRh/pMWpxML914VCExzn9dKX1T99KQ+As21T1tPc2U3TkrvrG45?=
	=?us-ascii?Q?3D3zdKNpbHnSXgreLASMd3NxikPzzFrdm/VWYcwcM7oPkfXUoirqflEkLiUt?=
	=?us-ascii?Q?C9DV9bBBA1tdxpNbPfu1Rf3GHc9VDP1/9J3g5LFFLSrpG99yAV16ZxRTaGeV?=
	=?us-ascii?Q?ngaZMA+WU8q2xlGABOmCkC6F/kqNHkSZF2qdiWKeywgFw=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Y0nq8DbfEfh3MtmoFxeaQrzr4BBKhCnFVyraiff0dKMsxmDaTjkSmIVDxgS76ueHTHa3z1Yd9ftuh+oyZSdIYQIG4XocN25w0O5nQu5DppF8M4jpWwb3nslPhemb1Tq98xoXpYuNmu0XMGHcKA8bEk5dC+dnF9DbV4XJLRIifQQJhrosxdwHIHZQTFQg3jiB5Ze7TDaNsf/kB4gG8PZL9g/drOLtA6G9y87WixWujo/4zCfRA+6HARN8b8TXNF5O9p/BP+nMr24KkhhcXGQIGo5X9VlfdMzZMftoCvruzUNTxVE5dsj98SEBboi3jhdG2OsqndsqmgPrMwUW9b+eKaaxt5Gm1iFFr7nLGtlg39xN8F1VBmqxoIdwHwL+DcgRDToQoyR7/C1l2bqMYje3/Akfay0NvxCLjYyfGDA3mI4=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2653;
	6:irbEiCZ1v1bswuSIdAnGP1MjZHezDeTvbp7/GDm5iywVlHf3UGAVRTTMSM62BkqEa2N0Giz11LH0MqT3eTvEjeHc5PBffT9MkvNWb+QRLLQ5f0bcWqLJ5v7h0oDeWtHdXUNBGZ0mxTqUDpVL7aFvB+A30V5EHXtSyvH/FjZCb3boMUvyDr8ixNJEvvDnyAlXNYig8QYrT0UVnWqTq4tym6sji7YkAyZXqO4S5xeY9+/hpVEPR0zpf8By99xb9UYMP5rhdCNDhzWjjdNBlkRpQa9431Ev1HpuPWAFAjBf+nZIcLx34E2ablNigJqQb8HnSlvcX/5LUayJtUKNyDBMjTKJZoQBtfHNQ0vOe5jgPGr0nUmXrSUTowEiL2TP2Nv37j7grGf6/PWHZi6VlXRoq2AlcCggvEDoIbI1W/9hfIiQmY28mroP5Bgzshe25EGqBgs3uxutOP2IdmuJcmQrog==;
	5:GyJMo8F66poz4cdmk9jY3fb0o0Aiut7+P4nYqtaom/Q58h7+gZyPnxFcypmhxW5X4GQLbGR7eOS0shjDTv0HotBNYhe+gjwMII8AaY5IZdEfG7Sa0reXv/JYfV0JbOasccPFS+X2NNWQ8SHtuTT75oKtLqiBI7DpNPuwNiQvkvvG75E5DK90op+0oZ9zC9Tlas4Y2qB0AA1opNHB4/3l3w==;
	7:dLwqH7jc75OZwmY1T4MtMEKwyyg3unn+schKK7hWJ1OHNRZFrteXSzUkgE/8BKe2NnO0TBYqTJShqXh7b9y0anUzwY0yawLsPoX2xRPuQ7MPMWe/Jt4A8TTY7GqNZyaoOolqci4szwUt1QQSYp+0rA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2019 00:04:15.1500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 629422b1-74bf-4a9c-4c15-08d68bc6a1bc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2653
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
X-List-Received-Date: Wed, 06 Feb 2019 18:39:07 -0000
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


