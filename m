Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26C8C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:24:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.191349.1673940277344835101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Fne/08V3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940280; i=@fujitsu.com;
	bh=um6n1dx72hMBQwyfwlqPKocTeV6LFyaLtVovbVZ++SM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Fne/08V3rdv51amAG3pwulgM5usVD1G3Z4Kkqa57SVwu1aA6nKTGHBEpX1Ry4im3R
	 NmDlEN3bGGQfchi/zVaa7wkEhnkN1uTHg4b/BQL2SXK670F0Z4cAvcr1KBG/0Db/uo
	 w+e84UXjJS0FjmylT+O3FdmD5G+WjfwUv0xzJgqPXUsZt6rFBrM7xWlTZfCyYWzJNo
	 8ROuslSHQR3DggpmImxVJsCDyvvWMxnrWomT4D5mSv7M+bDstMSF0eKmnUmAsDQHJB
	 uTAbdYIalParIM+qevt9ZxQ4pEz3VPi988ZUvaesryVgWHnoRmny7mKaa2+gXDHnbo
	 L1n9b5qfKSfrg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWdfc91i
  ywbWdBhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bXO3fZCj4IVDR9+snewHiCr4uRi0NI4AGj
  xLXDLewQzhUmiUddlxm7GDmBnL2MEgsbVEBsNgEpiRv3/7OB2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQV8JDbPh4izCKhKLDiwlAXE5hVwkti48DhYXEJAQWLKw/dgNqeAs8TBXbuYIHY5Sfy5e5
  oZol5Q4uTMJywQ8yUkDr54AdWrKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0LSvoCRaRW
  jaXFqUVlqka6ZXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJ
  JkZg6KYUK93bwTht2R+9Q4ySHExKorwnTY8lC/El5adUZiQWZ8QXleakFh9ilOHgUJLgPeUFl
  BMsSk1PrUjLzAHGEUxagoNHSYQ33BIozVtckJhbnJkOkTrFqCglznvYGyghAJLIKM2Da4PF7i
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwryOIFN4MvNK4Ka/AlrMBLTYo+QoyOKSRISUVAO
  T7DSFKSK2mjFubqWNd+/Mi3dr2q+ut+RBzfb7B0zVlHb/W7OwK+/pLf+1d1a/yf8q4dLI6qzN
  t5DZ1f7Lkqyvvoc0ZRbn1d19d3wdu6zsomWXflx20W1Lmcy8rNy9YtXq0m6D59Xnw7Taq2xcL
  X30Am7o5kUZhp+8e3Hm5r2rL04s+ZKf/1TugDjHY1nXH32sswVLrobVz4qX7fnura5tLdGxQD
  bl4NfGjeeMtG/biGpEykZlv1fPMNS5/fTE8pPVt//mF774ceFFeH7Fz1uHDddubuzc4CyedvL
  AxN137m5dm5bE2eo5p6RNoUY06kXOgouKk1PTj189X7+70v/UV3vOZEfD25XTV05z8X+mxFKc
  kWioxVxUnAgAzTQHOlgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1673940279!403841!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29502 invoked from network); 17 Jan 2023 07:24:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:24:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7F2FF7C
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:39 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7338073
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:24:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.0.2 -> 3.1.0
Date: Tue, 17 Jan 2023 15:24:21 +0800
Message-ID: <1673940264-20487-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940264-20487-1-git-send-email-wangmy@fujitsu.com>
References: <1673940264-20487-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100621

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Add xdist pr default. (#1253)
    Create docker-publish.yml (#1250)
    Parallelize pytest with pytest-xdist (#1247)
    Support Python3.11 (#1246)
    Fix reconnectDelay to be within (100ms, 5min) (#1244)
    Fix typos in comments (#1233)
    WEB simulator, first version. (#1226)
    Clean async serial problem. (#1235)
    terminate when using 'randomize' and 'change_rate' at the same time (#1231)
    Used tooled python and OS (#1232)
    add 'change_rate' randomization option (#1229)
    add check_ci.sh (#1225)
    Simplify CI and use cache. (#1217)
    Solve issue 1210, update simulator (#1211)
    Add missing client calls in mixin.py. (#1206)
    Advanced simulator with cross memory. (#1195)
    AsyncModbusTcp/UdpClient honors delay_ms == 0 (#1203) (#1205)
    Fix #1188 and some pylint issues (#1189)
    Serial receive incomplete bytes.issue #1183 (#1185)
    Handle echo (#1186)
    Add updating server example. (#1176)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.0.2.bb => python3-pymodbus_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.0.2.bb => python3-pymodbus_3.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.0.2.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.1.0.bb
index 95cc3e351..b58c62218 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c2223d66c7e674b40527b5a4c35bd76"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "704cb7fb90631c45f9c3a70b89d0c990fe0e208ac56f14a5c449e21bebd1e201"
+SRC_URI[sha256sum] = "eeba02c86b13b1f885c0acc50adf4611df24ab85066ff54daa37c2d883c32525"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.25.1


