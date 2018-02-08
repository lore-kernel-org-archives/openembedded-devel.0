Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0042.outbound.protection.outlook.com
	[104.47.37.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8393E782DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=yCmgVYwFUKqUmqbZKYEKxHrnBMp0vuAxSbGs0OBaoVk=;
	b=MaOyy8ZgUKad2u0voW/fE2WoQQmul134mSyE5yauHB4Z3tVWYjNz+LKGlVaVcASpi8uU7f5y24P/pMmHLuosgSM90bIhzHSAS2uNeiu+iIR7KzAxAFM4F9cq/HpAr9r9fSL+EA0xrzkggxAOA9C47mOrCWWLYdesZtWw8J9UUkE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Thu, 8 Feb 2018 20:16:18 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Feb 2018 12:15:51 -0800
Message-Id: <20180208201553.26484-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR20CA0004.namprd20.prod.outlook.com (10.171.151.142) To
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 572e4363-1e03-49e4-c20e-08d56f30d089
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:BN6PR0101MB2932; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	3:3+s1zO2AKQexYp4rkU8d6a6PLraidUH4iMoPt6MYfVFACnCnRMyw1DBr8qJeGChJKkdNtcIlFz07QMViSwvvEYhoRMO62rKqm47ebygkr8PF5Cw89DPh2ecaHTy5/nPhyPtscd3hnL6zwztxKaeemEr8dXy3WeC+tZ1Y32hX43VPdsxL36+K/DBKF645m+N5nBUwmQBSA9eJGa2x3n5AJk8FKiYxUA3/75sQW0iez7ZITdpcOzBeZlkJKYG9WHHP;
	25:xolKbAtBZOmTH/VDCBNYnPExOqh97QdrQpbrWvE1bIdcoqvBwspQfujCUqMM+CgsepN0vSSWAHT99PLqTaszFV332yxGLhiIvpco3rnKwb4RU0BzYzql3+mxSW/LCIxVbLCaECSj9YyEQmiAKo2tj0KbbuCKXocTxq0BnGMTfwqT6vrIN3GNjCJpwF2ZSE4mh8yubtqhDQam31eOtPpSb0D3xMXvzIEH1wJmYP0ToYwA38PFSo1IB9xUBI/38fqEncn0TRm7HRqe62CB5qQyfY2VnGxf8IdG/2cI/uHZsXDfcicAW/NXc3tSN/LYg4PRkjApo8Q8/arci06gq3E7sg==;
	31:UCxesYVNJHvI1rjk2Y1o4WElsBDKootwsaSCLcO1JbOINiDDzNVqIIcsz/e0AIVmdQmp+KzvOWhJdwOvKKKemBVfZpB79eCy1SpUL520grbvwxqWkVa0LVjoETvzowke8Xx90Q35Eh8zkpEIBfMQronCnU9xOgD93kW46koRsU+pwyMAxxG0JKs6WTRAtpc+kaCfKF/xrLmYSXKKc7Y4IhxJzgiDlDtLqO9uWQ1sQ0k=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2932:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	20:i4NJPHDDi+v85lp6pq9UTlYqnQ++gnjl7nnC4dGAGItfb8bQ2ipfX1G3DulZpaw3SJPT1NyKGGz9zCldY3N8beHPrCOK845d8SPbgmSXAARLJlERYFXs2E0ZEfPIsT+1EdssgsMXCJIyUuy+Ov/AWHrtNau+0bJHr5jbTR7Lk2lVjrn6rCTVAZngrmRDws+MwtAeI1pX9rLBuTuHTqtmFEeWCaWlUYtNJnfBKh2h0kIyVnrU2X660QMloZc7EbUWWli+GHf1gHTIuP3NS1Q0mwuznf4kXXVH6a4ta547dsn60hR6C9/OAPqVYa8JthwQoX356KZZi0hGQG4+ozeHnEq9+TMwAxIQd9pOv2ISQe1ut9qfRAtH0+xpJOtYWP72pVU62qvP5LnY9mG044hJy5mVnsL3cqumep0OqnohfqM=;
	4:741iUoILnaehvVZUYv5Z76necPX3j04D4BSIcJYN8CGdJIPIl5i99y/N/beHISskd3xnH0inPkMHDB9VtyUKhyz/fuRdb63DmK2x8UN7HTOqJHT0uiC1y7wlr4sPmXl2wnkQ2eJqOzRknUTlh+1LswfjwKCq5bc5puGyzEdWv7/LjtFu4g7Y6O8S9zNXJSd6utDhAszHYYDICv0KidmwKV0HkvSg7qs4QIu/UVhfhtmPa2650fGnT5shaAfYUYesXENVvEX6NNbGUS5YmJYqXw==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB29320C53F4400333D9364C0FABF30@BN6PR0101MB2932.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231101)(2400082)(944501161)(6041288)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR0101MB2932; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR0101MB2932; 
