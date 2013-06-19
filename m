Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9646AD59
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:51 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so3360679eaj.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=FC9myRu1BsK8QQQ/P8o0wUx9f4jSJ0Zyj1esioFfzl0=;
	b=fhohKWSdmLPqgEuUzUhW1MN61ZXE1rEaUq+G0uAvrgfvXMZxxTp6+xFEUr8mDRB779
	8jpd98PnJR/Pu/uzi3HdojKBKAhYoTiYeuSjHBVjHlWtZcpgek4h0QV7UN2EadJsMrsS
	JXLyeyzLt38yGxy2VGQQmWQOiEmSwVf0+u2CpEhOeK5hzz6gGLlxAPVZ9d9yfzF5Yx5s
	kq10hVvRNt5RKD1U8ADa9ahLtSE1+u5n7AzaCT6ZboyoW0HKgYmZDAQOCZLwyUe74r3h
	orMtp1y3A3YZ93HMxDlrS2j1GLIF/1ue3z8oltlf7h0WHoJhPT+RCd+QuGZkmeOsTSEY
	6anA==
X-Received: by 10.14.176.199 with SMTP id b47mr3590034eem.117.1371662992105;
	Wed, 19 Jun 2013 10:29:52 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:15 +0200
Message-Id: <1371662967-31734-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 08/20] gcr: initial add 3.8.2
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb

diff --git a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
new file mode 100644
index 0000000..65309da
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A library for bits of crypto UI and parsing etc"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+DEPENDS = "gtk+3 p11-kit"
+
+inherit autotools gnome gtk-doc
+
+GNOME_COMPRESS_TYPE="xz"
+
+SRC_URI[archive.md5sum] = "f5e66afcab19897a0de0590735329fb1"
+SRC_URI[archive.sha256sum] = "a1e615ce2cfd375f383bbdd289935a8e3e16901c3c6f032780847055e8bec2c1"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/gcr-3 \
+"
-- 
1.7.4.4


