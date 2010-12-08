Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jefflance01@gmail.com>) id 1PQ8Gk-0007iN-GG
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 01:52:32 +0100
Received: by ywi6 with SMTP id 6so371027ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 16:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=krF0ed2wB0snZKrBT6Kul8ECXKuigLmT4CLBvWAw34c=;
	b=du4TtqQbN+1XrTU9YptUqBoI1NP6fO580TXi4drXjnK/ZH+o+hkZmEz1UnhyDKomcp
	Asrri/EAllhKo3Y45+Otrhw8TrCmUIt4Pu34Id99Een+SopSP9FFkG4VtxO6G9DmBR6S
	L9jnT9h/q+zr23ybhwqD3bW4wBF/BjwNrqYRI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VnDubnJHxs+lu413d0QOwHNSe54oqHaJVKblEGHFp0lcFLFJkRl5len1BQEjP0eci2
	oLT/rUoQCyXr12HTDvnPaOpoVyt9w/AZ4Zbi0Jert9mltZQTIjd1OzVlZy1bg4DDzhhL
	4HqcYBFvQRdfE9DQVNUqV6bLNqbBy3N6loHgk=
Received: by 10.150.225.19 with SMTP id x19mr2865525ybg.402.1291769458938;
	Tue, 07 Dec 2010 16:50:58 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r38sm563yhi.43.2010.12.07.16.50.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Dec 2010 16:50:58 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Dec 2010 18:26:29 -0600
Message-Id: <1291767990-18403-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: jefflance01@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/2] matrix-gui: updating SRC rev to pick up new platforms and matrix code enhancements
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
X-List-Received-Date: Wed, 08 Dec 2010 00:52:32 -0000

* Added Matrix Enhancements:
  * added new platforms am180x, am181x and am3517
  * add control menubar at the top of matrix-gui (HTML change not code change)
  * add descriptions to matrix applications (source code change)
  * make matrix scalable with respect to number of applications.
    * allow addtional main menu pages and allow additional sub-menu pages (source code change)

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    8 ++++++++
 recipes/ti/matrix-gui-e_1.3.bb      |    5 +++++
 recipes/ti/matrix-gui_1.3.bb        |    4 ++++
 3 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/matrix-gui-common_1.4.bb
 create mode 100644 recipes/ti/matrix-gui-e_1.3.bb
 create mode 100644 recipes/ti/matrix-gui_1.3.bb

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
new file mode 100644
index 0000000..c578a47
--- /dev/null
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -0,0 +1,8 @@
+require matrix-gui-common.inc
+
+# Use the mem_util application from am-sysinfo instead of a
+# prebuilt version in the repository.
+RRECOMMENDS_${PN} = "am-sysinfo"
+
+SRCREV = "192"
+PR = "${INC_PR}.0"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
new file mode 100644
index 0000000..dd1b16b
--- /dev/null
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -0,0 +1,5 @@
+require matrix-gui-e.inc
+
+SRCREV = "192"
+PR = "${INC_PR}.0"
+
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
new file mode 100644
index 0000000..53db8af
--- /dev/null
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -0,0 +1,4 @@
+require matrix-gui.inc
+
+SRCREV = "192"
+PR = "${INC_PR}.0"
-- 
1.6.3.3



