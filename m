Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F49EEF36E7
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 06:56:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8440.1773038418629688467
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 23:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KDVfaP5k;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fWO7UapL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62963esW2200772
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Mar 2026 06:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3EQhm7RQtoro+amPSAuAuaV0DpH5mWrVZfO
	O4XXUkYM=; b=KDVfaP5k9yYcWi0HSS85P06WZ5wOprxIkfC1+AXtcD27rWXH99n
	cHGOFkmDCWgtFKy7Fz5O1kVdwh7JfFPKmbLuGHcGJhMi6nGy9ZhXzUoJP9IylO5Z
	8RpUaxd1ywLg5gmjx0tE/3PSUK+ItawVxrLAVH30e/6BwGpnSpdnuy1+nP8Hxxau
	fda4KkrqDxqITN0kBhjsQIW99XwxNTbB08limRvgw5g+WIuWXC3J5V/sjR3iCdsr
	i+p7ttxBdaeiTnnCN4+ZOJ9vnqzE6a3QYL8JBucPH8nUvQF3MB2bgcSohnGC4LSb
	lVJre1cS47X9Cbd0Y3DbIC9u0fuXhG49CWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8c377-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 06:40:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35982c5940cso5809042a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 23:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773038416; x=1773643216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3EQhm7RQtoro+amPSAuAuaV0DpH5mWrVZfOO4XXUkYM=;
        b=fWO7UapLE0FbFbbuDSdrBm0q/bsbqBazPi2jKYHrOrosCGwJG+pMUwd1fOR1rUpaJZ
         4UjBVhVBlIkUbaLHmuUfEJy6dW4+69tstyYfyjAqEig18MyJeDByRGHMGJ5s3KvLb0zT
         ZkoiYQSExI74Af7eYkYyxy2YlFVLI96aKnyXriCB12MwSEIUKsIx8RLz3QEZVksXnk+R
         dGTRbAvuxolekwulDJPhVOkLZhR4VKrLWLBK04hKc+pUqfr4oaJszA2GInWyQjLHEUE6
         JRtKuSuLArYgaFDC3XRhOT6af/C8Ct+66rQuTpoZmIA511qWotTD98VY7Jx9m7u6pqDm
         3Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038416; x=1773643216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EQhm7RQtoro+amPSAuAuaV0DpH5mWrVZfOO4XXUkYM=;
        b=J+F2n8o+A4ea7ygXad1NDmDrGv3FeW5NYndkkIRRVUHCfmyNadjySRIi/7x77DOju6
         NhQrX9FyJXYF8uyjB5r04lqOZkF+s2xumjUhB7ATUryqhW7RqyClPgyLzidp7BWBnfBu
         MZS8+A+RWyGDe4OxotqleNMfJXbtNOVuw2yGYxHBKwKtbqMdIoAEIGz0wN3Gymg2c/Ps
         60RGpT13GaNdzQuICGR7KmZo6wBiY2i0V9wlGn1kNtS0vyBQ6/KwtJfJJxQwQwv9JAiW
         zUuohQ6Qkz4jOw1z1WOfUEa/VgyPIETo65zQZcHn7qkjN2o34R6j6DjI+/dl89FEnLMU
         7T1Q==
X-Gm-Message-State: AOJu0YzOeTpDsWw2yMqOqrKLQ6lXjW6JkB8DEG0VoOXh3Ax0KPGc7zAZ
	3ezbFxWOrc3N0PkPjzQdvIevtBs7ttDjGzUVC7bsLoer/ihO6q8XRtIif7kSEEAs2LqlPQlYAxk
	riybj609iB3SEq/nk+wtdDd6w8cMIIQVJuCTx2LoKTTjjAHpBH1iaYk/BLazSCGb8bxBOv0NgLl
	Ln3G1kkEgRHOOKXd7x
