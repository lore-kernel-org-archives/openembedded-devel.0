Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRrtT-0007ZB-Vu
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 22:19:56 +0200
Received: by yia13 with SMTP id 13so88400yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=NLb4pMKZlebSL50VipMAmJrQYp/KKdTlqSbxOIn2sKc=;
	b=Kv+T6LdQDLqkHv0M1vejGgAMDny8fyBOTryKSVw8/Iza22qXOnNQrE/HC6JoKpYtaf
	sNQcFzuPABWnkNcV2Yt0R+IDvq1Dsa9nmbMnHEO1BBPjrB7hcrUf7NrmZhPOwY8H2wlK
	kkmwI6Rt8nwH9G+MD9V9CPqVxu97DJ7zo/sOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=OP853fiBiFet5A9ZmGDFfASoJiNxlnbYBZf02mpbpueiD9nYiNy0spuYPfKQ0oPa2j
	s7Jhm7JloZm9FOkM2m1oC7bxKv8wjtAyLMfI4dBS89lBHLIbq3Y0ysI9hzM9sIT2C8Gl
	UV4QF4GG+T3Ni61cYsPKxpO/RLoKn9pqmf4Mc=
Received: by 10.236.186.101 with SMTP id v65mr8929658yhm.94.1306959401471;
	Wed, 01 Jun 2011 13:16:41 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t43sm1478016yhm.70.2011.06.01.13.16.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:16:40 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 20:16:15 +0000
Message-Id: <82a4381c9ac475d989220cb27924f02a6154d3b1.1306959338.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
References: <cover.1306959338.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
References: <cover.1306959338.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 5/5] pcsc-lite: rdepends on ccid and drop init script
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
X-List-Received-Date: Wed, 01 Jun 2011 20:19:56 -0000

We use auto-start feature by default as it is provided by ccid and
works out of box for most use cases.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb   |   15 +++------------
 1 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
index 7d235d6..14a0ba0 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "http://pcsclite.alioth.debian.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8e551349dc346258274f0007679e149"
 DEPENDS = "udev"
-PR = "r0"
+RDEPENDS += "ccid"
+PR = "r1"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/3533/pcsc-lite-${PV}.tar.bz2 \
-           file://pcscd.init "
+SRC_URI = "https://alioth.debian.org/frs/download.php/3533/pcsc-lite-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "47e7055cfc14399fdaa1b7a4aa06e5aa"
 SRC_URI[sha256sum] = "41f13d552eaa2c3978fbb6f2125e81903a0767011d999052fd1a6ee03880b398"
@@ -21,15 +21,6 @@ EXTRA_OECONF = " \
 
 S = "${WORKDIR}/pcsc-lite-${PV}"
 
-do_install() {
-	oe_runmake DESTDIR="${D}" install
-	install -d "${D}/${sysconfdir}/init.d"
-	install -m 755 "${WORKDIR}/pcscd.init" "${D}/${sysconfdir}/init.d/pcscd"
-
-	# handle vars values
-	sed -i 's,/usr/sbin,${sbindir},g;s,/var,${localstatedir},g' "${D}/${sysconfdir}/init.d/pcscd"
-}
-
 PACKAGES =+ "${PN}-lib"
 
 INITSCRIPT_NAME = "pcscd"
-- 
1.7.2.5



