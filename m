Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2NyP-0002GR-F2
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:24:13 +0100
Received: by eekc1 with SMTP id c1so769511eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:15:45 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.14.205 as permitted sender) client-ip=10.213.14.205; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.14.205 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.14.205])
	by 10.213.14.205 with SMTP id h13mr5694362eba.5.1330438545589 (num_hops
	= 1); Tue, 28 Feb 2012 06:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9lhOMKBJqt/LVzw+qF50Gmi92A4uqfsLIu2RAHTQk3s=;
	b=Kp6P/+VOCxVnxcXugWzhp2hUdKT+v8kCTDmrfBY81iaw91WtysVzg2ewcom6UlgQED
	xqI7Iroq0WQuMnYEIpfS9WpCiuEx/5vJnH+CvCang5g3KwTM7Z/zpYmxgLNqlaMa2lg4
	ItnVL4WWovSQDgUEmt7nouY8coPisreWqMpic=
Received: by 10.213.14.205 with SMTP id h13mr4276271eba.5.1330438545510;
	Tue, 28 Feb 2012 06:15:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm70764627eeb.7.2012.02.28.06.15.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:15:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:39 +0100
Message-Id: <b3815eeeca93e8a741015f74465c7757d31e6a88.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
References: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 08/14] libsdl-image: bump PR to rebuild after libtiff3->libtiff5 change
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
X-List-Received-Date: Tue, 28 Feb 2012 14:24:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libsdl-image/libsdl-image_1.2.10.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
index 29234ab..12a3abd 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl"
 
-- 
1.7.8.5



