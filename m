Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2ADM-00043g-Cw
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 01:47:19 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so2939910eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2013 16:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=6XvWc4qCMjhPrgreLGcDK35kBkUv2unRvZjoiUIDdfY=;
	b=i0Bmo4JXqnOtf268Z7mdDQH0ADK5biYSOraJLSVEfJSKOFYsf1hUC22u9kPELJCkqT
	7BNP3+Tz3yNChvapvPWFptc8rowrPy4fEcCSUR4KAcDuL4edZCA4en/9wu/xaUYHfoYK
	+oeOeg9wSTPO2b3hubw1CAptIJm3aflRjLE/J2g3uYvW/VEfqUK31rJD1DRpaVxkvjM3
	5WgT/EmRMnFsNuewPHjD+HAapK+5wrrKKzE0Nwo5GNooVd1Ez+SpVkILDGFy/qqQ0gTT
	GtsA+QyM/yI0PhrFkQCl8MR3jxBYV2wUEgyYdod/YmO/jwVXu3HlitYhjvdk31Y3HVhm
	xvRw==
X-Received: by 10.14.198.198 with SMTP id v46mr65665493een.4.1359937889029;
	Sun, 03 Feb 2013 16:31:29 -0800 (PST)
Received: from localhost.localdomain (p5B0A0847.dip.t-dialin.net. [91.10.8.71])
	by mx.google.com with ESMTPS id j46sm21263378eeo.3.2013.02.03.16.31.27
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 03 Feb 2013 16:31:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 01:31:12 +0100
Message-Id: <1359937872-26028-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 4/4] orage: initial add 4.8.4
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
X-List-Received-Date: Mon, 04 Feb 2013 00:47:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/orage/orage_4.8.4.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/orage/orage_4.8.4.bb

diff --git a/meta-xfce/recipes-apps/orage/orage_4.8.4.bb b/meta-xfce/recipes-apps/orage/orage_4.8.4.bb
new file mode 100644
index 0000000..9905987
--- /dev/null
+++ b/meta-xfce/recipes-apps/orage/orage_4.8.4.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Xfce Calender"
+SECTION = "x11/application"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+DEPENDS = "gtk+ xfce4-panel libical"
+
+inherit xfce-app
+
+SRC_URI[md5sum] = "d5105981a9d77ed22be42615d70f3cc0"
+SRC_URI[sha256sum] = "b19df727da9da48b979e238ac7113c803976de80bd1e2dadf6d84b864956dfd5"
+
+PACKAGES =+ "xfce4-orageclock-plugin"
+FILES_${PN} += "${datadir}/dbus-1"
+FILES_${PN}-dbg += "${libdir}/orage/xfce4/panel-plugins/.debug"
+FILES_xfce4-orageclock-plugin = "${libdir}/orage/xfce4/panel-plugins/xfce4-orageclock-plugin ${datadir}/xfce4/panel-plugins"
+
-- 
1.7.4.4



