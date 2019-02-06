Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 39185 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Feb 2019 05:38:11 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760049.outbound.protection.outlook.com [40.107.76.49])
	by mail.openembedded.org (Postfix) with ESMTP id 463386BDDC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 05:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jmmiEPKxfroL4e3/LzFLPa70oUIXZVoUZ5tzHDXXEiM=;
	b=1WTFACzzq/N5QQchcY7V/89GPdmsTw/e0mIG0J5CesbDPEDKHQmnfYFhCD84qoTeZgj+p454rVnJPhynXL36rp0rPJl5A77lPSTklZaFPVQoLxmfc/kBwSIwWQprBKaOrJHeSDI0L7Bc/kDL3hyOOT5qhJTcA0SmK9DJeUIKcE0=
Received: from SN4PR0201CA0003.namprd02.prod.outlook.com
	(2603:10b6:803:2b::13) by SN6PR02MB5022.namprd02.prod.outlook.com
	(2603:10b6:805:67::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1601.17;
	Wed, 6 Feb 2019 00:03:55 +0000
Received: from CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by SN4PR0201CA0003.outlook.office365.com
	(2603:10b6:803:2b::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1580.20 via
	Frontend Transport; Wed, 6 Feb 2019 00:03:55 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT049.mail.protection.outlook.com (10.152.75.83) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Wed, 6 Feb 2019 00:03:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1grAh0-0007kz-Go
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2019 16:03:54 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1grAgv-0006Qy-Cf
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2019 16:03:49 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1grAgu-0006Qq-MK; Tue, 05 Feb 2019 16:03:48 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Feb 2019 16:03:44 -0800
Message-ID: <1549411424-12784-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(189003)(199004)(77096007)(8936002)(4326008)(106466001)(63266004)(2616005)(486006)(6916009)(336012)(476003)(126002)(478600001)(316002)(7696005)(36756003)(16586007)(106002)(51416003)(54906003)(81166006)(2906002)(305945005)(81156014)(47776003)(50466002)(2351001)(26005)(186003)(426003)(50226002)(8676002)(48376002)(6666004)(36386004)(9786002)(356004)(107886003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5022; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT049;
	1:oFoqB21XXGmANvZ1suwAVoKUBaWC7Gv+z3PMUvTV/H1UsVsQasfolZ9Ck6JPzeYWWinVLFZZBLyVLU43j3oziGdoloSugrA9MdF79uYsh6XrM6uN1OHwkJyFtcOFAuiNEwA+HsGJZgqzLrPsHVl9U1sF+liKDrnzDwrsTBog9k8=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe9034b0-a145-441c-de3e-08d68bc695af
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:SN6PR02MB5022; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5022;
	3:SoKm08LGNP/pSun1BtzwBfDY3abXQb8UM6t03HsBz5EFDlzocZktfcK0v8490VKmnVi/93sUq3qZQ2lpn9JKa7iQH5lR0uOCcuTcBh7OTHO6KsWBL/TbJCTC+L8w1B92AGCrmWZdktkJXGaqx8OjOdXqRzwuuGeR7oYC8GED3RRTHYtnvU2BGmNi95CT0a/2YhnTIcEpgpftu7fWRLpXtq3/XBdNwcllm0pl9+H9aBinRrqlghrrXdBLEPwVcqSZGp9WhhnFp1kRD3/uM/mCENDC9nvsV0/Mm1n298c2z6dsWhqAR80t8Ienwf/FqURefLkWErefO2QWjPGz7zhfrREnQzED2HNjr5ue9MoqN5ABCex7evhmoxbejVloYn8Z;
	25:q+Qm1x3NV/H9QnmvfwCy3v7IlRpOaKJRI7hey1ENxZLznb62ApJg/4S5PzqGcK9ndyF99/W4Re5ciwzUeIfUJrI0TQs5HmwOP7oUN7ZxlbNJEiTicGLHJ7MHIwpG2k6fHefavj6sDcMmCMYBUD/uugX90h7B9hG6aKUL5FC66j7SC5bi3AGSHT0K2eKAWc6x+DMUKC8F3slg18RkWuSVq8VI4Y3h1vc00L9doIEQejevrm82S158EeVdMwLRP++hpKrxBO8PYdgt4ZoSNz66DRQ9Z/6Em5BR+UmHMxtIJQ71K8lDvup5OU2iPmGVbg1aBKegWWdpZvU3zQOO2HoDAQ==
X-MS-TrafficTypeDiagnostic: SN6PR02MB5022:|SN6PR02MB5022:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5022;
	31:1RSYNqIMduZuc5aP2ad3+2iEXzPq/j9+Ow9CnB1FzuLqoqJEZbAw+Lazf1sw7ukXDBfjkq+WPwG96c+NFL7qCYH521linhqfiEQOw2haTTC+4SX2kWEWUQIki5u3+VI96P2HAwLur+4s04noMy24NvEQaGAH2Be3YWG+CIw/WVTC1Hk4JzoxxIquaUDBuAkPDQUN8tDNeMKg7Z3oD8gBc6iMjxWZAknygWJ/0wjo4r0=;
	20:Wuf5xibm4ZjlqJR7bk8ZzxBpm/8cISB0M3X5sbjm3Uo91JeUB6e4kuzUmbvZ/UA9X4eZ0WJ3QgW6mFLdc1TBCNBpuR1bQvDarUDfr5cFMJqS9eVAkNcWLoAblGkGaSFZlJtGwgT1l1RntiDT+LCVkJQgkWGnRmnyNWJXqY1Tplo3F4zM2d9OHEHfwdTtvekbBShOfkF0ZE16cbTVOVmPVEItQS/xwdn8xsggr0OOrzr5H30RHqm8+mhNaMJ2uxAzkKF/AdpTleDQUsez2MiqWfCUYLYNpJzxa0MX+TNQl3JPiOaMdXwzNgtT0huhh7AKFgemjnvZx0UjUxvnPZlVwZlU3K2J3WhqEIIaI0AGOvfGZoQVdiFzIpcDW2+2FeIGdmaczPSXsyEfTzktU9gcnqKPuxvxh8oaofPGaui4qp4BHbQTEXNymqqnCqD1V6T360amEP0ooOD6XkGfWCASAkEc9YEx4lB13zvhIItdp2sNVYnJijxs777FCqzxbVEc
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB5022015ABD309F087465E0DAB06F0@SN6PR02MB5022.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5022;
	4:MnHwtn/TFjcFxs3SuhV6Zky8jj9zJNiNKJsCs0pM/s/xesjGRA8FEXJuI2By2R9+PYJnAa9NsDtwnwF2w9zQEA7tVmTCi1EGouVfZ4gDQ7Acj8rtTWJZMfvzqBQ5cuyXB04blbQANHFaH+izpV8B8LxA0TCCNyw5xZ7+ZZJBRXliPvtPNGaEkuIn1p1C8ASbDH/FXcaNQPzmZy3H0+M/sQ0cxwei/Ckk4p75rXwwAKJDlFpX/KfWX2o8w2SPaOXaPYJmlwXblPzIRqbPE+H0YNKlyMRUEVrwnoBfmsQn+F7mtUdQZRBYqiVm3EBNKB8p
X-Forefront-PRVS: 0940A19703
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB5022;
	23:a4z17W6yg61/NhOsKpG7KQJNbBP0YB+R3i1w3mOZ3?=
	=?us-ascii?Q?OFA2GbtA4jKTU7eXFHxM741bUJMUMpoj1Zg7XB0Z335dC+ZJ++pgUZeyat28?=
	=?us-ascii?Q?rTu1Cg0z5qZMi/NpfTSrxGPshgxZaELG10y4sBa9zWdpyb8ie31MTIqwfxSw?=
	=?us-ascii?Q?Pkf84RGng4ZwAlnr2G19AJQEa7joBq33Ur8nXJkiVmx9K9JJjo3lKSW4Uujv?=
	=?us-ascii?Q?kYChS0ARnIz5GVeyj7Go2e6LHEKra1EOKqE9MrsrRUQkNLjWLmfTzJ17CBsF?=
	=?us-ascii?Q?IVsTT6ox6F6UWf0zRMGqntS4VxaxQp10hgq0XlM+BrVorRgCaO5INX9oL08s?=
	=?us-ascii?Q?0YUphCGMx5kbgUuNyQfi3/fTXHdZtFsDRHYiNlS/7qkAGPGajjt86bCKSctC?=
	=?us-ascii?Q?XQe8G6ChFVKOZlA7oPsEGfcu6EfbseLBhWMz1yucRKfGm/i2ljs3DRCEaSR/?=
	=?us-ascii?Q?AlhuyYldmWzQtQ9UdMhl82zfmD1yKlZ+w3Pwqj0DFfRwnNp3SxbIqzBcZM3q?=
	=?us-ascii?Q?WtahSKUaSNzXEl5GBYuRIRJYboD7YrWvXxjWtXiAvUIKK8mUxx6gDDNzIXhf?=
	=?us-ascii?Q?cstB6gC2gHrpAwFmCcg+d1UuKJQIpTvQUXGjA6FEwU0PCcR5Wu481dE0XDXp?=
	=?us-ascii?Q?rTpmJABHtnsmo+VfVJiBCjcpV9vQVB6kCZTQD4w+a8ilzxuvxOGjzh90gNu2?=
	=?us-ascii?Q?yjb0q0AP2bDn1upFAZMn7xFM0V8ZAfSEb1NC3VXKFePFCDzPxF7HyN75snjX?=
	=?us-ascii?Q?Y3cdp4SOjVqQ2o5ZYDd8DcHjg6ztw40sT0DgYCOaPXI/RMz4dAgYlHNYWdWc?=
	=?us-ascii?Q?OssZYVR7qEVSkKeksJP77B8fBopzrFW8cmi4huMocPbAruq7D3qnJWt18hAF?=
	=?us-ascii?Q?EYHYCWaw4e8s/TRllk1Sy62VssNX/N6Vch1sfWDDJ/zsfzGKdKgbm3N7HriJ?=
	=?us-ascii?Q?aJHYQmmljCh0OddoRGVxZjZ9vsxHFcq19sAzBEkChwCFzwDPu+UN5w92M7yZ?=
	=?us-ascii?Q?M/sA1VeuiYlkXFl5JL0ix6P?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xyzEySUk8zpUXr1e0bap3P3b7C7MGUfAqOJjCjqFy7wpAN5wk5HV/T7YaGuBehswh7eF1vEgdoxcXhSIow47wjwKg80hkOCcHW3393n7MCyKRgWhA8tAvn+/PTHZVviEw138LUoSB0aEfPhUPbFiUgxIe6EyAJbOTYnCVWig1uQdyT8gcufSRsosmbugwU2SHholZBOfpH7qjNNS69u4aaoEJuCfQVwfhzKdpHMiOE/WMBWUode1RBpB8FcC5M/zWekHVWQofB/FaGE5O4DEDMObDLFQXmVAICzrAh+xN0jfTEulfnW/XmJpTOeynwwJMqgwDIHAp8slvRP6dA8bdEGA+093QOoYJEs+qYX6QRuvogdsfy/v7GipcOKhpVfuUJxQOYoe45M/qEJXQ5cV0xl43UTvwCk1QGzwDOzZlck=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5022;
	6:d9/pf+em7LGy9r7PLqEjomYd/78lvkl+kkNEJQkCO5wCbmMjsOGV/2D6dCG3HhCRohajzdc4mz8P4cGl+SdqSxM1VKoBlsqWxHvONWAfyv7cIJZgDDmE5dfcUgGe4NSgdmaFnRhswHtBjnw5QFj7awxKorRD90s4xFc4mt+9OD4lECtO8XQE//yWFajTlyd++tsndS+gkUvlvKrrn4ZA4LfY4E9mp+EZg+caw5NKAMkOomCWYic4t738UYxE8JzTokJzRMRKwBGAUPUk+6ab88l1s+k+l+BOnRmk7ZFOgIEr/SuCjWu2Kx5nrjrmcqvKE50picJPlrfBFhEUHvoCqWO+TxNl6CTA0Asc+v1x3p9+S8VtWVJe34hkcstJYWy6P2Xszj6h7F+IVo0+8UD+NrH37GfyAvAEXFHgmvPSm/rp2+XhnRCRLsvXpX6kMifSo7VQXkZLpS5onCqtfy3ABA==;
	5:J4g20Ezke3pBzq4WTrkE2D6DuSvzwcOpia/vdm4tThKt95FZhZGaA3In2CwH/EVqPtch4QrcEu7sxxRR2sQiiioec4B9n9V+W0/zrCAkCAu5lXUg/2ekrgKZDQPtnx72ZexiCITAJOai2yyzw7E4iy+9UE3LxsUY7hc+WjNjrcHtJU4RYcyyerts98VurqWbSUuVB9hwsGBOUpeBaRyEfA==;
	7:7txjZBgH7O0scMHk3Hkt5N4tgNHtgOkolNQnFpj0ltP8gGFsiWCez2RJXj3G9odxj2sQHsWQTc4W7rUQer3uIbxXoQa+ON3oMJVVl7rTsywR7Qli47Os7sJw6Ao8UrJM5cJ38NEgnaH5QmPH1euHtg==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2019 00:03:54.9349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9034b0-a145-441c-de3e-08d68bc695af
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5022
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5022;
	23:QuKYfg4/RiUNekVwBV0wL+ogXFrrx6aLMc8579oycR/oabW9fysy0PYLRNcgwq9VBy/bBm3e+eunrw43zxcgeE5cjaYMpHVfg7ZjqbFZkBhVefSfGqhywGy6IfjSn8ysdkY04I9iOfjaeS4gjCIrxA==
X-OriginatorOrg: xilinx.com
Subject: [meta-python][master][PATCH] python-requests-oauthlib: Recipes to provide support for Requests-Oauthlib libraries
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
X-List-Received-Date: Wed, 06 Feb 2019 05:38:11 -0000
Content-Type: text/plain

Yocto recipes for Python Requests and Oauthlib libraries to provide
easy-to-use Python 2 and Python 3 interfaces for building OAuth1 and
OAuth2 clients.

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 meta-python/recipes-devtools/python/python-requests-oauthlib.inc   | 7 +++++++
 .../recipes-devtools/python/python-requests-oauthlib_0.8.0.bb      | 3 +++
 .../recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb     | 3 +++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-requests-oauthlib.inc
 create mode 100644 meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python-requests-oauthlib.inc b/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
new file mode 100644
index 0000000..4bc6a36
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
@@ -0,0 +1,7 @@
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
+
+SRC_URI[md5sum] = "4358a879a4377393bcfd37d0f9ae6d4d"
+SRC_URI[sha256sum] = "883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb b/meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
new file mode 100644
index 0000000..4318915
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
@@ -0,0 +1,3 @@
+require python-requests-oauthlib.inc
+inherit pypi setuptools
+
diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb
new file mode 100644
index 0000000..1294661
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb
@@ -0,0 +1,3 @@
+require python-requests-oauthlib.inc
+inherit pypi setuptools3
+
-- 
2.7.4


