Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S13hh-0003ey-KM
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 23:33:29 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so1346543eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:25:08 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.95.205 as permitted sender) client-ip=10.14.95.205; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.95.205 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.95.205])
	by 10.14.95.205 with SMTP id p53mr2541124eef.80.1330122308512 (num_hops
	= 1); Fri, 24 Feb 2012 14:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GYF7B+QaVU/j4/PIjMJFvSmCeIzzuIn4RUk7lWX1OxU=;
	b=qqwFl/Uk1EyRTCeh1muvxWGWlgioqNUKhiDH1Q7umRwG7jB4OUNLPcO/mASMAqUGKF
	6xE6UOVJdJaU9FOue3iqrDRj5TEwvRayZtfUfSEWJu27i81Fieog9P4BC++eYPZN8deJ
	V4shE6y7aHYNev643u3Oa8o2ByRjxWeEQDmnk=
Received: by 10.14.95.205 with SMTP id p53mr1879606eef.80.1330122308466;
	Fri, 24 Feb 2012 14:25:08 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm23191258eef.10.2012.02.24.14.25.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 14:25:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 23:24:40 +0100
Message-Id: <99cb835ec9b9125171750e3e7e967ff17166fe4b.1330122206.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <aa725d9f76cd10dbf229311041896507b0806039.1330122206.git.Martin.Jansa@gmail.com>
References: <aa725d9f76cd10dbf229311041896507b0806039.1330122206.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330122206.git.Martin.Jansa@gmail.com>
References: <cover.1330122206.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] task-cli-tools: move ltrace to RRECOMMENDS as it's probably not available for shr4 and sh3 and use allarch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 22:33:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/tasks/task-cli-tools.bb |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-cli-tools.bb b/meta-oe/recipes-core/tasks/task-cli-tools.bb
index c6dc4a7..a849978 100644
--- a/meta-oe/recipes-core/tasks/task-cli-tools.bb
+++ b/meta-oe/recipes-core/tasks/task-cli-tools.bb
@@ -4,17 +4,12 @@ SECTION = "console"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r18"
+PR = "r19"
 
-inherit task
+inherit task allarch
 
 PACKAGES += "${PN}-debug"
 
-def get_ltrace(bb, d):
-    if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'sh4', 'sh3' ] :
-        return ""
-    return "ltrace"
-
 RDEPENDS_${PN} = "\
   dbus-daemon-proxy \
   dosfstools \
@@ -39,7 +34,6 @@ RDEPENDS_${PN}-debug = "\
   devmem2 \
   i2c-tools \
   gdb \
-  ${@get_ltrace(bb, d)} \
   mkdump \
   mioctl \
   procps \
@@ -50,3 +44,7 @@ RDEPENDS_${PN}-debug = "\
   strace \
   tcpdump \
 "
+
+RRECOMMENDS_${PN}-debug = "\
+  ltrace \
+"
-- 
1.7.8.4



