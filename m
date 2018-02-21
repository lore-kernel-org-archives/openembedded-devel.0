Return-Path: <BSREEKAN@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0050.outbound.protection.outlook.com [104.47.40.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9337B786C1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 00:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AlH6eUWp1o9Dh1DoCKhZ53sxGw7M9ptkVmxKKxoSt60=;
	b=KpE1uLj4N+h4hiAcX7tDEktQmzMkdPtTvjbHmy+G3cOXIugd4z5Ywp92dgN9A/U386LEtQLmCKGq8BYaz/TOTagrDZOM66Eh+6TPiQzqqDUN/su2dc2k7OztHoKP1mN9ko1xlRGObSk791//au+Xdn1l/uOnWmXgCEWMSUUuNrI=
Received: from SN4PR0201CA0048.namprd02.prod.outlook.com
	(2603:10b6:803:2e::34) by MWHPR02MB3392.namprd02.prod.outlook.com
	(2603:10b6:301:63::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.527.15;
	Wed, 21 Feb 2018 00:07:39 +0000
Received: from BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by SN4PR0201CA0048.outlook.office365.com
	(2603:10b6:803:2e::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.506.18 via
	Frontend Transport; Wed, 21 Feb 2018 00:07:39 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT036.mail.protection.outlook.com (10.152.77.154) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.506.19
	via Frontend Transport; Wed, 21 Feb 2018 00:07:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:43370
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eoHwf-0005jC-M8 for openembedded-devel@lists.openembedded.org;
	Tue, 20 Feb 2018 16:07:37 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eoHwf-00070t-JP for openembedded-devel@lists.openembedded.org;
	Tue, 20 Feb 2018 16:07:37 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w1L07VPF013000; Tue, 20 Feb 2018 16:07:31 -0800
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eoHwZ-00070Y-BM; Tue, 20 Feb 2018 16:07:31 -0800
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <manjukum@xilinx.com>, <alejandr@xilinx.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Feb 2018 16:07:23 -0800
Message-ID: <1519171643-9049-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(39860400002)(376002)(346002)(396003)(2980300002)(438002)(199004)(189003)(77096007)(336011)(2201001)(6346003)(26005)(72206003)(186003)(36756003)(47776003)(48376002)(6306002)(50466002)(2906002)(8746002)(356003)(9786002)(478600001)(107886003)(59450400001)(54906003)(316002)(110136005)(6666003)(63266004)(4326008)(106002)(8676002)(305945005)(50226002)(81156014)(51416003)(5890100001)(81166006)(5660300001)(8936002)(7696005)(106466001)(36386004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3392; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT036;
	1:Eh58sRX3W+sspol0z0QXCCBL3WPZX4TkhRBoCiuhN9DiDEmaEzgQ5ZtPFqjDtcVhinu9Dd1PzI1OJef3Xqcn9tLCTYJvbtRCdnrcckngkPsoXZZrFdWte3uc3fg8tYue
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49dca81e-9479-4b79-860c-08d578bf1e40
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:MWHPR02MB3392; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3392;
	3:wyA7F/n0JqfIY98QVJcVD0/EnNGT42scKAFLeBcZL12k/c2eCUg3c1tqzMhsCHhi2TVlGr4hZEEDibw8PdayxNdrGfHHOsC0YC3IZGx8DpZ8xYBwkK84TWRZcOJ+poGU3sO6AlEIYAMhM0qru1piKSbXJvUKuDyrmdz86qMFoIozuaA5xyZllCvIzVzlCNJlh/KB+C7QGjXzlOctV3mksfPM9f1kf8yu4LwoaE/NN4GYAuXqg/CW7BVI+9k/p0AZrkfmxAdR/NMw1OPrloXQ5NfeEbt9vUjcUnd9+KzKgfQ30oI5mnLo9hJAVaddi/TtddfVQpf0uhXKMTL3A4sPFIZ2b3reOz7gAqdjKoJqD3k=;
	25:TLraQnk90QoxlgBpw3MLr2lI4Mx/3wRuLKfhSBWXVOd/KaojoAnpPT8lXKF7qMYXFw1L1X8wLova5b9MZ5jDuvf3v2dSb9HB+NLPkaioson2GyNxcwShJOgLTIywovq9Y56CWh2ucdnV4rGpGvKNdxz0TRz6QOqh/KBx68A+Oq375gxuEvxYBNio5xjGSHUaJYjdzLVWJy9ejL5diHiMsmF7Jul2VDkKDwXCXifkxOoWOHksdgHprO3L9TF218JyZpdpOF0IIvKd8V1yU7l3eWreKOS4PpXXLkkbaJHOafmMSAeYQ/7rwbb5WwCPY6mcqZmqKFtQXPvDQoo0Zhh6Ow==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3392:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3392;
	31:/Gdg8ZmWlBUZAtFHAz3fc+YPlAxMxkuFxr0xqlTXJaHsAKHG5ROm9RkrUR9AeR8jxH9UDy75rfCG6pEgIfqyBwFi7aAWmb1Y/x+oKIdi7EErpnZ08tqOMsjojrynn34xEIkW7Z9Jm+fK0ncjJsdzDFB204DuU1ge2QUC/lHLBQBhVoPxvdfkoYO0FHxcnM3jrEyzvt5qff+WBivdd3Zj+TBZEoYCCXpWbY5kiTzf+IE=;
	20:+Zkhy0rLkteWDZcMWUDwJdhpj04jQIr3Af4Nv3v2Y2p+OoNL5UMp5fT1DbTUhH7YW0TklVyxENi5hGIlH01vstnxpACsWcvnVLaxXGxbViM3F31gq+qYsCLZriIqKhKhbi13sYAJdwOpaXLKPWawBrngLk0rK87a4USiLXiBWd+TKZzyYYwpBrbn3JV64KGQnfucIb5pSaQtm9XiZtXck+A3Hx9X+/ZMW9wuieAns8lFqbxM1oBy3HncGo73ihdC34rKDOiY0D5i/S8jSfIpymI4A92Mxd77SCPE479ZLtxCS/FHv+RnCMZdzdrXTxsIJkyh0uZly/i1tEA89b8KrVYTF41FTO1Bl6hdsILv06an1CoWrhauU61GWFlbRsqMGuQgbZfyRKLm0BYlAJHp0Ptzo1t0hu7S7pZ+Ct1qIunxqKN2Z/0nAnCvgGH913MzYA2iPYuHkbb9avFV05kv/Q1IWUOc5xRUcYhKLsufSmtBC/EhL2hEy3tN3KWVfts+
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR02MB339280B3EFC94AE46E39E4FAB0CE0@MWHPR02MB3392.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(251646265452963)(192813158149592); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001061)(6040501)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231101)(944501161)(93006095)(93004095)(6055026)(6041288)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:MWHPR02MB3392; BCL:0; PCL:0; RULEID:; SRVR:MWHPR02MB3392; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3392;
	4:YbtmTBg8v32O2N2vt5P0CzAIM11uL3s0qqp92vIJXlfME1gHKSWmo87umR2fsD3dz0f0Z0lG1emQuJENyv2Dj5/ls/ejRz+wTsnrVN4HIPA8bVZeez8dvusxrecXx+dbDwaCC7JFgYwmciSdqKfFQlno8G+rGRSSrECC+AGFN1F67TK5MjQX5MLy0qZRfMbvs74T5djIqHCH4jW9Rw3xxN8QxXwL/PE8D3w5OpE6G6pBWy7yKLIqllvNha4HejnHLm2jqBIzuDuDE77+WtsE0wV0qnhyFlPOoEGe4WqSjRxOwxJjf90AGU++XmJ5Rqk+yC1HvFPZ1lNQeKeQvLxXWMPKrLoE3qcWWNwtjMcDT0HsjOXGc2ckWShPFvXxRldR
X-Forefront-PRVS: 0590BBCCBC
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3392;
	23:i/ZPnsrEoUIEuFZ8n26PamdEbLRN0uxTZFMH4I11P?=
	=?us-ascii?Q?WhAKBdtaRhXVDvUOxCpGiCEVXBXU7uw3WCoLbwx0Nj7WoHZE8QIaODpB0ebR?=
	=?us-ascii?Q?WCfwYZZOlsqw5e/mb/cOL+LEBFsN+WQa63EJkASi5ERjHGS/X8I0OicRfznS?=
	=?us-ascii?Q?/MLlZdFpdh74z1gtCOQveQLK+TNJwGEvWbfoGNDMl8lxhmUPQKcDp0vccu1L?=
	=?us-ascii?Q?diDDIRtQR1G/GfbuXn2GZWoTLQ16yfTieNIHH4/a9uqNAvRHgIMzhd1SXh0d?=
	=?us-ascii?Q?UfCA/zNFtO7EPphxcUv5ZmIN28IVKxVt69hnD5P3iySSq6HSS0MHSsRpXAUi?=
	=?us-ascii?Q?tpiaQe3rcB30BJ05iO0Hne51fEJw3aPx6785338vtru7/giE0dEpEwr+5FE/?=
	=?us-ascii?Q?hohN6jENgcIvEz5NrultwtZtWPvqF297pzaqf9x2VP7WOvcorC8TH5J+XtJ8?=
	=?us-ascii?Q?4LdsECm7hhtCwQPApSmUaSWcVbc2MP5sIhi+D21CccUfq1OGvf4D72Y5EEzc?=
	=?us-ascii?Q?XRAQ0+rqmVLD/zPm9OBis/RroqiTKKg8WZrOH8A9cYIA6UOHQNfyWdcyZMfk?=
	=?us-ascii?Q?Af1Rrvad0PnBywum1ONa3/vMZZcSlv2fqOk8xSPjr3+3/a1sS6u51Gp852MS?=
	=?us-ascii?Q?Cnhnu2znTIpON8Uzri4/hKXyw6RD5hqXtj2bcYC3XFikOD02bEkWb0lniIha?=
	=?us-ascii?Q?XoFBgleqAyKrUKHhGrwNq3aQY0Zq9O0dyQSaxIvXVwlGotVQ6sPISi0Edj1r?=
	=?us-ascii?Q?1da7OaubV4pij4I0jDElFli+ModMxLVW2kjH75jZzuj35gjQ1gm/Ug5nl2Dl?=
	=?us-ascii?Q?WxQhvhE0dt4k2T+JW2LnZnTgpTsY4Mn9Z3dQG3fWUCHnYMm99Bn4TgaCIv06?=
	=?us-ascii?Q?q2MW1wtvNnUyKesyzUL4iw10KXCuvV8N3JSQTYr1l2a+0bnNLy2xSln2eVLh?=
	=?us-ascii?Q?Pmf+QYa9OU3iQdBj02jFsRkA5duaSrKTvmymUrAO0DVqknj/ueqHxlN0TcYo?=
	=?us-ascii?Q?iIMZ7QiboKLvB5vT2VwZUzDuTMgJ4X6l5Zy5c5Ret5h19rvHKAlra9rRiw+O?=
	=?us-ascii?Q?SSJoOc6gRGOqs2/j5p8VU64q79naEJfhK24hSYrJUXC6kx6pus4qtDsPWCV6?=
	=?us-ascii?Q?JrFD/m9Qro+CyiiHXoX93GnvuGiRpjJ?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3392;
	6:vbKs+z1ufyssBxYFNfop6sg5oXIewEayCBVtF75ALNgff7awf9ZZVURk2Wbdx3cfBxye3Zuzl18M3eY2Iz6jSozh1I4uwoRvujokSLelQzkzPtGGso3K6JZyODOu/UwCjJan8DAT4chzJUb6nNETrENLDPHbZb/PMcVZiK/zZygHqAFquJnWd24RMWIdqoGC6SsDufV9XhTf8hGoEFavjv0bylxH7JB7DRwOKgWSo83Esl0O80LJPlAFic0O0yGFQzJSTmItECKtNWuScYTwpesXuAFWEI9Q/5fuAvk0d+cvh43qZOM38eXOzwiwqFwVBmUmTqQrDflGbqZMyjYmtlLAcqyiDZgDoOr83LwjBV8=;
	5:wEiHf1Ph5NHK7C5QsZvIAr5ZolZREuhKHEVD993RkJX8ZfI7vwW2eUa6cq3WnyEZX0GhiZt18Z8l6FDoDXu5Y52yrPK7M/aYX/zcQMX2Qr8LtMO3yLNOani2nA/mUlW64ylvWPt9Y4aC8QzJ3Jh4tCvxQmUQ7URBnUA5pubjqFc=;
	24:N9qpEKzMKgdXmaVI2gdSriUlT6I3PrXjWFGqtm3TzneLAul3rayk3OPoihgV6uHgcOHZ7C/b5MlhaCNfyKq3iPhKtGS5wb+Vw7z6IiIz5NQ=;
	7:oHm0EP+DTEuHuxe8MFz3oYoe0zbQjcXPakZndPHVi0SIdfoRbqismKBWjIqdXv/Z389dOvtA1YFuneK9xLeejqBo4I1+Du/sqRt9lB/Tehy43UQV+Iv4LVC2U0UFseuQ7wVuHW2lSXfdgdfQIsw6kbfo/Khq4iUZunVIpFUasfb3Ll5bgU0TQVc6zu6nARH68ASl1aR3Q6m+qo/fUwI7Cq5cQsCWln3m0SmRdwmYLNNXX041o9hZp3roKbnWvS3U
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2018 00:07:38.1924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dca81e-9479-4b79-860c-08d578bf1e40
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3392
Cc: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [meta-python][PATCH] ] python-oauthlib: Add python-oauthlib and python3-oauthlib.
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
X-List-Received-Date: Wed, 21 Feb 2018 00:07:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch adds python-oauthlib and python3-oauthlib.

Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayath=
ri@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../recipes-devtools/python/python-oauthlib.inc    | 25 ++++++++++++++++++=
++++
 .../python/python-oauthlib_2.0.6.bb                |  4 ++++
 .../python/python3-oauthlib_2.0.6.bb               |  2 ++
 3 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-oauthlib.inc
 create mode 100644 meta-python/recipes-devtools/python/python-oauthlib_2.0=
.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib_2.=
0.6.bb

diff --git a/meta-python/recipes-devtools/python/python-oauthlib.inc b/meta=
-python/recipes-devtools/python/python-oauthlib.inc
new file mode 100644
index 0000000..c5de8a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-oauthlib.inc
@@ -0,0 +1,25 @@
+SUMMARY =3D "A generic, spec-compliant, thorough implementation of the OAu=
th request-signing logic"
+HOMEPAGE =3D "https://github.com/idan/oauthlib"
+
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5ba9ce41463615e082609806255bce1=
b"
+
+SRC_URI =3D "https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0=
684165bb38c51117f34e175c379fce5c7df754/oauthlib-${PV}.tar.gz"
+SRC_URI[md5sum] =3D "277a9a966cc8c72e492b4eeb41332445"
+SRC_URI[sha256sum] =3D "ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2=
539bbc3ec70ce1"
+
+S =3D "${WORKDIR}/oauthlib-${PV}"
+
+# The following configs & dependencies are from setuptools extras_require.
+# These dependencies are optional, hence can be controlled via PACKAGECONF=
IG.
+# The upstream names may not correspond exactly to bitbake package names.
+#
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?=3D "test signedtoken signals rsa"
+PACKAGECONFIG[test] =3D ",,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography=
 ${PYTHON_PN}-nose ${PYTHON_PN}-pyjwt"
+PACKAGECONFIG[signedtoken] =3D ",,,${PYTHON_PN}-cryptography ${PYTHON_PN}-=
pyjwt"
+PACKAGECONFIG[signals] =3D ",,,${PYTHON_PN}-blinker"
+PACKAGECONFIG[rsa] =3D ",,,${PYTHON_PN}-cryptography"
+
+RDEPENDS_${PN} +=3D "${PYTHON_PN}-core ${PYTHON_PN}-crypt ${PYTHON_PN}-dat=
etime ${PYTHON_PN}-json ${PYTHON_PN}-logging ${PYTHON_PN}-math ${PYTHON_PN}=
-netclient ${PYTHON_PN}-unittest"
+
diff --git a/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb b=
/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
new file mode 100644
index 0000000..4329d21
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
@@ -0,0 +1,4 @@
+inherit setuptools
+require python-oauthlib.inc
+
+RDEPENDS_${PN} +=3D "${PYTHON_PN}-re ${PYTHON_PN}-lang"
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb =
b/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
new file mode 100644
index 0000000..da13b55
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-oauthlib.inc
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

