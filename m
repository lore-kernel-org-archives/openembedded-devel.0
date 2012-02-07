Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumr2-0001JM-GO
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:13 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181062eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=TtRAnYc8yChXHFOR0iKfsidIFL4YEuu+Fz6N3xQzj8s=;
	b=ODr65DN68KPFJBzti0U1NYX3HLFlvlKWku1nczdxNHCKHs+JBh4Yl7MLar7E+WsYRq
	KSusz2AvkoMVJEqiMHoVLVJ7KtNfkaQMuNf+cDKqDIWe4/tEU9LF9U7HzA/2vKZvFUBh
	5LQWaLrYXWrGZrF52jqqZnEZwdJgNUTEOSBwE=
Received: by 10.14.200.196 with SMTP id z44mr7064380een.116.1328627592483;
	Tue, 07 Feb 2012 07:13:12 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:44 +0100
Message-Id: <1328627573-5217-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 18/27] rsyslog: conditional DEPENDS systemd / remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog.inc |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
index ea7fa22..3a9c1fc 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
-DEPENDS = "zlib systemd"
+DEPENDS = "zlib ${@base_conditional('INIT_MANAGER', 'systemd', 'systemd', '', d)}"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
            file://rsyslog.conf"
@@ -20,9 +20,4 @@ do_install_append() {
         install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
 }
 
-PACKAGES =+ "${PN}-systemd"
-
 CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
-
-FILES_${PN}-systemd += "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "${PN}"
-- 
1.7.6.4



