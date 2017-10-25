Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 69948 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Oct 2017 15:58:38 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0081.outbound.protection.outlook.com [104.47.33.81])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE4C71C7A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7EHtfZ24VwCiyFtfkSNsCMVD7U/QL3xBr1bCrXpalmo=;
	b=xfrTyqVsCUaYTeBIS2vcEd9umz86pjYjnEKcqWda79+cVyxBVUQ4iTz8nAsKwz7bRTJWAXwMsqqKV9vMZiZfBW2zCRwPLXc6iZ95o/VgWgM/F1O/tKvrgCVfLEL9KKJSB5tFdFIG+5pzj1iCopg3zD8rSjvqfOLZfZtfUnQLazY=
Received: from SN4PR0201CA0043.namprd02.prod.outlook.com
	(2603:10b6:803:2e::29) by DM2PR02MB1339.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.156.4;
	Wed, 25 Oct 2017 15:43:24 +0000
Received: from CY1NAM02FT031.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by SN4PR0201CA0043.outlook.office365.com
	(2603:10b6:803:2e::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.156.4 via
	Frontend Transport; Wed, 25 Oct 2017 15:43:23 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT031.mail.protection.outlook.com (10.152.75.180) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.156.4
	via Frontend Transport; Wed, 25 Oct 2017 15:43:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:56343
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7Npy-00013L-SB for openembedded-devel@lists.openembedded.org;
	Wed, 25 Oct 2017 08:43:22 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7Npy-0006Yi-Ok for openembedded-devel@lists.openembedded.org;
	Wed, 25 Oct 2017 08:43:22 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v9PFhBvs026040; Wed, 25 Oct 2017 08:43:12 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1e7Npn-0006Y6-SA; Wed, 25 Oct 2017 08:43:11 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Oct 2017 08:37:41 -0700
Message-ID: <1508945861-2293-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23416.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(316002)(356003)(36386004)(305945005)(48376002)(189998001)(107886003)(50466002)(36756003)(6916009)(5003940100001)(6666003)(5660300001)(72206003)(4326008)(33646002)(2906002)(966005)(106002)(106466001)(478600001)(63266004)(50986999)(8936002)(6306002)(50226002)(9786002)(2351001)(8676002)(81156014)(81166006)(16586007)(77096006)(575784001)(47776003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1339; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT031;
	1:DCvZSdPmsbHLhl8FX7EG3SojXZj1/9KHMf50hM6Z3E2uU3kp7xT0JeVl1B/OrP4BZ4L3jlxwClhoMRU/aKRsWx1lH64zgwOPmFNaFNZTZOUzQdHXJZTIB3v9SnXuyN1l
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65aa979a-c0d1-417a-5c4f-08d51bbf2049
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DM2PR02MB1339; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	3:3lgys4GpLIMYex+XJWbLwEr1NYNL6pg8PtBM1yGwgYjpwK/Q0Du7iRr1Mlqvwv9RObLBgwGUawseqJlmZzDy5XAwPQhQjFaLM4R+fCflHdgke4Yi7H+bKl7iha5FBm8YLU0cKT8o3bVvsWZ6ZD9Xans9rdS1+ZA1lVGqnaI7vWeNcNP/ccu6RCjkIGs+nRCKcRPiVURdCiQ16oaJbw0L9w3ZfavLDtk5qRYHmy5E3JVLHhuz6FksgCKC7lXiqHnNMH1YKsc2rp7vyUNlr0Y76THxAhkwxA1fKK2kdPTLEFRn3OVcHg/uwut8m1cfCEnJYA4LhctuHkRyRcrm0bspGhtSi4N1rb8/pbHtmyvmfUw=;
	25:uOufnWLKd3iCYHU3NiJRG5n3pgO8udYTGKojHXhrVr67GE07xIkNf73rzzTaxhUTb7Nk9vEgVHSA38iBwbttDw9x3lCgvnpM2evMJULqRDer88C5RcRLCnJ1fl1TuMLJHFDenW/Nhtmr5n3huA6FKFbd5wBfYFFqty3oh8vEq9j1lhLb/22A0Dmzl5MmhLeW4a+3kjlSrBfCPaI44gozyqC4ikIyf8YPP79bsRdbTQoguLKJ7Eo3wUXGo517eR1K132Uv02r2VNIjeVptqwgPCwf38OqLndti0vmiy0n6kU1HRBhk5TEj73CJdbkAJytVBxgyQ6j5tb3O/2OFuzd8A==
X-MS-TrafficTypeDiagnostic: DM2PR02MB1339:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	31:csgoOBFM9OwBFnYlAEIPIuAc+t7A35/TUb6mEe12l++Wn1W6ndtjQOKJfQrl5UHScNCsVnHyTEEqvR0wHK9JfRMBA5iZD/Gzx6WsfCQFuyVNnrkzuYJsvTiDDE8esEr41vAUPvkLqB+ADdn1UdhUZN995zlqbmt1Uu84YXNZYVugbYutk8IqM45RgCp5ikg2Sjt36ZG4JGiiIb+UylBh9hl9XX/IFBS9JSG3PIQjuA4=;
	20:i2kFELpZByoUbFlOqoomcPxB/qlwGZ0NAQSyf7ZSAzpCVMDWnbr9wiRWpH/Lv6Yf4QrnrO7knmsE7bRzFnJ2MnUX8LijYKv2pUJYKZ5Hfe088OGo5gwMo/gSqpf+C0h/PqlIFSZlJ6Qnqf70EltAAA9neU1cN1ODw6Zm6Te2x+6XTfecM8mNjaO1amhAlRXYuQn4wAicXqySV8BhNJAJBOm/LFMc+MQgaEtnyAkvPM4NCaLlcakRaJmxFSNkWb9r8g+sv3yOR8epb9tD9PYN+wTCR8WBSIG64V0G+LP8TrbQBqm7+G3kapEU1W6GunqIWS4UFRpIIex2Nx4XMpAHyqt3f3drHE9GID5ySo1DpYaZtKnLnsge/k/m/Jt2o0ANkYhKdMIef6BRNlR0RN6d8fgNaCnsBOl97Z4Odj0a7tdh68dLCsQIIxKmHldsEbUiGAiTYuCRBN74YqPm4HSpslbF4ApDiThR6G7vJQiTWQHIuOGmAaNbEa688udX2H4k
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <DM2PR02MB1339F6AAA2FED2170F2F82DDB9440@DM2PR02MB1339.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93004095)(3002001)(10201501046)(3231020)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123562025)(20161123564025)(20161123558100)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR02MB1339; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR02MB1339; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	4:rvENnPlSVV6J0XfdV5vcqnVn/6YUDN/GTbBbTyM5MOq6eK1jXNODG6J+nOFOpxFYnbNzMZ00r2D4yA9naZD3Xj4XKFxjLdhGs6cUqftXAUWoB9IdPF1zfFNNna0+xBYJ2dMPc+yJCPuFHSsAWXJAkjGesOrcIj8JsxZxH1VbjZrH13wjkCincPDQLjLSU+quIoFr3gy8fa5bQnRGkbrYw1QBnVrS5k7uRHh2tWB3u7SpynB2Lwfs33ZBJ0B75LFc1OSA9W8GRcUZQ3FNBhrFlmB+hi2g/cMdMnLkTJdrSR4=
X-Forefront-PRVS: 0471B73328
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1339;
	23:dsA/8nM6sf3nkB/m50ou2DJsz6pBG/ZyYNnjyZ0Bh?=
	=?us-ascii?Q?xTEGNjy0iC4UWtDaC8gqHz4jSZCpL5R9i/RpKZsOBOggEGKXpdWZ+kRienJ9?=
	=?us-ascii?Q?REd+2QwS/3YuDhgicUEmB4/KGeKyfbuU765NoPnS8/n5kAyvKji2jdi74ztC?=
	=?us-ascii?Q?zKua24i6kP4mGYMLI2NFK/wrBbCLCw9EFR4Pi6gfKJ0VolrNnUO5F383RfRx?=
	=?us-ascii?Q?s3m9Jze1ZwBsZwwGZJqwB+KF6TX500bAczX0Q6txSU9tJ3US1ZreYzJpFB7K?=
	=?us-ascii?Q?ZxH73jD/NWZ88KoJ7akpl+5BZ/o2Twx8QP7blw8hYpgi3sN1Y7nKGU1m2gW9?=
	=?us-ascii?Q?KD+wlfaN/eSWRKX0f6y2EVkO1H+PWQofXhw/LzkaKSqCvlcd2U+cd3v4nvtQ?=
	=?us-ascii?Q?FJ8FjxUZDpoNyxlySWXYPE1i27L9rGJDhi6YW5jzlUgaTLsIhMcOszUFWm1o?=
	=?us-ascii?Q?odmgahxJeTxDpuTx77rGTl+ftcZfDUvyh729nyJtye0Eu9HY2XiQK1tZ8AP7?=
	=?us-ascii?Q?UiZ+OYrtE/t7uvjV/BrTIzmWTvAZt4H3Q+RhPgUqxHHhWl43C9Ammaw5y0hq?=
	=?us-ascii?Q?SgO9IsBeTPEMNx+fn6TXLab+Kmih/xprkQFNvuU1a3soPOU368PxXVgKE0wu?=
	=?us-ascii?Q?1ztAjSpPaGWaeSQrwLbSMwPf4909P+T+RaE0F3NvPHNGjw1JgTtPAJQquEfE?=
	=?us-ascii?Q?Z9vR92lP1WsgyMmwMe9TA4mZv0TbaC3yNjYbe3EtwrG+UWwtcH6RhIxvlODB?=
	=?us-ascii?Q?PPDafB4OPgqTPsR2Mbs33/GiSeudpO4Petfc5VU9x4bDBM+rslwBMHEE4g/5?=
	=?us-ascii?Q?XIenUQ29wm930Ez3OadtDMKka8y/OcmXLOYhSjVO1iNfwMHKcygegwzNUFOi?=
	=?us-ascii?Q?iFWYrFSUPm87fFi5ZujF3qHbbiR3CIXLv0vz8KU9S9hBWCTrdesYoRQv4Zus?=
	=?us-ascii?Q?fBrtbjLHexZUTYEWBaPrz8Gm3MrikOVaONakUIPk8ct4PrX5VekEyRi4Z4EE?=
	=?us-ascii?Q?KL7oVm4ObFyPatLxBvAgiD0fOrq9YJtzCcxtFc903kna+C5YT4Gp7nql9F/F?=
	=?us-ascii?Q?M8Tt2IjD/7CH7h7uuR3HBtXgxmD?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	6:ctaMm8LqRnWP/ZYZJVBxprK/Lq4M0nAlPahZGJFBP0sB7lOXQ+Chd+FIo1bCBZxCtgPjgT2IuCGNybQqZ+DUQMPc8BHHlEbnKzfHSqNZ/5Aud38wPcOpGZuECuWtjuFd1gTxrby23dCSrdVamPa+IVVqpgM86hVh/xBcrgjWldwq07p99TPguV7Tj/N3p86sNOtN15hTN1VTS/7NA+GoNqS6Zc3iClyBxvpMi8B8bGjuTaqVC1LvnYHMPhttddqpKsTUSf4JheiEZ34eEJuE7zT1d/KyRY02u2w5SwmtcWDASNUxzIjXv3lJ8HuZTM5A4Et12w1aCBQoH8hhu+WTZQ==;
	5:DGkU7/i3aYZ0tJ3hboH6s3EjTHW6EOAvgdZvn5t369Rqc17qgjkosGbb26mxLv2jBpVrF3wBJ42ncLoZ6H7AaAkyVvaufBYfqedzBYMaWAbWinkF6LwcX9meNGjaaurnSQ/bkQRwoTtaKtOTzBuaFg==;
	24:+thQDOcbOpZwzP+7H0TZCifjLLZJS4zCw/zqKhocEPfWdbarI7ZT8os/CR9MJ0DxMte01rdzkC/MZuQA02BsLkKpYU9j8l8dG3CHCdwwZio=;
	7:TSxK/GW3lGlMrI+yittntwnQnC8rUo+N68ZKFo041AGwIPoiYtzbfzX8jkvjxP36/xCRkYle1ArahckwS65Yvedr7E9WV8YHiRcDts3aT4pA7t+KXZMG5risA4Wq8WrD5TiZ2wyEgRIKFm4jD9d4t5X/GSoIW/hTTwwKMzmszxy/cVH6iq8v59HXc4VCPQz2c1XmdUGHNBJINGK6kaDzCN4F8KSvID38aDR80WA0dqE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2017 15:43:23.5769 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65aa979a-c0d1-417a-5c4f-08d51bbf2049
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1339
Subject: [meta-oe][PATCH] linpack_1.0.bb: Add linpack benchmark
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
X-List-Received-Date: Wed, 25 Oct 2017 15:58:39 -0000
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
index 0000000..83a4a80
--- /dev/null
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "LINPACK Benchmarks are a measure of a system's floating point computing power"
+LICENSE = "PD"
+LIC_FILES_CHKSUM ="file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
+
+SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c"
+SRC_URI[md5sum] = "1c5d0b6a31264685d2e651c920e3cdf4"
+SRC_URI[sha256sum] = "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} ${CFLAGS} ${LDFLAGS} -O -o linpack linpacknew.c -lm
+}
+
+do_install () {
+	install -Dm 0755 linpack ${D}${bindir}/linpack
+}
+
-- 
2.7.4


