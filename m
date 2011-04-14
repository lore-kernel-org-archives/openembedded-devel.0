Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QAGPP-000652-Hc
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 08:52:07 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1173770fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 23:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=cUmvrdsU9KlqC2KmYeuxZ+eUZiPxQSdQq/wWelP6lOU=;
	b=NsFEnSgOI16L7MHvs4/p4KUw75dKHzRNmrA0H3xEHKN+jtU2mofaVnOPe2iduf9rPq
	T0FDF0gmuE4idr7T12lKuHuH8HTSyv5PjNhoDtaNr2XFHa8XWmfEgS8U2hZh4QWAkkb4
	qbS/BxC8edxXXohtmWJe+YcxQZCflDya3Azw0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=c9EEorSsRtgU5ELWxJHZBDHSc700vi3rwM3zZpy/oUXVS05GiIT06dQabfyevwKFie
	+MOP7nRW5f8zXDbrwzkM6nn3ZX5/FNlvVyP3DflyxQz2468d59e8+xe09otRCD48Rh9m
	kLi1gBR/l1F1ljdr79pHswe2HBefVAuAvdGG4=
Received: by 10.223.75.1 with SMTP id w1mr430451faj.17.1302763794165;
	Wed, 13 Apr 2011 23:49:54 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x16sm394013fal.43.2011.04.13.23.49.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2011 23:49:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2011 08:49:52 +0200
Message-Id: <6477dbd64bed3cdb845f1e7f847372e142b37d0e.1302763646.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1302763646.git.Martin.Jansa@gmail.com>
References: <cover.1302763646.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/2] imlib2: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 14 Apr 2011 06:52:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/imlib2_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index 96f66bf..a2585e7 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "A graphic library for file loading, saving, rendering, and manipulation."
-LICENSE = "BSD"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 # can also depend on tiff34, ungif or gif, z, bz2, id3tag
 DEPENDS = "freetype libpng jpeg virtual/libx11 libxext"
 PROVIDES = "virtual/imlib2"
-- 
1.7.5.rc1



