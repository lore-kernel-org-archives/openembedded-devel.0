Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1Ntgf6-0005BE-D4
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 13:23:17 +0100
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 7C58968795;
	Mon, 22 Mar 2010 14:46:20 +0300 (MSK)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1NtgPU-0001tP-7U; Mon, 22 Mar 2010 15:07:08 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 15:07:08 +0300
Message-Id: <1269259628-7253-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1269259628-7253-1-git-send-email-khimov@altell.ru>
References: <1269259628-7253-1-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: 7C58968795.E6909
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SUBJECT_FUZZY_TION autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] acpid: add script to halt on power button press
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
X-List-Received-Date: Mon, 22 Mar 2010 12:23:17 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/acpid/acpid.inc                   |    5 ++++-
 recipes/acpid/files/powerbtn-acpi-support |    2 ++
 2 files changed, 6 insertions(+), 1 deletions(-)
 create mode 100644 recipes/acpid/files/powerbtn-acpi-support

diff --git a/recipes/acpid/acpid.inc b/recipes/acpid/acpid.inc
index bb976c9..5240911 100644
--- a/recipes/acpid/acpid.inc
+++ b/recipes/acpid/acpid.inc
@@ -5,7 +5,8 @@ LICENSE="GPL"
 INC_PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/acpid/acpid-${PV}.tar.gz \
-           file://init"
+           file://init \
+           file://powerbtn-acpi-support"
 
 inherit update-rc.d
 
@@ -23,4 +24,6 @@ do_install () {
 	install -d ${D}${sysconfdir}/init.d
 	cat ${WORKDIR}/init | sed -e's,/usr/sbin,${sbindir},g' > ${D}${sysconfdir}/init.d/acpid
 	chmod 755 ${D}${sysconfdir}/init.d/acpid
+	install -d ${D}${sysconfdir}/acpi/events
+	install -m 0644 ${WORKDIR}/powerbtn-acpi-support ${D}${sysconfdir}/acpi/events/
 }
diff --git a/recipes/acpid/files/powerbtn-acpi-support b/recipes/acpid/files/powerbtn-acpi-support
new file mode 100644
index 0000000..b2e80f9
--- /dev/null
+++ b/recipes/acpid/files/powerbtn-acpi-support
@@ -0,0 +1,2 @@
+event=button[ /]power
+action=halt
-- 
1.5.6.5



