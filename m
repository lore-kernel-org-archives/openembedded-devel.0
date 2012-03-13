Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S7P8m-0007k1-Rb
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2012 11:39:40 +0100
Received: by wera1 with SMTP id a1so328892wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2012 03:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=NgB6lakE821t1Tv0IRwN0aEh9byd4o/MEtXgFNyuOxU=;
	b=CahhDIxwuF2LZxDXG5orbXojgcipTx7oHwSIzEG8w0AhcSs1qb+Pw3D984Qi7nfqsy
	SkXV+9yykEkPUxnf/QYbioDZEp8A1DSRBsKzqUuAgkQpTHD4aPOq9JlWxKSW6kQgfMpH
	ey0mWK31dN4yP/rJxha4B5CXWxLsZ0xGFie0I3SbfUKhWyACMpNNLhVnQ90n9nmLMoCw
	FCMTk3lCOiiKbjssWFJBSEz+i0KrqLsYxHleQy/tuzNcD+hy5CRlTQBvKbUDl8g/XEQ3
	HQw6VErmBAAZwhJWZ9odVcm0744I/yxkDqOd2hgXouPRZ7ItFzAkDuy8SjYGtkekMSWu
	6JXA==
Received: by 10.180.104.137 with SMTP id ge9mr6007104wib.20.1331634656822;
	Tue, 13 Mar 2012 03:30:56 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id w10sm537764wiy.3.2012.03.13.03.30.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 03:30:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Mar 2012 11:30:52 +0100
Message-Id: <1331634653-5439-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1331634653-5439-1-git-send-email-schnitzeltony@googlemail.com>
References: <1331634653-5439-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 2/3] xarchiver: add bzip2 to RRECOMMENDS_${PN}
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

error message for *.tar.bz2 was
tar: Error is not recoverable: exiting now
tar: Child returned status 2
tar (child): Error is not recoverable: exiting now
tar (child): bzip2: Cannot exec: No such file or directory

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
index 5c6b7f5..68216cc 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Lightweight, desktop independent GTK+ archive manager"
 HOMEPAGE = "http://xarchiver.sourceforge.net"
 SECTION = "x11"
+PR = "r1"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
@@ -13,4 +14,4 @@ SRC_URI[sha256sum] = "cea932ff9d505969201fd502470bbebbc5726ab3d6765e142fc8295aa6
 
 inherit gettext pkgconfig autotools gtk-icon-cache
 
-RRECOMMENDS_${PN} = "lzop zip tar"
+RRECOMMENDS_${PN} = "lzop zip tar bzip2"
-- 
1.7.6.5



