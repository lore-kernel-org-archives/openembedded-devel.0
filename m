Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 37D1460144
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 09:42:17 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so4645454wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wlym23lNPazpcOA0BFds1/Ulz6NZchao9ePVnvxy7zY=;
	b=y9ZKPipoN85r168nb1dtM/kQno4gfyzfSjTn0oUuGbAVdyEtWDWsdoJmI28rtXUAcY
	H20BVQtEm+XmQCtZyQiE79nEvK2BrkIy2qshjxKwHr/dFyj11b1OaEK36evZ0i0i0xQr
	zutabqu8BpL0PnyouxBwbaMDQ9nJkPOEu5YuuRXkMcYp/0y0HVeSs1HtWd47aOc2/rJU
	b8F8TSWzCmmhIz0vDAJHRzl9v++8oH3YzN7Z8XMvA2s3LUdl5K3gDFRSqeSAgj9/6fK0
	uCRJAC3mx24koQdgqJtu64bKAYPJgTF3DmoRwe756BO9ZtTKIF8PCGbMl92gnsOks/K7
	Qa8Q==
X-Received: by 10.180.83.8 with SMTP id m8mr56919732wiy.8.1407404538677;
	Thu, 07 Aug 2014 02:42:18 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id u7sm27189637wif.3.2014.08.07.02.42.16
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Aug 2014 02:42:18 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Aug 2014 15:13:38 +0530
Message-Id: <1407404618-32573-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: [PATCH] gdk-pixbuf-native: add setscene dep on jpeg-native
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
X-List-Received-Date: Thu, 07 Aug 2014 09:42:22 -0000

From: Shrikant Bobade <Shrikant_Bobade@mentor.com>

Without this, we can get setscene postinst failure due to libjpeg being
unavailable.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
index 3d08146..1248529 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
@@ -74,6 +74,7 @@ RDEPENDS_${PN}-ptest += "gnome-desktop-testing"
 
 PACKAGES_DYNAMIC += "^gdk-pixbuf-loader-.*"
 PACKAGES_DYNAMIC_class-native = ""
+PIXBUFCACHE_SYSROOT_DEPS_class-native += "jpeg-native:do_populate_sysroot_setscene"
 
 python populate_packages_prepend () {
     postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
-- 
1.7.9.5


