Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id B61DA609B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 17:14:51 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id b8so7061719lan.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 10:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=FPP0nC0r8E5Z/BdH+vVnpqzMVcy3jJq98xU+ASFHFYg=;
	b=Zu/RMy9q0IzTdYDN3s9mmdxrlxmt2yhPcEfM5spngWs02ifIMWgsM4Zc5lpCW6+iDf
	H6LN7n42hRw752HQRJkOjzhg9qgCCI+NyHf9+w89XFPQKhsYB8CIR1DrmAGvTv5bB/7E
	Qrj/LK73iOUazkn7MBn8/uPocDhqf8U/wdNgLa2QAA2UVLNq8Dkz5fnKgQ1zM2eSAJ4h
	sUtLDP9qitg5aUjgzRanJ0jUD6gLz6FkWeMqKFlkuVF71ki5/k2N1vub3OvwR9JCCNMu
	asis68K37g5WjoPzNqXNGiYM49LbC+2e0gMIqro3sxQG18dYN2r6HRDSD+EbIEcZRXBb
	3MxA==
X-Received: by 10.152.28.41 with SMTP id y9mr1975693lag.57.1397582091211;
	Tue, 15 Apr 2014 10:14:51 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72]) by mx.google.com with ESMTPSA id
	jp6sm17806326lbc.15.2014.04.15.10.14.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Apr 2014 10:14:50 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Apr 2014 19:12:45 +0200
Message-Id: <1397581965-24301-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH] populate_sdk_qt5.bbclass: Fix PACKAGE_GROUP deprecation warning
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
X-List-Received-Date: Tue, 15 Apr 2014 17:14:55 -0000

Fixes the following warning:

WARNING: PACKAGE_GROUP is deprecated, please use FEATURE_PACKAGES instead

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 classes/populate_sdk_qt5.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index c921983..7b31bbb 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -53,4 +53,4 @@ toolchain_create_sdk_env_script_append () {
     echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
 }
 
-PACKAGE_GROUP_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
+FEATURE_PACKAGES_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
-- 
1.9.0


