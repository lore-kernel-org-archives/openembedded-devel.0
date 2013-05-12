Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UbdTe-0008Oo-Jf
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 May 2013 23:06:47 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so1408609eae.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 13:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=FhYdp36WOlpbhZrVZMyXK5CCB/dTRd36LY4y+oF6WPA=;
	b=M6LEgVtBElkULvxiLEEp2JK/M9zW7h4t3W9nqnPSs1shOHjkuWriifLOx9d4siwYQK
	GI8uAlSv9W2dj+1fHcg3L/EzXXBBvgFLi0Vf4KCIFunPUtnhFJSfNg2mFQlYNx0bn5NG
	j1e7i0/tgzAVqnVLFtQHitoAe1WwxeviomIxMOiKVamcy8AQC8mXOrsmDtB6Eu/mYeT5
	irjvNGsWKQK8qyWRObXtMoe772J62hQ2YPAKHdYgEduOuRXCjFSmXV3gfN80xvMVIIIs
	7xOJJy0Vf4y8WzhBjNb2qQPc4bupplUjO70jN7/DspJKh+dUXsR7+EB3PguKoOWQIa1P
	Q5JA==
X-Received: by 10.14.178.129 with SMTP id f1mr33904516eem.10.1368391714160;
	Sun, 12 May 2013 13:48:34 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06B8.dip0.t-ipconnect.de.
	[79.223.6.184]) by mx.google.com with ESMTPSA id
	w52sm18480626eev.12.2013.05.12.13.48.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 13:48:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 May 2013 22:48:17 +0200
Message-Id: <1368391699-1402-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368391699-1402-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368391699-1402-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-network/meta-gnome 2/4] poppler: fix config option --disable-poppler-qt to --disable-poppler-qt4
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
X-List-Received-Date: Sun, 12 May 2013 21:07:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/poppler/poppler_0.22.3.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.22.3.bb b/meta-oe/recipes-support/poppler/poppler_0.22.3.bb
index 660bc0e..d3d5ce8 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.22.3.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.22.3.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code bas
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
+PR = "r1"
+
 SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "be915388eaad6865cee5a156c8119ec1"
 SRC_URI[sha256sum] = "916a931cbef951366014f13d5f4a574657ccc064ac41051df96dd58e22934431"
@@ -13,7 +15,7 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "\
     --enable-xpdf-headers \
     --disable-gtk-test \
-    --disable-poppler-qt \
+    --disable-poppler-qt4 \
     --enable-zlib \
 "
 
-- 
1.7.4.4



