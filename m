Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E90FCA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 04:55:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13583.1756356892564745779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Aug 2025 21:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S/2lBqCV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03356deeff=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57S4e5sd3151147
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 21:54:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=SPqKu1+slyun3stxWcZBcPqqxksHgtERGdvn/UzuWf4=; b=S/2lBqCVyppQ
	eqmKTqCUc1AsQzFr0YdGGtVw6D0IIa2Km3TehF1cfH6B3rnxz5B/QLQnVmfkLaM7
	47CezQuGvkadpuc0tiIM9atRDeoFyRjkLz201Azlp6lY5wvSI87/9lF4HaVts4/x
	U3uuoEwTFGxikZq2gj8NGpc5Q6wHitL7BUjiHMQeFHkdrgoAAn61bb6Q1iR2AhId
	H+LFbTEskbYCUcgReer/DDnue+Vjrlt9Oe26F8n7Qm9xuAM6uJQIZxkvV6+JTu6T
	m/tXRpP8sKNFz4h0+tYEKO1Inhuw8miWqEEuXX01finQf1ORbN67UhP16tkTCA5J
	WxPyxnLcaA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x25a81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 21:54:51 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 Aug 2025 21:54:51 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 27 Aug 2025 21:54:50 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH 2/2] libwnck3: fix build failure for lib32-libwnck3
Date: Thu, 28 Aug 2025 12:54:48 +0800
Message-ID: <20250828045448.3704256-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828045448.3704256-1-changqing.li@windriver.com>
References: <20250828045448.3704256-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LWSBwElwZ05Eeq3pC1-GPLp70r9UmzcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDAzOSBTYWx0ZWRfXzQMPQIS1BQPl
 O1zR6IZQwpM37LfKO5r5jpKWG8J5CsQ+qkQZqE8iyHaNHdO5f+Jm/n7gsiAJ9d8GSuHAvBWXyUE
 3JOA4zcrbACc3GzMfpzMB2UBd0/xzcfNA9ZJX1MCzuxn36tfdVTGdckPhYnqpYKLgG/SNJTQ8OG
 OBMAcvn0UXM5KBxW0+HZ7uArOBsOhdujqQVp5ehci+oBDMoX9CaNY9AELExsOXiXtA7TgRHfLXY
 5SR4n2LOMl1Pwj/OLoHdb26fWq009O7czqWCk7k2AZd76MvGiyCn+b3rGDbpHGkvvA66RPr1Sfd
 iINLEwkmBmR9Jpfl+mZiEB00dqgy0sDxZUV6aFbiq85N6VVl4J2b1uzLZSAdB8=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68afe11c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=GNEw3xDRAAAA:8 a=hT18Y9NG75USSpZ8hLEA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Gbt7yw0KH3r5R2uzA50C:22
X-Proofpoint-GUID: LWSBwElwZ05Eeq3pC1-GPLp70r9UmzcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Aug 2025 04:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119126

From: Changqing Li <changqing.li@windriver.com>

Refresh patch for fix build issue

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...caused-by-OE-core-changes-to-startup.patch | 33 +++++++++++--------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
index 91e23c785b..0328202f1b 100644
--- a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
+++ b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
@@ -1,4 +1,4 @@
-From 1df0f4ae8fd54bc1ae940dfafa701c84d068674d Mon Sep 17 00:00:00 2001
+From fd075074182f756e2872569925f70f5f4e2386c2 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 25 May 2025 12:24:16 +0000
 Subject: [PATCH] Fix build issue caused by OE-core changes to
@@ -21,23 +21,30 @@ It is caused by a patch of startup-notification in oe-core which is backported f
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+Refresh the patch
+Don't use explicit type cast to avoid truncation, use long long for tv_sec.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
- libwnck/tasklist.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ libwnck/tasklist.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libwnck/tasklist.c b/libwnck/tasklist.c
-index 7418f89..460e11d 100644
+index 7418f89..f0f30b2 100644
 --- a/libwnck/tasklist.c
 +++ b/libwnck/tasklist.c
-@@ -5031,7 +5031,7 @@ sequence_timeout_callback (void *user_data)
-       WnckTask *task = WNCK_TASK (tmp->data);
- 
-       sn_startup_sequence_get_last_active_time (task->startup_sequence,
--                                                &tv_sec, &tv_usec);
-+                                                (time_t *) &tv_sec, &tv_usec);
- 
-       elapsed = (now - (tv_sec * G_USEC_PER_SEC + tv_usec)) / 1000.0;
+@@ -5019,7 +5019,8 @@ sequence_timeout_callback (void *user_data)
+   WnckTasklist *tasklist = user_data;
+   GList *tmp;
+   gint64 now;
+-  long tv_sec, tv_usec;
++  long long tv_sec;
++  long tv_usec;
+   double elapsed;
  
+   now = g_get_real_time ();
 -- 
-2.33.0
+2.34.1
 
-- 
2.34.1


