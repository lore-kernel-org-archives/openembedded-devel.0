Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 41B2D7CE21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 13:53:40 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id f72so131994wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 06:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SsXtcBG83/357WYpytv/3hDxtYyvy80ndNfWjCsn/Ag=;
	b=ZZDFgyie8Y5XN1okoi5DDdImzeJyDqqhVKbHL31kSNYNIpJW30LMyROA9l6Jq2fFof
	Uv3Pwxqgu6UJdSeBkj8o00SbXQ5gTI0FUa1WQcYq8p9YtWKD93YcXISrQxSRgAkPIvkI
	RXW/cEF9B+uxKJnccrCM+t+Xwd8jKIVBuzOAc7l1h1ClUIejTK6lHhyS/PbOJ/QhrAzV
	rYpMt//mDpJWRHlphSqhA9hD+aMJQmYm9vWrvNBbm3x8ucfU6skQq+zbQcWHv9dkuPc8
	/LaA7pXrLgclCeyshTxjHYsbJP+G3D1CM5dmbLpsuzNkavlRFYXbxQv/K3FS6zdUJ/Md
	ILdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SsXtcBG83/357WYpytv/3hDxtYyvy80ndNfWjCsn/Ag=;
	b=L2c4hiXOxl5dg5+hz9W4MvumjDyNEt6e5zB8Rrvn1J0cQGxue7rXwBPp1uQQznW5Lc
	jVHEj1oKEWotSwlZuo72DTl7Q8njqMBSB9yEJuT/ZJIvZsHI33VP94zT+VrYWYaIblbt
	2iEjXSVRn2PAPpHnNlTxpAMvgoojSwnz4Vta/FSYfTIhbNnW3aJlj6HHeFglmeo+XUl7
	wtzmK8BE5S1oRZOV43uFkBipa+YlUO8Uf/XqvRjnqkfPU0e90uuCyuyEf0MzIy3HDiR1
	ctVcmoavZAEgIS4TfBEiFf0bZgJcfzz9FVkvRIXtZPD50TWUVlkSFAkEHebnlMRWTlnK
	B+NA==
X-Gm-Message-State: APjAAAUVyM0+r+iGwvMAXDkNSoFeb75gHOQuTe9y0q44RHcr0ArXbAuB
	gK+dHCW3OxV/WLRZOhtxBSObn0uD
X-Google-Smtp-Source: APXvYqwWkIQ5/B5hzm1MEi10VbCjeuInhJ8QTvN91iHc7FkM/Jp0aJ5IMKo9/MlXtf2Xxk5QDuPMTw==
X-Received: by 2002:a05:600c:254c:: with SMTP id
	e12mr4887092wma.168.1567000421172; 
	Wed, 28 Aug 2019 06:53:41 -0700 (PDT)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:7c5d:97d6:64f2:9ca6])
	by smtp.gmail.com with ESMTPSA id
	j20sm5783672wre.65.2019.08.28.06.53.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 06:53:40 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2019 15:53:37 +0200
Message-Id: <20190828135337.9493-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] ifmetric: add initial recipe based on Debian packaging and patches
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
X-List-Received-Date: Wed, 28 Aug 2019 13:53:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

---
 .../ifmetric/ifmetric/ifmetric.8_typo.patch   | 15 ++++++++++++
 .../ifmetric.c_netlink-invalid-arg.patch      | 16 +++++++++++++
 .../ifmetric/ifmetric/ifmetric.c_typo.patch   | 24 +++++++++++++++++++
 .../nlrequest.c_packet-too-small_fix.patch    | 16 +++++++++++++
 .../recipes-support/ifmetric/ifmetric_0.3.bb  | 17 +++++++++++++
 5 files changed, 88 insertions(+)
 create mode 100644 meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.8_typo.patch
 create mode 100644 meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_netlink-invalid-arg.patch
 create mode 100644 meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_typo.patch
 create mode 100644 meta-networking/recipes-support/ifmetric/ifmetric/nlrequest.c_packet-too-small_fix.patch
 create mode 100644 meta-networking/recipes-support/ifmetric/ifmetric_0.3.bb

