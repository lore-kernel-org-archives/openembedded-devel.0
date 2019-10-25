Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 95EE17FA4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:30 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q13so1012527wrs.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gAQbqMA17O+gnzIXxmAx9lTkPiszFpyK+5oM0WQuSFc=;
	b=UhvzSCdVvX3bsYYUv6a6pKIzlIkPH7WRr+5RECwGPreuUEMAvXp57xDAYQM/fyyyW9
	N51WQsHoqcTZkd30OxZuvR1skFa8Pu3cfmU49btBl3srhJ+31eNOLrbdu3VV9T91C6iz
	r5Gy5e/2ncR5Y7yPWUZksflIXE9HbglP53Nzf8uYwUen+dbs7A6tHw311gPFTkrVKmnT
	ODAMdQkXTpnLyr6QLyJiR14IcAG/BpmdFrYTnEA0tRGNw1e5jU9Xx8Yt9tgKrtEKVpSn
	M4Ur9p6668WNqS/VvihnoQhyDPDLZE+7YXXCZeR1NzbgnROtigWOkgp3Sof/nLRcNCOA
	AZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gAQbqMA17O+gnzIXxmAx9lTkPiszFpyK+5oM0WQuSFc=;
	b=bXvLtV5S5PKbW5wRWgFuK/SfxMccpOg7ZY0pD7bTZ02iKfZsqWtKMOfSDuFj9kkkqY
	TsYO4mEwmav2DyqdbP4s72gWoW4NqP0coHxRX0j5/ynyuFRhT0dI6rD14t+xjGt55u6v
	idKTy5Z35gfL0DUaVUfvWBmw9TTUwhM+Ch78pNMNNjIvWu227trWQWNIiKS4En3rLkc3
	dP071W+TXcgdZXYv7vIPBuRU9vl8cYKs/vB4e/eVH/P45RB8bnwXSW5PR1UgOlzVZufb
	nV1KkulLDYFDGSesHLmVR/P+NdnNlzPO9sISgFp/n374QFb8Mzt4aqLyifb1eScsgu5M
	6c+A==
X-Gm-Message-State: APjAAAVifv70w8yltsQR74iFIlBxTsAoBTq3ouewkv57qbx015ZQJbmU
	nakOXcBUbYoTQ1ByIv7SWxnAVGBg
X-Google-Smtp-Source: APXvYqzWVB+F6AEEz61o7NL5dL4s6AvMJAwi/oTY26k20L7Z897nncvCYeeLmpWesOmHHdlFnyW++Q==
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr1360299wrs.363.1571988091145; 
	Fri, 25 Oct 2019 00:21:31 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:04 +0200
Message-Id: <20191025072113.11172-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/15] yelp-xsl: initial add 3.34.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Oct 2019 07:21:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependecy for upcoming yelp-tools.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/yelp/yelp-xsl_3.34.0.bb      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb
new file mode 100644
index 000000000..17994414e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "XSL stylesheets for the yelp help browser"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=3e2bad3c5e3990988f9fa1bc5785b147 \
+    file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
+    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+"
+
+inherit gnomebase gettext
+
+DEPENDS += "libxml2 itstool-native"
+
+SRC_URI[archive.md5sum] = "f8c4e777aee8b055251c333ef48a0cd0"
+SRC_URI[archive.sha256sum] = "e8063aee67d1df634f3d062f1c28130b2dabb3c0c66396b1af90388f34e14ee2"
+
+RDEPENDS_${PN} += "libxml2 itstool"
+
+BBCLASSEXTEND = "native"
-- 
2.21.0


