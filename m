Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlRr-0001p7-QV
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:46:45 +0200
Received: by gxk1 with SMTP id 1so144411gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=GjZsvKyVv2BDSnY1/Q3zRPILWrkyC0uwbhW9AolH0Go=;
	b=jde7a3wdDz9XCiLPz4NLyxGCcce4W9DJzO3PrSBn8FrWC0Fu/pYgSU5cgdDb6KNf+f
	wpiAJMZDEhJ3iamASopUCRoJ6HNurRj7tv06ImXVLe0Pv0Xbwzjs0gOD2yp4ZAII2rJC
	klplnWPY5hqnYWTyRuWVmTNAzVEilCY04a5RY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NqoOBX87SGBEURceXzOsHdzdvwegW8XG+C4dSROaNhqOmLbYl42NiQldKKZpLleX2H
	vn63QqIjIQ1HEr712Pc0riPGr8rhFYXKXzWkNqmu70colKKe56keu6PU2D1/Dkqj014c
	liIPXh4U0dqHZ6aIqA+s9AONVMjTUZ9+rEvPQ=
Received: by 10.101.139.37 with SMTP id r37mr9488225ann.75.1277858520081;
	Tue, 29 Jun 2010 17:42:00 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id r42sm345299yba.0.2010.06.29.17.41.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:41:59 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:41:40 -0300
Message-Id: <1277858503-27321-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
References: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] Add lksctp tools
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
X-List-Received-Date: Wed, 30 Jun 2010 00:46:46 -0000

---
 recipes/lksctp-tools/lksctp-tools.inc      |   29 ++++++++++++++++++++++++++++
 recipes/lksctp-tools/lksctp-tools_1.0.7.bb |   11 ++++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 recipes/lksctp-tools/lksctp-tools.inc
 create mode 100644 recipes/lksctp-tools/lksctp-tools_1.0.7.bb

diff --git a/recipes/lksctp-tools/lksctp-tools.inc b/recipes/lksctp-tools/lksctp-tools.inc
new file mode 100644
index 0000000..678531e
--- /dev/null
+++ b/recipes/lksctp-tools/lksctp-tools.inc
@@ -0,0 +1,29 @@
+DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+#DEPENDS_virtclass-native = "python-native"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+INC_PR = "r0"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools pkgconfig binconfig
+
+export LDFLAGS += "-ldl"
+
+do_install_append_virtclass-native() {
+	:
+}
+
+DEBIANNAME_${PN} = "lksctp"
+
+PACKAGES =+ "${PN}-tools"
+FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_libdir}/*${SOLIBS}"
+
+FILES_${PN}-dev += "${bindir}/*-config"
+FILES_${PN}-utils = ""
diff --git a/recipes/lksctp-tools/lksctp-tools_1.0.7.bb b/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
new file mode 100644
index 0000000..34c2ce5
--- /dev/null
+++ b/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
@@ -0,0 +1,11 @@
+require lksctp-tools.inc
+PR = "${INC_PR}.0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
+
+PARALLEL_MAKE = ""
+CCACHE = ""
+
+
+SRC_URI[md5sum] = "047562b40537eb3be5d5ec3ae0a2198b"
+SRC_URI[sha256sum] = "e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
-- 
1.7.0.2



