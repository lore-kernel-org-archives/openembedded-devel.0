Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE66C54E49
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 08:37:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6642.1708677438336617171
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 00:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OcOTr6yz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2783f3eaa2=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N78lXC004278
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 00:37:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=uXZmomXfGcWZjL/YMW9IcIz3CO9GHJCY09lTrQJdYHk=; b=
	OcOTr6yztbNg57oyYhDwboZ47fIN913WD4bZMLylEyMsNsJmaBVqvas3U4Ur9kdU
	B4HnCnXHy9MyEATcHyrNLA6VXILR6Ci2yujCmbIAra4/c/yox2CAHahekmvXUMsg
	guplcZNJMHb54U+ZR4vx+vUYDRZyZ6q3wCpVE59diAnTmS38RavrV9VxEMkWYPbZ
	ApwvT8Do91ScbZLPK/u0GM8dPHp2o19Au7BpibCaHt9wtHidsifu1ZCxxkFNYCpr
	zMWkLTyIXOw/XCvy7/Pt3p3TLLHzPvVIqeEE/S0Rovcmz8WOLHdsE4YzwUEUP50M
	DmCyytICbO3jxjaJIigT4w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20cjxn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 00:37:17 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 00:37:15 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 2/4] nodejs: fix CVE-2024-21892
Date: Fri, 23 Feb 2024 08:36:18 +0000
Message-ID: <20240223083620.182565-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240223083620.182565-1-archana.polampalli@windriver.com>
References: <20240223083620.182565-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: WsJ5IdxkeZZ-XdwCJADdm1tYztNJgVUR
X-Proofpoint-ORIG-GUID: WsJ5IdxkeZZ-XdwCJADdm1tYztNJgVUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109005

From: Archana Polampalli <archana.polampalli@windriver.com>

On Linux, Node.js ignores certain environment variables if those may have been
set by an unprivileged user while the process is running with elevated privileges
with the only exception of CAP_NET_BIND_SERVICE. Due to a bug in the
implementation of this exception, Node.js incorrectly applies this exception
even when certain other capabilities have been set. This allows unprivileged
users to inject code that inherits the process's elevated privileges.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2024-21892-0001.patch   | 97 +++++++++++++++++++
 .../nodejs/nodejs/CVE-2024-21892-0002.patch   | 58 +++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |  2 +
 3 files changed, 157 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch
