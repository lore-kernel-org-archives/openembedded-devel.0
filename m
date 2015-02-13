Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id C3569733B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:17 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so9680185wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=M1q/YjXJiEy+pW8/seyKurx1MiLt1Gbc4kFqNnOZ3lE=;
	b=ZI/nC6Qp9gz25ZhAr70a4WbQQMkwfotVg3P0ENLnCgOXAl8IeVNw9XCEvFbFsTOiyj
	T+udTWFB6rFUHdkh0yh74AOELqsZ63Cx6gdTbRVVOzC4NcezvyB/jBckXTJ+ealPaern
	VhqC51hDx0wzgmokXl5oP+RtTzBO1jZhJzdmuwn3JottIoMicqOeMDlrKHB6iSlc3CHa
	P2LdTvH4Iyu8WWo+SQS4/aBVTAuRNPtwv69Vnf2EtBKMXn/QmPkRZbv5lnSaQAtnENg0
	IfTF6nDPXW0mCBbiuup0vbt3V/5AMIFXWXp45Ngx9Uos3SAFUCHLep5R8yZwjHa6r+sy
	UvVQ==
X-Received: by 10.180.86.201 with SMTP id r9mr4067555wiz.56.1423810938762;
	Thu, 12 Feb 2015 23:02:18 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:45 +0100
Message-Id: <1423810919-9857-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 05/19] xmessage: initial add 1.0.4
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kde-plasma startscript uses xmessage and it might be useful for others

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb
new file mode 100644
index 0000000..9960706
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb
@@ -0,0 +1,10 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "Display a message or query in a window"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=73c7f696a728de728d7446cbca814cc5"
+
+DEPENDS += "libxaw"
+
+SRC_URI[md5sum] = "2dd5ae46fa18abc9331bc26250a25005"
+SRC_URI[sha256sum] = "bcdf4b461c439bb3ade6e1e41c47d6218b912da8e9396b7ad70856db2f95ab68"
-- 
1.9.3


