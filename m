Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UT7aG-0002Fj-4Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 11:26:24 +0200
Received: by mail-ee0-f53.google.com with SMTP id d17so967543eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 02:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=Bn2T4DY2vRBE07WQNZlfPK9jn+p1BmRHQdsw4MXK3FQ=;
	b=pXere7s1wUYX1vaym4Hv4qQaxQqHS2tIY8lJHeqhPrFH3YAuzzOswQaZPKh55nG/JU
	4mmogA2DNt8YZxLHk9MH175HL+c4ig1ua5xBEchK8HL0ESEJwfw36r6Hs5ygeNgJcMOX
	XTHtIIWYPo1CtICMCEhgzM9cc+iUv3JTDYemDxEh5mWMA8tLt5g0vRx8nd7Ke9FyADkT
	RAsctfR4KmV06JwyZARaw1Kox+IizFEBJn+u5rbDOs2IFqd8umB3vT3d1GDMdevn3Myg
	Jc3aJlk4NPJKBe76oNIWoJvGeeGpDgjcCk/EKcWbb7NyDwUnw79i9FhQOPRRHljJS0L4
	QWCQ==
X-Received: by 10.15.95.74 with SMTP id bc50mr14943386eeb.36.1366362525952;
	Fri, 19 Apr 2013 02:08:45 -0700 (PDT)
Received: from localhost.localdomain (p5B0A1D5F.dip0.t-ipconnect.de.
	[91.10.29.95])
	by mx.google.com with ESMTPS id cd3sm21485104eeb.6.2013.04.19.02.08.44
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:08:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: eric@eukrea.com, denis@eukrea.com, otavio@ossystems.com.br,
	openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2013 11:08:34 +0200
Message-Id: <1366362514-25467-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH][meta-browser] chromium: fix icon location in google-chrome.desktop
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
X-List-Received-Date: Fri, 19 Apr 2013 09:26:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../chromium/chromium/google-chrome.desktop        |    2 +-
 recipes-browser/chromium/chromium_24.0.1312.52.bb  |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-browser/chromium/chromium/google-chrome.desktop b/recipes-browser/chromium/chromium/google-chrome.desktop
index d29fdb2..0b639a9 100644
--- a/recipes-browser/chromium/chromium/google-chrome.desktop
+++ b/recipes-browser/chromium/chromium/google-chrome.desktop
@@ -107,7 +107,7 @@ Comment[zh_HK]=連線到網際網路
 Comment[zh_TW]=連線到網際網路
 Exec=/usr/bin/google-chrome %U
 Terminal=false
-Icon=google-chrome
+Icon=/usr/bin/chrome/product_logo_48.png
 Type=Application
 Categories=Network;WebBrowser;
 MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
diff --git a/recipes-browser/chromium/chromium_24.0.1312.52.bb b/recipes-browser/chromium/chromium_24.0.1312.52.bb
index ab0fb4b..2827cc1 100644
--- a/recipes-browser/chromium/chromium_24.0.1312.52.bb
+++ b/recipes-browser/chromium/chromium_24.0.1312.52.bb
@@ -13,6 +13,8 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
         file://google-chrome.desktop \
 "
 
+PR = "r1"
+
 # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
 COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_i586 = "(.*)"
-- 
1.7.4.4



