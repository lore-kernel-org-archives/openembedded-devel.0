Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHGTV-00026m-Vy
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:25:50 +0200
Received: by wgbdr12 with SMTP id dr12so3503052wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=8C4drgpieX56IjReG8S54UtQfv+jeIAVNzMc+kviI6g=;
	b=FbvfAs1KV3fch68Hox7URfLnqczTwQe4Ryi9FQWZOE0EydmRW4ODm64Q3yp+QxIOQX
	WH87WAl2h46qvKMS+eKGOCkzOlJBe40r8uZBEPq/BAt6AMeHeGsHHNPXeZ8iDoTP/IC5
	XxgxZP7XfPLzPDa12lae0Y0UVSGPs7UlQGXs/pkoxuVSYXjP4dVpAtqc6g06px+RhQoQ
	cayir7YqBZ6MHVn1GesQXPkknm80H87EInRjKw+lMGFTzYrDB225MS5ePUO57/JhIhNL
	69vzHUxQaYy6lgZt7BU+Z9FP/JmvPBPcUQdZJgfvHgJ/mKCTXH3p9Yy4wzQoFUD13+zV
	Z7gg==
Received: by 10.180.80.104 with SMTP id q8mr16586902wix.14.1333984593604;
	Mon, 09 Apr 2012 08:16:33 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id h8sm50109939wix.4.2012.04.09.08.16.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:16:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 17:16:12 +0200
Message-Id: <1333984573-28464-9-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
References: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn2rjnPLPmFr9JHIGvdETLAu1GAbdr7PGQZvLHpzXmyLNjs5SQfyoXWLZrtm30BskMIWCEB
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 09/10] xbmc: update to head of the Eden release branch
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
X-List-Received-Date: Mon, 09 Apr 2012 15:25:50 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/xbmc/xbmc_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb b/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
index 751d9ca..459b571 100644
--- a/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
+++ b/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
 DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib"
 #require recipes/egl/egl.inc
 
-SRCREV = "14feb096bcea1e434b5ab23888d6a4c62240f6e0"
+SRCREV = "1d975a04c6686b9a82f63a4c605a5c5c5f84d0e8"
 
 PV = "11.0"
-PR = "r12"
+PR = "r13"
 PR_append = "+gitr${SRCPV}"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden;protocol=git \
            file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
-- 
1.7.2.5



