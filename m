Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 937666EB19
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:27 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so2643567eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=+22krmzs+ShGX4xnZNCSw5BZZJBzEBJy0DhecGxD7/k=;
	b=F5z/tjGEJqSNeJMRvPFzLdA9jn025H3VVUz1tNFskmuHSF8iwWrEezHtQyTyGSMRgk
	xE8EFjGiihm3IUpcetSf4Jdhu42V3Sx8CuzWdWzwq1MdQV6s+8i013h1JmC++9L7F76/
	N5tDDJtenrdDNHnhJg9pNsMNTxT1ZbF/leQb0Fexap/CylotS/+K8zjtLHR4n+sNdwRc
	bBKR4GaZC8TVY99m2GvDpE81faESB+HzmKbY3qmC2vp26OtwFMsdm9Yjv0RKs3BK1Lyv
	KpiANHDr5ElT7Ab5m9IRj88EMjoy34trKj8B7cL4uuw4OysO0J37jc6ocoUj9T26fS06
	z32A==
X-Received: by 10.15.53.133 with SMTP id r5mr224682eew.100.1391240068122;
	Fri, 31 Jan 2014 23:34:28 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm46153504eel.2.2014.01.31.23.34.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:05 +0100
Message-Id: <c570151255c1c92da6d65a6da4a891524a30b360.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/20] emotion-generic-players: add recipe for 1.8.1
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:28 -0000

* be aware that this isn't very helpful yet until we upgrade
  vlc in meta-multimedia
* announcement:
  http://sourceforge.net/mailarchive/message.php?msg_id=31895179

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/emotion-generic-players.inc      | 12 ++++++++++++
 meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb |  8 ++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players.inc
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb

diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players.inc b/meta-efl/recipes-efl/efl/emotion-generic-players.inc
new file mode 100644
index 0000000..5c16802
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Emotion generic players"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
+
+inherit efl
+
+SRCNAME = "emotion_generic_players"
+
+# creates empty packages until you get vlc-2 and enable it here
+PACKAGECONFIG ?= ""
+# needs eina and ecore from efl and vlc-2 (currently we have 1.11)
+PACKAGECONFIG[vlc] = "--with-vlc,--without-vlc,vlc efl"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb
new file mode 100644
index 0000000..9fc50a7
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.8.1.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "895d8057fb5cdcadd9ed1f710a460b4e"
+SRC_URI[sha256sum] = "d3221726df583b3d5d43192e4909c08ac4dbf7ff35b81568ac339d7dbaf84d36"
-- 
1.8.5.3


