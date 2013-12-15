Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 64FE26DAAA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2013 16:05:42 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id r15so1766092ead.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2013 08:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sMYs2XYpAfIoUeRMWJSqU2xtWjS0Ji0HGz4G+OsB2vU=;
	b=YG0YTyJJ2SKr1Xv//6BoJNz/POTV7bUAFUh0eOFr2Y70NY+6abmMAIcGwRNzrvJlWv
	PsVr3t7QYqYKd8q4sHTrK3FvwhwcRiOfYimd+ZEfKkHSMxvXtv9TEnR8lYQRF5pBLbd0
	JO/7BetyuJ3erS7Mw2g4xZVRqXLFwb6AvNVECJCFVzZ+67m6W5BAJv8LA2Zv3duUqZhK
	NdU84Fg2CZT/WMdDF9jmK0SwVn8q+K688xMnGCgtmCVyEhzoPXL6JlqyWTh2TkWDhZpR
	lFWOQD/itATlSE7qxVlbz5unNhgMYMuz0ZqE3FuqmgyqsP/3oiJcRgD7fOohAhT3d+2M
	zgNg==
X-Received: by 10.14.115.133 with SMTP id e5mr12254699eeh.91.1387123541648;
	Sun, 15 Dec 2013 08:05:41 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm31594641eeg.4.2013.12.15.08.05.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Dec 2013 08:05:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Dec 2013 17:06:07 +0100
Message-Id: <1387123567-25357-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-systemd][PATCH] rpcbind: Rename .bbappend to match any version
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
X-List-Received-Date: Sun, 15 Dec 2013 16:05:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../rpcbind/{rpcbind_0.2.0.bbappend => rpcbind_%.bbappend}              | 2 --
 1 file changed, 2 deletions(-)
 rename meta-systemd/oe-core/recipes-extended/rpcbind/{rpcbind_0.2.0.bbappend => rpcbind_%.bbappend} (77%)

diff --git a/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_%.bbappend
similarity index 77%
rename from meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
rename to meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_%.bbappend
index 5cb6bf4..f006b3f 100644
--- a/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/rpcbind/rpcbind_%.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 2}"
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-- 
1.8.4.3


