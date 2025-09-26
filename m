Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A45CCAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 11:44:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15373.1758887080934080499
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 04:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rI+U6CTd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1364ba7040=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58QB9lSX1379348
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 04:44:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=dOARXScmdFHJn4GIcIV/
	uMqANVJ7S8k/NojfQItyN9s=; b=rI+U6CTdhSPdCiCimwK7ZdUCVsdqeN2XUsKt
	Oege19g/UvjeLWh/leqnSJG3AkvjBNnvU2JNNlZHb2DINQAZzZlfxV8pDxSmzyMR
	mCsQno3OBoeIjgQwvG6Un2SsMPjWhmlNUt4W9mzgMA4NqyJeSTVHgWh5xig71YX2
	HDm17aOP2Rh7WXfbLNTmda++YGWlGUKRyLEsD5hzdEt2NmsWstpnjy6aNy0qNxLf
	sZ0gXGRJzV3Ym+AsWGSTabTaOR4B0zwSX/KCeSEB/E3zlYu7dW+C7gVGJCEDpTTr
	8M6cji47nM8x3FxjYiNATIKGE/k/CztycNnKgGH3+RRN2ctMvQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbse0r7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 04:44:39 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 04:44:39 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 26 Sep 2025 04:44:38 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/3] iperf3: Fix CVE-2023-7250
Date: Fri, 26 Sep 2025 17:14:28 +0530
Message-ID: <20250926114430.2425208-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LHJ3sR1KKsNKUYK7yZqQBtCm_5WkrO61
X-Authority-Analysis: v=2.4 cv=NanrFmD4 c=1 sm=1 tr=0 ts=68d67ca7 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=vtXoPY2jAAAA:8 a=leH7VdtcYazS_2BtDtsA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=s4FxMMpuSwg4a78zj2vJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwOCBTYWx0ZWRfX/ganWLd8tMtN
 t3DFmN6gPSonh6x1yOxQVc2mc12Z7I+ngfz6jFRkdktDtZnuoNp8Zcij9xSUep+Q+Ot+NA8jSKD
 hC4sg1AUsV0zH/CGMq3a1l3MbTXFnZcXxt/KBCG1OnHc35OeKcscvEh7RkV/2ElxnzWlnyuEPLm
 mitLqFNElmT/5UEU5aVEwT+2w/Rv0nJ1uQxrr6+3qvrY8nisbP24CmoCX+4jsOiFFyqEytqyQ7Q
 2q49j71SHrQx4DUaOkfg9WhkHiu5K/11kuil3simSmq7YR4b355MqHfvNYSyVmg1YVrC42qSMuc
 Ww7MtBBrT53nJ+fD9WSPBhfIU8KkVz2M5FCj7C1Przfr2o4Q7xv2nsMftRGfVgLhfHuPbgF/wO+
 9wwsRRzvHfUFxrqG3pULHLn1K4WZxQ==
X-Proofpoint-ORIG-GUID: LHJ3sR1KKsNKUYK7yZqQBtCm_5WkrO61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509260108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 11:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119906

From: Soumya Sambu <soumya.sambu@windriver.com>

A flaw was found in iperf, a utility for testing network performance using TCP, UDP,
and SCTP. A malicious or malfunctioning client can send less than the expected amount
of data to the iperf server, which can cause the server to hang indefinitely waiting
for the remainder or until the connection gets closed. This will prevent other
connections to the server, leading to a denial of service.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-7250
https://security-tracker.debian.org/tracker/CVE-2023-7250

