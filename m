Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id D1B826EAB6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 18:55:27 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so1724114eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QD6SwQiFIL7MAxwHimo1wEUEuTwrty7Ar//7CwcLT+k=;
	b=DSPygd1i7gI29sBdnvHJRz+Rc49R+XQECUjmhl64W0VtEkIzJE7s3BDR0RakzATrIW
	+XqhHKzUIbEtS0PQNgssPo8KalWFC9P8dF5B/uwJp0QkNOzONCtaG0xzL95vR0ZmWmFC
	zelthQVklKO2by/x5S3B/bCe9Wbx5Ocyk0rpAWQHWsFOqPUnMiuBVImfkXbvKKqkrnzC
	ohns43tGVp6ffRl1AZiw0HVDTLLT5ehe9Ed4aa3LqgDxFOx9jj1df+39kzDSP2FEWKRy
	9RCjqcuKz0VhBmXaSytt9+4cwt0lIEtd+AS46EXiHuWtNnwryuPkOGOituAN3MDE6OX0
	8Yzg==
X-Received: by 10.14.172.69 with SMTP id s45mr9971875eel.26.1394823327966;
	Fri, 14 Mar 2014 11:55:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i1sm18972356eeo.16.2014.03.14.11.55.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Mar 2014 11:55:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Mar 2014 19:55:36 +0100
Message-Id: <1394823336-18212-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH] qtbase-5.0.2: Fix build without -fpermissive
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
X-List-Received-Date: Fri, 14 Mar 2014 18:55:31 -0000

* commit in newer qt is using GLint and casting to GLuint
  later so it doesn't have this issue:
  commit 1d8ec5fae2fa4bf694b93bb6bf14a7c42c84a9b6
  Author: Valery Volgutov <valery.volgutov@lge.com>
  Date:   Tue May 21 14:18:17 2013 -0700

    Fix FBO restoring in QOpenGLTextureGlyphCache

* but backport to 5.0.2 is using GLuint:
  and causes build failure without -fpermissive:
  | qtbase/5.0.2-r3/qtbase-opensource-src-5.0.2/src/gui/opengl/qopengltextureglyphcache.cpp:151:51: error: invalid conversion from 'GLuint* {aka unsigned int*}' to 'GLint* {aka int*}' [-fpermissive]
  |      glGetIntegerv(GL_FRAMEBUFFER_BINDING, &saveFbo);
  |                                                    ^
  | /usr/include/GLES2/gl2.h:536:37: error:   initializing argument 2 of 'void glGetIntegerv(GLenum, GLint*)' [-fpermissive]
  |  GL_APICALL void         GL_APIENTRY glGetIntegerv (GLenum pname, GLint* params);
  |                                      ^

* resync with version from 5.1.1 to fix this

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0019-Fix-FBO-restoring-in-QOpenGLTextureGlyphCache.patch        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/qtbase-5.0.2/0019-Fix-FBO-restoring-in-QOpenGLTextureGlyphCache.patch b/recipes-qt/qt5/qtbase-5.0.2/0019-Fix-FBO-restoring-in-QOpenGLTextureGlyphCache.patch
index e47c7b6..e8169b5 100644
--- a/recipes-qt/qt5/qtbase-5.0.2/0019-Fix-FBO-restoring-in-QOpenGLTextureGlyphCache.patch
+++ b/recipes-qt/qt5/qtbase-5.0.2/0019-Fix-FBO-restoring-in-QOpenGLTextureGlyphCache.patch
@@ -27,8 +27,8 @@ index 8822faf..022356a 100644
          return;
      }
  
-+    GLuint saveFbo;
-+    glGetIntegerv(GL_FRAMEBUFFER_BINDING, &saveFbo);
++    GLint oldFbo;
++    glGetIntegerv(GL_FRAMEBUFFER_BINDING, &oldFbo);
 +
      int oldWidth = m_textureResource->m_width;
      int oldHeight = m_textureResource->m_height;
@@ -38,7 +38,7 @@ index 8822faf..022356a 100644
      glDeleteTextures(1, &oldTexture);
  
 -    funcs.glBindFramebuffer(GL_FRAMEBUFFER, ctx->d_func()->current_fbo);
-+    funcs.glBindFramebuffer(GL_FRAMEBUFFER, saveFbo);
++    funcs.glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
  
      if (pex != 0) {
          glViewport(pex->x, pex->y, pex->width, pex->height);
-- 
1.9.0


