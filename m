Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T4CdC-00073L-DL
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 17:14:06 +0200
Received: by pbcwy7 with SMTP id wy7so1530473pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QtGzPwownLcSuCQtsOd9IK8N+yFoZzmWz2FUbLsdFWE=;
	b=lQISfo8OCbVYbH30JZ90E+egfRRzd0q2Q/x/XBP8C+z2XJwIkzZmHaI2iZF5+Um4xA
	y161AwwWrMm2mcSUFdHTB1HcGOqVS0IhFUCztZgwvQmfyyaG6fmInqImVbBK0jSe2spD
	wJZr3TeKiNaxoN2UAGLWTxQAs5J5e3s2O1+9tcRq+tr9YL7dLf8RKVNjrWkAiJ4Cn7Ok
	DO6GjIMUu38EU8wAvWWZstQ3GIRhHOwm2/9sExmipqooz+a00+m823WxDSRoxqoJySPc
	ok+viDTuDVYa5INjJZQccLz+D+LRbB4n48R13Idc2ZgiBpP5RiNEXVzkmAsaef7iT3zO
	WKqA==
Received: by 10.68.238.166 with SMTP id vl6mr52997359pbc.96.1345647720605;
	Wed, 22 Aug 2012 08:02:00 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id qp6sm3866364pbc.55.2012.08.22.08.01.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 08:01:59 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 08:02:19 -0700
Message-Id: <1345647739-14002-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH][meta-oe] ipsec-tools: use a correct LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 22 Aug 2012 15:14:06 -0000

From: Christopher Larson <chris_larson@mentor.com>

The current LIC_FILES_CHKSUM checks the FSF copyright/license from the
*generated* Makefile.in, which has nothing at all to do with the licensing of
ipsec-tools. This is about as wrong as it's possible for LIC_FILES_CHKSUM to
be. This fixes it to use one of the headers from libipsec instead.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../ipsec-tools/ipsec-tools_0.7.2.bb               |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb b/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
index 270d77e..255246e 100644
--- a/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
+++ b/meta-oe/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
@@ -1,6 +1,6 @@
 require ipsec-tools.inc
 
-LIC_FILES_CHKSUM = "file://Makefile.in;endline=14;md5=c73d05590728997bfbab5c671ed38366"
+LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7ff40beff19fe6bc6aef26bd2b24"
 
 SRC_URI += "file://ipsec-tools-install.patch"
 SRC_URI[ipsec-tools-0.7.2.md5sum] = "72861f005746ee27984b2ee715ecc629"
-- 
1.7.9.5



