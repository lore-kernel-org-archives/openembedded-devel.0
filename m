Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIhs-0005n7-Lh
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1964777eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7bHVHAXR4Zvh+OUhozdLYdsb2HSVyqV7YJh16p18oPM=;
	b=sRrBbgukN/mKat007S/K+uRyGtO5jmG9Rw4AtF4D2MuF9nUEyAaPPsVIkPC12vCdPk
	K0M3awoT5HAZzPBsMOtUyPFkHX7cyuICGMlFgyWTtsMjx3EBioAqdx4p2K9QxxI1yhMY
	5l3nDWTjQCoyBsvewfHUCoQIPwV1ElIgamFuYwclAhGXK5qQE6bHXAIP9qS3N3sotYS9
	z05ytXNKfU5s6ZXzU6OWsCF5+czB+Kh6StBVl0aHTyyfHlBwWmsp9DhO4kZzH+IAtlXK
	cdRdVItbNdQzLzWz/oAt4uHL/xBDlqjcYmXxxNFLYa2uZMNNLFDBrtRS5HB4tuwAWngL
	W3Ig==
Received: by 10.14.2.66 with SMTP id 42mr34159790eee.7.1355680697687;
	Sun, 16 Dec 2012 09:58:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e2sm23867974eeo.8.2012.12.16.09.58.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:48 +0100
Message-Id: <0860760e0f2e24915e8c708adf22a82efb8e8559.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/26] xterm: added gnu-configize for AArch64 support
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_277.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_277.bb b/meta-oe/recipes-graphics/xorg-app/xterm_277.bb
index f68e23c..18abe35 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_277.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_277.bb
@@ -15,6 +15,7 @@ EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --disable-setuid"
 
 do_configure() {
+        gnu-configize --force
         sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
         oe_runconf
 }
-- 
1.8.0.2



