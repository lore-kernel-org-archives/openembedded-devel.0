Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T4oRS-0001GS-Nr
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 09:36:30 +0200
Received: by wgbdr1 with SMTP id dr1so1000902wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 00:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=FAcUkUB3goIH6/xiqkLzo4sE1sAYFDs0zWQAKVyob5A=;
	b=nthvsiub/Ir4HAkzNFEBAGpnD/ZUGhBWkV/l53N8t3duJCFdV7JGvPSvSVO01EvY5j
	VES/WCyJK9rMVVJoLXUKAEVjeyGD6BVsgK5BGgyvyw2RTfLyEsSMsS3HJw8pSKjaaTF6
	5+AY8Bu2w5tly7KisOhT9XnbR0trUzSuJkyv6xwtJATc1o3KPJcpNMOMyfhlVq0iCSWd
	/eeTvoiovdGRgsF4uoQpEdTpB6vuEX/7c8R7kOkj/hhbZCXgVD3XKO5CiAydySocDImw
	Mvn0V97LnyEBL1ZuSqDrzIr3kagymgy3pEdlmuERBcaWZSo4KiDxPDFboIhJWcIh2Pnn
	uUBA==
Received: by 10.180.104.197 with SMTP id gg5mr3255645wib.9.1345793063715;
	Fri, 24 Aug 2012 00:24:23 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id dv1sm4462286wib.10.2012.08.24.00.24.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 00:24:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2012 09:23:38 +0200
Message-Id: <1345793018-4843-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1345793018-4843-1-git-send-email-schnitzeltony@googlemail.com>
References: <1345793018-4843-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] busybox/meta-systemd: follow oe-core to 1.20.2
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
X-List-Received-Date: Fri, 24 Aug 2012 07:36:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...box_1.19.4.bbappend => busybox_1.20.2.bbappend} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-systemd/meta-oe/recipes-core/busybox/{busybox_1.19.4.bbappend => busybox_1.20.2.bbappend} (96%)

diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
similarity index 96%
rename from meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
rename to meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
index bb11550..a0ae2ce 100644
--- a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 1}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.7.6.5



