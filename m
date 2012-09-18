Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylI-0001l8-Vb
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:26:53 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=3COxWn1yhVbaWIjr9LFioi5oAYiJNM425FzZj4GNpho=;
	b=bGE7BHv/sokVIyb5kN2/PT8Am8KyZjKbJx6t0t+Sw7qz+ZJrf5HG3b2Gjl07jA+3P/
	i9kC8JU5GEfOiAyfLrlmKCaD6PqjjxX9RIZD1FPbE21pWuk4/vKNXID0d6mDnUgdofP4
	sgJoA1+HhKUW4b+u2/kXen1mHwZFkl/awUKahmKcBk+JyTBGvW+RB/hJTtoAqOnDZIbu
	Ii2ZmYL/YThu6FmL8RDIzLZCGwze2v2foS00zOv+tv0UP27XLdh/n7qhvHrMYh5lpVu2
	ThCVDETnc1OMfnoX1TCOFW6P+VcdvXKhZvS6XFpukzjHYp639jAj9xlW9AGvpyh6M4oO
	Gj8g==
Received: by 10.204.128.214 with SMTP id l22mr152259bks.86.1347977655228;
	Tue, 18 Sep 2012 07:14:15 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:43 +0200
Message-Id: <1347977601-28665-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 02/40] xfce.bbclass: change SRC_URI calculation
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
X-List-Received-Date: Tue, 18 Sep 2012 14:26:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* grabbed from oe-core gnomebase.bbclass
* old calculation did not work for version numbers with multiple digits (4.10)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/classes/xfce.bbclass |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index 2350c27..f4ef556 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -1,5 +1,10 @@
+def xfce_verdir(v):
+    import re
+    m = re.match("^([0-9]+)\.([0-9]+)", v)
+    return "%s.%s" % (m.group(1), m.group(2))
+
 HOMEPAGE = "http://www.xfce.org"
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
 inherit autotools gettext gtk-icon-cache pkgconfig
 
-- 
1.7.6.5



