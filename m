Return-Path: <BSREEKAN@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0058.outbound.protection.outlook.com [104.47.36.58])
	by mail.openembedded.org (Postfix) with ESMTP id 1B05B7863A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 03:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4SIKxmWr8i6uOEFE+BPHLu+ApGosSg9v2SWF6QmwCIQ=;
	b=qx9ZWAWBK2JnoYtNl1SbYFr1y5Fwfu9pm6k91WvTO6IyLuU6mW0dJ8s0tP2irX9cweUD/nSJmahQCad4Cm/+XD5OCWxLvCNaPRD0AaCDSNq6UASTwR7moCCu1ol3EK+4ED0tnW4isGaatIaD7ORB7k8GPPdX2dHp3XKe+2mK+xY=
Received: from CY4PR02CA0001.namprd02.prod.outlook.com (10.169.188.11) by
	CY4PR02MB3384.namprd02.prod.outlook.com (10.165.89.155) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.428.17; Thu, 25 Jan 2018 03:00:18 +0000
Received: from SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by CY4PR02CA0001.outlook.office365.com
	(2603:10b6:903:18::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.444.14 via
	Frontend Transport; Thu, 25 Jan 2018 03:00:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT003.mail.protection.outlook.com (10.152.73.29) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Thu, 25 Jan 2018 03:00:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eeXlw-0003AN-Qv for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jan 2018 19:00:16 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eeXlw-0001FS-7U for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jan 2018 19:00:16 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0P305qs007263; Wed, 24 Jan 2018 19:00:06 -0800
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eeXlh-0000zR-QY; Wed, 24 Jan 2018 19:00:01 -0800
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>, <manjukum@xilinx.com>
Date: Wed, 24 Jan 2018 19:00:01 -0800
Message-ID: <1516849201-27005-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23616.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(346002)(396003)(39380400002)(39860400002)(376002)(2980300002)(438002)(199004)(189003)(478600001)(72206003)(6636002)(63266004)(5890100001)(305945005)(50226002)(81156014)(8936002)(8676002)(81166006)(336011)(8746002)(106002)(316002)(110136005)(48376002)(50466002)(26005)(4326008)(77096007)(36756003)(47776003)(2906002)(106466001)(107886003)(7696005)(51416003)(59450400001)(5660300001)(9786002)(6306002)(36386004)(356003)(186003)(107986001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3384; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT003;
	1:f5BriW2xxav/gzEC1kHjUMTTYQUN6XYw6ORtrb9myYm9fNgv2f014mpZCx9mRTSX+7B6kv/WQUWe7fh+a7A+NR3/dIp0p5VDVxYdCfauxQtFXhdDBGCbXS2cxXXacIcO
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34ee656d-bd14-4052-858d-08d5639fc38a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	3:hSgccCJ18l3EMMobthnUITwj7te0zAVrZM2LSmk4ZFtaIYBO3/aMhy/L/srSUeOCjdHgBHifh2WUowYtgB3RsoumoE1S/6WXMQTqnWop7ZGyhbtngYGhHck85/BB3ieOcu6Z4yJBFTSob++IdQX4xWNSdXDK8kVyIXgZJp1eYDl4m3ynG7CNQN9pd7EgjmzIQRWN2s/ScDzOCYAKqDVqFNX/ExEn8w13HaGXmYJsFLl4kCPzKKSx1p8mdJi7zSlpHF+jPgS48rYRQLumHp5hNAp2wZLiQ5bzZ4xYJwb+Ho1opVzDsfUcGLvYP/2XriakKA4gmZf/rwpjdX4cyZa8ho3fnH+cMFCSq6qNbpHOJwQ=;
	25:hN78z2UZdyH21xTbve/q90kS361FXBbT+NkCCTJqg6e2D5K4Y0U83jUJIlJhaGa21U1qcLhmbIaCBybBUH1M4MKrntzvaPhRgg4nyWrL+xSrrp5ImLrYbpVlAuLZkuREZVn/XH58IKk2sp99J/P5TK4CpP758vps1qc+Slk/NiXRXgkhEQrGq0tmI8JEAefRbbsonYYcB3tLuNSwe7gUWr2LSUMjU3zIHJ2PZi4ypndhbFeiNATg8AfmJSBIFIBKdmmmIcZCqLDNKQb7I/Mox5JIN2LrDrS5rszLTMMwaXEHwLxBGNf78jXyrPPM78jDIWuf19bwMy38HoaG15YR5w==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3384:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	31:bcvf2EkrbI0/pEVR2+3iGBOHac/H5ubqbgH0AaZ49yid3yfnuPALKwkyr5RUhgUwJ0224Raer8lkoffUlBRWBNLMZxnnUy/PWQhYkaJcu/KzqmKQEYdLLz/IMaqhpihw/oelKQnNWsVyhPzIajaBTFL6axKjjQM2sVyPMYCHd09CC7kM2PNxEJw0cx/5TF2Uo6fDqI+3RiLQfB9i3DrlRj7aASDjfTi4eAwms8ifc7M=;
	20:7S2hvMmnUEhIPsQKe+/Ay+K7aCWNy6EBCT2TWXUcPK9wgwVNTzDtJUFEvwwL9+I0sJ1lr0YBZqrxxs8gyEXMdNE6dKmrLaskrBAb4K+dieXvjY6nBpp2W9J5M3+6FuafJChxGA7nN6E1D6xcbBJ+KlA4NLb3Zfel9zicF0WiKgtRofNk9MvDu2FitbQx9hjTLXBpc+3op+ac5NBPS2AzH7WZFnr+BONNWCKdyXkWjfdq2noRGsm6E93J/l3/NJhHoIa1O0K0gCrYU/Wc2+n6Wi/iwJbS6rx/SX9yrfQbDXG1/z/J2bn02wrL0QFPK4LhSj/O0OKHuByBtRzyCrzL0KrDO7QNCt5tUzxmAtTLMmoy0wcUKMcU8g7dzFWF0rA8OajcDmZJZXSaGgp03HMQlYwuFejwS/yg4ssFl4rKxpsv4OYl1Tqx1Arpwey/gIPucYd9YOsHVaKQlYza7dUxY/KEM4BxsT5Ffq7wGs3+iuvRHw4nsjQfh9y5kup1rzMX
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB3384F27EA118F3C7DE04537BB0E10@CY4PR02MB3384.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(251646265452963)(192813158149592); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231023)(2400081)(944501161)(10201501046)(3002001)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(6072148)(201708071742011);
	SRVR:CY4PR02MB3384; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	4:cc6fS/UQghEUc3V1Dh1U5xtVe/A6SchdkEP+3S1WD+O7mMBPPRGeABOxD0Yrt1I9cj/7OvTmFQ67uGkamY28ywS7jdot51LavArMqYu1WSD+f2TwYbu0Y08N8zXGz7/GyLzuPFdDx94EnCXYYTvI1w8J35U08ZIyUSk7xTAFZHigVXx3qaFQ1SEi20NAiac+0U81Ivs8FUQ8avFPhMjJtX4wAAXZo9wg3eGjxk6fKKFonwFGrnbybd0afatefP5boQLOVh08qzA26D4R7DUPzBGRIXo10jPRv6tjwsB+legmsx4zXqkeKuVV4yBQFoDcBf2e6LwMJavftfvm/Pc9szKfxLbFSH27UzRlX2FGws4x8wm2heJwqnmZihwffkpN
X-Forefront-PRVS: 0563F2E8B7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3384;
	23:KoxfO6x+409zNFb5jmOLnPElgMjB+xskXN4ucwsf0?=
	=?us-ascii?Q?U9syVVenHJpvhGKuWwSae47F3PArcT/33xPJCtJ8ngphrq6iVIm4nrTPNmCA?=
	=?us-ascii?Q?gL9sg9Ig1Gbw8eaLQgSfKxsh+CyDNUOwjh6SUwnu106KC7ya/LEsz+2AwkCp?=
	=?us-ascii?Q?XxZrIBnbrLraC8e5Lc+5e9BXKbPEUlqUwbZ3lDIlc5rFT9YYJ7gWY3Ok8PMB?=
	=?us-ascii?Q?+EytgoTCsmwAdCdJ4r3WqT7h05go6I0sXOpc0tqe4ZRMznIIE5ZE2kJhU+TW?=
	=?us-ascii?Q?y1XZgCIgs9eRmvppix7tctUzqaRKgiKpyPbNK9iKnjcYgvPnwvmp7nfkOW3j?=
	=?us-ascii?Q?+5dRbHTc1jtrSfqHnDRgo6upddM3nppaM/wifVhTycDqDH7e0bamNYbr8KuT?=
	=?us-ascii?Q?zw8rLGK7lcAJTwmuhdIFtoynCUeqcbxAZeDWM5VYpcj/lyHL2eysVhiTHtuw?=
	=?us-ascii?Q?N2manXUuW7+oam/8JR5H8mT4iXwzD2GZS08lHV38SWyRaO363PDzVf3gplUH?=
	=?us-ascii?Q?HJpgoX5ycJTUkZhkXpH7XxZfTk6raPXqX88hgtyHbrumRQjo/KYxSgPF7nET?=
	=?us-ascii?Q?ppIqFu810w6YT4UxVnHSAAgsWJJoddqH+kRIgYZ/VOPemlffBsu9+TvVFETG?=
	=?us-ascii?Q?ZzqDjwqX1yRFzuC77eWXkfj4KgDF0BDQtRbElDoS/SJu5pd9SHT8uHockhN5?=
	=?us-ascii?Q?nfvq+dClck7WtPewFfBvqFEDzeUTXdSQ0IJCjZtvyQJ8XXKJYrAfn3lh9Kgm?=
	=?us-ascii?Q?C0oLReByJcFb2C1N4NSF6NxgjDkXaflB3HSlH16194XyNgkZHcEIgHNmxKCp?=
	=?us-ascii?Q?wpYsACtjPvmJJoyB26gMCisw9TnDbRW+fHbRdNI+D2/Ga84NeGtPWhJpoQlj?=
	=?us-ascii?Q?F1S6l/xC834DDSCQt7/Ww0Mzr7YZIEk8YaNjucfjhrl3j12i/7BGPCXkQSAg?=
	=?us-ascii?Q?RQOqN4AyRKBmjjkYzyduWTdqm7JCF2ELZoVTDgEmk9EhroG9SnhuWwpD/LIY?=
	=?us-ascii?Q?QBZshOgKJsN+tbFFsvJro0YRbNc8v7NfUVcEehWyKgbXC6vByiqQ8vT1do1Q?=
	=?us-ascii?Q?CDw0hpFuxDVXyctq6DxyGdtDxarmnSYWqB7m3RqaJ0deBnk2hTRItIAmBOiO?=
	=?us-ascii?Q?PiAY/GGc1Ta9hn/0cp0DgeiAb5JXze/?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	6:csPKuL59ubJC+D7danphZiM8jdPbmU8OsAvvl/U8w1DVa4b7uJNJ/HFAFf6K0Xcaq0UlA/0oQwlYvx3OPuEBUi8i/srneI6uuxRlESAoCN2kJm18dgFIbOJ38gmHquTbEb0qzk1jFscF9Ygv7mdApuTdKaTj/X2iqKpzwh7e2pQLkqFU+KxDJTxjIG9eIBFwUuyhWq4drwr+DpsG5aEr9MdfpkNQxWQUfo5Ud6HXCbzSO+ucz739gTPFO7Jc0EfJ8u4Ydx/nyWOM/zASMJp0c6CWs9FF4mkj9r3fn6mqRPZr3+M84hhXagUAKdOevZYZ8U5G9PU9C67/dlIX2eei0fxMFJC6jWwHwe76Wq4UwIo=;
	5:CyH82sRhXcdFRE186jsJTC/YdmLzc1DR/Q0BTFiI0Qm/enTL64CpzvSXHDCCIG9lH+EFPo6FTItE6KPHgNYQCoCe2TQ8a4tQJBZxrzwSpNFsnYIYupoG86ryYY1rvkyenTlMV48VD8VzYdBTfRggZT6H2lxttMR6A5qyjBKVddA=;
	24:LOkBur/ISm9hoosDnRDdm4NX7hhphVnakk+dpl10eTSWVKg7hkZrzZLY2YeM5kdmaN0i5L3GgUO3Yj2miLUCZDglUcLfmPdmiYtH5UpmPY0=;
	7:O8znEuf3LkDY7YarEu9LafO1XgM9f1qbfN08oT26il8m/+/p+zPaJIHgeObp37ATCBp9UyJaJAgin348X7MXDvl1aJpTtE81w/2R/Jz2/EIYpIj3N5/T8cKgPM8y066+KIMIiWxqBXyGB7YFj/+9cZ86XfP9eWmzw4unxGkEvo/dBJQwGhqQoW/1ZgmA+hPxCrpKMmkhwN0k5orBPLVnEiabMafyrZTHjXDh+5YlnuBg9vy7KbQyqqIBBNkwofue
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2018 03:00:17.3128 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ee656d-bd14-4052-858d-08d5639fc38a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3384
Cc: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [meta-python][PATCH]] python-oauthlib_2.0.6.bb: Add python-oauthlib
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
X-List-Received-Date: Thu, 25 Jan 2018 03:33:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch adds python-oauthlib.

Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayath=
ri@xilinx.com>
---
 .../python/python-oauthlib_2.0.6.bb                | 27 ++++++++++++++++++=
++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-oauthlib_2.0=
.6.bb

diff --git a/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb b=
/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
new file mode 100644
index 0000000..0bcb7b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
@@ -0,0 +1,27 @@
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
+inherit setuptools
+
+# The following configs & dependencies are from setuptools extras_require.
+# These dependencies are optional, hence can be controlled via PACKAGECONF=
IG.
+# The upstream names may not correspond exactly to bitbake package names.
+#
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?=3D "test signedtoken signals rsa"
+PACKAGECONFIG[test] =3D ",,,python-blinker python-cryptography python-nose=
 python-pyjwt"
+PACKAGECONFIG[signedtoken] =3D ",,,python-cryptography python-pyjwt"
+PACKAGECONFIG[signals] =3D ",,,python-blinker"
+PACKAGECONFIG[rsa] =3D ",,,python-cryptography"
+
+RDEPENDS_${PN} +=3D "python-core python-crypt python-datetime python-json =
python-lang python-logging python-math python-netclient python-re python-un=
ittest"
+
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

