Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 011A270533
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 11:34:00 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id hz20so4607777lab.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=KCiVe8TB1ezQH23f7ImKe5RM5YVmwJf1l7/RakA1cTk=;
	b=fVCiauQheRaEkYQeDDjGDPud0lrcmLDRu1lm1zFBcSvUHQZkLWa1yiVwWb85qqnfmZ
	+HKovbxbhJKl1EQaUWBQ44Y7z2TdkezcJ1IqPG2zMX00hXXBaK9g/uGQQnQxiwk3wYk9
	2McO6jpGvc9Xhv3I7LpYzmAIxfMDKeh2PR8PLSfRXERUaTKd3r5rXKmw0Qn8RPurB/to
	HVm7hPmPcUQZ1LvqXPYGHHMtKDIonujlkhD36D7xKqwXgz1KT4aBMfKz7fJwQIBQeE9+
	q0CjIZYpz/8uUHpj48wh6vIoNoNbBpNzksWVm7nlQSxBzQ8yz59enZBA4gwDJ5C0LVQl
	HyQg==
X-Received: by 10.112.171.167 with SMTP id av7mr2815884lbc.97.1405942439974;
	Mon, 21 Jul 2014 04:33:59 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id a7sm11183291lae.37.2014.07.21.04.33.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 04:33:59 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jul 2014 13:31:50 +0200
Message-Id: <1405942310-9182-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH] gnokii: Add missing intltool-native dependency
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
X-List-Received-Date: Mon, 21 Jul 2014 11:34:08 -0000

Building from sstate-cache fails otherwise.

Fixes:
| NOTE: Executing intltoolize --copy --force --automake
| <...>/gnokii/0.6.31-r0/temp/run.do_configure.6895: line 181:
  intltoolize: command not found

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index 4826452..de6e86c 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 intltool-native"
 X11DEPENDS = " libxpm gtk+"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-- 
1.9.3


