Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7836AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:32 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so57873396wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=4OTYAKmcEebNV/XsLW3uUdhzIN/lZVo4dogskR29QWo=;
	b=f1ex8VJkRJtHDrxCxLzXyXC2UP9DYkWNhKZLWo4JdBOyxWRbi2zmejU0pDwjZ0vmzZ
	Frm/uzfW8N4BgYvC/d1kEjrHX42tWWU7jh2+bcHUAXi17UswmkX5zhTFh4WrMx9Qybou
	11rg/3inP9t8U0h2Ihrsl3ayCmVVkv7GJFgw5m+gwFkYGWTr9wDmrmB/9i45mrChexs5
	uG17/zJSCiYUg5ABg/suqT/dwNYUohuWzZdPAIqoryYUA983Y2c15kjUprrSi6Y+K6RV
	8brSXRMcrD5xOIp+Mlo1q8DusqDQJOKSbpf1xEmMLbG9cDK4EccvLpdZrKEVf3N4v9ib
	0syQ==
X-Received: by 10.194.209.168 with SMTP id mn8mr40783598wjc.49.1432588473644; 
	Mon, 25 May 2015 14:14:33 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:14:02 +0200
Message-Id: <1432588449-31413-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/12] thunar: update to 1.6.10
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
X-List-Received-Date: Mon, 25 May 2015 21:14:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.8.bb => thunar_1.6.10.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.8.bb => thunar_1.6.10.bb} (85%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.8.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.6.8.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb
index ed51cdb..8393007 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.8.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb
@@ -4,11 +4,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui xfconf libsm dbus-glib startup-notification libnotify xfce4-panel udev"
 
-inherit xfce gtk-doc
+inherit xfce
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "d7c6ae92f180c1d8d5b4c3f368142252"
-SRC_URI[sha256sum] = "4079ccffe990cdccee48a0ae200d8a5bc9335c34721d7923b375795940cf79bb"
+SRC_URI[md5sum] = "3089e1dca6e408641b07cd9c759dea5e"
+SRC_URI[sha256sum] = "7e9d24067268900e5e44d3325e60a1a2b2f8f556ec238ec12574fbea15fdee8a"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
1.9.3


