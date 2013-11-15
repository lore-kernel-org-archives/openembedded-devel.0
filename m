Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5456D742
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 20:45:20 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id r15so1226827ead.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 12:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=bjlgQlJR9qJO7LFNOpk/X1Btl10FyLdwY8/Dz2bFd+8=;
	b=mp3MznmzPSW6qvNjE1cBWL9sPNCv4F5xGDceP6+1hsU+jYIyc2FMRZxi1cWGFw3KO+
	1jn+489NGHgVAZXqvhcrpNpqawKTqQrWyK//+NKbtcebCxkKGuZQ9YnXPwHSSL5PxovT
	qkEe3TcZMa6In1o1j7Zkm4USYnJcMR+oZpcTJz54Wz7vT3NP+tJIjM8eO+db7K3y1Z55
	5qzgTqBtOmv3nkCpJ8xiHExBHqzq+Z2MSSfw4KHfmEkrkY73EJNTXZi6xi9rL+nV7wf4
	WI7+BSs9H/xOkrfr4cBuT39gXRFX7G3SnE99GSJvlxqOGTTTnFiVa0nd9JyIU41R7WwL
	1SZg==
X-Received: by 10.15.111.196 with SMTP id cj44mr1559329eeb.94.1384548322052;
	Fri, 15 Nov 2013 12:45:22 -0800 (PST)
Received: from localhost.localdomain (p5B0A2F0F.dip0.t-ipconnect.de.
	[91.10.47.15])
	by mx.google.com with ESMTPSA id m54sm9752664eex.2.2013.11.15.12.45.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 12:45:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2013 21:45:08 +0100
Message-Id: <1384548309-29331-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libmpd: sources have moved from sourceforge to musicpd.org
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
X-List-Received-Date: Fri, 15 Nov 2013 20:45:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
index b58a4fa..ec48b2c 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://sourceforge.net/projects/musicpd"
 DEPENDS = "glib-2.0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.gz"
+SRC_URI = "http://www.musicpd.org/download/${PN}/${PV}/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "5ae3d87467d52aef3345407adb0a2488"
 SRC_URI[sha256sum] = "fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83"
 
-- 
1.8.3.1


