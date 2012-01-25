Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rq0dN-00030B-So
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 12:03:21 +0100
Received: by bkaq10 with SMTP id q10so4059895bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 02:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=x6bfiFzk4JzBqSh4PsWwc1S7E2CU9eHWY+dDx3CYLlY=;
	b=aT1APIfGpC0gm743+mSykqxjoQIspXnAn6MoxzJPCQuJjms6nUKi+fBPwFwZKmZJRW
	gb/EW6Jwh6imJiVwb4s5LV4KDMKezZBL5fqjN2L/xdF8MLnw18HacWPmjKOVv3ZGG/5Q
	7J2GFZPjtLjo7KoZUehky6mdeqaB+WSE3oZxQ=
Received: by 10.204.151.77 with SMTP id b13mr6829719bkw.57.1327488935657;
	Wed, 25 Jan 2012 02:55:35 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id iu2sm216116bkb.0.2012.01.25.02.55.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:55:35 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Rq0Vq-0007KG-8E; Wed, 25 Jan 2012 13:55:34 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 13:55:26 +0300
Message-Id: <1327488928-28127-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
Subject: [PATCH 03/10] Add libnfnetlink 1.0.0 package
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
X-List-Received-Date: Wed, 25 Jan 2012 11:03:21 -0000

Add libnfnetlink 1.0.0 package from the OE-classic.

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 meta/recipes-support/libnfnetlink/libnfnetlink.inc |   16 ++++++++++++++++
 .../libnfnetlink/libnfnetlink_1.0.0.bb             |    6 ++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/libnfnetlink/libnfnetlink.inc
 create mode 100644 meta/recipes-support/libnfnetlink/libnfnetlink_1.0.0.bb

diff --git a/meta/recipes-support/libnfnetlink/libnfnetlink.inc b/meta/recipes-support/libnfnetlink/libnfnetlink.inc
new file mode 100644
index 0000000..0f7ea91
--- /dev/null
+++ b/meta/recipes-support/libnfnetlink/libnfnetlink.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "libnfnetlink is the low-level library for netfilter related \
+kernel/userspace communication. It provides a generic messaging \
+infrastructure for in-kernel netfilter subsystems (such as nfnetlink_log, \
+nfnetlink_queue, nfnetlink_conntrack) and their respective users and/or \
+management tools in userspace."
+
+SECTION = "devel/libs"
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://README;md5=287b7901363dda6ef7176fadee6972ed"
+HOMEPAGE = "http://www.netfilter.org/projects/libnfnetlink/index.html"
+INC_PR = "r0"
+
+SRC_URI = "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=libnfnetlink-${PV}"
+
+inherit autotools pkgconfig
+
diff --git a/meta/recipes-support/libnfnetlink/libnfnetlink_1.0.0.bb b/meta/recipes-support/libnfnetlink/libnfnetlink_1.0.0.bb
new file mode 100644
index 0000000..ef6551e
--- /dev/null
+++ b/meta/recipes-support/libnfnetlink/libnfnetlink_1.0.0.bb
@@ -0,0 +1,6 @@
+include libnfnetlink.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[libnfnetlink-1.0.0.md5sum] = "016fdec8389242615024c529acc1adb8"
+SRC_URI[libnfnetlink-1.0.0.sha256sum] = "3752b03a4c09821ee9a2528d69289423a01e7171f1a22dfdd11d5459e03972fb"
-- 
1.7.6.4



