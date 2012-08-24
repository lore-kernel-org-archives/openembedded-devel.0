Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T4oRR-0001GL-FF
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 09:36:29 +0200
Received: by weyr6 with SMTP id r6so832838wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 00:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Z31dqDi+ugffrZW/7Oqzyda27w8WVKH/MPVrdhpJyHQ=;
	b=ZY4orRw2xvUQicNYTEief/BqP1qmx5YzCKn6P8Kd1QtNCUtpP1oRxKWP5DnDyIp5vU
	7DBOS36ZBlDanxPQVAa5RrsF2Glia6PBxjGg0mj46njjo7RI2V2DiTigcjBnrZMxlknP
	ntAoxv6X9XmqpFjvSKyz9xDN942KKo80VskUcwqLu9DizJMi8L2G6XMaEbW1FYf21FmA
	XCdDKADQoDdYNQDgHxiNCzWk5ZJcJjKgGZY/bNTinZ+egmYsGrysAyYxJeylycxphUH6
	mH/38I2UuclsUTgX8uaQJouzKk+WSI/Ga92kvAK+/WKQzvAX2ZWK4bX4votTY99zlpIP
	rxAA==
Received: by 10.180.96.199 with SMTP id du7mr3177574wib.21.1345793062412;
	Fri, 24 Aug 2012 00:24:22 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id dv1sm4462286wib.10.2012.08.24.00.24.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 00:24:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2012 09:23:37 +0200
Message-Id: <1345793018-4843-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1345793018-4843-1-git-send-email-schnitzeltony@googlemail.com>
References: <1345793018-4843-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] busybox/meta-oe: follow oe-core to 1.20.2
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
X-List-Received-Date: Fri, 24 Aug 2012 07:36:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...box_1.19.4.bbappend => busybox_1.20.2.bbappend} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-oe/recipes-core/busybox/{busybox_1.19.4.bbappend => busybox_1.20.2.bbappend} (90%)

diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
similarity index 90%
rename from meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
rename to meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
index e9dd4ac..0741b76 100644
--- a/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -1,4 +1,4 @@
-PRINC := "${@int(PRINC) + 5}"
+PRINC := "${@int(PRINC) + 1}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.7.6.5



