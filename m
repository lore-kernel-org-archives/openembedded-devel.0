Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJV-0005cb-9P
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:21 +0200
Received: by mail-bw0-f171.google.com with SMTP id 19so784003bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uL9k+j9Daxpe62QOppZv0PBGAMyZQK3LMgQJtUpdCP0=;
	b=iKcf4bz2BWa/Wrd0j7yyowp8IvpGj+/LWjGGrmOPsMq0IVE9D2fB9T2kmOM1E8vUVl
	bi4qDtwTJFwGRzm9Bl7jxZhI/1RP49LHqU0yBzaulqS8l4mJKAH7XoQnh6LxxzKakK0l
	4oNNTdeS6ZAHcGtKtkI54RXwtOWPGIv+gDbPw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Bh2K2Xw8ByHkNa8rCL9krvD4Rsku2ZjQJFUgtznnVq7TqrUy7nZeNNA5wiICX4n24x
	dbdtKPVmbHTtSKsaKUnm9Fx96lw+AmHNU+QvvHd72W1yYbgPMmJpbni72aVeTYrJTPW5
	z3sE4RWSbQAnPmccvltfTB8+WkyDfuYREUV/g=
Received: by 10.103.227.10 with SMTP id e10mr418045mur.56.1242873589988;
	Wed, 20 May 2009 19:39:49 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id u26sm4488766mug.52.2009.05.20.19.39.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:47 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id F3AD66103B9; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:24 -0300
Message-Id: <1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 09/23] hal-cups-utils: add
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
X-List-Received-Date: Thu, 21 May 2009 02:47:21 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                   |    4 ++++
 recipes/hal/hal-cups-utils_0.6.19.bb |   23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 recipes/hal/hal-cups-utils_0.6.19.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 96a2272..77b4b4f 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -10170,6 +10170,10 @@ sha256=65d8f8eeb61e7609a8c5001b6660d90e7a482c4b74b4e226d09b433dc1a80c9d
 md5=a6f532770cf9286e1de38d6570cbc6bc
 sha256=65d8f8eeb61e7609a8c5001b6660d90e7a482c4b74b4e226d09b433dc1a80c9d
 
+[https://fedorahosted.org/releases/h/a/hal-cups-utils/hal-cups-utils-0.6.19.tar.gz]
+md5=58e1c8f5597dd39e57dcf3c4aabe60f8
+sha256=f40a7ebd1453d471a8a6bfd8c635708dd739a6160bb661813f936d936ba85618
+
 [http://hal.freedesktop.org/releases/hal-info-20070618.tar.gz]
 md5=c7005ccb1765d8359fd2348350770495
 sha256=bec1b0ad166b6c4d5269e7aa6d7bdbd0eb05c8f2c30042e4dca18993ba5682f0
diff --git a/recipes/hal/hal-cups-utils_0.6.19.bb b/recipes/hal/hal-cups-utils_0.6.19.bb
new file mode 100644
index 0000000..289990e
--- /dev/null
+++ b/recipes/hal/hal-cups-utils_0.6.19.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Utilities to detect and configure printers automatically"
+HOMEPAGE = "https://fedorahosted.org/hal-cups-utils/"
+SECTION = "console/utils"
+LICENSE = "GPLv2 CUPS"
+DEPENDS = "hal dbus cups"
+RDEPENDS_${PN} += "python-dbus python-pycups python-cupshelpers python-subprocess python-syslog usbutils"
+
+SRC_URI = "https://fedorahosted.org/releases/h/a/hal-cups-utils/hal-cups-utils-${PV}.tar.gz"
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
+PACKAGES += "cups-backend-hal"
+
+FILES_${PN} += "${libdir}/hal/* ${datadir}/hal/*"
+FILES_${PN}-dbg += "${libdir}/hal/.debug ${libdir}/cups/backend/.debug"
+FILES_cups-backend-hal += "${libdir}/cups/backend/*"
+
+EXTRA_OECONF = "--libexecdir=${libdir}/hal/scripts"
+
+do_configure_append() {
+	sed -i 's,^#!/bin/env python,#!/usr/bin/python,' systemv/hal_lpadmin
+}
-- 
1.6.3.1.54.g99dd



