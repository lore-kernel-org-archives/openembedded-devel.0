Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDymD-0001n9-V6
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:50 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999601bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ZBa91xd99zK+XQcDW8XiAQIGDHKCFvdaxcq/cirPjdM=;
	b=DDn0ifOIM0EqoQ/ycx7nuIUDODQOLxPjadB8Nw+V6B9P1fOJrFZhAR8oIIQv9bOfNM
	+efv5RiRB8iNbaZKg6UmrlfJwIsNUQhgF0bT1h9uBeNC2sYF99tsFGIL6EHnwingOjM/
	PjS5dmEuFT5iNCU/hMkEf2X9FB/jjMEHe4H7pcVTvMaB07U95R/Zi5/OBhlsfL2p/QJb
	ARbgF/2jhaXZ8TV+G5gl7uS3C7vTg3TBavpIitEaSOUs1qpV/i296WpqrOCkx7z2oY/F
	bmHqL3QBejPYZ1CAHetDUXcaJolx+VjXUEsyQT4dpN3OCuL2eBJXEkMRYXW5ICf1oEI9
	62xQ==
Received: by 10.205.135.146 with SMTP id ig18mr157121bkc.80.1347977712027;
	Tue, 18 Sep 2012 07:15:12 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.15.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:15:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:20 +0200
Message-Id: <1347977601-28665-40-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 39/40] packagegroup-xfce-multimedia: initial add
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-multimedia.bb  |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb

diff --git a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
new file mode 100644
index 0000000..b869572
--- /dev/null
+++ b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "All packages multimedia packages available for XFCE"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = " \
+    xfmpc \
+    xfce4-mpc-plugin \
+"
-- 
1.7.6.5



