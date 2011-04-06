Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7N18-0003cL-Rr
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:19:06 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so888220fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=GXwD5mspFlsYftQXY145bNhp+E7okhj4WiMHE+YL+Ag=;
	b=sq7WCCSfiiwgP9QQlkLLPptf426htn4/f6g6CDktlW3fGQQnVz1mrIdH8fw+yel2x1
	cjPQGLvE004K5U3svmqBeqIg8mF3fTITqlLFG3mPSEGdSGzoLqIQ3AFC+upJay8eUFUK
	MB/k1jPqw9ZYvVix1NX1DwY2/r3N78plHSn+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lYm16RKcP2nJnRgu/oOBA/9U2gpXzmqRqYml3qbsBVY7HZb5UneAeJQSerGJH0IhU/
	+SwDcZXlNxHl47xMJjjUF8fYC64xnm5MJwMh3PVV5A+XJXuCl0w5LrnIIqPcXNYlge+u
	+sfIhoMLqdhWv0rj5bf6uOdXbC2XBykDho3jY=
Received: by 10.223.17.141 with SMTP id s13mr676940faa.23.1302074222301;
	Wed, 06 Apr 2011 00:17:02 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n9sm81042fax.27.2011.04.06.00.17.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:17:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:17:00 +0200
Message-Id: <9893e1bbe2615ba3900d5e0578ee200fd34ab11f.1302074016.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302074016.git.Martin.Jansa@gmail.com>
References: <cover.1302074016.git.Martin.Jansa@gmail.com>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH 7/8] evas: drop PACKAGES_DYNAMIC_virtclass-native, not needed anymore
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
X-List-Received-Date: Wed, 06 Apr 2011 07:19:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index 3dbd072..4e6f328 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -29,7 +29,6 @@ do_install_append() {
 FILES_${PN}-dev += "${libdir}/evas/modules/*/*/*/*.a ${libdir}/evas/modules/*/*/*/*.la"
 FILES_${PN}-dbg += "${libdir}/evas/modules/*/*/*/.debug/"
 
-PACKAGES_DYNAMIC_virtclass-native = ""
 PACKAGES_DYNAMIC = "evas-engine-* evas-loader-* evas-saver-*"
 
 RRECOMMENDS_${PN} = " \
-- 
1.7.4.1