new file mode 100644
index 000000000..0eb988fac
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0001.patch
@@ -0,0 +1,97 @@
+From 3f619407fe1e597657b598383d0b5003a064311b Mon Sep 17 00:00:00 2001
+From: Daniel Bevenius <daniel.bevenius@gmail.com>
+Date: Wed, 17 Mar 2021 13:48:51 +0100
+Subject: [PATCH 2/5] src: allow CAP_NET_BIND_SERVICE in SafeGetenv
+
+This commit updates SafeGetenv to check if the current process has the
+effective capability cap_net_bind_service set, and if so allows
+environment variables to be read.
+
+The motivation for this change is a use-case where Node is run in a
+container, and the is a requirement to be able to listen to ports
+below 1024. This is done by setting the capability of
+cap_net_bind_service. In addition there is a need to set the
+environment variable `NODE_EXTRA_CA_CERTS`. But currently this
+environment variable will not be read when the capability has been set
+on the executable.
+
+PR-URL: https://github.com/nodejs/node/pull/37727
+Reviewed-By: Anna Henningsen <anna@addaleax.net>
+Reviewed-By: Richard Lau <rlau@redhat.com>
+Reviewed-By: James M Snell <jasnell@gmail.com>
+Reviewed-By: Michael Dawson <midawson@redhat.com>
+
+CVE: CVE-2024-21892
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/3f619407fe1e5976]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/node_credentials.cc | 38 +++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 37 insertions(+), 1 deletion(-)
+
+diff --git a/src/node_credentials.cc b/src/node_credentials.cc
+index 4c098c9..7688af8 100644
+--- a/src/node_credentials.cc
++++ b/src/node_credentials.cc
+@@ -12,6 +12,11 @@
+ #include <unistd.h>  // setuid, getuid
+ #endif
+
++#ifdef __linux__
++#include <linux/capability.h>
++#include <sys/syscall.h>
++#endif  // __linux__
++
+ namespace node {
+
+ using v8::Array;
+@@ -33,14 +38,45 @@ bool linux_at_secure = false;
+
+ namespace credentials {
+
+-// Look up environment variable unless running as setuid root.
++#if defined(__linux__)
++// Returns true if the current process only has the passed-in capability.
++bool HasOnly(int capability) {
++  DCHECK(cap_valid(capability));
++
++  struct __user_cap_data_struct cap_data[2];
++  struct __user_cap_header_struct cap_header_data = {
++    _LINUX_CAPABILITY_VERSION_3,
++    getpid()};
++
++
++  if (syscall(SYS_capget, &cap_header_data, &cap_data) != 0) {
++    return false;
++  }
++  if (capability < 32) {
++    return cap_data[0].permitted ==
++        static_cast<unsigned int>(CAP_TO_MASK(capability));
++  }
++  return cap_data[1].permitted ==
++      static_cast<unsigned int>(CAP_TO_MASK(capability));
++}
++#endif
++
++// Look up the environment variable and allow the lookup if the current
++// process only has the capability CAP_NET_BIND_SERVICE set. If the current
++// process does not have any capabilities set and the process is running as
++// setuid root then lookup will not be allowed.
+ bool SafeGetenv(const char* key,
+                 std::string* text,
+                 std::shared_ptr<KVStore> env_vars,
+                 v8::Isolate* isolate) {
+ #if !defined(__CloudABI__) && !defined(_WIN32)
++#if defined(__linux__)
++  if ((!HasOnly(CAP_NET_BIND_SERVICE) && per_process::linux_at_secure) ||
++      getuid() != geteuid() || getgid() != getegid())
++#else
+   if (per_process::linux_at_secure || getuid() != geteuid() ||
+       getgid() != getegid())
++#endif
+     goto fail;
+ #endif
+
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch
new file mode 100644
index 000000000..efb64db7d
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-21892-0002.patch
@@ -0,0 +1,58 @@
+From 10ecf400679e04eddab940721cad3f6c1d603b61 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tobias=20Nie=C3=9Fen?= <tniessen@tnie.de>
+Date: Sat, 4 Nov 2023 00:39:57 +0000
+Subject: [PATCH 3/5] src: fix HasOnly(capability) in node::credentials
+
+SYS_capget with _LINUX_CAPABILITY_VERSION_3 returns the process's
+permitted capabilities as two 32-bit values. To determine if the only
+permitted capability is indeed CAP_NET_BIND_SERVICE, it is necessary to
+check both of those values.
+
+Not doing so creates a vulnerability that potentially allows
+unprivileged users to inject code into a privileged Node.js process
+through environment variables such as NODE_OPTIONS.
+
+PR-URL: https://github.com/nodejs-private/node-private/pull/505
+Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
+
+CVE-ID: CVE-2024-21892
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/10ecf400679e04ed]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/node_credentials.cc | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/node_credentials.cc b/src/node_credentials.cc
+index 7688af8..3dcbc8a 100644
+--- a/src/node_credentials.cc
++++ b/src/node_credentials.cc
+@@ -43,7 +43,7 @@ namespace credentials {
+ bool HasOnly(int capability) {
+   DCHECK(cap_valid(capability));
+
+-  struct __user_cap_data_struct cap_data[2];
++  struct __user_cap_data_struct cap_data[_LINUX_CAPABILITY_U32S_3];
+   struct __user_cap_header_struct cap_header_data = {
+     _LINUX_CAPABILITY_VERSION_3,
+     getpid()};
+@@ -52,12 +52,10 @@ bool HasOnly(int capability) {
+   if (syscall(SYS_capget, &cap_header_data, &cap_data) != 0) {
+     return false;
+   }
+-  if (capability < 32) {
+-    return cap_data[0].permitted ==
+-        static_cast<unsigned int>(CAP_TO_MASK(capability));
+-  }
+-  return cap_data[1].permitted ==
+-      static_cast<unsigned int>(CAP_TO_MASK(capability));
++  static_assert(arraysize(cap_data) == 2);
++  return cap_data[CAP_TO_INDEX(capability)].permitted ==
++             static_cast<unsigned int>(CAP_TO_MASK(capability)) &&
++         cap_data[1 - CAP_TO_INDEX(capability)].permitted == 0;
+ }
+ #endif
+
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index b786c0273..9540ed44e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -28,6 +28,8 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch \
            file://CVE-2022-25883.patch \
            file://CVE-2024-22019.patch \
+           file://CVE-2024-21892-0001.patch \
+           file://CVE-2024-21892-0002.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.40.0


