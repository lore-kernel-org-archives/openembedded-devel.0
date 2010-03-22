Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1Ntgf6-0005BF-Ba
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 13:23:25 +0100
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 7948A6878C;
	Mon, 22 Mar 2010 14:46:20 +0300 (MSK)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1NtgPU-0001tN-5t; Mon, 22 Mar 2010 15:07:08 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 15:07:07 +0300
Message-Id: <1269259628-7253-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
X-Altell-MailScanner-ID: 7948A6878C.2F83D
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] acpid: convert to INC_PR
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
X-List-Received-Date: Mon, 22 Mar 2010 12:23:25 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/acpid/acpid.inc       |    2 ++
 recipes/acpid/acpid_1.0.10.bb |    2 +-
 recipes/acpid/acpid_1.0.2.bb  |    2 +-
 recipes/acpid/acpid_1.0.3.bb  |    3 +--
 recipes/acpid/acpid_1.0.4.bb  |    3 +--
 recipes/acpid/acpid_1.0.6.bb  |    3 +--
 recipes/acpid/acpid_1.0.8.bb  |    2 +-
 7 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/recipes/acpid/acpid.inc b/recipes/acpid/acpid.inc
index 6e79915..bb976c9 100644
--- a/recipes/acpid/acpid.inc
+++ b/recipes/acpid/acpid.inc
@@ -2,6 +2,8 @@ SECTION = "base"
 DESCRIPTION = "A daemon for delivering ACPI events."
 LICENSE="GPL"
 
+INC_PR = "r4"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/acpid/acpid-${PV}.tar.gz \
            file://init"
 
diff --git a/recipes/acpid/acpid_1.0.10.bb b/recipes/acpid/acpid_1.0.10.bb
index f210051..c5e3c62 100644
--- a/recipes/acpid/acpid_1.0.10.bb
+++ b/recipes/acpid/acpid_1.0.10.bb
@@ -4,4 +4,4 @@ SRC_URI_append = " file://event.c.diff;patch=1 \
                    file://netlink.diff;patch=1 \
                    file://gcc44.diff;patch=1 \
                  "
-
+PR = "${INC_PR}.0"
\ No newline at end of file
diff --git a/recipes/acpid/acpid_1.0.2.bb b/recipes/acpid/acpid_1.0.2.bb
index 2a305ee..ad8efc4 100644
--- a/recipes/acpid/acpid_1.0.2.bb
+++ b/recipes/acpid/acpid_1.0.2.bb
@@ -1,3 +1,3 @@
 require acpid.inc
-PR = "r2"
+PR = "${INC_PR}.0"
 
diff --git a/recipes/acpid/acpid_1.0.3.bb b/recipes/acpid/acpid_1.0.3.bb
index 640acd5..670f032 100644
--- a/recipes/acpid/acpid_1.0.3.bb
+++ b/recipes/acpid/acpid_1.0.3.bb
@@ -1,4 +1,3 @@
 require acpid.inc
 SRC_URI += "file://gcc40.patch;patch=1"
-PR = "r2"
-
+PR = "${INC_PR}.0"
\ No newline at end of file
diff --git a/recipes/acpid/acpid_1.0.4.bb b/recipes/acpid/acpid_1.0.4.bb
index f48c262..8d9bff7 100644
--- a/recipes/acpid/acpid_1.0.4.bb
+++ b/recipes/acpid/acpid_1.0.4.bb
@@ -1,4 +1,3 @@
 require acpid.inc
 SRC_URI += "file://gcc40.patch;patch=1"
-PR = "r3"
-
+PR = "${INC_PR}.0"
diff --git a/recipes/acpid/acpid_1.0.6.bb b/recipes/acpid/acpid_1.0.6.bb
index e096796..c44cd81 100644
--- a/recipes/acpid/acpid_1.0.6.bb
+++ b/recipes/acpid/acpid_1.0.6.bb
@@ -1,3 +1,2 @@
 require acpid.inc
-
-PR = "r4"
+PR = "${INC_PR}.0"
\ No newline at end of file
diff --git a/recipes/acpid/acpid_1.0.8.bb b/recipes/acpid/acpid_1.0.8.bb
index 98638e6..5e8e451 100644
--- a/recipes/acpid/acpid_1.0.8.bb
+++ b/recipes/acpid/acpid_1.0.8.bb
@@ -3,4 +3,4 @@ require acpid.inc
 SRC_URI_append = " file://event.c.diff;patch=1 \
                    file://fixfd.diff;patch=1 \
                    file://netlink.diff;patch=1"
-
+PR = "${INC_PR}.0"
\ No newline at end of file
-- 
1.5.6.5



