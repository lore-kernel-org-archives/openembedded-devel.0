Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJW03-0002rv-JF
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:20:11 +0200
Received: by mail-gy0-f175.google.com with SMTP id 1so2074894gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=GL8IB3sMEjRSB8xjsSYlPp3FHw7nWh0Ozg/06NJ4hDo=;
	b=w67iKZlF5/lxU2Mm8rVQO3aApETn6fVpKWnBV/dvEFzYP1EAlrwYnmMHXvvBJP2+L5
	I2YFAqogJBtnT0d1lRkOK7FDMParRKiBfw0QgEZBLGNTLI9Q55o/BFAh3ZyCQ/HKCsfh
	5sx34kHqMGgM+oonn3NwWKNAAyKhCz/Ebniug=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=pjDJRu+XyS+xM2mi8E2x/q1lguUP2WDkvjCDIKojKDHHjBkr4wV75pjXoAKiBCwUqM
	YrmbSOSfztDHrz86MROfBwO5k7oR+NqBKLWcifaisK0SUlekw7bdkxSqQJbJY0GlI3b9
	UigkU7CrQLdU5d26aTJ44tB7+UJcSnnarUfn8=
Received: by 10.150.238.18 with SMTP id l18mr1649120ybh.215.1304968648782;
	Mon, 09 May 2011 12:17:28 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1123219ybn.24.2011.05.09.12.17.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 12:17:27 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 19:16:51 +0000
Message-Id: <1304968617-4949-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4 06/12] p910nd: add version 0.95
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
X-List-Received-Date: Mon, 09 May 2011 19:20:11 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/p910nd/p910nd_0.95.bb |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/p910nd/p910nd_0.95.bb

diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.95.bb b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
new file mode 100644
index 0000000..5ded564
--- /dev/null
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A small network printer daemon for embedded situations that passes the job directly to the printer"
+HOMEPAGE = "http://p910nd.sourceforge.net/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "c7ac6afdf7730ac8387a8e87198d4491"
+SRC_URI[sha256sum] = "7d78642c86dc247fbdef1ff85c56629dcdc6b2a457c786420299e284fffcb029"
+
+do_compile () {
+	${CC} ${CFLAGS} ${LDFLAGS} -o p910nd p910nd.c
+}
+
+# The avahi stuff makes it work with bonjour printing
+do_install () {
+	install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd
+	install -D -m 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf
+}
-- 
1.7.2.5



