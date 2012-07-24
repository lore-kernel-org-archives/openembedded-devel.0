Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1StaGl-0004CI-HD
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 10:15:03 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so4724362bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 01:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=RL9LfcNPp7IMdR0uFlXU5fF2w04TJBGft1rRXchqTS0=;
	b=b2W+EKDPWSMvJ9CTrf4fj9wewo3JrOI9XNZdOAOS+c+bH09aZcH+T3DtCR9eDkivjg
	J12MBtK3Tz3H26+6P+wVMD7Ik0+vUPIcVyFHc4O8Q1jtRKnt3Dj8ZQIHWP7a8gL0X9hF
	eU5gtljB/tBjBBtiYMEm/caLioGZYv0XTHxLzZBW45fpw5Mpqvd3opuDwteHm3U4WJ9C
	NcsHkShgcOtApvJCBh0hodaS3WWV6x4SoVh5SU6VQDlngDpOq5L1mNllPDgue7YpqLXa
	EbtTcQia9rDNXHPg21mpKoj9POCT+xoxHU/RQpR3ipv8fSfdhULZxqTRc0w69U++LT9d
	jDdg==
Received: by 10.204.154.151 with SMTP id o23mr9737854bkw.77.1343117017883;
	Tue, 24 Jul 2012 01:03:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm9652884bkv.11.2012.07.24.01.03.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 01:03:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 10:02:58 +0200
Message-Id: <a8708d0cae4f81f34b225193293767fedc4f38cf.1343116924.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343116924.git.Martin.Jansa@gmail.com>
References: <cover.1343116924.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343116924.git.Martin.Jansa@gmail.com>
References: <cover.1343116924.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] libgpewidget: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Tue, 24 Jul 2012 08:15:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgpewidget/libgpewidget_0.117.bb             |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
index e8abc43..ef0329e 100644
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
@@ -4,10 +4,10 @@ SECTION = "gpe/libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-DEPENDS = "gtk+ cairo libxinerama libxcomposite libxrender gtk-doc"
-PR = "r2"
+DEPENDS = "gtk+ cairo libxinerama libxcomposite libxrender" 
+PR = "r3"
 
-inherit gpe pkgconfig autotools
+inherit gpe pkgconfig autotools gtk-doc
 
 SRC_URI += "file://pkgconfig.patch;striplevel=0 \
   file://glib-2.32.patch \
-- 
1.7.8.6



