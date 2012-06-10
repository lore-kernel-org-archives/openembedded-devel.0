Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3q-0001gN-OA
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:39 +0200
Received: by mail-wi0-f171.google.com with SMTP id hm14so1978843wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=jeAZw0hMnOnTmcfJUno9vhL4fa04JP4Z/a10FPr0DqQ=;
	b=e3pH+QnvYDARegG8rmepCvYIhgwvSi94dSV78+Q+jJzfXAVxOvnjzrppdvQKN93KOJ
	H4r2e+R1EY/FYIRZFO+Ov6YcBjffHfijkBb2YLsODcXRvWV04O0SjiR8FoPUyjZr7HMW
	LrZkG2X26gTqjse25GfgbWpVZdEMIupv66Qd5AB9uqTVk5ulhptBm02oPRcgj0RPXJKm
	9X2b3ZPJXZKS8TctmoP82dwt7JJaytb5Cgply3IlJ9U4eYf5ymuaHt5Ho9Tq6wEjAxIe
	nXzxm/nkcYjOa4XmELJtih5x0wFvwi/9fTZ3uPiRfKM8yZzFbPP8x1W/Ynb0FIzX2DGn
	1Iqw==
Received: by 10.216.145.157 with SMTP id p29mr5123596wej.65.1339364528433;
	Sun, 10 Jun 2012 14:42:08 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.42.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:42:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:58 +0200
Message-Id: <1339364820-2880-26-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 25/27] rsyslog: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |   10 +++++-----
 .../rsyslog/rsyslog_5.8.0.bbappend                 |   12 ++++++++++++
 2 files changed, 17 insertions(+), 5 deletions(-)
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
index 0000000..0bff661
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
@@ -0,0 +1,12 @@
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
+
+
-- 
1.7.4.4



