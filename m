Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TzUbm-0005ts-G2
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 16:57:36 +0100
Received: by mail-ea0-f176.google.com with SMTP id a13so838867eaa.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 07:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=DVG8OgSk2De9ljuMxX101puwEJWwS7jrjIZE3Ril7OA=;
	b=Hc1/u51sICyfveRfzAHbcCnXTXNjUssRZ5RqT1cvVlqD/jQumEtzwZhKP8324b0NPl
	7pZg+55XEJ5qCQ6Kxri/Io2HP2FuUGW/zLG+AD66M0l8jZHzBAOsZsVrIzHiVCdJjnXP
	CoaDV0RkVwzvneXXp/tjcBl+HIizbPSC+LZ9F/bYb6od/PP1tnmnOk7oZZErkoAgabfi
	T+5Iyzwz2LhoI1XRoMYwGDoVjXNjYlL/sj9/fgtpntXn+YDuhVRXUjDlMvv+WgqKQjdu
	G/1Zk/SEy2T/IP8zh26kRHYbZoNHTAWoMMjMqNRGhl8YrAciHRujGV2VXcEh4ny3quyE
	GUug==
X-Received: by 10.14.198.198 with SMTP id v46mr27127224een.4.1359301309264;
	Sun, 27 Jan 2013 07:41:49 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id q5sm11876147eeo.17.2013.01.27.07.41.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 07:41:48 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Jan 2013 16:41:22 +0100
Message-Id: <1359301282-5470-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
References: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQll208xXsVu8ORD/oOkHz23eFk6NOD60UlfUyDyMWxgkqDgzQc7kcbCK5es8s1poqBhOUh/
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 7/7] python-smbus: add 3.0.3
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
X-List-Received-Date: Sun, 27 Jan 2013 15:57:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-devtools/python/python-smbus_3.0.3.bb    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb

diff --git a/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb b/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb
new file mode 100644
index 0000000..5ba24c6
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-smbus_3.0.3.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Set of i2c tools for linux - Python module"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://smbusmodule.c;startline=1;endline=17;md5=fa24df321a520ff8e10f203425ab9fa8"
+
+SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2 \
+          "
+SRC_URI[md5sum] = "511376eed04455cdb277ef19c5f73bb4"
+SRC_URI[sha256sum] = "23b28e474741834e3f1b35b0686528769a13adc92d2ff5603cbda1d6bd5e5629"
+
+DEPENDS = "i2c-tools"
+
+inherit distutils
+
+S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
+
+do_configure_prepend() {
+	# Adjust for OE header rename
+	sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: Module.mk
+	sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: smbusmodule.c
+}
-- 
1.8.1



