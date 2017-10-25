Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0076.outbound.protection.outlook.com [104.47.36.76])
	by mail.openembedded.org (Postfix) with ESMTP id D225B780C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 19:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/48SUi3nmSJnzd2HJl4jO09WAJPVbZkNPAxQO2tC5Tw=;
	b=vA6tLfT3UaucvUb3Rtkti7HpvWOwfuiC1+YGcTp0AnYDCBWxJQ2Zu4Ty//Fp3iYpw20EOv8rSftt1ahf1AK43i6yJSZWDZT8iH5HrXGTzrEOIFfwpyG1X/4zeG76V0ud41xwzxRzMa0Jwd3o+UoAVWsBKdJ59F8Nty+772iVQwY=
Received: from BN6PR02CA0095.namprd02.prod.outlook.com (10.161.158.36) by
	CY4PR02MB3269.namprd02.prod.outlook.com (10.165.88.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.6; Wed, 25 Oct 2017 18:54:49 +0000
Received: from BL2NAM02FT030.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by BN6PR02CA0095.outlook.office365.com
	(2603:10b6:405:60::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.178.6 via
	Frontend Transport; Wed, 25 Oct 2017 18:54:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT030.mail.protection.outlook.com (10.152.77.172) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.156.4
	via Frontend Transport; Wed, 25 Oct 2017 18:54:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:42910
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7QpE-0002zm-Gj for openembedded-devel@lists.openembedded.org;
	Wed, 25 Oct 2017 11:54:48 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7QpE-0006Jv-Dh for openembedded-devel@lists.openembedded.org;
	Wed, 25 Oct 2017 11:54:48 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7Qp8-0006JX-Tm; Wed, 25 Oct 2017 11:54:42 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Oct 2017 11:49:12 -0700
Message-ID: <1508957352-6372-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23416.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39860400002)(376002)(2980300002)(438002)(199003)(189002)(72206003)(81156014)(356003)(107886003)(47776003)(77096006)(50986999)(81166006)(36386004)(9786002)(305945005)(189998001)(63266004)(2906002)(5003940100001)(33646002)(8676002)(106466001)(4326008)(2351001)(5660300001)(106002)(50226002)(50466002)(16586007)(8936002)(6306002)(48376002)(966005)(36756003)(6666003)(316002)(6916009)(478600001)(575784001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3269; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT030;
	1:CyUGQbo/HqWsCpgTsv8Ak7+YsCUToXPCrGDyjcUnG6Rhfqjk/0E9Fs14Inp+exaRjiMuQTOguJhxR6slYGiDCykI8hKByx1G18rJgT+ihLv23xaOHZsEyi2nNpBzFAbv
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c32fca73-bd22-4172-c12e-08d51bd9de46
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
	SRVR:CY4PR02MB3269; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3269;
	3:03y7DH9u8CoUMrtThwdLJ0nrnW5V4I8HJ7njTaE4BToncQH7gzDmd1Iv1E75GPE4zOOrNrUJN7T/d40GySPugQO6zdT42V59ctrwwbxwjEXlm6JtEMZ/KsslrAhr12Ifsh8E6WryM8CEv/g0zeayGpvSJ5XCGWnShzLcZlUurgfawqC/XOD9/yFVyumeHIB9eiDWPGhpncrLsxGvI0th74+KpGM5l5hYkJxvdfulNldLIEhV/xhad7+B2NrcYEORwQdNC/sAZthEEauS0l7KYe8BHd9q7xPgTS/liBD5FRRAcnmbEdapMZ2iqHrA8L3JBAPvT/xRyyESBtogOYmRR0aTqnDJQzQsQwSFGtEP/Tw=;
	25:XpodNYp10BBZmyN3ccI1UJ/eGwz1tXqWnBKnop0xh8J3XwHIN4Rfv04uDnxLPm7wTVMpGO2LU9lPp3l22POMdURaSviRVDsCXAEalSNiqmCURV4pwrFPI/rva0KDArG/eRKHV+wiPmAPscU4VjsqRPn8Kc45iY3UetISwE4L4/42n+Gfpct7f32cEwEXFjxWuETyLdgd91X9QjzZZ7XEfcPbFPebXR29XfVcoAIS1QsSg+TZ+/iMnkXOoV0q9uTKUBIJAkHvsF0qRR6sNGDGN+mK5JIXCOlzBHsVhykS4hBJcEugtCYmCiAEv4D5wJRX6LQFmqPgrWi1hr6S4ZS2Sg==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3269:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3269;
	31:1YuTdhCMKiHURGXQ1AWcy/E18JZqg9069SnJJUg8huXI3DwcBjGLgNn6p+aOpLaaI8Nwc13K15syui/LOWMAGpac35w5Miai3/iaKGvQaZZh2QeUSjYx6YBk9J+/LCAv98yL8hK5wYmx0Pc5ifWFSkTAhb03YCLsOwLrxA6ePmk5ZXoJRtlbRf+8IScz4fbJVgiwumjGpuTinG+T0aWHKpTpg+rf7k0CeMmL/Ofyfm0=;
	20:DTkLj/BR3+FVudg+SuRsDxUJicXgakidbjlA2HC0uxzllvFkiOlblkjv5iTaSAb7Gb8JHPTYYMLPdZlY7NEI7YXKK4WMccW07m5epo+A+WbdYd4h5/Sqvd5oNp3Z2Y0YDYx9UqgOAeeu+NqUG60HDyPSNlo2bDXonC9Or3M/JXCDvXpkQq9OTyeK+AnufNKwvS2oIqYSGpy1+4xTJYc3J1CH1VZ+z8QfSFqgQOhuwZpQWKUh/7Boq9RlA7waabm+LSxlSz15LqqhWxmnyhUY4e036oNUyTlSF5X2vqCH7lXvwWgSyEqvrQjoUmON+Fm6ZVmzovqfEHiF5BOFkQrNcILZxP729y4WI2uIq+wW8p1kV0BBXwF1qs64A7JjWTcvZDGiguwvEuS+w/QFjGPpcRVU4ALbUrSTkDtcEdRNsFwHJUtb1DQ1uEVHkKucceS12BJithzgtoYehlFJoeZW9iJ1ixFeQnIRoU6ZvCycPg8KYX/A+aPaxB0ANGrLC7/E
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY4PR02MB32694A577617396CCEBEC453B9440@CY4PR02MB3269.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231020)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123562025)(20161123555025)(20161123560025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3269; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3269; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3269;
	4:nqhdVwJN23jbflq81ugR/D5Y3LwoxiBRpoQZOM0wEC95/H0GOu/2E2GaVPNC8nXhUF46rVOyRUJIec6w/JHbgn6c1ZCx4eVbe/PMLVvvUYyUI1ZQJui2mjrlUrHCzDDDBrdiGPAgxw4VLgJ8B5yQvXb6WXhpwiR/I5RPT5KE89ZOYRuOSPPG9c+kCMuZA6zZwkP780lpyFhHe+OSqWBbR/LJ0uMEOy/17ESxMcgh3cOu3Qx2ve4om86st6/4q3ZnWuwqN3gnX1VQiE2XCFJUS2e1TyDm3P+2yYmpR0hO+p0EQmHzyRAooPpG0oITBvhQ
X-Forefront-PRVS: 0471B73328
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3269;
	23:iLWzQm/UhhzPLE7/lu0dXCiZrLynKmexM57O1cabq?=
	=?us-ascii?Q?idjIEYC+coi2fQC5TL3pR3lkOcI3WFMlSoQUq5sr5M1z0njOc+AbqtgURZlK?=
	=?us-ascii?Q?Ifs01BUS1IVldCWyL33kMTtk+QUs3SruGAdveeqP3d1BfKx3jrgtm+HCF5ZI?=
	=?us-ascii?Q?GtEHdTxbNCgMgavgpgfDNbxkZzJVYTLYs7PG7/ml80h1FKL1TQ+MTMHIJ5vt?=
	=?us-ascii?Q?s9ihWB+N9PHgNp+QPB6h5MSE44jHGryUPvcLARyWUcxFqS7fytZClJN23c96?=
	=?us-ascii?Q?7JwpXUM6eH+a9wRYsr3kPzzzHq4KxesB6VtieI5Swl5Hgtn9IXKhSnvQKcjy?=
	=?us-ascii?Q?m0dgxcHnSHNJpK1WnoaNuoarGW0X4AKaIktgqxPe27im4+w6hRyy1klT0VOT?=
	=?us-ascii?Q?FGT2dbzjL9KgzEKiR1Kfb/ULr0KmVZizE/d2/ZRv/eM813lBCyqS/8T2a+vg?=
	=?us-ascii?Q?gzQvy5RU0LqdQSZOlxKn4q/kQKDvv7QJszSGcZQ6KTUmSlL1+XkQeHsl7G+w?=
	=?us-ascii?Q?BWv9fTgMRgjIZHfbP6weM+VGp7hleYg5j5Xtzc4nOnsWJ9nqEQVdIZTkT1lG?=
	=?us-ascii?Q?zATLfwCw0pbD1JxvaYQR+XIuFBMBMAkeGWBVxlfpaA1X+glT1IMY+jp6RrJC?=
	=?us-ascii?Q?pFH8ldDL3a0l/YQaWE5qflNZjsEdybaNmYCesK/8TFawMT25TUJQZ+wKWlt7?=
	=?us-ascii?Q?Y7ejOgi4gr0RF8UDh9LLTwEF8Wdi8+BijyP0KzT42DDEMr0S9srT2iKBhbDB?=
	=?us-ascii?Q?p/d3nuwLefmdW72OcBQpgdMBHvzDa0kM/nHe3uLRU/HXXje8jvUpodCCof6i?=
	=?us-ascii?Q?JvnYN9iwbl7SXuV/ztB0Q1oswIMGH+Kb8cpDM7atQ3MdtJE5idi0VyOjZTkd?=
	=?us-ascii?Q?zmgpvpZdUdrOmgukAuAKcU5wx5QVtPdMkQi0pvUZBo9HxuYNfsLeRrFMINF3?=
	=?us-ascii?Q?VLZ0pbVVZ6weFHS+iHn9kwMiRU0z4PUjOM/78Vzci9S7pqhu0fVpHAkO6UEy?=
	=?us-ascii?Q?2xcR+YccyiOAOjiR9fpcTch3V7R25PRJ8bkvRnMau15ucoxbYn1caUfkf4xU?=
	=?us-ascii?Q?jFJBtFftuMBVKIH+XKqtyqvgDrS?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3269;
	6:ShoKRbemzfdis1XHr4b4Z/i0nIfa3OcAhpckwim42Wh5UXS3f3beEJCPSPtqpxUHIui6e8u2H4UzeepMNnOI29XLvQDSXsGZnTqMGmXLg+AiTfaS88neByRMi5Knhpo01Tl0cok6DWz5hgKm+aKu/x5eGzdUGmqm4oSW+1vwjiySgHyg8Fdk6CzdA8K0OmDVCxSfOhK7ocdMAnfmr2aCIaLcUYAG0PTRkkQzxrBgpj+31Vz0hz+R9SQholORsaFHVce2iu1/XVdL699ovJ3B3VEcz0Eh/MxJ+BsGN8NrYb2++h4972sBscgI1PWbZHGtb/hYxaGQjrE24fsoW5tpIU6NunH9cSiLQBRrh21hg9w=;
	5:5n0jnrCr7kx8FFO8uE5Vgg9qYI0K8At50k1wZu7f7sQPK76i4xUU+r1N4KEnFONdG9abLK8EKWSaSRDdGRE+7xBZHduEf1xnBf/B1/KDFAEDcmOWUqiOjgd/3OJB9cy3iykkNKaV8reiNeBbvtg0lfs4jP9r06W3HPJRKeDn9MY=;
	24:E1ifmXB6Frnn7xzPnRrIxoGqCETdR9OXOVo5R7QWA1p+TZQq28nV7L8ir1EXlknje8dI8ukOVBWUkuSgxcL3wPbg3Q7glLD+x6m0otr+X7g=;
	7:1JLlpLgBWa6kruBjpmJxYtCYRGqM7w/frhFpjAesapmnLF3gBnVzuR/+gKHRzrelb+5pQBSeKDdzO75RlbfrKMfLGnRO+HVTvAqbbiu3KhZlD/0QRzmfXgZKPMfAb2pkAqKi0jeONSIsQ/j0+AHNVRDzH3VlwX2ZxfWJtOqZ3DRoj+G95sG5RywDynfXLegfBAaCWcS+ARD2fTYpYpjbje2TXhVajZCjdvgspfz4oEY8CJKGiE3KIsJy2sC88Xev
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2017 18:54:49.2106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c32fca73-bd22-4172-c12e-08d51bd9de46
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3269
Subject: [meta-oe][PATCH v2] linpack_1.0.bb: Add linpack benchmark
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
X-List-Received-Date: Wed, 25 Oct 2017 19:10:28 -0000
Content-Type: text/plain

The LINPACK Benchmarks are a measure of a system's floating point
computing power. Introduced by Jack Dongarra, they measure how fast a
computer solves a dense n by n system of linear equations Ax = b, which
is a common task in engineering.

https://en.wikipedia.org/wiki/LINPACK_benchmarks

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb

diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
new file mode 100644
index 0000000..7f7ac9f
--- /dev/null
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "LINPACK Benchmarks are a measure of a system's floating point computing power"
+LICENSE = "PD"
+LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/PD;md5=b3597d12946881e13cb3b548d1173851"
+
+SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c"
+SRC_URI[md5sum] = "1c5d0b6a31264685d2e651c920e3cdf4"
+SRC_URI[sha256sum] = "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} ${CFLAGS} ${LDFLAGS} -o linpack linpacknew.c -lm
+}
+
+do_install () {
+	install -Dm 0755 linpack ${D}${bindir}/linpack
+}
+
-- 
2.7.4


