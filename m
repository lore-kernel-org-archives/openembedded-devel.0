Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBBB60167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:12 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x12so4897543wgg.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=3MVQUUwnEg0sXM0yV+x0x02z+xVS2C/IPevxiJZ0pkk=;
	b=UenOnQsodqZDZkBZTnxBOx3oO5ydC17TBYDddL3VbZbotKfbJ0K83caC3veai3R52m
	IQg0hohOGw4MU9Zhg6tQxLjx75JkaucABiJ1SvT+wvass4Y8dNGa/T7ccwLY/++j32uN
	8BudOW6BHGXDY5JMqTYhYhrTUNAhfrpRBEEqGJs7f/egbmVs6r4SVugLJcGKu1Nyk8nB
	iCqWuELyuchPoo9UoHRsv40DnFp6Fo2t7JP7ZKK/5sS70Q+GKC5ufYaH5PH9Jpk9Bngo
	m66oVRVKZVdhapSXSu/C652j0M9ZW4fUsvwC21TRnwRO3Yi9GWQZIeJ80b2Eot166ZAj
	7oWg==
X-Received: by 10.181.12.5 with SMTP id em5mr13367065wid.84.1423810933519;
	Thu, 12 Feb 2015 23:02:13 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:42 +0100
Message-Id: <1423810919-9857-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 02/19] libqmi: initial add 1.12.2
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
new file mode 100644
index 0000000..789692b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "libqmi is a library for talking to WWAN devices by QMI protocol"
+DESCRIPTION = "libqmi is a glib-based library for talking to WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libqmi"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+"
+
+DEPENDS = "glib-2.0"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "5b3b6b37a57e2fa828fd4cb6f86d7a9f"
+SRC_URI[sha256sum] = "d1661d73b510482b29b93b7e396756c433d35360b3d44c72afa7921339a98624"
-- 
1.9.3


