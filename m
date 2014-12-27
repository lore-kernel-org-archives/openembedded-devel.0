Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id C1267713B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:40 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id w10so14560309pde.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ffzVLzs7e09XMA+LHAQYinCNLZGt5ehLrJK0enPBmtA=;
	b=BXLOAqgJ4JkYYJSd7QkirGGBFEnO0gLO5mq3e2i/NiqiGpadFG5xjlAoHfLi6YNb0i
	WRUe7wOVMY/BXSle3lQcE5vsfLXKoxpdUYCIEsIB1EJEkn/PnccrV5UQZUNdjJUkxHKi
	28RlVLzXVdGuv+Uq8z5w7ydWM5RHFrVZIMYTUDjG89LXmxN5BYoPSQs9xFmXEQsNIZpD
	nnXeO3GN2gUjRRCTGg+p+Wqi2CPEMTz0rQX5DVdhhZahf6uwb+u52gUx29JWtwIA4+7H
	aWG3GTaLk3yl4K/lEO8WONkl5WrGVSkkamwZ66EACIyA8YwWwRJgGQ/0l8uuxAjeqVTG
	wXhA==
X-Received: by 10.66.163.196 with SMTP id yk4mr75097916pab.57.1419700961782;
	Sat, 27 Dec 2014 09:22:41 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:02 -0800
Message-Id: <7c58d49071052b1acb6128024029d0279cade876.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 15/27] libcanberra: fix installed-vs-shipped warning
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:40 -0000

From: Robert Yang <liezhi.yang@windriver.com>

When build libcanberra for powerpc64 bsp, it shows warning:

WARNING: QA Issue: libcanberra: Files/directories were installed but not shipped
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/canberra-system-shutdown.service
  /lib/systemd/system/canberra-system-shutdown-reboot.service
  /lib/systemd/system/canberra-system-bootup.service [installed-vs-shipped]

Update FILES_${PN}-systemd to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
index cb171ac..0f00b20 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
@@ -59,4 +59,4 @@ FILES_${PN}-gtk3 = "${libdir}/${BPN}-gtk3.so.* \
 FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/ \
                      ${datadir}/gdm/ ${datadir}/gnome/"
 
-FILES_${PN}-systemd = "${base_libdir}/systemd/system/*.service"
+FILES_${PN}-systemd = "${systemd_unitdir}/system/*.service"
-- 
1.9.1


