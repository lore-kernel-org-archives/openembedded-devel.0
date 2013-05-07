Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrr-0003cB-LG
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:22 +0200
Received: by mail-ee0-f53.google.com with SMTP id d49so594019eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=8Zla1gfWl680wc2z3nkUIS2iSrNMnFLIiH+ipiptde0=;
	b=g4pj3zAq3B1jmteb5rkmVJ9YYkRAFRPc1j8uA4fDM5ZaZXM+GvUEdXTcJhbfV4/YPh
	+a/81TLfGwGOKIQpUu+ORBKSbwRCIVKXzDL52r1UXCAUA7aaaGURbxdgddSpl+qW/qti
	QwkP6FyEc/PvvyMsVAIdlA44506LHNktQS8mpUHnuDkNqenLO7FPH/zVEvI89gOnwhId
	8csnuLneg1rR0cY/Y4gFBcMAvVhZgB4w2kVc1L1IJELiTaD1S3ArPnSCSOOGKHOqS8sR
	cuaqCqWBKtpZ5FRIhhgTUdyrywYgWc3LxK+H/w4JCoT+nie4aRpGK72pHWeh/6/7LmGy
	MUEg==
X-Received: by 10.15.95.74 with SMTP id bc50mr9973524eeb.36.1367966538499;
	Tue, 07 May 2013 15:42:18 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:46 +0200
Message-Id: <1367966513-12566-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 08/15] poppler: update to 0.22.3
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
X-List-Received-Date: Tue, 07 May 2013 23:00:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{poppler_0.18.4.bb => poppler_0.22.3.bb}       |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.18.4.bb => poppler_0.22.3.bb} (85%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.18.4.bb b/meta-oe/recipes-support/poppler/poppler_0.22.3.bb
similarity index 85%
rename from meta-oe/recipes-support/poppler/poppler_0.18.4.bb
rename to meta-oe/recipes-support/poppler/poppler_0.22.3.bb
index df26c03..660bc0e 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.18.4.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.22.3.bb
@@ -3,13 +3,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "12658f3308597e57f3faff538cc73baf"
-SRC_URI[sha256sum] = "33421148cdc8e043da291dece2cce1cea6220d49a50c00c56d56d6435501d42e"
+SRC_URI[md5sum] = "be915388eaad6865cee5a156c8119ec1"
+SRC_URI[sha256sum] = "916a931cbef951366014f13d5f4a574657ccc064ac41051df96dd58e22934431"
 
 DEPENDS = "fontconfig jpeg zlib gtk+ cairo tiff lcms"
 
-PR = "r1"
-
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "\
-- 
1.7.4.4



