Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SNksz-0006WO-Oj
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 15:06:57 +0200
Received: by wibhj13 with SMTP id hj13so512879wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 05:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=3rWuJOLbuLcF4ntYxMtyLMX7kEp8UXZ8JmC+fnIVcgs=;
	b=mfWAqsjIQ+RvvrJV7si+/j+30bI+s3CggnIZKarP2vEolwdWDygUGsaH28+N4GZwJs
	VzETOMbiXa+nf1dczmKfSKY0YWl7x/7SL1+Hg2iMmHXE++76JGUu1nJ1uAa3tl94mhST
	J6GM7qagctfFBxgJdydQk6gOzQmjQlDN0XpiMgIzh73X934qv7GAFWWKrOsW7hWVBMCk
	ybVZDqF5SBznxhZPvuukhx/TWoZETDZBdtPe73YAewDjVywOd1xZ9KrpF+ffzfhEiHDG
	R8P2FVfLaStpQ3u1DxxDm/moGHkZMkHsqW0UrYGxQljcvKUgIAYCCgsAuPAkP21KMaq/
	GFfA==
Received: by 10.216.139.12 with SMTP id b12mr6996164wej.4.1335531439357;
	Fri, 27 Apr 2012 05:57:19 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id j3sm7348454wiw.1.2012.04.27.05.57.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 05:57:18 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Apr 2012 14:57:15 +0200
Message-Id: <1335531435-25806-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk4rYbRf1SF71D1aBzndKvYLrfEMc21AyLl3uxvixlj81VX7Vu3hmwRfSg6r5+u4B64vMgt
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] busybox 1.19.4 bbapped: create dir before installing into it, fixes build failures on the autobuilder
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
X-List-Received-Date: Fri, 27 Apr 2012 13:06:57 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
index 2c73732..786e1d5 100644
--- a/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 4}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -16,6 +16,7 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/default
 	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
 
+	install -d ${D}${systemd_unitdir}/system
 	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
 	     > ${D}${systemd_unitdir}/system/busybox-syslog.service
 	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
-- 
1.7.10



