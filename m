Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tm3OI-00050e-Pf
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:16:17 +0100
Received: by mail-ea0-f172.google.com with SMTP id a1so1956999eaa.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 06:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=GIi4nbBzMqCvf/gZfQjCO3B/WjcYkyAJuIvCymrWUic=;
	b=Nv2IJo9BuX7PQ1PujKi2FO1HlqVLAORfukj3Zw8skohHgGSc+MkvkQDe9VYagf0GN/
	jzcTquhwPVkHmowjqi0zR0YxV678c0FXHUulFXR8aaA5oNo7SJKpAqdgIfztzPDbjLE8
	C3PzUC298Oib3lE7zvffRfNXJfCS6YbNup2w/kgWBrSUyjd45je46+gkQdhEMuzJIvV0
	kBF6PWDfcnvEJ2n96PMb3sG7qz1DddgkI+ug5sAzFRTU8mT0nJRQ3o64ditrAFwYTDQ9
	HJIKQXcnoUswd4E4gtL/8g72a3zwE5euktyRwQFkUlbgkT8XMWqnAgb5fzir7eo1w4Kv
	dN1Q==
X-Received: by 10.14.174.132 with SMTP id x4mr31633924eel.39.1356098473086;
	Fri, 21 Dec 2012 06:01:13 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id w44sm21810573eep.6.2012.12.21.06.01.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 06:01:12 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 15:00:50 +0100
Message-Id: <1356098450-27475-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkusZHh9u2yVwiJ5O4XiqpLr9DQcmzX4r852m1w/WT/twqgTHt30ya9wfOwhinLFXRvZC8/
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH 6/6] libav: update to 0.8.4
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
X-List-Received-Date: Fri, 21 Dec 2012 14:16:28 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/libav/libav_0.8.3.bb |   19 -------------------
 meta-oe/recipes-multimedia/libav/libav_0.8.4.bb |   19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
 create mode 100644 meta-oe/recipes-multimedia/libav/libav_0.8.4.bb

diff --git a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
deleted file mode 100644
index 66a32c9..0000000
--- a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require libav.inc
-
-LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-PV = "0.8.3+git${SRCPV}"
-PR = "${INC_PR}.0"
-
-# When bumping SRCREV make sure you bump PR here and in dependant
-# recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
-# changes
-SRCREV = "2fb4be9a99a2c2a9435339830e3d940171cc0d9b"
-SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.8"
-
-S = "${WORKDIR}/git"
-
-
diff --git a/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb b/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb
new file mode 100644
index 0000000..bed8ba3
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb
@@ -0,0 +1,19 @@
+require libav.inc
+
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+PV = "0.8.4+git${SRCPV}"
+PR = "${INC_PR}.0"
+
+# When bumping SRCREV make sure you bump PR here and in dependant
+# recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
+# changes
+SRCREV = "2c8ce46250ff78191fe6565876ddc4bc03fdf519"
+SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.8"
+
+S = "${WORKDIR}/git"
+
+
-- 
1.7.7.6



