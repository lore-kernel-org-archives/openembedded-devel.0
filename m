Return-Path: <fenixk19@mail.ru>
X-Greylist: delayed 4802 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Oct 2014 16:09:43 UTC
Received: from smtp46.i.mail.ru (smtp46.i.mail.ru [94.100.177.106])
	by mail.openembedded.org (Postfix) with ESMTP id 290C860097
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; h=Message-Id:Date:Subject:Cc:To:From;
	bh=7R70P8gZNJns16SEzqq/dVXcmVQ993OxrPkX3bIr4i8=; 
	b=ayu9Zwhw1h+j7QquSRc3QyyTITK97C0fr/AVr5WUIa0HSKUT/RhwxwajpxZnA7MHur1dF7ewg6BRJSO/CbSJXvynrUqj1KefzzyWO1xjwjbpvC0xcfpO3tK/SUX+pl7zOb35QXDxbN9Nd6qPbgG5fZBOSyblX7gRKOSg3yrJQgU=;
Received: from [37.204.187.134] (port=57111 helo=localhost.localdomain)
	by smtp46.i.mail.ru with esmtpa (envelope-from <fenixk19@mail.ru>)
	id 1XgFWg-0001mp-IQ; Mon, 20 Oct 2014 20:09:42 +0400
From: "A. Varnin" <fenixk19@mail.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2014 20:09:29 +0400
Message-Id: <1413821369-3670-1-git-send-email-fenixk19@mail.ru>
X-Mailer: git-send-email 1.9.1
X-Spam: Not detected
X-Mras: Ok
Subject: [meta-oe][PATCH] log4c: new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Oct 2014 16:09:44 -0000

Log4c is logging library for C (http://log4c.sourceforge.net/)

Signed-off-by: A. Varnin <fenixk19@mail.ru>
---
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/log4c/log4c_1.2.4.bb

diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
new file mode 100644
index 0000000..43e0746
--- /dev/null
+++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Logging Framework for C"
+HOMEPAGE = "http://log4c.sourceforge.net"
+LICENSE = "LGPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://cznic.dl.sourceforge.net/project/log4c/log4c/${PV}/log4c-${PV}.tar.gz"
+SRC_URI[md5sum] = "0d94919136e1d16b68427562e74cb3dd"
+SRC_URI[sha256sum] = "5991020192f52cc40fa852fbf6bbf5bd5db5d5d00aa9905c67f6f0eadeed48ea"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+EXTRA_OECONF = "--prefix=/usr"
+
+inherit autotools
+
-- 
1.9.1


