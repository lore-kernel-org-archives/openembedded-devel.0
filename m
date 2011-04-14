Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QAGLj-0005sl-SE
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 08:48:19 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1172487fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=WR4CGFwHdMF/B1lhWqZZxfxaYiukPKowRPs6yqg7ilo=;
	b=PW90jcJssYmdU8uC3HaRpix/rVVqJYVlMl9kx85bZZ+yta3LO3tcwEiRm3oGDucq/B
	09kgvE4aAfEwO5eTOF3cab5X5wxZG+vgSECp4LEuJ+uXvelmiB68JfL1fiMA9MKJ3zbe
	o4UmSxGurdn3yxjeKpUHs+GlmKchN4nRfK+ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JogaoI02U0MgTKSz6JJpVRqZ0YsmmSWgolO3Fvv5yn1kw9N5CTMhUsHHZrtLgUDEgn
	+k//onEs2ZsNejeavPuc+g8dPD4OVoC7kOoGT4CjChcY1QJouPRWpDBarOcZnk7pJpUg
	D2h6NuM7bnqNyHe9E4FnUha4hOInifemAf1qk=
Received: by 10.223.6.11 with SMTP id 11mr406344fax.93.1302763566671;
	Wed, 13 Apr 2011 23:46:06 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y9sm1329890faj.2.2011.04.13.23.46.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2011 23:46:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2011 08:46:05 +0200
Message-Id: <4a86322d8d5da811850fdabff8e446b42cf010e9.1302763397.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1302763397.git.Martin.Jansa@gmail.com>
References: <cover.1302763397.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 1/1] mesa-xlib: fix FILESPATH
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
X-List-Received-Date: Thu, 14 Apr 2011 06:48:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/mesa/mesa-xlib.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/mesa/mesa-xlib.inc b/meta-oe/recipes-graphics/mesa/mesa-xlib.inc
index cabe6e5..cc4a9c0 100644
--- a/meta-oe/recipes-graphics/mesa/mesa-xlib.inc
+++ b/meta-oe/recipes-graphics/mesa/mesa-xlib.inc
@@ -1,2 +1,5 @@
-FILESPATHPKG =. "mesa-${PV}:mesa:"
+#not supported in oe-core base.bbclass
+#FILESPATHPKG =. "mesa-${PV}:mesa:"
+FILESPATH =. "${FILE_DIRNAME}/mesa:${FILE_DIRNAME}/mesa-${PV}:"
+
 EXTRA_OECONF += " --with-driver=xlib"
-- 
1.7.5.rc1



