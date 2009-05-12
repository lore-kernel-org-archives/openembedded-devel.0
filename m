Received: from [209.85.216.126] (helo=mail-px0-f126.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1M3hdr-0002x2-Kv
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 04:22:51 +0200
Received: by pxi32 with SMTP id 32so61549pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 19:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=SIjrsu9JV438QU7WdsZ3og3xR7L+c1RtffFQK77Rgi8=;
	b=T7xyNMagVVb5J1IJxDRzshUtf36pyBgcUCz9C3d5QxW02n3ewHsgOgrGDzeP2tK3DB
	hOoFEg1FwSp5vz2MG/7+ci2SM6WPn9jBckNBmSh4MqEkdbiW8I1nIg5MXUPPk1w0TflL
	yjtN0QFB00OPPxJZIyLn93VKx+eNc4CGyxOxk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gdrdVpKNimiCVYbE+VB6igPMvOj10KPxLrtTIu/e6feGhX/U4W7ZHcwXE/c4vzc0EI
	duOJje0kdh0xFqlWYziHDAIfFHDzHSf5GzkMJ4L1C2N9JwN7zv+eOf9eh4ZhFe8sGpp3
	bEiyvHyTHcW8m45HIDe8WQunavrWYdXTLQeWM=
Received: by 10.114.125.15 with SMTP id x15mr5929275wac.217.1242094574267;
	Mon, 11 May 2009 19:16:14 -0700 (PDT)
Received: from localhost.localdomain
	(adsl-71-146-28-0.dsl.pltn13.sbcglobal.net [71.146.28.0])
	by mx.google.com with ESMTPS id v25sm6865160wah.32.2009.05.11.19.16.13
	(version=SSLv3 cipher=RC4-MD5); Mon, 11 May 2009 19:16:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 19:16:10 -0700
Message-Id: <1242094570-12734-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.0.4
Subject: [PATCH] python-native_2.6.1.bb: Add zlib-native to DEPENDS
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
X-List-Received-Date: Tue, 12 May 2009 02:22:51 -0000

	Do not use --with-zlib instead depend on zlib-native
---
 recipes/python/python-native_2.6.1.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/python/python-native_2.6.1.bb b/recipes/python/python-native_2.6.1.bb
index febe271..ca567a1 100644
--- a/recipes/python/python-native_2.6.1.bb
+++ b/recipes/python/python-native_2.6.1.bb
@@ -1,5 +1,5 @@
 require python.inc
-DEPENDS = "openssl-native bzip2-full-native"
+DEPENDS = "openssl-native bzip2-full-native zlib-native"
 
 SRC_URI = "\
   http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
@@ -22,7 +22,6 @@ EXTRA_OEMAKE = '\
   STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
   STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
 '
-EXTRA_OECONF += "--with-zlib"
 
 do_stage_append() {
 	install -m 0755 Parser/pgen ${STAGING_BINDIR_NATIVE}/pgen
-- 
1.6.0.4



