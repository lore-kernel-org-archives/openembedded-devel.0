Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web09.3384.1618537440223084557
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 18:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=N43Jr1Fa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618537438; i=@fujitsu.com;
	bh=qZ+hZqYaCqZbjrq7s1N/2fMuCN5Lz/P7hPO3uVhQVUw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=N43Jr1FaeYYPHh1SxjUwSBJ3r/YdK1x6nj3rsuzKk0N0cVk9e6p6RpBckdsT3Rxwz
	 3lQxIY8xB444uv07qtZFFCrucnUBdFZBFuL/81WSSvs5jtz5z6U2VjQs3whlMXSF8/
	 b2HVMT2p4cETvlUef9OGsKUu5b///LWqHI27OHJW5PwtsWyW3avCJt6ce29B6bSsv2
	 m7mwCsGAubra7J64ePRwdww72JgBcSgF27axn1K6kHSQ2dMQQiXEwkowebRjndGBSm
	 TAhhH+ZCXdl9xApCGDfRBrfLT+gf1FmpwA9bVqCCaH8k1P6OUnWo0M2DT8+u9/Lg7+
	 zU0y6V1HNo6eg==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 41/78-46412-DDBE8706; Fri, 16 Apr 2021 01:43:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxVffO64o
  Eg95/lhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8byezvYC/q5K9pbVBoY53J1MXJyCAnMZpL4
  ca24i5ELyD7OKLH69Sw2kASbgI5Ex4tuFhBbREBfYunsPcwgtrCAq8S0D1vBbBYBVYlpm1tZQ
  WxeATeJh4sbGEFsCQEFiSkP3zNDxAUlTs58AjaHWUBC4uCLF8wQNYoS23eeYYGwKyW2TzvLOI
  GRZxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNI1tDTXNTQ210us0k3SSy3VLU8tLtE
  11EssL9YrrsxNzknRy0st2cQIDKKUgqOdOxh/vfqgd4hRkoNJSZT30IqyBCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvKteVSQICRalpqdWpGXmAAMaJi3BwaMkwvvhJVCat7ggMbc4Mx0idYrRl
  ePZ2iWLmDk2zFsKJP/fvQsk+xccXM3McbP90GpmIZa8/LxUKXHelyCzBUCaM0rz4EbDovESo6
  yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeYyBTeDLzSuAueAV0HBPQcRWrSkGOK0lESEk1MIl
  Nau+MjrY1lC8PFhTKtA8w4LHPflX4ePXemZfiMiyvx5VMiDvNcS1e4MyJFGvxB8/eaP/cWL5M
  sOxlmc/bJVqMifcNDqyZJ1RQN/t50oV1jr5Nxes/7Hs1xV5v55Y35e0nplubb0983W0UZ/mpJ
  fe3uc1R1f+zV7nc+zDbrPHUsZ6ka/VTLLMWXf1Z1eddt8vXeN2EuPTj4ZnfrygfknPyWRtidK
  VF5ZXak21KKvZbfxx8o7n84vlnssYpB/e+M3j2o+Z9crBX+uGnB76mlRa4CTnwhK4/2HPj7sb
  H2QGr9/x4fuDqlITfvkvjXhd9rr3dHPu46npFY8iLK/P8M27v+aQgklg34b3ugb8CrFOVWIoz
  Eg21mIuKEwFSBj8qQQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-285.messagelabs.com!1618537436!1195516!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6876 invoked from network); 16 Apr 2021 01:43:56 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Apr 2021 01:43:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13G1huUh014495
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 02:43:56 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 02:43:55 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] dnsmasq: upgrade 2.84 -> 2.85
Date: Fri, 16 Apr 2021 09:43:49 +0800
Message-ID: <1618537429-7445-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb | 8 --------
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.85.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.85.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
deleted file mode 100644
index 3dd9154f3..000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.84.md5sum] = "6bf24b5bcf9293db2941fbdb545c1133"
-SRC_URI[dnsmasq-2.84.sha256sum] = "4caf385376f34fae5c55244a1f870dcf6f90e037bb7c4487210933dc497f9c36"
-SRC_URI += "\
-    file://lua.patch \
-"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.85.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.85.bb
new file mode 100644
index 000000000..023dda3e5
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.85.bb
@@ -0,0 +1,8 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.85.md5sum] = "4079e1e6e1065e4bd14ded268cdd7bd7"
+SRC_URI[dnsmasq-2.85.sha256sum] = "f36b93ecac9397c15f461de9b1689ee5a2ed6b5135db0085916233053ff3f886"
+SRC_URI += "\
+    file://lua.patch \
+"
+
-- 
2.25.1

