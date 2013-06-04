Return-Path: <philip.balister@gmail.com>
Received: from mail-qe0-f42.google.com (mail-qe0-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 26DEA6065C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jun 2013 15:28:40 +0000 (UTC)
Received: by mail-qe0-f42.google.com with SMTP id s14so271148qeb.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jun 2013 08:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=649N3JAgcK+Efyx9WnAhlh7WBYHkEZik13oGYRiS93E=;
	b=r7y5xNUVP9XkyB5wDh8n37ips9vKkmscMudT+H/RrC3TpNe4dGA6jCrkawaHlWOEDh
	OuURh5U5STfaXqzSegbFyZCC1R+NwnqdMpYZ4IlK+weQAAp+RZIPvDE2afwg9ht5392I
	2LuDmt17LY7Da6UM3viOOKWz2VqYbQo5BMeEFVcYl4c0dp8ELLPjpCjkCEwbIx5wWgpV
	UpzN2aPJL8sHBhRcy4GXjwogvIm4xoWdjNL0JHVWNOJjgbuAvhN8IyQYLnf++t436O+S
	x+N2yJn6HP7ET5WikVyT3KddufMcOx901/vrFO/NDq+ZabFgvntsfaorvCrbigxQ6Poe
	po7g==
X-Received: by 10.229.17.140 with SMTP id s12mr9183194qca.79.1370359720476;
	Tue, 04 Jun 2013 08:28:40 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-166-228.ronkva.east.verizon.net. [96.240.166.228])
	by mx.google.com with ESMTPSA id
	c10sm67371517qao.10.2013.06.04.08.28.39 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 08:28:39 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Jun 2013 11:28:35 -0400
Message-Id: <1370359715-30958-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH] gsl : Update from version 1.12 to version 1.15.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Jun 2013 15:28:40 -0000

Build tested for armv7a.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-support/gsl/gsl_1.12.bb | 6 ------
 meta-oe/recipes-support/gsl/gsl_1.15.bb | 7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gsl/gsl_1.12.bb
 create mode 100644 meta-oe/recipes-support/gsl/gsl_1.15.bb

diff --git a/meta-oe/recipes-support/gsl/gsl_1.12.bb b/meta-oe/recipes-support/gsl/gsl_1.12.bb
deleted file mode 100644
index 8fdbbc1..0000000
--- a/meta-oe/recipes-support/gsl/gsl_1.12.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include gsl.inc
-
-SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "3ec101903c8157756fa1352161bd4c39"
-SRC_URI[sha256sum] = "22019188d24c769acafc250ddc247105eb9cab099529b627078cbd8012c7b7b9"
diff --git a/meta-oe/recipes-support/gsl/gsl_1.15.bb b/meta-oe/recipes-support/gsl/gsl_1.15.bb
new file mode 100644
index 0000000..620e780
--- /dev/null
+++ b/meta-oe/recipes-support/gsl/gsl_1.15.bb
@@ -0,0 +1,7 @@
+include gsl.inc
+
+SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "494ffefd90eef4ada678c306bab4030b"
+SRC_URI[sha256sum] = "85b907e57902e2b7606ef3aef960302ffdd13bd9dc5b8fcbfa75e4f0bf340ea3"
+
-- 
1.7.11.7


