Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id D0DDB76DF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:47 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so2877944wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=mSx0YoTOaVPzriccPKLsi/XeTjH4EP0BBFtZnCErSsU=;
	b=NfypPxtQQpd3mN+IMM82QzEmNfgvXSgoIGa/LosNGAUwPzbwFzLl4X6UgAKmSpt3pL
	1DHjo/Eze1G/QeB2lhMwuKrNsiTTig7baVTlz3tFl//HhMaX9b9ft9P9hWce9Q0YMI7N
	l+auHeA8ieNjs+2q3QHGjAF5NjQFqFoTFje4P2TdDSQq8UIe9pQapgOghy9TL9gfJj33
	eMHUSKvPIH5uIxnYm3vw2zvWjq2Ip3UTq3JGvN/6G1CEsW9D0MjZkIaJlQrIa6NiZSR9
	MwtlLMwLTWcAzN846rFRnYw3E4rqhfxRS82/LgsnWLsTK0j47m7Tq8AHBRdijUUcjgPQ
	TUBw==
X-Received: by 10.180.76.232 with SMTP id n8mr24833695wiw.72.1442450507942;
	Wed, 16 Sep 2015 17:41:47 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:18 +0200
Message-Id: <1442450491-14912-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/19] libgudev: initial add 230
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libgudev was splitted out from systemd into a separate package

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-gnome/libgudev/libgudev_230.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/libgudev/libgudev_230.bb

diff --git a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb b/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
new file mode 100644
index 0000000..5f847ad
--- /dev/null
+++ b/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
@@ -0,0 +1,11 @@
+SUMMARY = "GObject wrapper for libudev"
+
+SRC_URI[archive.md5sum] = "e4dee8f3f349e9372213d33887819a4d"
+SRC_URI[archive.sha256sum] = "a2e77faced0c66d7498403adefcc0707105e03db71a2b2abd620025b86347c18"
+
+DEPENDS = "glib-2.0 udev"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+inherit gnomebase
-- 
2.1.0


