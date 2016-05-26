Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0335771951
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2016 08:07:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a136so2829696wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2016 01:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VqztNDvxRlcptH3hnZlzyuMn17r/auREcwm512dLirs=;
	b=Unn6ln4vk/mOprLx7D5V6Bjd/NXLOWg9RWEYKJSmaIA4oeL6rkPSeSRPnmwl8S+HIc
	kd8fEINQ66AUgI+U8xuOwa33auKsJGV0tLyxGxa4JOG3MA8Iif5gZjaWXmEZcGDb+2lP
	zsWVhYn/PD6gAg58a+mJehdEc7FYTuWmy9hUGHb8q+xK6KSnWl/uI5CmEPpCEb1LqKue
	WTHx8Dr8ZFYyl1tWDPN/7mSZm0hoqBmjF5tdjz5nR7DWn7j5ihuxiWdcg/DSFZ/KMeY1
	BXdlqAAl8zdfx5Fl/PTk2vmIZUNaIg6+cfVge0prCojqY1FMVD28nyXYVRV1i8t3TmNn
	7F6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VqztNDvxRlcptH3hnZlzyuMn17r/auREcwm512dLirs=;
	b=ZiQFEs39cbPK8VNSDO/Gb1k8VggS/+KrZ5oDvyyTWFh9PbKIuTXyAVe+4k5p5K5b9k
	pxCliK0q8z5gVXjiVloNpFtn8/yeUtOMVJkJU4Ih0iXaT6JbkbMgz2GDubivuyFy0iG3
	E8jofIQgqx9YRi4dg4OgeqtQX+9wX1HkhDJpE+3TlBZjT4uuJ1DiUD3hLbDmnhn/f+P+
	Z8oS9OlwocLuVpcocuWUzUBYFEPjZA5jvegzM1zNGcvyJAAYqhYLhg1sRG1vtEOCuXX7
	MJjTil+FdfTz7ewq/AdH+xnI25y2YRuU2a6CfwcpWw9eg9FHIxtOTdJPErq4XbXWNxEC
	C/oA==
X-Gm-Message-State: ALyK8tLvNrKMzmMeaYwR63p1ihZYN5vsaXen+6rZNMn9IOki7TXBIhSyTXmkF17ZT96BuA==
X-Received: by 10.28.45.200 with SMTP id t191mr2189267wmt.40.1464250065240;
	Thu, 26 May 2016 01:07:45 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2F80.dip0.t-ipconnect.de.
	[91.10.47.128]) by smtp.googlemail.com with ESMTPSA id
	d7sm2173167wmd.11.2016.05.26.01.07.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 May 2016 01:07:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 May 2016 10:07:31 +0200
Message-Id: <1464250051-24295-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] geany-plugins: fix build
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
X-List-Received-Date: Thu, 26 May 2016 08:07:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| build/cache/glib-gettext.m4:39: error: m4_copy: won't overwrite defined macro: glib_DEFUN
| build/cache/glib-gettext.m4:39: the top level
| autom4te: m4 failed with exit status: 1

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
index 08f79bb..9a39150 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
@@ -11,6 +11,10 @@ SRC_URI = "http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "31e4aa4b771a4ff8ccfd74efe7ba7b44"
 SRC_URI[sha256sum] = "03195a0b7a361ddb2ee4138f46fa87b6d9b9801ff00657456ab9c8b8908c0ce0"
 
+do_configure_prepend() {
+    rm -f ${S}/build/cache/glib-gettext.m4
+}
+
 FILES_${PN} += "${datadir}/icons"
 FILES_${PN}-dev += "${libdir}/geany/*.la ${libdir}/${PN}/*/*.la"
 
-- 
2.5.5