X-Gm-Gg: ATEYQzy1bQyde9tbXGJOMVBEsTSFkLIXCwrxcjzT97JLTAUnWOb5oaersg6ZK+fuEls
	vosVXuRrQ7j3drOvz7rqbq8Fz0SGAIquxjv++fC+N1Gxgt/Wf1GDIvvR5lTL0QbqrLnksgBvio9
	g1venFhtDYUHCfFZO9NEBHe7bcFvAC+Sut/PZdcW3KnzKRcsm1ErkARfXQdmJ2x1YPGRkCU8DgG
	neKJetHAsSL1WeUPQVVy4XBwq/QRHNf5/b9Z72EHQw33WTTP6W9+YYELw8ZJqm155/0SOl7Cv0t
	W0fElUNO0w2B9LrUaX54NpBG+2S5vb/bvRt6IGWEnJRkj8VmUAes9zdCqYBVfGsjgQlYycKbnvR
	4b1bhzIocl0vsyn/66OcsmWtabeGxKA/e3ATr0zKrjljVPzYyyRlxfvXFHg==
X-Received: by 2002:a17:90b:4cc3:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-359be24aaf6mr9222739a91.9.1773038416019;
        Sun, 08 Mar 2026 23:40:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc3:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-359be24aaf6mr9222710a91.9.1773038415343;
        Sun, 08 Mar 2026 23:40:15 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c003c526sm9653560a91.3.2026.03.08.23.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:40:14 -0700 (PDT)
From: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
Subject: [meta-multimedia][PATCH] module-protocol-native: Fix socket activation
Date: Mon,  9 Mar 2026 12:09:56 +0530
Message-Id: <20260309063956.1548385-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 43wWSAghcls120UKYgR8fOlHPzCuDTre
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MCBTYWx0ZWRfX3o6TtH5xZ6Im
 Uo/2iSNdQFMAVVoKWUnzGsYPdAgbApIzVh+F0Je9VqCJUNaQEC/6sIDCcWPNJv5gHthXckN8Zmy
 m4BEB5Ko0pMA5YhhvebECNTCoDIqwE6A4S+Zz8EDnr3q50cpdp2f5gtbZoyvCvxOvt+FilXZn3t
 UnMHxatfVlP5N3veXf/hs5edDYsNz4Yjz5sA8t5UmfX0/VB8Q/zlJeUoRwcQF8KalaUpWal9YDj
 gSAVzSVTL56WIs8KucxPsd7j9qfYO7e/CjUFGJIYkhkAh2chhG1JK9EjgkQF4BISwEau2j5Lot6
 qPVb8Fu9lE8uNYsepPxg/vnYAbS45pcj+wAeuAojs5lrKCwJSUU56dCRTxpcn7TNWJ2AbD4a5dg
 UCDlkdjXINzX2LeOjODYYJEm/lIJiK6FFJrunlneO12HYch8N6kdpp+DlRxqqxz6nZeUDy5AK98
 iO0QfSUy/A2nz45S/Yg==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ae6b51 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=3-RhneuVAAAA:8 a=ohPS9fNQRRmcJyZ1AIIA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: 43wWSAghcls120UKYgR8fOlHPzCuDTre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090060
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 06:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124955

From: Sairamreddy Bojja <sbojja@qti.qualcomm.com>

Fix path comparison in is_socket_unix() and don't unset LISTEN_FDS since
the function that uses it is called more than once and it was not unset
when sd_listen_fds() was used.

Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/f4e174870eb8cbe60c922d3bf181f3eb2347523c
Signed-off-by: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 ...rotocol-native-Fix-socket-activation.patch | 86 +++++++++++++++++++
 .../pipewire/pipewire_1.6.0.bb                |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-module-protocol-native-Fix-socket-activation.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-module-protocol-native-Fix-socket-activation.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-module-protocol-native-Fix-socket-activation.patch
