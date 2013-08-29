Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 464416BE8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:10 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so343252eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=d8BzSAiU1E0tDoIjV+RaEXtdhmcImeY1mV87PziRsE4=;
	b=zxWMgfR5eDRKv/im120HILevrcOwSyuw5ZLkvixn4Whbs7sY8XtBC8X33t8upBVngW
	Ww4p7vcGchpBDgWxXGOMvQtxhAqp5j3n4QoiJcEfmK5yuWNK2TENjpjGZw8z7LT5wNPv
	IIv1cNmQOPtuh5uFLdwgJOf1PZpJgQGUupVQbomvj5zacGu5fRlF4pd7FsjITSo5zsFn
	JMPkMbXHTHBHjg/TkVrejjsFl8SDJU+/0lwl1YgHVTHGV2y1AyA5PvS7mc5ztUg3v60g
	KbFLyF3Ssepo+i061OYJV3Pt6WGboKay/TtctG6gTdA6I+9YVjWrX71MQVO/2fTi/VxG
	GnZQ==
X-Received: by 10.14.183.2 with SMTP id p2mr5376481eem.44.1377791530546;
	Thu, 29 Aug 2013 08:52:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm47164539eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:54 +0200
Message-Id: <0cd27d123d656285571b32796b9beeee0fe611ff.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 61/66] xfce4-settings: Add PACKAGECONFIG for notify
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb
index d633fa6..4aac5a3 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb
@@ -20,6 +20,9 @@ SRC_URI += "file://0001-xsettings.xml-remove-trouble-causing-comment.patch \
 SRC_URI[md5sum] = "3bf42281b64b10b2691008cd693f7dbd"
 SRC_URI[sha256sum] = "4a4f1e79a58b524f3a6dd030b6fc687671b35566f847e6f516c6f84211191698"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
+
 FILES_${PN} += "${libdir}/xfce4"
 
 do_install_prepend() {
-- 
1.8.3.2


