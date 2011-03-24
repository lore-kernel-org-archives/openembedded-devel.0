Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2twE-0004AQ-J6
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 00:27:34 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so577628bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=gTNDSW/FqJV8F9mG2T3NSf/QJeMYfYqIuX6IjICAPYw=;
	b=sjxYWWDX2DG4ue6U+xyqXK4SIfJzGYQY254VadzOZxDMCRPpeJIyiFfg1W0YDPyPYC
	JN7/ZrIXJQW2lpk436wpN2tYDqN54pk9TO6mIv9Zs8Dk7qewCHBWbI4kM6BZ/GDX8OGt
	GlQRWn7GuZ608+s4zqm307PRmAlhWhoia6k1Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qscmK5IhV0n+RP+tTfGX9aqcfiOWSUScOLXWoM6aFOSzCckJCCkEdNDNgJKiqUpo/p
	VaF6dfDqsKS5WggsFPikW8hnRMywLgY9umvSNnLEer+jp4B1Ue+dCoIOWTv/qwfBQFzF
	XrUMQGAbpnHRph6y3dY/42lX/Fl5IZyjXr2uU=
Received: by 10.205.24.13 with SMTP id rc13mr77148bkb.75.1301009144263;
	Thu, 24 Mar 2011 16:25:44 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k5sm323606bku.4.2011.03.24.16.25.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 16:25:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 00:25:37 +0100
Message-Id: <ab5a90f3f6a79d320224b53c5a9ea3ec9cf90218.1301008354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301008354.git.Martin.Jansa@gmail.com>
References: <cover.1301008354.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/8] evas: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 24 Mar 2011 23:27:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index bcb1984..3dbd072 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -1,5 +1,6 @@
 DESCRIPTION = "Evas is the Enlightenment canvas API"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=702a085dc863c1c7c1e909db7175f5bf"
 # can also depend on valgrind, libsdl-x11, directfb
 DEPENDS = "librsvg eina eet freetype jpeg libpng virtual/libx11 libxext libxrender fontconfig libfribidi giflib"
 DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-native eet-native eina-native libfribidi-native"
-- 
1.7.4.1



