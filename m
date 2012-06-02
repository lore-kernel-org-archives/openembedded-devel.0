Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLd-00028M-5G
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:25 +0200
Received: by mail-wi0-f177.google.com with SMTP id hm14so1276602wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=2d8wAu0xLbdD00Aua9nBUTKjq1Z/Ik4mzhskqdOuXVQ=;
	b=JtezQwnwF1YklLr4QzAFPM+MnEfEPZexdJI3U0CjjkyNxFRJzcGlYkga8tsQxIEi8A
	ncab+eJ2ZgGYBK/HqfUnSHig/UnOKmE2e/hMNTIUgklXJeUCDk5Aj8HA00Ibyh8J9w1h
	9A88wBcySihYpBTANIbgF34DA9OlABDS97Z5+wfCAASyKhzUKsy27qOvcWYtrYpsE8Pc
	u4j6VDRUClKfloFzM/grzV0aZuGFeWP5HU9ICqdXKZgCVIpIEU7OKTcZJptCP+t+FK/k
	wZQKMzuH/KTXx9za3T9un2VOWLeHmror/cdt24W7Cvm32FMFv8j0dLqN0BamT7+wBllg
	ltGA==
Received: by 10.216.54.206 with SMTP id i56mr4671112wec.28.1338639125265;
	Sat, 02 Jun 2012 05:12:05 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.12.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:12:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:59 +0200
Message-Id: <1338639361-23775-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 13/15] xfce4-weather-plugin: Make it work for a while by using different license info
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Grabbed from [1]

This is a inztermediate solution until next version hopefully will use another weather
data supplier. There are proceedings ongoing [2].

[1] https://projects.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/xfce4-weather-plugin
[2] http://git.xfce.org/panel-plugins/xfce4-weather-plugin/log/

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../weather/xfce4-weather-plugin_0.7.4.bb          |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb
index d75d51e..202078e 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Panel plugin to display current temperature and weather condition
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+PR = "r1"
 
 inherit xfce-panel-plugin
 
@@ -9,4 +10,14 @@ SRC_URI += "file://port-to-libxfce4ui.patch"
 SRC_URI[md5sum] = "03c972d13eba5cd226432ff66e3ff282"
 SRC_URI[sha256sum] = "3f76207b8a845d15bfec6825bd5300aedd086c455259c4dd8670a89a3c8ab382"
 
+do_compile_prepend() {
+	# Switch to a working license key
+	# https://bugs.archlinux.org/task/26815
+	sed -i \
+		-e 's/^#define PARTNER_ID.*/#define PARTNER_ID "1003666583"/' \
+		-e 's/^#define LICENSE_KEY.*/#define LICENSE_KEY "4128909340a9b2fc"/' \
+		${S}/panel-plugin/weather.h
+
+}
+
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
1.7.4.4



