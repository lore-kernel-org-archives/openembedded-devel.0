Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdu-0004lJ-Hw
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:28 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506551eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:11:07 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.101.134 as permitted sender)
	client-ip=10.14.101.134; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.101.134 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.101.134])
	by 10.14.101.134 with SMTP id b6mr705247eeg.81.1329999067245 (num_hops
	= 1); Thu, 23 Feb 2012 04:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=H/7cTJNABPF005IEvoSr8/LrQ6IpeYoySGgQ+xZhJmo=;
	b=cXTybsvzQmpcnX2YyjVvdgeBlysp3T5ZzKfKKwp5PjDCEEKWTklFwnoCgIf42CsTOc
	Lgy8q23Ka+hEDncF88G8Y1EJW0xjpBkmcfo35JUn0noaCdZwtAzAooYa6E4nHFmlSp46
	M1+jGkq9ns7132WlbpMLH4rUQvT0OYSOs/PHs=
Received: by 10.14.101.134 with SMTP id b6mr561042eeg.81.1329999067162;
	Thu, 23 Feb 2012 04:11:07 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.11.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:11:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:50 +0100
Message-Id: <1329999054-23112-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 19/23] syslog-ng: remove unneeded systemd code / use ${systemd_unitdir}
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 3bbebec..3489ac5 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
 # update-rc.d and update-alternatives is important
 RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 inherit autotools systemd
 
@@ -26,7 +26,7 @@ EXTRA_OECONF = " \
   --disable-pcre \
   --disable-sql \
   --enable-systemd \
-  --with-systemdsystemunitdir=${base_libdir}/systemd/system \
+  --with-systemdsystemunitdir=${systemd_unitdir}/system \
 "
 
 do_configure_prepend() {
@@ -47,11 +47,6 @@ do_install_append() {
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "${PN}.service"
 
-PACKAGES =+ "${PN}-systemd"
-
-FILES_${PN}-systemd += "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "${PN}"
-
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
-- 
1.7.6.4



