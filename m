Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arj-0000U8-Ce
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:35 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1075458ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=b4kbZ0QCJY4te32I3/ASzXWPRTEVQYCHL5OR0hLiYkw=;
	b=Epl4o21f2v0Q23anytud5315byd9B/mMYCwglyIisYzaQ5thS1z4xtt2u5/TJHFaPF
	UHY1jMqU1U6R/ovJpxGre8lG6Hw+ZYEx0LEP4BEJ/IqGRqHKtKnxj+6N5xRh3xE5VWVi
	owg0SGjRv2qbLMhoHDRO51941XDg3klh7/51Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=cQpVWfJbH+9oglSVP20fnqCblghynHFla1vLxLrZekBY9E95Tu7gFMhJiR1vaThJtS
	Lfhp4xcG5JZmJrAxwIbv4y7oQpQn98NmFN1V6ObZelZ9nYhMwt6+9sWLMlstK85iJctM
	65UW78XZD54xSwP5H5Eq+pd5TSe70oGK1Kzrc=
Received: by 10.100.213.18 with SMTP id l18mr10161521ang.37.1241830220263;
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 8sm822805ywg.53.2009.05.08.17.50.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:19 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id F2507610192; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:26 -0300
Message-Id: <1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 10/23] hal-cups-utils: add
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
X-List-Received-Date: Sat, 09 May 2009 00:56:35 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                   |    4 ++++
 recipes/hal/hal-cups-utils_0.6.19.bb |   23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 recipes/hal/hal-cups-utils_0.6.19.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 0df13ba..57a1e72 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -10058,6 +10058,10 @@ sha256=65d8f8eeb61e7609a8c5001b6660d90e7a482c4b74b4e226d09b433dc1a80c9d
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
1.6.3.rc1.51.gea0b7



