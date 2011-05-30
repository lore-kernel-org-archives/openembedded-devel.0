Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3ul-0007v1-KQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:57:55 +0200
Received: by ywg8 with SMTP id 8so1597173ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=8hKNZK5QGD9jPEZHdhsMWiCSSa0RxpT3nKUQpxpfAlw=;
	b=tdoarYbRFRtmjV5Al7aJbQYMVE0DZop8WNPOlZ7106Isx7ch6L1f7ux/tvu2i0PnJ6
	xuI3GN5ivsYCum+lsBt5z1xYz2ggFjJp/WugvbgFyiDLJKkbzLPJnGEjbvygI1+Yq/pF
	7qkA3IJ03p/Acst0gmNqu85x2ODYyYBOYlj4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=aVGZnSdq8K3lT0uT8SNnEn70smhdNNc2ZZFqhZJFcSkN9pmjW7QXpQ85PyTPtKH2pK
	PgzjGdawSa0PUDwTyl7Btitz6Ji61EI8F4x3tO4RShg7Fm4Io8DTCOFnoCyFUuS4IcT7
	ReCJELk9Zl632uW76jcxmlLtM9c+RRGBqrSeM=
Received: by 10.236.136.196 with SMTP id w44mr6048525yhi.229.1306767286279;
	Mon, 30 May 2011 07:54:46 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.54.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:54:45 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:10 +0000
Message-Id: <1306767263-29895-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 04/17] xserver-xorg (1.9.4): enable xephyr
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
X-List-Received-Date: Mon, 30 May 2011 14:57:55 -0000

---
 recipes/xorg-xserver/xserver-xorg_1.9.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-xorg_1.9.4.bb b/recipes/xorg-xserver/xserver-xorg_1.9.4.bb
index 89e7a03..cc2dc43 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.9.4.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.9.4.bb
@@ -6,7 +6,7 @@ require xorg-xserver-common.inc
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
 PE = "2"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += " \
             file://dolt-fix.patch \
@@ -25,7 +25,7 @@ do_install_prepend() {
 PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
 XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
 
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
 EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
 
 export LDFLAGS += " -ldl "
-- 
1.7.1



