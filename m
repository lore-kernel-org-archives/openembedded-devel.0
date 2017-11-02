Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 22352 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Nov 2017 04:32:47 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0084.outbound.protection.outlook.com [104.47.38.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7AC6FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 04:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=c8wpofjYV2FhCVzdatIkI6S5V5O04OX58gcSEdfyqSk=;
	b=xryJQk62ZQw7mlBNpCmrNE2nqiozsmzRwNAvtj3QAy/CoOPZhDQ3v4QvKGQg8SQ+300cbcX2a+Loqhn5TROTCnb01Xx8f22PrAirKNR+cs17c2EWvknw9b8FXPmDUIaFhmS2gGJJ+GkullxFaxWRzNAQApA6+ICZ21ld+vWh20Y=
Received: from BN6PR02CA0086.namprd02.prod.outlook.com (10.161.158.27) by
	BN6PR02MB3266.namprd02.prod.outlook.com (10.161.152.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.6; Thu, 2 Nov 2017 04:32:47 +0000
Received: from SN1NAM02FT011.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by BN6PR02CA0086.outlook.office365.com
	(2603:10b6:405:60::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.197.13 via
	Frontend Transport; Thu, 2 Nov 2017 04:32:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT011.mail.protection.outlook.com (10.152.72.82) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.178.5
	via Frontend Transport; Thu, 2 Nov 2017 04:32:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:34131
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eA7BO-0007fo-6z for openembedded-devel@lists.openembedded.org;
	Wed, 01 Nov 2017 21:32:46 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eA7BO-0007mH-36 for openembedded-devel@lists.openembedded.org;
	Wed, 01 Nov 2017 21:32:46 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vA24WdoI003414; Wed, 1 Nov 2017 21:32:39 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eA7BH-0007lk-7T; Wed, 01 Nov 2017 21:32:39 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 1 Nov 2017 21:26:59 -0700
Message-ID: <1509596819-21148-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23430.004
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(189002)(199003)(47776003)(36386004)(966005)(16586007)(2906002)(107886003)(478600001)(72206003)(5660300001)(77096006)(6306002)(5003940100001)(19273905006)(106002)(50986999)(6916009)(6666003)(4326008)(81166006)(106466001)(33646002)(8676002)(81156014)(2351001)(316002)(50466002)(189998001)(8936002)(356003)(9786002)(36756003)(48376002)(63266004)(50226002)(305945005)(107986001)(5001870100001)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3266; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT011;
	1:wtXQnCVe2ixDk16j0g2xtm3iXa1pY23gCXTYPycBnqL7zVfc/yv/TZ02Xfo+RN7KRKZdoygUmeKHJs51dYOUa+B93Rpj7Y3QbhOduYA/3pdI1qV7LCA3bqMkE4Xxe6aQ
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7e31ecf-cc19-4eb5-8011-08d521aac4bc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(2017052603199);
	SRVR:BN6PR02MB3266; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3266;
	3:xBVzErJhbXzQnogRZNu9G4lTYXRFSVJB5jxzjJ49/QvdCJB0Q8HiNlt3XNGfIo7jZNKly0SkuJkNLR4B8TgVNCJcAZpEDsLIPkP7e0ndqTRkIXEuqv7CCOZrlYhhgjNGzSB04tqVLCbEwK9jde1eReOD2nVizL9KnvuGVvTGX96LGsZlmq1rg67sl0eysshY6xGYkZRSrWIBYH9NKEJo3VndlshjrNazbr0lb9FM7JABtdyyYOIUH7D7x3lQN0vwXvbGWKi8y+iU8oZVB5zod+Yrks5lsh1a2jGTOZavuPHEie+oJuCdwGMa2d4vi42RULBhBHFixQdAVLfLPRRAyzvlKl3mBHYlSHRWEY/gKBc=;
	25:sdm4VD7MpiN3b5FZ0A5B0hXKoUJCKagkYvs//NOtDmcxnKiQFpm5RUfNv1h/HhC/FUPEe7Vr+wyWRYSlP1UNk2l04Znz4ElrH3hs/WJBmr/wYRjy2cOPX0vlPp5VizoMUrjkSivNb3QPk4pbsIEYmIwH4pjbfw2TMLFXeFdeKiowprOZS8El5aF/RiNqp97n4RgTPWTMg1QaE09rPIhbvHKOLiouhII/FXf7KqqAm+juzNOgarN8oJf3SnFYTVQWocxJFIWkFMFwQUZu3v+m6RkhbQ4ditqo60QgiSS5Mda8cXKIZxRV0dONcvbyAnr2AnJCSnKSqSvHktVYZAsJpA==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3266:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3266;
	31:BTgt3NE3q+F2AxtL4Q5su1q3Fl5c0rlrAmcCwhbVt1rhxxwGa2fYbn11d7B2BVNVw4mFMKlPE2Mbmw/SGtXWxVH3ra4Dfcz2CGg/nPRC9jGAY3qfkEQ3oxmef0CfbzCs1tS7Qfylws7Yq9PhT4minzMM/3+K7HWdc3I909bO4VaityhCnosl1HePhYHqA1/kEyOatlypCv9MJNsog9uLCwTYPAnmwTjLy/NnKU75fSw=;
	20:iPUw/VXpBowHrOVorHARvjSwrQNJzM9pa72e2fgYhA4Am0HP/cC9qwExB+LltRddJUYasaBVpanpM7UeVCfqDbX73vDAFL4xqPucvD2H7jNyQ5LBzKVPXHfeaQru5IumXxcCGKT4joJfUZWHhTwO+AXjHNPddo7mOBAWwE1DoaQAlhdFCFK2L7xFcTugy9KaYQOjcp5LA9+tfQ/XY9n+UH+608bCXO8x3xN8QQgAMT6PjFY0+UGaJX9IITCLGOFcn5KbVq2J/pp0bhq4ZIMQy+VzqiLGpJQLtcVfHr5lzniQzDyR8w0lW7ii6B2j2HvdGP1jaOjeZwMv9lowXOwIU8kbeytPvnrNrmWFUbGNIeB83dZgv5hPe+UkQ8OPKyzSaecLVMT7Gd8KlpgIfmQBHzHtWyN1+7nPAKzv5VUNCBoig2U206NZENS6SLYaabK7GDLfySQVKogrB3+gqR/S77esBs9TXyvkvFeQVcfCPJFQ2usRWJZzQcE9dBLUjM1g
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <BN6PR02MB326698D7039A680D676A591CB95C0@BN6PR02MB3266.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231020)(10201501046)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123558100)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB3266; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB3266; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3266;
	4:e3yXIEAAb27kkbi0ffuZ0fx4eOsnEMVy3sTAr/KrlXM5hWGFhsxkWP/1gqkzS0NFjX6fDpS8OjbdZm0UWmiHl7hCfUoVw6R/qpt9cedc3oJQIvhgbK1mY3jEnSLWZeiRs3ykHNMP8CloidvydGB7nLzxxQPxbxZ8rypfJB+Pshs34PB90a4C5ldktElArAybbbgwn5nBBAuH/k8NFz5EsWXvoFAtOI4sC9e+H2EJZTMIpVOiryGWnNtOHGVxfc3SbfL9tyNoTR87EaER5hLBNFCebb3nmnfQ5qGXAdBMou/LlmAKIPxYrqTS6KawtlP6
X-Forefront-PRVS: 047999FF16
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3266;
	23:pEqcXq45puwtgO23ti3h3jsAbZbwOPHcAAN5NOj5i?=
	=?us-ascii?Q?hmln5iXrxphVp6IhXN44KZgXtbiWYeSeCZRYnkRpitWgdewVcszPMqqIuoCq?=
	=?us-ascii?Q?rs3WV/HU974vKDtNtdFsltg1FJ70VXnRgPHuAlX6UXYPL0PRVYL6l82kk3BS?=
	=?us-ascii?Q?TuRyNNtcaeG7CZqSWu00ndstDXQqsnu4riU14MzFbwej/2cdsSIG5woW7TT1?=
	=?us-ascii?Q?MMNEl87wWq+OHObOkSccBzwlA3kFzEw1aZC9sgy+KNpHaYOkOlCYqIVfJebQ?=
	=?us-ascii?Q?eXTKia7RSwvaXOoBPjjpDAdJgG+OBP28Zv/8Hi3KA+d9gML5WwXRSmnaAF0s?=
	=?us-ascii?Q?ye5Jhdn5t//RIK79gqaackaR/R9m2r7Y1Q8UrtQzTgkoGTK42M66u22xPSkQ?=
	=?us-ascii?Q?CgsoPB08sz4zBMCagoaHgzF0kjpP8s/1SlmtjA+3QyN3iLaZTcLO7cVBaWRc?=
	=?us-ascii?Q?808jbwUh0yI/3S6i/N/slCQtJNhRNaG+F97s4qAefWC16XjN83J97JrOovLq?=
	=?us-ascii?Q?6OD939rxjOx8bx0sY7HYbapl+2ehC2h54WYR07sSxDPOwFJpp7j/932f+jHV?=
	=?us-ascii?Q?6QFcfOjuukown35jbXvvV/Ip5d2eiPz1wwnATBtPHScTKbEOU3TGvWq0lREn?=
	=?us-ascii?Q?O6QJz0c3oh6TKjutdJr++pBwZRUKlnpQfuo9kAuuBLvsifiY5NTgctdeZWob?=
	=?us-ascii?Q?UpUJ00JtVMdiDlY3rtpxK1rV5O+N9ouZto2m/2W8dV08tVXHXCj2tc72kcZc?=
	=?us-ascii?Q?9CuOY67y8C/XkEraqxxPHNS8PMGrrUQhYNO8dDqxqXrJjTrd4taqXLc+VNuG?=
	=?us-ascii?Q?08gb38U8hsSCbZFR/kGZpxv9+a4KhtHNQJrP4XaP3/s20mAbNQFaqdskFbNY?=
	=?us-ascii?Q?miKBNphhjPec7FWJwJGBnTd0QD9vZ3eabQKx+TgTTs5pMh2+gVOLTTj9+/lY?=
	=?us-ascii?Q?cs1KPitGDuFkiLRKSqfRhr35yguA+ddjsTKiB2uqD7dA5QBExqaUyKdJ6Tsa?=
	=?us-ascii?Q?9o1rvEwDy2JGMdgzVIWLemsUgPS5KWhbG+3bDCpVaU+GokIUEHhe0vjHJcts?=
	=?us-ascii?Q?4/AVq0xpV3tOop6XuKwD+eSF9n6PWiq3TF+RDdk2SI/rVFGTw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3266;
	6:kARTyOm2HfjYrU4NngjGzyEYb/EHhF5JbSPwELTwiIhYmbkTOfaLW0sRzkBxXC0UQctL1hPq+K/R8c1KarQlqC6tuJZ0CuCaiA1ayEhR5t6p5Yph0WQjdiuU5gVl9asKFA9jtYozO7WQGDlmakUa6JPAFUlbsWslVpPHLMxuC0FIA5PYQ04mL0JSWF+Mog8W86ICsgwZ2HYQxahAHYgJF4ozcfExyA0kbD0fQzuLkHEKpfpGecuxMeM4wiuyBLpozNwy3dRFsyqzIrcnWRQwPQvRv923fLqU0cQRPxdbmNKyeenqbXco85FoamiesUf2uunFTHmAwIG363bOsrKskkQaEYcw0WTWDWkznQ96ZJY=;
	5:uBSJTmnxGVV0QNuX+CPA7rec/RcTr2AS5ebNPavpDARIIjlBTeB2ExhvKEUxYJPXikKVyL7QDgu8neeBKTza37/zI3w6Uqtc7H+LstYqVKnl9CcXxpuQelRcnMUuxX2dInOSHYCXiY4fz+rxbhvhcAdnF7e0Zk71SKW+griPQYE=;
	24:JVbyLpfaE4xOUoyG9eUUTphnH+0uLIubDc3Lca3FQrE/9ygEoFBpDTZJVei9Fz01y5ne29eEcG9IDcwg9nPitelvsE03F8jJfN7sJ37xe1I=;
	7:UHd214Z6fEfh9Opw8alUu1HeHW/ynPZd2y9mxOkyCevRfpeiWv8UnZmqsG0C6RJLXHEpGz3IThzNWRcFCr+jj6QeuScxUF8K9K4nLZacfVK4c2KyXYIBjojAkTqYr+oOlov02Rekso0/0M4dXgCIhdwY6mr+60MTAt6qGfhtYb5KaT+VmcSMXOgBINhrLiiD3+Y3HZBBYGU8/2f1XUfogoBoZ8g/2r2jWk8FRNGARGtaqGXPinHNoRBTronjwwxP
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2017 04:32:47.0231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e31ecf-cc19-4eb5-8011-08d521aac4bc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3266
Subject: [meta-oe][PATCH v3] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Thu, 02 Nov 2017 04:32:48 -0000
Content-Type: text/plain

The Whetstone benchmark is a synthetic benchmark for evaluating the
performance of computers.

https://en.wikipedia.org/wiki/Whetstone_(benchmark)

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb

diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
new file mode 100644
index 0000000..a5f963d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "CPU benchmark to measure floating point performance"
+SUMMARY = "Whetstone benchmark is a synthetic benchmark for evaluating the performance of computers"
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM ="file://${WORKDIR}/whetstone.c;beginline=1;endline=52;md5=c795edc15e7e1d92ca8f88ad718449f5"
+
+SRC_URI = "http://www.netlib.org/benchmark/whetstone.c"
+SRC_URI[md5sum] = "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
+SRC_URI[sha256sum] = "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
+
+S = "${WORKDIR}"
+
+do_compile () {
+	${CC} ${CFLAGS} ${LDFLAGS} -Ofast -o whetstone whetstone.c -lm
+}
+
+do_install () {
+	install -Dm 0755 whetstone ${D}${bindir}/whetstone
+}
+
-- 
2.7.4


