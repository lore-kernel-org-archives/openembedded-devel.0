Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id EE68C6D45E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 20:11:44 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id l10so1581519eei.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zWNlYkSdW7Lbn1LLbHrH9QNge/HTFRvfRNCN/NIgz3Q=;
	b=Trahfb7Id2CIZ07KdwYaB6hNXkDZSsJV+YmQIthUU6sFeQHX/bUI4AM1oznNIE+ao9
	aWbTFrclRJ5Xo/KgWWhSeBJaPbwYMyKUhw3+yVTAvEXIHUToYNzN9abBTKfipINOw9Bc
	WcgwNUlAEA1cqQBi7MK+xj5U7z2HAG1tzIiB00qYiXtI8j+5n1XUPeFWqFDCja9BMqsJ
	PPjiBbDV872PwOVf+zQXm2Xp0kp8S8N87waC/UfDMFeRXZuXihHxflKKT0r7JRA/5rZ9
	SrOnoLkMbbVLROePyLFB7gVj2O2i0n2Fb1Ioc4wGiddusTfAXttLfhl2fvgnJ598oyT5
	ANkQ==
X-Received: by 10.15.45.8 with SMTP id a8mr4932280eew.1.1383250306304;
	Thu, 31 Oct 2013 13:11:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm13049817eeg.13.2013.10.31.13.11.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 13:11:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Oct 2013 21:10:51 +0100
Message-Id: <1383250251-16449-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [meta-networking][PATCH] cifs-utils: Add PACKAGECONFIG for cifscreds, cifsupcall
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
X-List-Received-Date: Thu, 31 Oct 2013 20:11:45 -0000

* make files in bindir/sbindir a bit more deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index d8de714..2b7a0dd 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -14,6 +14,10 @@ S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
+# when enabled, it creates ${bindir}/cifscreds and --ignore-fail-on-non-empty in do_install_append is needed
+PACKAGECONFIG[cifscreds] = "--enable-cifscreds,--disable-cifscreds,keyutils"
+# when enabled, it creates ${sbindir}/cifs.upcall and --ignore-fail-on-non-empty in do_install_append is needed
+PACKAGECONFIG[cifsupcall] = "--enable-cifsupcall,--disable-cifsupcall,krb5 talloc keyutils"
 
 inherit autotools pkgconfig
 
-- 
1.8.4.2


