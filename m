Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC9CD771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n3so16811468wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5eoIBSK5YLzcFqGEajpkqNR0oxEOXNAp2IdZtbcxn00=;
	b=V2FvgKEU5l1cyJMyfY7Jg/pGXumhhyIhONTT3U1nzfB0M6YqcN0PGLjvCu5y7SlUo/
	mgPIEEd3b4fINv5pqeCG8efVR5n4egcemHM3HLdz2O96enkvx23lz6lcB5Oh0TR0I2FR
	cfpP56uDVrkwOYuXVgzMRIClLiOJrnC1GVv9f+DQf4MGWGfJUnEF2Zux0qmNF2PiuWaB
	BbFuzSDQ/35iGC8tiLcZsOxMjZJPnsxMUG5z+8DhbOQC8XZsdaIhJI012/LC4j2Lh8vt
	/qNFxBK/ChVDaIjJD21LOd5rmu+UXfaNxgnOAXti0lIVBztHgW90Gs/A+3ZifFkLz/I3
	yVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5eoIBSK5YLzcFqGEajpkqNR0oxEOXNAp2IdZtbcxn00=;
	b=UYBB4rOCgbQVUWxg/12XutmbaSI3jx6kd3Fl9xZMXGidjfHMYR/0NQY6nUTtYDkT4o
	BPfSiWzYWTApJ7TNRFnxH4MjjNRrqU/jyYFZzRWSjVnGw/KnJrQD7TyhedRtR9f5Agqm
	pHsBpMbcuLUaOYfj8dcS6aLK6QbXdzKPcQ/vY+7DmIvi9Jh+IgCxkNth6PLokWCRGhke
	gC8TbdAAKf5iRJrxJ4ywyhC3GdIpGkWUbRogMUat9uGLtkaBz72WuVsnZG1weFzinluH
	0St2dGxZdrUdtgyLWlGDvu87wm4AfjkHQaAOpYNeoZ+AXIvk0fQ81h4NCoGjxBXxxwJ0
	vt8g==
X-Gm-Message-State: AD7BkJLARYUO6Zww0k+jgcMH8oZzYpnRuvqRbze2fL7e+PJdwLEsdCpYoVWACaHs5uTybA==
X-Received: by 10.194.248.200 with SMTP id yo8mr20116859wjc.38.1460317307651; 
	Sun, 10 Apr 2016 12:41:47 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:00 +0200
Message-Id: <1460317290-4787-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 01/31] qtbase-native: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 057edd4..0dba556 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "41706400f605524a5a9953714aa0cfbf811dba7e"
+SRCREV = "d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b"
-- 
2.5.5