diff --git a/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.8_typo.patch b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.8_typo.patch
new file mode 100644
index 000000000..246910036
--- /dev/null
+++ b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.8_typo.patch
@@ -0,0 +1,15 @@
+Description: Correct typo: s/ommited/omitted/
+Author: Michael Shuler <michael@pbandjelly.org>
+Index: ifmetric/man/ifmetric.8
+===================================================================
+--- ifmetric.orig/man/ifmetric.8
++++ ifmetric/man/ifmetric.8
+@@ -9,7 +9,7 @@ ifmetric is a Linux tool for setting the
+ 
+ ifmetric uses the Linux NETLINK interface to manipulate the routes. Because of that it is compatible with routes created with the new iproute2 utility.
+ .SH OPTIONS
+-You should specify the interface name as first parameter. The second parameter should be the new metric. If ommited the metric 0 (highest) is used.
++You should specify the interface name as first parameter. The second parameter should be the new metric. If omitted the metric 0 (highest) is used.
+ .SH RETURN VALUES
+ \fI0\f1 Success
+ 
diff --git a/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_netlink-invalid-arg.patch b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_netlink-invalid-arg.patch
new file mode 100644
index 000000000..374135d4f
--- /dev/null
+++ b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_netlink-invalid-arg.patch
@@ -0,0 +1,16 @@
+Description: Fix "NETLINK: Error: Invalid argument" for links that are down, in kernel 4.4+
+Author: Jim Paris <jim@jtan.com>
+Bug-Debian: http://bugs.debian.org/864889
+Index: ifmetric/src/nlrequest.c
+===================================================================
+--- a/src/ifmetric.c
++++ b/src/ifmetric.c
+@@ -97,6 +97,8 @@
+     l = NLMSG_PAYLOAD(n, sizeof(struct rtmsg));
+     a = RTM_RTA(r);
+     
++    r->rtm_flags &= ~(RTNH_F_DEAD | RTNH_F_LINKDOWN);
++
+     while(RTA_OK(a, l)) {
+         switch(a->rta_type) {
+             case RTA_PRIORITY:
diff --git a/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_typo.patch b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_typo.patch
new file mode 100644
index 000000000..992f7d2fb
--- /dev/null
+++ b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_typo.patch
@@ -0,0 +1,24 @@
+Description: Correct spelling-error-in-binary s/Recieved/Received/
+Author: Michael Shuler <michael@pbandjelly.org>
+Index: ifmetric/src/ifmetric.c
+===================================================================
+--- ifmetric.orig/src/ifmetric.c	2013-09-04 18:37:59.000000000 -0500
++++ ifmetric/src/ifmetric.c	2013-09-04 19:08:38.539750778 -0500
+@@ -38,7 +38,7 @@
+             case RTA_OIF:
+ 
+                 if (RTA_PAYLOAD(a) != sizeof(int)) {
+-                    fprintf(stderr, "NETLINK: Recieved corrupt RTA_OIF payload.\n");
++                    fprintf(stderr, "NETLINK: Received corrupt RTA_OIF payload.\n");
+                     return -1;
+                 }
+                 
+@@ -102,7 +102,7 @@
+             case RTA_PRIORITY:
+ 
+                 if (RTA_PAYLOAD(a) != sizeof(int)) {
+-                    fprintf(stderr, "NETLINK: Recieved corrupt RTA_PRIORITY payload.\n");
++                    fprintf(stderr, "NETLINK: Received corrupt RTA_PRIORITY payload.\n");
+                     return NULL;
+                 }
+ 
diff --git a/meta-networking/recipes-support/ifmetric/ifmetric/nlrequest.c_packet-too-small_fix.patch b/meta-networking/recipes-support/ifmetric/ifmetric/nlrequest.c_packet-too-small_fix.patch
new file mode 100644
index 000000000..15b310333
--- /dev/null
+++ b/meta-networking/recipes-support/ifmetric/ifmetric/nlrequest.c_packet-too-small_fix.patch
@@ -0,0 +1,16 @@
+Description: Fix "NETLINK: Packet too small or truncated!" error.
+Author: Benedek László <benedekl@gmail.com>
+Bug-Debian: http://bugs.debian.org/514197
+Index: ifmetric/src/nlrequest.c
+===================================================================
+--- ifmetric.orig/src/nlrequest.c	2013-09-05 14:10:42.000000000 -0500
++++ ifmetric/src/nlrequest.c	2013-09-05 14:19:06.573420862 -0500
+@@ -44,7 +44,7 @@
+ 
+     for (;;) {
+         int bytes;
+-        char replybuf[2048];
++        char replybuf[4096];
+         struct nlmsghdr *p = (struct nlmsghdr *) replybuf;
+         
+         if ((bytes = recv(s, &replybuf, sizeof(replybuf), 0)) < 0) {
diff --git a/meta-networking/recipes-support/ifmetric/ifmetric_0.3.bb b/meta-networking/recipes-support/ifmetric/ifmetric_0.3.bb
new file mode 100644
index 000000000..4ee7c42a3
--- /dev/null
+++ b/meta-networking/recipes-support/ifmetric/ifmetric_0.3.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Set routing metrics for a network interface"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://0pointer.de/lennart/projects/ifmetric/ifmetric-${PV}.tar.gz \
+	   file://ifmetric.8_typo.patch \
+	   file://ifmetric.c_netlink-invalid-arg.patch \
+	   file://ifmetric.c_typo.patch \
+	   file://nlrequest.c_packet-too-small_fix.patch"
+SRC_URI[md5sum] = "74aa3f5ee8aca16a87e124ddcc64fa36"
+SRC_URI[sha256sum] = "0fa8510a4e34e555f136f9df81d26618313f2d69a4880c0fb5967f19502f1aec"
+
+inherit autotools
+
+# disable lynx support for now
+EXTRA_OECONF = "--disable-lynx"
-- 
2.17.1


