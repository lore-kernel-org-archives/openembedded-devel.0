Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5C86E6BE6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:02 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so341046eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=haWzvHg0Ho432WbSOWSgYYzwJNhMfdk4LhGgX93DqeY=;
	b=df6kzWcQeDbG9kzpFB7G/0s2hLG9s6bpVjho4eU087JTknH3whTtoRj+dNgXRSY1zO
	f1jLpI5O2jeZObIPbWLEzOYUMp1ihQx5vtFT8Dzyaq+2DnUruKCpl4Jk+1V++DZ+C8mT
	cvHvzMDxAA5wo9hWK0npOy+8tgIuvSpUQVRdsKxF7Tf5xBf0UoyVnQLPQDtU7e7A1MgZ
	2TLsRZohOwVp3r8lwcm4HTd6EbtUjXW87LTwi3XuemYsxFyYkxNXVeLRQtAXIfKIjLq3
	+j4kn1gakjnQ8RQvmzSiZZFrUG1xuQolFsYxouxyeEM32BZzZl9rA7dFsZxMueZomr1l
	4GfQ==
X-Received: by 10.14.9.72 with SMTP id 48mr5289411ees.42.1377791522835;
	Thu, 29 Aug 2013 08:52:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm47241928eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:48 +0200
Message-Id: <1ddcffa07d921bfc9fa49aa5b49afe98bafcdb45.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 55/66] orage: Add PACKAGECONFIG for notify and dependency on popt
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-apps/orage/orage_4.8.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/orage/orage_4.8.4.bb b/meta-xfce/recipes-apps/orage/orage_4.8.4.bb
index 9905987..69211cc 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.8.4.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.8.4.bb
@@ -2,13 +2,16 @@ DESCRIPTION = "Xfce Calender"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-DEPENDS = "gtk+ xfce4-panel libical"
+DEPENDS = "gtk+ xfce4-panel libical popt"
 
 inherit xfce-app
 
 SRC_URI[md5sum] = "d5105981a9d77ed22be42615d70f3cc0"
 SRC_URI[sha256sum] = "b19df727da9da48b979e238ac7113c803976de80bd1e2dadf6d84b864956dfd5"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
+
 PACKAGES =+ "xfce4-orageclock-plugin"
 FILES_${PN} += "${datadir}/dbus-1"
 FILES_${PN}-dbg += "${libdir}/orage/xfce4/panel-plugins/.debug"
-- 
1.8.3.2


