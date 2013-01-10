Received: from mail-wg0-f51.google.com ([74.125.82.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TtL9z-0004Wu-KX
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 17:39:20 +0100
Received: by mail-wg0-f51.google.com with SMTP id gg4so342841wgb.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 08:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=2w3+7a/UhLxalC8lcX8sYJHzleX7YQw556b2Warr+v8=;
	b=ySt5TOVPyxOncDgZu/QN6+oayaqhlHkhSh/wmTAvx5eyFkRWGwCwfKHwlW/9kc43My
	k+15Qe4kIZOX2VjlLL/UXq+XWFsY4eol+VTE4Z68ce+9Bhw+ZqmzHo2eYLTJblQJw3LM
	S8auAM1MrRfPctB7N/ieiswLKz0pv5/HsWWBjPHTa5lXC2ObdmeeyEc4EwqEtsmmH9as
	Pm7LEoyOYnLZxoQM16DV8vJEd3/EIlvQOiNd+5TkFkAH76I/zXC1+SU28DX9AwvqHSb+
	VXQUT7Hh3F6a88H2iWJK6wIQG0fQZO0L7tf9NZCUg5P7GnBbaLvFm0sbM26FTXmUphLV
	KqVg==
X-Received: by 10.180.78.137 with SMTP id b9mr10220227wix.30.1357835046297;
	Thu, 10 Jan 2013 08:24:06 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id g2sm3028792wiy.0.2013.01.10.08.24.03
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 08:24:05 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 21:22:39 +0500
Message-Id: <1357834959-9937-2-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357834959-9937-1-git-send-email-fahad_usman@mentor.com>
References: <1357834959-9937-1-git-send-email-fahad_usman@mentor.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Eric Benard <eric@eukrea.com>
Subject: [meta-browser][PATCH 2/2] chromium: fix dependencies
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
X-List-Received-Date: Thu, 10 Jan 2013 16:39:21 -0000

* fix dependencies to build chromium package successfully with current state
  of OE

* add native support to libxi

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes-browser/chromium/chromium_19.0.1049.3.bb |    5 +++--
 recipes-graphics/libxi/libxi_1.6.1.bbappend      |    2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 recipes-graphics/libxi/libxi_1.6.1.bbappend

diff --git a/recipes-browser/chromium/chromium_19.0.1049.3.bb b/recipes-browser/chromium/chromium_19.0.1049.3.bb
index 22b141c..6744ee1 100644
--- a/recipes-browser/chromium/chromium_19.0.1049.3.bb
+++ b/recipes-browser/chromium/chromium_19.0.1049.3.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Chromium browser"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3cb55cc4ec38bb01d2ceaaa66b5436c2"
-DEPENDS = "xextproto cairo nss gtk+-native zlib-native libxi libgnome-keyring libxss cups"
+DEPENDS = "xextproto cairo nss gtk+ gtk+-native zlib-native libxi gconf udev \
+	libgnome-keyring libxss cups cairo-native libxi-native alsa-lib"
 
 SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar.bz2 \
 	file://include.gypi \
@@ -16,7 +17,7 @@ COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "0cdd94b2be21180af93f719e9a9a2883"
 SRC_URI[sha256sum] = "3bdce0bd8381cd699014e7ec72ab02c7d8444ba511c27afff76bf015361c4021"
diff --git a/recipes-graphics/libxi/libxi_1.6.1.bbappend b/recipes-graphics/libxi/libxi_1.6.1.bbappend
new file mode 100644
index 0000000..c90046b
--- /dev/null
+++ b/recipes-graphics/libxi/libxi_1.6.1.bbappend
@@ -0,0 +1,2 @@
+PRINC := "${@int(PRINC) + 1}"
+BBCLASSEXTEND += "native"
-- 
1.7.9.5



