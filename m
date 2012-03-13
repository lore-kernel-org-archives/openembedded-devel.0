Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S7P8n-0007k7-PR
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2012 11:39:41 +0100
Received: by wera1 with SMTP id a1so328909wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2012 03:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=m0D1Lrdb5XuPaA4bBPoghdjZkkJ4NQSzySdYB9gf7J8=;
	b=AreQbelkxmTVAQaGWLwtXms8I7V+AihPjYY3mBZLzx07hTzp/kHO6RtILRNJ4d/Xza
	JzpKqj8TnZWiXpLd/kzIjZ5omewpwP/xFzQi/cr7bKyEEn3UWKD1iJOPei60VB0E4mxo
	/2feP44FZryL0kbDU3lNSnQMh2EMsMTD8I0V0TifdrTO/7tq+aot0fmU859LQ1soBUPB
	dpCWQsnfrXuMG6yF1k+Gj01Dwcr0vMhRnf6L2W+NgUwTUvJ56gdz+HHgvCLvnhomsNds
	KNkp4fL5FhCFPSdzLvhmjcbSDRIKiVNOFVfSGsXGmMyB8et0pSY5MYsL5reD1mZ/1C4X
	A6rA==
Received: by 10.180.76.74 with SMTP id i10mr6197635wiw.2.1331634658072;
	Tue, 13 Mar 2012 03:30:58 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id w10sm537764wiy.3.2012.03.13.03.30.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 03:30:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Mar 2012 11:30:53 +0100
Message-Id: <1331634653-5439-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1331634653-5439-1-git-send-email-schnitzeltony@googlemail.com>
References: <1331634653-5439-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 3/3] xarchiver: add unzip to RRECOMMENDS_${PN}
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
X-List-Received-Date: Tue, 13 Mar 2012 10:39:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

opening *.zip caused:
Failed to execute child process "zipinfo" (No such file or directory)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
index 68216cc..f47a3bc 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lightweight, desktop independent GTK+ archive manager"
 HOMEPAGE = "http://xarchiver.sourceforge.net"
 SECTION = "x11"
-PR = "r1"
+PR = "r2"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
@@ -14,4 +14,4 @@ SRC_URI[sha256sum] = "cea932ff9d505969201fd502470bbebbc5726ab3d6765e142fc8295aa6
 
 inherit gettext pkgconfig autotools gtk-icon-cache
 
-RRECOMMENDS_${PN} = "lzop zip tar bzip2"
+RRECOMMENDS_${PN} = "lzop zip tar bzip2 unzip"
-- 
1.7.6.5