new file mode 100644
index 0000000000..c345067932
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-module-protocol-native-Fix-socket-activation.patch
@@ -0,0 +1,86 @@
+From f4e174870eb8cbe60c922d3bf181f3eb2347523c Mon Sep 17 00:00:00 2001
+From: Jonas Holmberg <jonashg@axis.com>
+Date: Mon, 2 Mar 2026 10:28:26 +0100
+Subject: [PATCH] module-protocol-native: Fix socket activation
+
+Fix path comparison in is_socket_unix() and don't unset LISTEN_FDS since
+the function that uses it is called more than once and it was not unset
+when sd_listen_fds() was used.
+
+Fixes #5140
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/f4e174870eb8cbe60c922d3bf181f3eb2347523c]
+---
+ src/modules/module-protocol-native.c       |  2 +-
+ src/modules/module-protocol-pulse/server.c |  2 +-
+ src/modules/network-utils.h                | 14 +++++---------
+ 3 files changed, 7 insertions(+), 11 deletions(-)
+
+diff --git a/src/modules/module-protocol-native.c b/src/modules/module-protocol-native.c
+index 2be92a847..98a43829b 100644
+--- a/src/modules/module-protocol-native.c
++++ b/src/modules/module-protocol-native.c
+@@ -907,7 +907,7 @@ static int add_socket(struct pw_protocol *protocol, struct server *s, struct soc
+ 	bool activated = false;
+ 
+ 	{
+-		int i, n = listen_fd();
++		int i, n = listen_fds();
+ 		for (i = 0; i < n; ++i) {
+ 			if (is_socket_unix(LISTEN_FDS_START + i, SOCK_STREAM,
+ 						s->addr.sun_path) > 0) {
+diff --git a/src/modules/module-protocol-pulse/server.c b/src/modules/module-protocol-pulse/server.c
+index aeab710b0..637757dfd 100644
+--- a/src/modules/module-protocol-pulse/server.c
++++ b/src/modules/module-protocol-pulse/server.c
+@@ -576,7 +576,7 @@ static bool is_stale_socket(int fd, const struct sockaddr_un *addr_un)
+ 
+ static int check_socket_activation(const char *path)
+ {
+-	const int n = listen_fd();
++	const int n = listen_fds();
+ 
+ 	for (int i = 0; i < n; i++) {
+ 		const int fd = LISTEN_FDS_START + i;
+diff --git a/src/modules/network-utils.h b/src/modules/network-utils.h
+index a89b7d3bd..6ff80dd7a 100644
+--- a/src/modules/network-utils.h
++++ b/src/modules/network-utils.h
+@@ -143,7 +143,7 @@ static inline bool pw_net_addr_is_any(struct sockaddr_storage *addr)
+ 
+ /* Returns the number of file descriptors passed for socket activation.
+  * Returns 0 if none, -1 on error. */
+-static inline int listen_fd(void)
++static inline int listen_fds(void)
+ {
+ 	uint32_t n;
+ 	int i, flags;
+@@ -161,8 +161,6 @@ static inline int listen_fd(void)
+ 			return -1;
+ 	}
+ 
+-	unsetenv("LISTEN_FDS");
+-
+ 	return (int)n;
+ }
+ 
+@@ -192,12 +190,10 @@ static inline int is_socket_unix(int fd, int type, const char *path)
+ 		if (addr.sun_family != AF_UNIX)
+ 			return 0;
+ 		size_t length = strlen(path);
+-		if (length > 0) {
+-			if (len < offsetof(struct sockaddr_un, sun_path) + length)
+-				return 0;
+-			if (memcmp(addr.sun_path, path, length) != 0)
+-				return 0;
+-		}
++		if (len < offsetof(struct sockaddr_un, sun_path) + length + 1)
++			return 0;
++		if (memcmp(addr.sun_path, path, length + 1) != 0)
++			return 0;
+ 	}
+ 
+ 	return 1;
+-- 
+2.34.1
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
index dea1a169d0..742720ef60 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.0.bb
@@ -15,6 +15,7 @@ DEPENDS = "dbus ncurses"
 SRCREV = "700cea78dbe7564131d51b21a7795e2567ee048a"
 BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
+SRC_URI += "file://0001-module-protocol-native-Fix-socket-activation.patch"
 
 
 inherit meson pkgconfig systemd gettext useradd
-- 
2.34.1


