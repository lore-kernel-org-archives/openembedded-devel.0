Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 060B671144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 10:13:56 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id b16so11608986igk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 02:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=FhiwBAQM42MuL+PzHLMqvXFy8V8yFBkDey59rfmbvN8=;
	b=vxpoNHwzAkg1hk054vPebdcpBWuN3N4zD+WYm/hb+8OEKNLoQGNpRwQFopDEV6eOY/
	knLPDEeY2AEXf2u7SUu92/Tu+uFx2ztieaksWMF/3eJgTIkpHyK7ALeB+2icPKOziAoc
	aJNnz7PH5cjg2wWhAtJeLPr0nk24KPAZtHO7f5rNk3HY8YGffDjN7t3k+xd9IGWNh16m
	7cz0OymZOTP1Dq4D8vRaNQijvXECVtfZSxwfeJ/iGx/KTVnLiATk32h1RTVPQthO3sak
	hvVbvZUxAY8QRfkSuAgbNodjJtKOVyBGjw40gyxui8etN8bY03/+OIpfzoB1MNW0MOyA
	JnTA==
X-Received: by 10.107.135.34 with SMTP id j34mr9113774iod.84.1421316836851;
	Thu, 15 Jan 2015 02:13:56 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id
	c12sm3109008ign.13.2015.01.15.02.13.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Jan 2015 02:13:56 -0800 (PST)
Sender: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jan 2015 13:13:46 +0300
Message-Id: <1421316826-10404-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-networking][PATCH] vlan: don't try to include files from ${HOME}/linux/include
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Jan 2015 10:13:59 -0000

vlan sources explicitly adds ~/linux/include to compiler include path.
If that directory does exist, this leads to various issues. Drop this
explicit exclude path.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 .../vlan/vlan-1.9/no-HOME-includes.patch           | 22 ++++++++++++++++++++++
 .../recipes-connectivity/vlan/vlan_1.9.bb          |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/vlan/vlan-1.9/no-HOME-includes.patch

diff --git a/meta-networking/recipes-connectivity/vlan/vlan-1.9/no-HOME-includes.patch b/meta-networking/recipes-connectivity/vlan/vlan-1.9/no-HOME-includes.patch
new file mode 100644
index 0000000..b7ab7d9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vlan/vlan-1.9/no-HOME-includes.patch
@@ -0,0 +1,22 @@
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Subject: vlan: do not include ${HOME}/linux/include dir
+
+~/linux/include dir may exist and so will be added to include path
+in front of sanitized kernel headers in OE chroot. Drop this include
+option.
+
+Upstream-Status: not-applicable
+
+Index: vlan/MakeInclude
+===================================================================
+--- vlan.orig/MakeInclude
++++ vlan/MakeInclude
+@@ -16,7 +16,7 @@ ifeq "${PLATFORM}" ""
+ endif
+ 
+ ## You may need to change this linux/include part.
+-CCFLAGS = -g -D_GNU_SOURCE -Wall -I${HOME}/linux/include
++CCFLAGS = -g -D_GNU_SOURCE -Wall
+ LDLIBS = # -lm #-lnsl # -lsocket
+ 
+ ARM_TC_BIN = ${HOME}/Intrinsyc/bin
diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
index 2c4f157..d980a47 100644
--- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
@@ -2,7 +2,8 @@ SUMMARY = "VLAN provides vconfig utility"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://vconfig.c;md5=293ef69c4e88434d37a5ee577a5288cb"
 
-SRC_URI = "http://${BPN}.sourcearchive.com/downloads/${PV}-3ubuntu9/${BPN}_${PV}.orig.tar.gz"
+SRC_URI = "http://${BPN}.sourcearchive.com/downloads/${PV}-3ubuntu9/${BPN}_${PV}.orig.tar.gz \
+           file://no-HOME-includes.patch"
 
 SRC_URI[md5sum] = "5f0c6060b33956fb16e11a15467dd394"
 SRC_URI[sha256sum] = "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb4868842b4cca"
-- 
2.1.4


