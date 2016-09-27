Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id F23926078E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:55:53 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id s29so694524lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5eM541oISxDXprs64rF5Iw09MVzfo2MD72HfP1QMDY8=;
	b=IHDQ5ZofrV5fXSd+zc7vl8UcLYxKyRog4rs7tDDTSpSNVHSDpRCrTUeyfYw4sJBclA
	z1vclyVdt94GSGJ8vOOyNn1Sgbw9dbDy/KFKvtRmpjPYDuNigU2A9Q7d7imMo+d5YAZn
	Dcb62ateAWu+KByvjqEL5zwai28y44JSRy8VN63Unmz2wgcU4g6P1pEKiBWzyqUJmSRy
	DjtpgEpGzp7JhSdyg6apr1K+bs0/lpjiXoQcIYPsKeg+G3NNvTTSJdE3X4w/+kJJyTpR
	yp+dh9XOXBmxiCI7UW7MBGVMpi7ga/49kEarnxaap+kWXvcQZOFBIobfRKcdD0OH30+d
	pwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5eM541oISxDXprs64rF5Iw09MVzfo2MD72HfP1QMDY8=;
	b=M9d01Z1xLtq5SiQ4kG3OPAa3b9YUJmSAl4AEPzk7gjww+vZr3J1LemSXtEJ2EgRatC
	z0o/PJVGC+Bcxn4u/pSuoy9JCGyxZ29FoVK01v9CE9AqhoRnkB9t4SOBZYJB5+s25sOp
	pLzbwjpieCRRVC+pRPgcFeA12qLvi7ZIl9FFR/O+PcUQrkq7tXnQykXuY8y55rh+Khbz
	7tLsSn6oJOhJHQm+odUOrbgkBpw9INWtPND/BJJlH/2lRdXycZZvzA5F3zu6UqweVnT0
	tAZoADaN5AGd7FL+Sc4cvaoEptEwQpUM9aOEbJDY0ZXfCrAWf6U8g9HOJJjqjEFgpu30
	0R/g==
X-Gm-Message-State: AA6/9RmcDxYb7y+27uVhrg1+r8fVdFH9rm53WuAZkAOOHFYR1FWdBBJIfMzgsdNS73sDZw==
X-Received: by 10.28.133.12 with SMTP id h12mr1260722wmd.74.1474955754806;
	Mon, 26 Sep 2016 22:55:54 -0700 (PDT)
Received: from localhost.localdomain (p4FDF068E.dip0.t-ipconnect.de.
	[79.223.6.142]) by smtp.googlemail.com with ESMTPSA id
	f15sm1156668wmf.8.2016.09.26.22.55.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 22:55:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 07:55:30 +0200
Message-Id: <1474955733-30185-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] xfce4-notifyd: update to 0.3.2
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
X-List-Received-Date: Tue, 27 Sep 2016 05:55:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-notifyd/{xfce4-notifyd_0.2.4.bb => xfce4-notifyd_0.3.2.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.2.4.bb => xfce4-notifyd_0.3.2.bb} (73%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.2.bb
similarity index 73%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.2.bb
index 6d170b6..2894af4 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.2.bb
@@ -6,14 +6,15 @@ DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib libnotify"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "094be6f29206aac8299f27084e284e88"
-SRC_URI[sha256sum] = "8c7ed62f9496816d1391281f77d1b32216f9bf6fd22fbe4f6f3f4e07a6bbced0"
+SRC_URI[md5sum] = "9ee9bd823710c8753cb99f5a8028d528"
+SRC_URI[sha256sum] = "c554db55d9d759c32115e9e5da029bd68b07628438ef2bac7ae4b458567c85a4"
 
 do_compile_prepend() {
     mkdir -p xfce4-notifyd
 }
 
 FILES_${PN} += " \
+    ${systemd_user_unitdir} \
     ${libdir}/xfce4/notifyd \
     ${datadir}/themes \
     ${datadir}/dbus-1 \
-- 
2.5.5


