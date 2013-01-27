Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TzUbg-0005tj-O1
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 16:57:24 +0100
Received: by mail-ea0-f176.google.com with SMTP id a13so808054eaa.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 07:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=DIFr5wYtqXHfgEZXfD49QhVri92ERJJkv4igRgeCQQM=;
	b=ct8gqe3kkuQEohWHQabWSPNsoE56VlpuhFAO+qg7uN9NUV7pZBT3pHGMTY6+gn60dy
	Z4xI8aRh4WsZg9JubEg0BJMdHl+Pg6QRpq960sYHC6fcz2f+dJDw6SY2eGV+ULov2dKT
	FcwhtM4O0oBUINWgRMp8J1TmFjdaFGnWtUAVKNBcznyjhstuF61XF4MjFqPjKbp0tNS6
	slEDtcZloTOpwqfDaIllGk3AGoFIIfvW+UwMksl+CcGAougpl+Mf0AVHQ8MQrqCw1J8Y
	jWfJcIkak0RtsvmusSmFZDz1GYJH+VGeVEv+Sm5XYKf4nTyQEsC/02Evm9aFkt7/7q3U
	yFTg==
X-Received: by 10.14.219.5 with SMTP id l5mr8983661eep.7.1359301303737;
	Sun, 27 Jan 2013 07:41:43 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id q5sm11876147eeo.17.2013.01.27.07.41.42
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 07:41:42 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Jan 2013 16:41:18 +0100
Message-Id: <1359301282-5470-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
References: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkYBb2vQw9vzHT4uqVqsUDLEo2WsBR1l2VXNu/KcIki9YJBgrYTGIiPTKvgsxfmVPoyNJqS
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 3/7] mkvtoolnix: add 5.9.0
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
 .../recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb     | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
new file mode 100644
index 0000000..e7f93d2
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "MKVToolNix -- Cross-platform tools for Matroska"
+HOMEPAGE = "http://www.bunkus.org/videotools/mkvtoolnix/source.html"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis bzip2 lzo file ruby-native"
+
+SRC_URI = "http://www.bunkus.org/videotools/mkvtoolnix/sources/mkvtoolnix-${PV}.tar.bz2"
+SRC_URI[md5sum] = "033621461ef8eb922fc1366e0a9a6f16"
+SRC_URI[sha256sum] = "d913f531331c3332d2fb334c872ea19bfea7293dfedc4bf33ae7162e4efcbde1"
+
+inherit autotools
+
+EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
+               "
+
+# remove some hardcoded searchpaths
+do_configure_prepend() {
+	sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/include:${STAGING_INCDIR}:g ac/ebml.m4
+}
+
+# Yeah, no makefile
+do_compile() {
+	./drake
+}
+
+do_install() {
+	./drake install DESTDIR=${D}
+}
-- 
1.8.1



