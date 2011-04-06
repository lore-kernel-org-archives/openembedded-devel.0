Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7VNX-0007tJ-Tv
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 18:14:48 +0200
Received: by fxm19 with SMTP id 19so1257921fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+KypO7jYIr9MlTN/8Da5PlDvNXA1aFOveKTxZkz6AYE=;
	b=JocTW5foGUCN78TdSXhvUphEulK3+9VovYuTEMi/p5GMJMduCJthoQOftp4YdPn2FQ
	uYd8AE6HPiVlam5xOxM33wZ1ZpdoFlrPFe+H8LHSYh82jocnST2JlcExL/oaqLtzQsGq
	iHVtDd9Mj92JPo/GzRT2WVHWTjlggZ1QTrLnA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MlOU2nSa4JEOMX4UwZlGpu359do9VrfnM7zsDvFa2q+aXg951SlXOYKCxn9JWEr9Dq
	KR4a91bF3czmkYagvXJDnnE42ZfQ/eVf3V5cwoOfFytJ9uuXHrv475XM4k5PPVEGlEce
	vk9iPKFzxUv5IWPYW/q/M2rAl4b2ZG7niGWBY=
Received: by 10.204.33.72 with SMTP id g8mr1060103bkd.3.1302106357380;
	Wed, 06 Apr 2011 09:12:37 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm468794bkb.10.2011.04.06.09.12.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 09:12:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 18:12:21 +0200
Message-Id: <1302106343-5331-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <ilt2d9$sr2$1@dough.gmane.org>
References: <ilt2d9$sr2$1@dough.gmane.org>
Subject: [PATCHv2 1/3] gst-plugins-good-0.10.26: move to obsolete
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
X-List-Received-Date: Wed, 06 Apr 2011 16:14:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/gstreamer/gst-plugins-good_0.10.26.bb      |   15 ---------------
 .../obsolete/gstreamer/gst-plugins-good_0.10.26.bb |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 recipes/gstreamer/gst-plugins-good_0.10.26.bb
 create mode 100644 recipes/obsolete/gstreamer/gst-plugins-good_0.10.26.bb

diff --git a/recipes/gstreamer/gst-plugins-good_0.10.26.bb b/recipes/gstreamer/gst-plugins-good_0.10.26.bb
deleted file mode 100644
index 9b8dc69..0000000
--- a/recipes/gstreamer/gst-plugins-good_0.10.26.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require gst-plugins.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e1ed191adbf81edff04f348f8ce8e198"
-SRC_URI[archive.sha256sum] = "ceb3bbea5ce18463b8fe470d34786bc846469e800305c436d799af9fe22bdcc4"
-
-inherit gconf
-
-DEPENDS += "hal pulseaudio speex libsoup-2.4 flac gst-plugins-base openssl popt esound libv4l"
-
-PACKAGES =+ "gst-plugin-gconfelements"
-FILES_gst-plugin-gconfelements += "${sysconfdir}/gconf"
-
-EXTRA_OECONF += " --with-libv4l2 "
diff --git a/recipes/obsolete/gstreamer/gst-plugins-good_0.10.26.bb b/recipes/obsolete/gstreamer/gst-plugins-good_0.10.26.bb
new file mode 100644
index 0000000..9b8dc69
--- /dev/null
+++ b/recipes/obsolete/gstreamer/gst-plugins-good_0.10.26.bb
@@ -0,0 +1,15 @@
+require gst-plugins.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e1ed191adbf81edff04f348f8ce8e198"
+SRC_URI[archive.sha256sum] = "ceb3bbea5ce18463b8fe470d34786bc846469e800305c436d799af9fe22bdcc4"
+
+inherit gconf
+
+DEPENDS += "hal pulseaudio speex libsoup-2.4 flac gst-plugins-base openssl popt esound libv4l"
+
+PACKAGES =+ "gst-plugin-gconfelements"
+FILES_gst-plugin-gconfelements += "${sysconfdir}/gconf"
+
+EXTRA_OECONF += " --with-libv4l2 "
-- 
1.7.4.1