Upstream patch:
https://github.com/esnet/iperf/commit/5e3704dd850a5df2fb2b3eafd117963d017d07b4

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../iperf3/iperf3/CVE-2023-7250.patch         | 133 ++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.14.bb   |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2023-7250.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2023-7250.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2023-7250.patch
new file mode 100644
index 0000000000..6000480de7
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2023-7250.patch
@@ -0,0 +1,133 @@
+From 5e3704dd850a5df2fb2b3eafd117963d017d07b4 Mon Sep 17 00:00:00 2001
+From: "Bruce A. Mah" <bmah@es.net>
+Date: Tue, 1 Aug 2023 14:02:54 -0700
+Subject: [PATCH] Implement fixes to make the control connection more robust.
+
+These include various timeouts in Nread() to guarantee that it will
+eventually exit, a 10-second timeout for each attempt to read data
+from the network and an approximately 30-second overall timeout per
+Nread() call.
+
+Also the iperf3 server now checks the length of the received session
+cookie, and errors out if this happens to be incorrect.
+
+Reported by Jorge Sancho Larraz - Canonical.
+
+CVE: CVE-2023-7250
+
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/5e3704dd850a5df2fb2b3eafd117963d017d07b4]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/iperf_server_api.c |  7 ++++-
+ src/net.c              | 62 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 68 insertions(+), 1 deletion(-)
+
+diff --git a/src/iperf_server_api.c b/src/iperf_server_api.c
+index 18f105d..ae916f5 100644
+--- a/src/iperf_server_api.c
++++ b/src/iperf_server_api.c
+@@ -140,7 +140,12 @@ iperf_accept(struct iperf_test *test)
+         }
+ #endif /* HAVE_TCP_USER_TIMEOUT */
+ 
+-        if (Nread(test->ctrl_sck, test->cookie, COOKIE_SIZE, Ptcp) < 0) {
++        if (Nread(test->ctrl_sck, test->cookie, COOKIE_SIZE, Ptcp) != COOKIE_SIZE) {
++            /*
++             * Note this error covers both the case of a system error
++             * or the inability to read the correct amount of data
++             * (i.e. timed out).
++             */
+             i_errno = IERECVCOOKIE;
+             return -1;
+         }
+diff --git a/src/net.c b/src/net.c
+index 1a88155..b80fb64 100644
+--- a/src/net.c
++++ b/src/net.c
+@@ -65,6 +65,9 @@
+ #include "net.h"
+ #include "timer.h"
+ 
++static int nread_read_timeout = 10;
++static int nread_overall_timeout = 30;
++
+ /*
+  * Declaration of gerror in iperf_error.c.  Most other files in iperf3 can get this
+  * by including "iperf.h", but net.c lives "below" this layer.  Clearly the
+@@ -372,6 +375,32 @@ Nread(int fd, char *buf, size_t count, int prot)
+ {
+     register ssize_t r;
+     register size_t nleft = count;
++    struct iperf_time ftimeout = { 0, 0 };
++
++    fd_set rfdset;
++    struct timeval timeout = { nread_read_timeout, 0 };
++
++    /*
++     * fd might not be ready for reading on entry. Check for this
++     * (with timeout) first.
++     *
++     * This check could go inside the while() loop below, except we're
++     * currently considering whether it might make sense to support a
++     * codepath that bypassese this check, for situations where we
++     * already know that fd has data on it (for example if we'd gotten
++     * to here as the result of a select() call.
++     */
++    {
++        FD_ZERO(&rfdset);
++        FD_SET(fd, &rfdset);
++        r = select(fd + 1, &rfdset, NULL, NULL, &timeout);
++        if (r < 0) {
++            return NET_HARDERROR;
++        }
++        if (r == 0) {
++            return 0;
++        }
++    }
+ 
+     while (nleft > 0) {
+         r = read(fd, buf, nleft);
+@@ -385,6 +414,39 @@ Nread(int fd, char *buf, size_t count, int prot)
+ 
+         nleft -= r;
+         buf += r;
++
++        /*
++         * We need some more bytes but don't want to wait around
++         * forever for them. In the case of partial results, we need
++         * to be able to read some bytes every nread_timeout seconds.
++         */
++        if (nleft > 0) {
++            struct iperf_time now;
++
++            /*
++             * Also, we have an approximate upper limit for the total time
++             * that a Nread call is supposed to take. We trade off accuracy
++             * of this timeout for a hopefully lower performance impact.
++             */
++            iperf_time_now(&now);
++            if (ftimeout.secs == 0) {
++                ftimeout = now;
++                iperf_time_add_usecs(&ftimeout, nread_overall_timeout * 1000000L);
++            }
++            if (iperf_time_compare(&ftimeout, &now) < 0) {
++                break;
++            }
++
++            FD_ZERO(&rfdset);
++            FD_SET(fd, &rfdset);
++            r = select(fd + 1, &rfdset, NULL, NULL, &timeout);
++            if (r < 0) {
++                return NET_HARDERROR;
++            }
++            if (r == 0) {
++                break;
++            }
++        }
+     }
+     return count - nleft;
+ }
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index d181eb3b02..8961628792 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dc6301c8256ceb8f71c9e3c2ae9096b9"
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
+           file://CVE-2023-7250.patch \
            "
 
 SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
-- 
2.40.0


