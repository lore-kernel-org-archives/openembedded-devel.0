Return-Path: <mohammad.rafi.shaik@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B483EF3718
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 08:54:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9665.1773046455134161878
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 01:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QGunXrWZ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Rjw0WvAo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298R4Zv2660360
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Mar 2026 08:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RfrceNpMocFTAJ9kk70e3gwe5glaXXnAKOV
	VN4aG4N4=; b=QGunXrWZdTHGgUNkBBI0hrIByOGQ66tYv0ZsKYd0PG3xyO9eLF8
	bGzT6srorwGVEp6kJJuX9dDuwPZMp0YBQLj/xDeEqX3ECjAJXdVMo6CaVA3VyMTD
	Q3/omCg64Oy/UFCcOg0c1yTNceiNfSQpUiXHLc2V3y3bcycx9ruEBlUkaM7ONQu3
	QTA4SNvxHGufWOMXZADOGpHeyWbLN66blMNVH9KYcvJEiXtddXU9gyHjbQWMRQI5
	CzfpdHbm11mO05id4rSxmlZcD1qz7+8LuezLbzd5dBdcYI2K78LTvEPHgAXv6fBZ
	GsqRLsM0RyD+o88rLOXx0QPnJgaYTKOwpow==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpmwtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 08:54:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829b8bb5211so6049181b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 01:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773046453; x=1773651253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RfrceNpMocFTAJ9kk70e3gwe5glaXXnAKOVVN4aG4N4=;
        b=Rjw0WvAo+hznB+UL/slN8QcbdDZQgSiDBBDgRxKyiy/uBpfIuroUk19tM7sdwzGcv0
         BstrcasvU7ORh/AsbMUh1CkUVrgDirqJto2F1XtNHdeW4lt3+Y50+anmMhyjMim5wEXc
         7+A6SdQWchknd6Pc35DAiC86PaywdCFAqo2bbehX3S6vxCC4PrnAe7aCBDHEvNkQpluq
         8putDxajMnIGoRbje2stEtUWEVNE4CEgrEr7dcfDdbKyEw6kxDC68fESBrMkqC8EHT+E
         1mPFNQ7T5D22IDvsj+p6K63ahlFamIIPmRTbHifcjMmnPV7HsMPL3/4a+1iseJlPn0FR
         B5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773046453; x=1773651253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfrceNpMocFTAJ9kk70e3gwe5glaXXnAKOVVN4aG4N4=;
        b=Ng5CcfDFSp+hCsur7kxICuaBNKAV/lh/5Ky1aN/Eoa1kiGr0MplejjJ/Tkf2j1uMIw
         x/xUoNwO57oE6X0x1xvZxR6Fi/xb9FuqJE541lUbvoHS87Ia7ak73UL+X3LwNeLWxbpo
         anxWqDiOF8o9Egy6vn5UFy7SVD+h8Ftash28uek+7q97h8W5QdDWL/+5ZJKoaxtfAV+s
         6Uh+mjnZVlquXk17EAVkxBlyYxaSzJhJq+tR5LQSkGFq9ImM8T/bCbaq8CIWNxTrWN/4
         R9ie00IGOQBcGQi+euAuLcOmW/IFMvaW7Br7WjXC7L2EBkNDgnGcgwTKwHybG610PWxs
         z5IA==
X-Gm-Message-State: AOJu0YxZkc7jUBuaV5bRELJIU5ou9KI7IEcrRyDNjho8f3DTyZNwK6Om
	ujz3SmcT7Jtn8NaXRz2qx9+6M4V4Xx1xZultR6r5eeX85ANDmJyo2he960TOSfdIxkZLLzH3uw7
	/e6gjPcZVFl/A1/a5F7kpgant5vbYskJc+CaZI+1niO22kIWh3MaPIPKAmMFfa1Snpj/Dfn7Ms6
	NTLnkdx5ahhMLc9MDe
