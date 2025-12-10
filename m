Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1955D2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:04:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10857.1765353888756246769
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p4MQKiN6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4439c1c002=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA5d4v31880582
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 00:04:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=uavXGu5AGCaAmVYKad54
	Qbj18EGdH+MRDL30rNUf6m8=; b=p4MQKiN6LTyr7LKn3k9cDCsYLg37/vO5MBLE
	MvHDWhXJHwhOn6Td9Y7Mvj4Ch70jDS4Ys+IjZWHePggG2yCQmL/UwQWY0W3x1/0g
	2DEl7jIpxqk55g8f5u8giJPY4hzS1PBTEhLiiQIdGfyUqrL51WcEAtnmSW9dwwH1
	mDhfi5bEuASB8UGBs+j//mgIz1saasfbcD/1xvrA/6ArFm4bfcs2DaP5H+6jYYKT
	ARP8rc5XkTCKOQ1UGATSA5q23PDUcQzEYzZljhjtTWVszj/E/csEG+PQKydWU1jk
	dgT2eZj48R3Oeg9LabB0G3ep2zo3jjcfLmtA/LPGQPNGxW/zPA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay022r9pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 00:04:48 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 10 Dec 2025 00:04:47 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 10 Dec 2025 00:04:47 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] minicoredumper: fix 2038 year problem in timestamp handling
Date: Wed, 10 Dec 2025 16:04:46 +0800
Message-ID: <20251210080446.2164494-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=693929a0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=v0Kjis4l_DK74aj9xSIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: tXhpFVf67DmZDSdq5KW64ns8w2YS6Qt1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA2OSBTYWx0ZWRfX47Pt0jIwNCdx
 DylzDXWS7nc0QEcX8V320Vr+i9FsCvJbK1T7YAcP+9GXSo/6Ach83hmE984ePi4eiL9GdP8iiP1
 cMYjYNX1jwhIYHhCjkQ50MaseCN3yFNlfElUdsHfRGYxK8H2X08HhjflUJAIbv4ETgkYRA3lcxo
 YJ4wrrlQD5pbI67+OjjC3whdYqahL5GbbrSvpG+a5SBo7ev7K0cZCA/ayKJRNcqb3VOImBF7rGI
 5Ra7qgfJMGDD4dzy/2USDiv/F4HnmGVe8s27xpdIIMKSXNkibmtciXS0PgZPLHyL8kUcTyChsIR
 a67LJ5eu5dmiRAWiYIhZX8KNl+FmKbzOa90f9x6Z9p8r3l6zdTbKtmmdOllL9ySnlWPDIAkSnTf
 b6IabsI9y8FvRVJnqWqm8GG4gbTyZg==
X-Proofpoint-GUID: tXhpFVf67DmZDSdq5KW64ns8w2YS6Qt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122486

From: Jiaying Song <jiaying.song.cn@windriver.com>

The minicoredumper has multiple 2038 year problems where 'long' type
variables and strtol() function calls cause overflow on 32-bit systems
when handling timestamps after 2038-01-19.

This leads to incorrect timestamp formatting in core dump directory
names (e.g., sleep40s.20380119.031407+0000.598).

Fix by changing 'long timestamp' to 'time_t timestamp' and replacing
strtol() with strtoll() to properly handle 64-bit timestamps on
32-bit systems.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...8-year-problem-in-timestamp-handling.patch | 55 +++++++++++++++++++
 .../minicoredumper/minicoredumper_2.0.7.bb    |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch b/meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch
new file mode 100644
index 0000000000..977f59b976
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch
@@ -0,0 +1,55 @@
+From 0f80d5813679320b69ae1d2aefb58af1e0e2d269 Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Wed, 10 Dec 2025 14:22:00 +0800
+Subject: [PATCH] Fix 2038 year problem in timestamp handling
+
+The minicoredumper uses 'long' type for timestamp which causes
+overflow on 32-bit systems after 2038-01-19. This leads to
+incorrect timestamp formatting in core dump directory names.
+
+Change timestamp variable from 'long' to 'time_t' and use
+'strtoll' instead of 'strtol' to handle 64-bit timestamps
+properly on 32-bit systems.
+
+Upstream-Status: Submitted
+[https://github.com/diamon/minicoredumper/pull/24]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ src/minicoredumper/corestripper.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
+index e9e3936..e52802e 100644
+--- a/src/minicoredumper/corestripper.c
++++ b/src/minicoredumper/corestripper.c
+@@ -617,7 +617,7 @@ static int init_di(struct dump_info *di, int argc, char *argv[])
+ 	if (*p != 0)
+ 		return 1;
+ 
+-	di->timestamp = strtol(argv[5], &p, 10);
++	di->timestamp = (time_t)strtoll(argv[5], &p, 10);
+ 	if (*p != 0)
+ 		return 1;
+ 
+@@ -3715,7 +3715,7 @@ static int do_all_dumps(struct dump_info *di, int argc, char *argv[])
+ 	bool live_dumper;
+ 	char *comm_base;
+ 	pid_t core_pid;
+-	long timestamp;
++	time_t timestamp;
+ 	char *comm;
+ 	char *exe;
+ 	char *p;
+@@ -3750,7 +3750,7 @@ static int do_all_dumps(struct dump_info *di, int argc, char *argv[])
+ 	if (*p != 0)
+ 		return 1;
+ 
+-	timestamp = strtol(argv[5], &p, 10);
++	timestamp = (time_t)strtoll(argv[5], &p, 10);
+ 	if (*p != 0)
+ 		return 1;
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
index 4073381899..f68984b072 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://minicoredumper.init \
            file://run-ptest \
            file://0001-corestripper-Fix-uninitialized-warning.patch \
+           file://0002-Fix-2038-year-problem-in-timestamp-handling.patch \
            "
 
 
-- 
2.34.1


