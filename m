Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDym7-0001l8-Nl
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:43 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=xC4LotVbeYCmcZFviULNW4iEdz2/iG7+Gv9lVxdBFHY=;
	b=igWJHaWonuJVUdZX0PpgcvjuoSnwqesZC7/BF8FjDuEs2HyzzeMt7Pic+IZjLSr4JA
	REF3woyrDCArDY/x7reII3qgU+aEDwusoBCJrnotZcHEDHApKuaQBlGypRVBpXAGJtjH
	VCUd2k9KmRVSGxqFDe7KPi7L7tHwNxs0SbhLnb8qFfu55i+Wto7QbQSOUMtt7HO7OrHL
	Sgbbtu7eBn/rGEmbXdJ9Jyy9Uj0EZHldcBYCdSxTcnI3Wn1UyKTtDV3TK4tNf4YJItYO
	W5KexAaJAVzCMpSpRPvxX7njoN6LplZrHXOWXlrF3oxfP4JyiG1j969R8N+swHbAqA4D
	slhA==
Received: by 10.204.3.207 with SMTP id 15mr147861bko.98.1347977706023;
	Tue, 18 Sep 2012 07:15:06 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.15.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:15:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:16 +0200
Message-Id: <1347977601-28665-36-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 35/40] libmpd: initial add 11.8.17
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
X-List-Received-Date: Tue, 18 Sep 2012 14:32:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/musicpd/libmpd_11.8.17.bb   |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
new file mode 100644
index 0000000..b58a4fa
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Music Player Daemon library"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+HOMEPAGE ="http://sourceforge.net/projects/musicpd"
+DEPENDS = "glib-2.0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "5ae3d87467d52aef3345407adb0a2488"
+SRC_URI[sha256sum] = "fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83"
+
+inherit autotools
-- 
1.7.6.5



