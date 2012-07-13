Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSq-0007zx-EU
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:43:04 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247517bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=1GGdvjvt3r/zvsUHvccnW6VuhV+EVjEOt57gS4wsoPo=;
	b=cyoymB3Y5ac2C4+xLAYnd/N9j8Ba+k7Y5fMTwN2Xiw7G2tuExVLgA6QlDiuA5/xj3w
	4NFV0Cd2ocW3iakr1B22F6nXEy/Lx2/Jdu1MaDyKpteO9WLXNNP0jOLcSqY2azUBe/Uw
	ixVbj4HF5YHZfBzpqQDreveayFIahEROz4ekiwFcjca6xt5AGKa2WdQ+HNWDR/qRVhA8
	L+qV0t529dgm1LEln6u50BVoeNA7M6/386zcYaqn9lAj3Io/IDhwn/QaA6DL2VKfUYgU
	i9Hy9LJsbqQFNxutrDAr2dufeWHsp5GcMG6wr7AvEmAVhnB2zL8siWinsbwUYv05bjAs
	0pxg==
Received: by 10.205.128.3 with SMTP id hc3mr161614bkc.29.1342168312559;
	Fri, 13 Jul 2012 01:31:52 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:38 +0200
Message-Id: <1342168240-7760-31-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 30/32] rsyslog: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:43:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |   10 +++++-----
 .../rsyslog/rsyslog_5.8.0.bbappend                 |   10 ++++++++++
 2 files changed, 15 insertions(+), 5 deletions(-)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
index 97fd026..a4bd180 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
@@ -1,19 +1,19 @@
 DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
-DEPENDS = "zlib systemd"
+DEPENDS = "zlib"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
            file://rsyslog.conf"
            
+inherit autotools
 
-inherit autotools systemd
+SYSTEMD_UNITDIR ??= "no"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.service"
+EXTRA_OECONF = "--with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
 
 do_install_append() {
         install -d ${D}/${sysconfdir}/${PN}
diff --git a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
new file mode 100644
index 0000000..b813a50
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
@@ -0,0 +1,10 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+DEPENDS += "systemd"
+
+SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.service"
-- 
1.7.6.5



