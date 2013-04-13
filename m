Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0o2-0007YV-GA
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:52 +0200
Received: by mail-ea0-f173.google.com with SMTP id k11so1555380eaj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=SbmLSlDnRLP6XX3HovQy+YVBBdfI4VFrdPEuFaDhBSE=;
	b=VZYBlGTQDFEpuu77kJu+zTzFm7ZBnsd1a2wwTHbkl6EA14alD+IEIJazsJS3IujHTZ
	t440uJQSMaXthNnF7SSj5Gz4vHaT6IIcHRteTuRPrd9shlKwegLC43bSIy1ULu43X061
	YylzRY81uGI3JR2cL7FZfo5XiL7VeSOlbOF7EBLNWhTSB7YAApq54fBoefVAJq2N36CL
	Kmbm1oT55YSAKSGNDqMdB8btMiOPxbBPs7erkTcxCXbNNwPZcoPEhKqUct0s+r/bpkD4
	YkJjscAmWB/U+PyR7Yx5r6/4PYhANs/7hl5Cxc6CMbBK9PRdRh3KCKT2zlDTzXkn7kMi
	sQyA==
X-Received: by 10.14.210.132 with SMTP id u4mr39462954eeo.19.1365859824881;
	Sat, 13 Apr 2013 06:30:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bk42sm16496250eeb.3.2013.04.13.06.30.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:43 +0200
Message-Id: <1365859790-20947-26-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 26/33] rsyslog: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:49:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog.inc               | 14 +++++++++-----
 .../recipes-extended/rsyslog/rsyslog_5.8.0.bbappend        | 12 ------------
 2 files changed, 9 insertions(+), 17 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
index a4bd180..dc6e511 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
@@ -1,19 +1,18 @@
 DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
 DEPENDS = "zlib"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973"
 
-INC_PR = "r5"
+INC_PR = "r8"
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
            file://rsyslog.conf"
            
-inherit autotools
+inherit autotools systemd
 
-SYSTEMD_UNITDIR ??= "no"
-
-EXTRA_OECONF = "--with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
 do_install_append() {
         install -d ${D}/${sysconfdir}/${PN}
@@ -21,3 +20,8 @@ do_install_append() {
 }
 
 CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
deleted file mode 100644
index 64ef39d..0000000
--- a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
+++ /dev/null
@@ -1,12 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 2}"
-
-DEPENDS += "systemd"
-
-SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.service"
-- 
1.8.1.5



