Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 47E636EE06
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 17:57:29 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id f73so7247734yha.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=grCkCBX7TCZucuq4TJ0IMJCW5hplpnjRIMdHR6X5ru0=;
	b=VVpswe1r1oQ8WohSNrw3AGuJ0YbAM6IFrkr16MlKzpGgVDw5zrD+noy+sJiPOv2tPq
	gPR5p1UtcIYpJPtfNa1gupMXsbwxZoB1AY9I1wt7ANguDNiVn6BVSW/5Axc1A2S++4p1
	YewzKcUmbZaOflQ0t0YWNQubzhH86/0/hIfDcqIQ79Q1beQjxJSP8gWQnyqIRUPiyaCY
	l59kKfnoQI8vy70JHcS5w5K3rMVcfoqCLOBt/mDXQPr8gIrOFKbM/hT3dbTdHh3cUwo4
	Awm+QyOQxXgNFXio0Q7GNyE3velOcp7PF7KwDnIzBE4nJ894/KiSJ2gNpjQJ0AU4HN7O
	x8qQ==
X-Received: by 10.236.102.102 with SMTP id c66mr1144033yhg.153.1392141450107; 
	Tue, 11 Feb 2014 09:57:30 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	b24sm61434799yhl.25.2014.02.11.09.57.20 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 11 Feb 2014 09:57:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Feb 2014 15:56:25 -0200
Message-Id: <1392141388-25288-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392141388-25288-1-git-send-email-otavio@ossystems.com.br>
References: <1392141388-25288-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 2/5] nativesdk-packagegroup-qt5-toolchain-host: Add packagegroup
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
X-List-Received-Date: Tue, 11 Feb 2014 17:57:30 -0000

Allow easy inclusion of host packages for the Qt5 standalone SDK or
external toolchain.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../nativesdk-packagegroup-qt5-toolchain-host.bb         |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb

diff --git a/recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb b/recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb
new file mode 100644
index 0000000..4cc0b93
--- /dev/null
+++ b/recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb
@@ -0,0 +1,14 @@
+# Copyright (C) 2014 O.S. Systems Software LTDA.
+
+SUMMARY = "Host packages for the Qt5 standalone SDK or external toolchain"
+LICENSE = "MIT"
+
+inherit nativesdk packagegroup
+
+PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
+
+RDEPENDS_${PN} += " \
+    nativesdk-packagegroup-sdk-host \
+    nativesdk-qttools \
+    nativesdk-qtbase-tools \
+"
-- 
1.7.10.4


