Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF326FAEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:37 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id b13so7844040wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6Drquy8d3Ry39cihHjRSb/lqkLjFO21w9pxpeO1vBlY=;
	b=b80lAZrHYvGyJ0aB/82P9SfQlZSlWKhPUHowsZp+NiE2o+/O+C8kIV0OC/zDIZGsI7
	pnOji4+N2PK96wr4Gw2WnC3MSnMLSw7TPxnUdzemzRCr8IOYjgwwxn2MhTD36ZoO/I//
	S0ko9miDZ6fyaK/XJXwzE4H0Pc5Rfj8pSk0BLDWtg/lXQscuZ2N24Px/ttya20+W9qjZ
	hpynsQ+H7JB93Gn2/QD0EV3aKs1y7Z+7R0xgx54u7iqheI94+cklQ/UlhkDFmso362eY
	aApPV24e01Ior6+5cvrRs6vhZPK3AV9wQixSPM+UyKR2eiwVUleoOz21Dp+UcInbzBq3
	KbVg==
X-Received: by 10.194.92.7 with SMTP id ci7mr20273538wjb.7.1396372538368;
	Tue, 01 Apr 2014 10:15:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm41872789eeg.11.2014.04.01.10.15.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:52 +0200
Message-Id: <1396372434-10710-44-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 44/46] tracker: remove --disable-introspection
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:38 -0000

* fixes QA warning:
  tracker-0.14.2: tracker: configure was passed unrecognised options: --disable-introspection

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/tracker/tracker_0.14.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
index 7c989c6..eea8edc 100644
--- a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/tracker/${VER_DIR}/tracker-${P
 SYSTEMD_SERVICE_${PN} = " tracker-store.service tracker-miner-fs.service tracker-dbus.service "
 SYSTEMD_AUTO_ENABLE = "disable"
 
-EXTRA_OECONF += " tracker_cv_have_ioprio=yes --disable-introspection"
+EXTRA_OECONF += " tracker_cv_have_ioprio=yes"
 
 # Disable the desktop-centric miners
 EXTRA_OECONF += "--disable-miner-thunderbird --disable-miner-firefox \
-- 
1.9.1


