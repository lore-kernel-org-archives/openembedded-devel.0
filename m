Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfyHj-0003Gh-F3
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 20:36:07 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1700818eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 11:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=juoLJiNPZ5hDzY8tBxzoBxElbJhS4zxOIT9mia7aZKQ=;
	b=s6L0iugJIcjHVuggj9pUguhDUWKmCdyXF4nCZSf+waqrnsYvD19B7wfFzsm09bT52g
	jZcvTrE75cqDYl5xb9IRgtS8T4Jhs4lgRO0P9f/xKK+J+1Ip81mg+DwkGs253CUaHehJ
	McVhfbwFijerEOg6wFTeuwyOIDMbToKJD9NSEiePWn6uD5gbN9DWBL1dhDq2+gMSgCI2
	VK1VfrDPc1fPy/NLJvGcRZ5wJ+W90UXtoHmDqdaqkIxdGvRCsRk5fGnRhLLBA4Yvl6TN
	u+M63EJSTOd+SwFgXFK8Y9MbYly6X2RUJSeUMoRjqht535ICoN0yfb2GZhnWfT5wplfV
	292g==
Received: by 10.14.194.4 with SMTP id l4mr51695895een.42.1354648900646;
	Tue, 04 Dec 2012 11:21:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 44sm4338300eek.0.2012.12.04.11.21.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 11:21:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 20:21:28 +0100
Message-Id: <355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354646880.git.Martin.Jansa@gmail.com>
Subject: [PATCH 59/64] libcanberra: skip dev-so QA for PN-gtk
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
X-List-Received-Date: Tue, 04 Dec 2012 19:36:08 -0000

* fixes:
libcanberra-0.26: non -dev/-dbg/-nativesdk package contains symlink .so: libcanberra-gtk path '/work/armv7a-vfp-neon-oe-linux-gnueabi/libcanberra/0.26-r2/packages-split/libcanberra-gtk/usr/lib/gtk-3.0/modules/libcanberra-gtk-module.so'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
index 8a03c99..5cf9a55 100644
--- a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
+++ b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
@@ -47,6 +47,9 @@ FILES_${PN}-gtk = "\
   ${datadir}/gdm \
 "
 
+# /usr/lib/gtk-3.0/modules/libcanberra-gtk-module.so > /usr/lib/gtk-3.0/modules/libcanberra-gtk3-module.so
+INSANE_SKIP_${PN}-gtk = "dev-so"
+
 FILES_${PN}-dev += "\
   ${libdir}/gtk-2.0/modules/*.la \
   ${libdir}/gtk-3.0/modules/*.la \
-- 
1.8.0



