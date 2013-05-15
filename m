Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpv-0006mj-OF
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:53 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so1156582eae.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=N2q0e2+jDjAzB2oDgcSODQat7ehGp4R9KLfl7lUzA6c=;
	b=LTy+iis8c/UjMytx/FG85irbiJ4aQCJnzjwR6CYIhBVvDr5bmsB6QYpvCGIxTzYlU4
	bQkJ4ZcK/FzlsLYhWsPDrs60oGoT8Dtbv8XNl+3Hs13tqa9kcfP4j+F5kzxPFI5rh1xt
	uCFxdkdRPn8Yr7V3ADCzQU9xfIL102C2gW0PVOqn4wJAjWJt+kg90qmVVZXXO05GG3sL
	Xm9+Ajn15vJPK+CWizyeus5cJKFWoNKbrGokdnmPb9+3w/257YnxELhS0YqTKKlHRu5U
	5zO5at51a73ah6L8EXaperQ+cYuLVkmPRbvtCqe3/VNJKyTayfNnxzFbXxLkALIThgqL
	ivAg==
X-Received: by 10.14.69.138 with SMTP id n10mr104302777eed.32.1368631419185;
	Wed, 15 May 2013 08:23:39 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:54 +0200
Message-Id: <1368631259-13401-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 09/14] xfce4-panel: update to 4.10.1
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
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...xfce4-panel_4.10.0.bb => xfce4-panel_4.10.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.10.0.bb => xfce4-panel_4.10.1.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb
index 02a6cb1..b0ed49b 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.1.bb
@@ -6,8 +6,8 @@ DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo virtual/lib
 
 inherit xfce
 
-SRC_URI[md5sum] = "cf7351a4b952dbe3fc5ff509c68def33"
-SRC_URI[sha256sum] = "3321f998af2bbd14ba68654a8881774f6ea2ec4f1a3544598e7f47d3ed0009b9"
+SRC_URI[md5sum] = "8a1f8371fc725ba00f4594c5c0f81c59"
+SRC_URI[sha256sum] = "573052ed1b65e247415f92df120c8a78f9e4152c2636d38c923f82e32b8475d6"
 
 python populate_packages_prepend() {
     plugin_dir = d.expand('${libdir}/xfce4/panel/plugins/')
-- 
1.7.6.5