X-Gm-Gg: ATEYQzzx8gR63d5m0XANaI8MHp3a80uJJWr4iASd+9OttRlRtHFEmcvbNI96F9L5u2M
	nSp7RANzCLQEwDs2E9vWoi37Vt9BxdOLnoFUgkvw1SgY1yF6VlO8o5zx/qK6XMcGHs/28vfvTm1
	cCTGKM9/csk9OLbigeL6D0qe64RzBJWPZLRBzTk1R34baSDvHSPzJr5zrcKHFWacvAidrmLvQwc
	IotRhkeKHG327GCaiwQakjiq56zG1/9eyPdm3YHe09GHXd4FoZl7FqkLgLdYGueV/XqyaJNOcdM
	3v8GycrLQRrXEkeProsGmftiw4RrUnf0gcSJSYbwhxj9yWUyqlg/e3uvnf7SxQHi7OUZYFPrEve
	TdalHzNg9BWQLadltxSNg0Pjp1LpdF2sMKalhD+XAT/H1EH/GDynJXDhHrg==
X-Received: by 2002:a05:6a00:f0e:b0:824:9848:b020 with SMTP id d2e1a72fcca58-829a2f705c9mr9785991b3a.52.1773046452676;
        Mon, 09 Mar 2026 01:54:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:f0e:b0:824:9848:b020 with SMTP id d2e1a72fcca58-829a2f705c9mr9785986b3a.52.1773046452066;
        Mon, 09 Mar 2026 01:54:12 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d3621sm10544596b3a.62.2026.03.09.01.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:54:11 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
Subject: [oe] [meta-multimedia] [PATCH v2] pipewire: Fix socket activation
Date: Mon,  9 Mar 2026 14:23:56 +0530
Message-Id: <20260309085356.1879708-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4MSBTYWx0ZWRfX9/iXxsRDewKs
 tswmlvoaCONVbH5Wqey0Bwq+F/DfTzxFaZ1OCuORUMpYzwIeKi0jZOjInQROgR0FxAZmEgbRlZX
 SZVDBoViC8lSv+BqbUMhPjvk4Bbjzc5SnQG6UfHXRuzMTP1leuP51sF5qU9jsYYNloUX3xt49JQ
 4dF3+YnYfAk6cNZhzhmmV3zsVEOGz++uEJX5PDycjW8y+W2KwaHExhxQs/yCkFEP3+5sGXaxPZj
 aWq4tD2rEfojJq0LrppndSlHPG6ZGkT1selRIV2JATxDLIfbCnyTwChYAWg17hFzLz+EXAgEGIT
 FkpmaiksXT0rxJazI1DPYDqNBU4TXB7vmV+kBxYz9ZG9DbpM32Nqpbu3rDpBNyoA3oTMcR9slkV
 tYpMa6hPjUFUSC7ItqdIjsy94/WI08ruLcvO5whS12hXxEfR2DTEw2ozi1lG62N/UXg9x5Uf26a
 rgPe+O/37cfaFQlfw1w==
X-Proofpoint-ORIG-GUID: e1uYHswkkGxsnfka22TrhRJ7s7932rz3
X-Proofpoint-GUID: e1uYHswkkGxsnfka22TrhRJ7s7932rz3
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae8ab6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3-RhneuVAAAA:8 a=dxQlcdCiTPPr8yDUY0MA:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=Vxmtnl_E_bksehYqCbjh:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 08:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124961

From: Sairamreddy Bojja <sbojja@qti.qualcomm.com>

Backport an upstream PipeWire fix into meta-multimedia to correct
UNIX socket path comparison in is_socket_unix() and to preserve
LISTEN_FDS when using sd_listen_fds().

The previous behavior could mis-detect valid systemd-activated sockets
and break subsequent invocations because LISTEN_FDS was unset, even
though the code path can be executed more than once.

Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/f4e174870eb8cbe60c922d3bf181f3eb2347523c
Signed-off-by: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
changes in [v2]:
	- Updated commit message.
	- Link: https://lore.kernel.org/all/20260309063956.1548385-1-mohammad.rafi.shaik@oss.qualcomm.com/
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


