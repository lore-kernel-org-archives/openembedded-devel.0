Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9321D71A7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:11 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 68so13535116wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0vG5BgTkUeS5/qJD+Z0QV9FLU8NOvFH9wVFq0awcxiM=;
	b=rpQBSYFw6XS7l1CFTBn7DYyGNIjIYRAte/UunXF/pDq+ZmFmDL4E9J53pAXm9XGzgg
	XR/2U6GPaOK8lNIEwVT8/WsYX3eaAfLzGfQlv+APDSrtDFpa0Ot72CUemkTA+JzhS2dW
	DZxKOObGo5YXnh5/u8tA+b4jCn+t5vqAl/gRxo7YIAucRXZAN3WEOB9Ml6HkI3w+Y2N9
	fqyDdh8mp0hk1eJJomMyL3Txw4g3bQ+EKPh9hnxmi0COk8LOWTkm9EOpq8d8nGFsPTH6
	utsdYYVBrwi0VNxPEzaPnqOj1m9s7NX4iE14EYJDaJH+oSo0kVHfTUuGMSE3lL7TmVTr
	PAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0vG5BgTkUeS5/qJD+Z0QV9FLU8NOvFH9wVFq0awcxiM=;
	b=keCwBN6CgBffXVjy93BSTboN1rN5JJzxjkuS0Pno4+vJsPMjsmWzzS/FY7tx64fXX9
	GeHq4D0ZFnoUGz85Gmerb7ijEKw6rIC5wd8MjF4XkkOKQiqHGBnNwm0nA8srwGZACZTN
	WyLdCdXCVOMBYmC+lhMpcup4NYDnfsaTe9LcWLb4BnhwfO5+xJd+ST2epEEwUhlU+opm
	zRJIM69JArnEDfgaE9/6FsCo5l3b4P4h1P9wCZT93YmjiuXokQTdVQ+DmU7qp90wm9vh
	iTKidHT/8jUWMqQNNicK3hvbQ7aFCqwRliH1XQy8lDLtP0ohnj/Z1bBhYyxnPPX4+rvX
	YYkA==
X-Gm-Message-State: ABUngvfMBZsubfP4MDoA3dxM0k2KaciK/neq+WAopseFVkX4X7Gy+1NeXntJN5YLE83V5w==
X-Received: by 10.28.109.87 with SMTP id i84mr11864503wmc.100.1477951872505;
	Mon, 31 Oct 2016 15:11:12 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:45 +0100
Message-Id: <1477951849-32149-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/13] xfce4-notifyd: update to 0.3.3
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-notifyd/{xfce4-notifyd_0.3.2.bb => xfce4-notifyd_0.3.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.3.2.bb => xfce4-notifyd_0.3.3.bb} (78%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.3.bb
similarity index 78%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.2.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.3.bb
index 2894af4..a50cea5 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.3.bb
@@ -6,8 +6,8 @@ DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib libnotify"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "9ee9bd823710c8753cb99f5a8028d528"
-SRC_URI[sha256sum] = "c554db55d9d759c32115e9e5da029bd68b07628438ef2bac7ae4b458567c85a4"
+SRC_URI[md5sum] = "f918bd3f9f9ad85eace408aecf541198"
+SRC_URI[sha256sum] = "986c4cfeb64c21c6bfb2fe65839490ad0f501fdfc8ed10cc71815da5da110f73"
 
 do_compile_prepend() {
     mkdir -p xfce4-notifyd
-- 
2.5.5


