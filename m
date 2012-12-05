Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJzA-0000Q7-Ow
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:46:33 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3068013eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1a7MBqFSLYLGaTziC0i8FsH9Q2thmicdqpz1dVi4Ah4=;
	b=Ib7NmS5ls+eD1K6G8F8u/VFvDlsVVXH8i397ceWsoxMChMNrHWdmUaXe0YX/2PMgwt
	Mh6/IdsZ30i67Mw8HeU2m3KRU/NrACflJqn9/PBiI0ImGYHFGZUDIjXtmmSCqnzvud9s
	CbTvgJhRf9rfMC5jdY4Bbuyq0kfYgH3dsnuoKP9aigO2Nu4i/YRQucLCjt3uz43YSxZb
	svcGtTkrhtCRFgvN2M0+whXcDK08rVvSFeuPVZDDjQvIn4nrocacWt8jZOdVklLjaK9Y
	kpV2mUzJJv9WDxjYh0Ev7/iBp00CawCxhKYYyK2/fdZbgSG/yM5RptJ137PF/r25HTKw
	Q3oQ==
Received: by 10.14.220.71 with SMTP id n47mr62491509eep.39.1354732318875;
	Wed, 05 Dec 2012 10:31:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f49sm10679098eep.12.2012.12.05.10.31.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:31:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:34 +0100
Message-Id: <3abfefea16f7c4da1cf806d40ef8aa570a53d037.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 76/77] cheese: disable scrollkeeper
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
X-List-Received-Date: Wed, 05 Dec 2012 18:46:42 -0000

* we don't provide scrollkeeper-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index 4ac667b..f447817 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 
 DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop evolution-data-server"
 
-PR = "r1"
+PR = "r2"
 
 inherit gnome
 
@@ -14,3 +14,4 @@ SRC_URI[archive.sha256sum] = "48f03470c6f527caa0e3b269d3afcff86ae0939a74f66ce030
 FILES_${PN} += "${datadir}/dbus-1"
 RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
 
+EXTRA_OECONF += "--disable-scrollkeeper"
-- 
1.8.0



