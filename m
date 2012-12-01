Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TebWj-0005uh-HH
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Dec 2012 02:05:53 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so612688eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 16:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=mW2Owk/GiIRT3NbZI23j9+Z5QdzM+zNzGYj7cWZV+tE=;
	b=keJQ5TvfgVsnljf8uPmbSOK5dXwWwhrz+2ze5XXz8orMt5u1HcUVVcxijjCYLd1xXW
	Cm8zdA/wKoX2qIYj8Gm0mXtPKHqFcNmCSnZT89xCDJLdCOjFvFLZ+3+jk5Z/kv2vghwz
	sCdl8Ro/AhekdVVaUyYB0HxNNb1lAhmP3BKVb7xQTfKMqTEBCehG1/RytO8gJWvodIQ6
	VeF/f9n8oq5Bq3KdWa7EKnu0WBj/BRJVpa3IrV0BQhZZzqVc04zGRKobN1x/FN0N9C2E
	T/WFD/Z/kMmU8gAkNO6l8ugcWqwF0q37d0vjiMBnkOmu6GPPLp2K5BDK0xQVF3Szx1Zk
	RTtg==
Received: by 10.14.3.195 with SMTP id 43mr10187831eeh.36.1354323096032;
	Fri, 30 Nov 2012 16:51:36 -0800 (PST)
Received: from localhost.localdomain (p5B0A35D2.dip.t-dialin.net.
	[91.10.53.210])
	by mx.google.com with ESMTPS id 43sm13899997eed.10.2012.11.30.16.51.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 16:51:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2012 01:51:20 +0100
Message-Id: <1354323081-8405-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1354323081-8405-1-git-send-email-schnitzeltony@googlemail.com>
References: <1354323081-8405-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/3] gegl: update to 0.2.0
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
X-List-Received-Date: Sat, 01 Dec 2012 01:05:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gegl/{gegl_0.1.8.bb => gegl_0.2.0.bb}          |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/gegl/{gegl_0.1.8.bb => gegl_0.2.0.bb} (68%)

diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
similarity index 68%
rename from meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb
rename to meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
index 5ae2082..a68dc20 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
@@ -7,9 +7,9 @@ inherit gnome
 
 EXTRA_OECONF = "--disable-docs "
 
-SRC_URI = "ftp://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c8279b86b3d584ee4f503839fc500425"
-SRC_URI[sha256sum] = "106b9574b6d5fb282683794f7a7f090a1a3f4a388890e592b202827a4ca76f75"
+SRC_URI = "ftp://ftp.gimp.org/pub/${PN}/0.2/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "32b00002f1f1e316115c4ed922e1dec8"
+SRC_URI[sha256sum] = "df2e6a0d9499afcbc4f9029c18d9d1e0dd5e8710a75e17c9b1d9a6480dd8d426"
 
 FILES_${PN} += "${libdir}/gegl-*/*.so"
 FILES_${PN}-dev += "${libdir}/gegl-*/*.la"
-- 
1.7.4.4



