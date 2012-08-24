Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T4oRQ-0001GJ-CW
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 09:36:28 +0200
Received: by wibhn17 with SMTP id hn17so434816wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 00:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=FnQODp5JnqZB13KY2r49icjY2nnR4jiuMrkPdklbbVg=;
	b=Pa/UAbxWMA9XgV5POXy5xCFtjtZ5UflUCA/IB86yTcz8GFlay0VoEP7gHrUK4VgreL
	1nEHu9NBE1rKic6EGb/1e9RpVb/vi3dR7NaG1f84DYqbQIJGI4LAWjQ+SUNrwjU81ZCY
	PTVeAt3v9DqmZAsc1DgGCOEowXrmv4RZIwbIPJMAtD1p5gNzzOZlc5lROP1qqDwTZECP
	p8K4MFOoQsqCGz3CAv403Ftl+WVq+VxjlBb93e0JHx87Z3JpNXSJTHgOTQVBVx1XAqcC
	NNxT3gFxAuRh03sAAtMtm/1msbtfh62gdRPmY1wCWKhKVutom2VEnP+lS1tfyh+lrNLa
	toQA==
Received: by 10.180.81.193 with SMTP id c1mr3233033wiy.12.1345793061099;
	Fri, 24 Aug 2012 00:24:21 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id dv1sm4462286wib.10.2012.08.24.00.24.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 00:24:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2012 09:23:36 +0200
Message-Id: <1345793018-4843-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH 1/3] gnome.bbclass: remove to use oe-core's version
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
X-List-Received-Date: Fri, 24 Aug 2012 07:36:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* suggested in [1]
* build tested from scratch with my working image [2]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-August/041157.html
[2] http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-image/xfce-full-image.bb

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/gnome.bbclass |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/classes/gnome.bbclass

diff --git a/meta-oe/classes/gnome.bbclass b/meta-oe/classes/gnome.bbclass
deleted file mode 100644
index 0a32a77..0000000
--- a/meta-oe/classes/gnome.bbclass
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit gnomebase gtk-icon-cache gconf mime
-
-EXTRA_OECONF += "--enable-introspection=no"
-BBCLASSEXTEND += "native"
-- 
1.7.6.5



