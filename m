Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id B8F2770234
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:17 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so1874329wib.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DBF5NCMIrxYVeIOVSZwaTaJrRtjZsSvxVzNB9LsbRNs=;
	b=09cEISwzSkEi5C69FMHVJNaNXFSv4D3BoDIy+XdhxsUHLoa2Y9psy9nyE247Dd73uz
	SmOYbV21WO1BJ52p+IyAO2lne/FvdBeJZhCS7tuOcK3TOa198KMfJqAws9kKAKdBJ366
	6aGKA72Y73pdbjDb6Mk/9RHTF+Eh8bbdaeO9+GfnJaGEADikQjgOjgePQXrtZLtnBuzc
	1ZC4FOOhsK2jQPuBj73S+QTji32zjmXXMC9WbAOh2F4sp08JVtDA7hjwPJ6oRoAyZMux
	Oow7CB9FRNQgGNwDXRHXI1TCTDi7wBSsdaunn/mxQTx734+EYJQeo/vVkpgjfm9TL103
	zcBw==
X-Received: by 10.180.37.180 with SMTP id z20mr10082742wij.58.1403342357982;
	Sat, 21 Jun 2014 02:19:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wv8sm5439980wjb.1.2014.06.21.02.19.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:19:05 +0200
Message-Id: <1403342349-11180-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 08/12] gtkextra: add missing dependency on gobject-introspection-stub
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
X-List-Received-Date: Sat, 21 Jun 2014 09:19:18 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
index b9b77e4..702419d 100644
--- a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
+++ b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
@@ -11,6 +11,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gtkextra/${P}.tar.gz \
 SRC_URI[md5sum] = "486cea93666020f85f101ed8341baf41"
 SRC_URI[sha256sum] = "9cab6c5d6b792eb828d17cec2b9c1baba2ef57f789a290464afab80b53969e65"
 
-DEPENDS = "gtk+"
+DEPENDS = "gtk+ gobject-introspection-stub"
 
 inherit autotools pkgconfig
-- 
2.0.0