X-Forefront-PRVS: 0577AD41D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(396003)(376002)(39850400004)(366004)(39380400002)(346002)(199004)(189003)(36756003)(2906002)(26005)(2351001)(50226002)(106356001)(1076002)(3846002)(6116002)(50466002)(105586002)(6916009)(48376002)(2361001)(6666003)(81156014)(81166006)(4326008)(66066001)(97736004)(386003)(186003)(8676002)(1857600001)(7736002)(316002)(39060400002)(16526019)(16586007)(8936002)(5660300001)(6486002)(107886003)(54906003)(53936002)(478600001)(47776003)(25786009)(575784001)(52116002)(51416003)(305945005)(68736007)(7696005)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2932;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR0101MB2932;
	23:0PbZdqAXI5Zcge9PpA0NGE+KcDlx7NlpoPlRbY+?=
	=?us-ascii?Q?5q09c2GIAbPzwsrGnO5r9o/Z1Np8f6tD54RmzKv4nwkj62etr0cdfxI6JyZF?=
	=?us-ascii?Q?aa2BgNxWfN2QRIuVGQtj5ubaakpelI8irU5FBP+1Zbnd12WFkDytAg9Rays/?=
	=?us-ascii?Q?HrXHta0tveYAsdSqGluUmsOKv+j8j3s6fmATgs+v1bEok1PLl06vRdFv0uBA?=
	=?us-ascii?Q?nK/uVXQnuuwfNRvYXxwmEQdLX5OAMDIzDrd9E45yP6wCPJ0yYTA5Sdxfa3Nu?=
	=?us-ascii?Q?N0wQ+/9S69BJyum8oEXmwgw7rmRmWTb8d3E+7fMS4Sxh2ceFcPsp+Lg9l4+e?=
	=?us-ascii?Q?SfzKknXMuDPEMdG49GWPahTt80fhKAMTRawnMFSbbVUMCv79XTd6ZYiqTuf8?=
	=?us-ascii?Q?Z5mscjHHh585hAKVQrp8S0yVba8GPEbhY+1Bd1QEnofWVdyJ/KBL+P7kCGCd?=
	=?us-ascii?Q?NrDEmNLV1nuAM464z7TIxV6WY6nAZf93zQL2hmBRjqI0YuZYgUzEq4d0ko1g?=
	=?us-ascii?Q?S2kvMpGDX3/MvgK6/MBysqP302YYZdtB+BBT6hvwdBr/LQQt/a5UWjKIw/vZ?=
	=?us-ascii?Q?aWrJuw3GqQDSGgmUVNg2ZyV9OI9gpUHOqIgA4vZa+40FuxE21ED/koxzvrEk?=
	=?us-ascii?Q?Nt1rr8azepdHs63+x0qYeRlshmRCjOfJSVmlMB5a8fvUADzE9rHUzTJcOdsI?=
	=?us-ascii?Q?lMyzyVt9CZidDhyvhhXU8nDAC3aPbOkl9C6HvNnqztGgLg6Qs+deoRRr6lko?=
	=?us-ascii?Q?iwt9DEKCO3V9TsvVMKY7WGstSqQu95ZD0GNV8UamGQUbbAGyWXwb5KmowT1t?=
	=?us-ascii?Q?cNE+ZLIMHIwnj3t13jl8BveLNGDZK3m9X14RP9LjoyqUtzGFbrRAzOihtBx+?=
	=?us-ascii?Q?I5WEl57Nlje8sfBFczGEcDckQR5Myp/trHOs3Krl0PSgD0fnNVblwy7KBxOC?=
	=?us-ascii?Q?saG1I4tHd/q8OkYskninIV8j3dQrzIxEx9PNFg2zeT6Ix0Ks7AoX9pNgEok8?=
	=?us-ascii?Q?IMdXzf/NrOrIK+avLbt7u2fEqXGVLMMl1ExSklH7hna/+2f18EYXuw1BivQn?=
	=?us-ascii?Q?k+KBEKm3Yj92P9uqMjpyJgDlJHnRm20gmhi3oqItEBXymRiWTdmIPX9WWE24?=
	=?us-ascii?Q?eFCnPJUEQC8oVj+Hw9emPn4ZERqF9ITSBTkZYlXkwuZH8UHuOJzvD5ldhnfF?=
	=?us-ascii?Q?yU+2k5oDtQy0qRzqeZZsYmR+8E8eILEQPwCWk?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	6:Ck73J3CvTtaG8pIyajS8/oYpws1WxpgmEa7mppiyoRJGPp2BFGPBCd6bCJsXI52htoEPDnwASc0x6XfuKcInJhIV/3wpySCu/9i6aia+icw0/i/8ub7p7rE3MJR8eyAcSi/N1q/PyJ4k2OvgyA5xv3SoXXK/IjM+Ww/iJJESG9JPw0Hh8/dqxrhJhtClQ7BgnCu23AwFvgj4wNnpI7Sk8TeVJ/59WH5o8FXQEqZ4cAkl2SMJxJ+Kjn5iFZn5pP4vAvHCAcchf4NqZTJydnYm1BzM8eRAI2wbwQXtVqSC9AwlB22qteLOM2Pk0bgmocgoQKPqreudhL9l3B7mpMASgui6PlyH7e55kEHL1ff9ggY=;
	5:anJjW9FlLGiKdDRk6n8Q/lEkcFJZhxKwIUeq8ObrcK17YfYU0AwQE7b9G4ckGgE4wim4tEdopfPiE/z+Vn3ZZZeBwCIA9N0I7WAZEa1veTZD/B2HppznYlLoQtY79CQOEpYevtBQty+qmXewXyOMJiL86ldwgjpo++VaIjvu1kQ=;
	24:6PO6/CzqxP/XFXLBlphxFrOLPqJT3rpy22OyadanPOyoo+/dS4z3wOcW8AhdcIj8g/xdQ+ZLB0V1jVdcnijw5wQx3OxhW9FK0T8etBx7Cao=;
	7:X0MFF8bHdjveobERHPTE1AeAu46fzjfCCWdTeZ5WKxuF7hKwIBtZc7OJV5/bGCjM3cEfpt6tnopgQkBeg+YLY4j2G9bIkCgi2C1HheiqUuVGK7MA7C45k/tdjNMKtntsIL3UMSBNlbpUvu8LPRG1j4eahTFyKDFDZOiF9QDXZJSP85fivanxiMXWBQyjPD38xHTLqW9VSI9FHxjjmP+LkbNwdjq1UVVY7Lfb0BknyRhgrW+l85Oja7dhbsFGL0Te
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2018 20:16:18.5751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 572e4363-1e03-49e4-c20e-08d56f30d089
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2932
Subject: [meta-python][PATCH 1/3] python-cython: fill in missing rdepends
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
X-List-Received-Date: Thu, 08 Feb 2018 20:30:47 -0000
Content-Type: text/plain

There are a few runtime dependencies not listed, so add them.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python-cython.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 6e424a90c..ddaed1d16 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -13,8 +13,13 @@ SRC_URI[sha256sum] = "6a00512de1f2e3ce66ba35c5420babaef1fe2d9c43a8faab4080b0dbcc
 inherit pypi
 
 RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pyparsing \
+    ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-xml \
 "
 
 do_install_append() {
-- 
2.11.0


