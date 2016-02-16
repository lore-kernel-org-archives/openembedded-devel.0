Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id C37CD73163
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 16:26:17 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id yy13so105719685pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 08:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X3hftL5zemI8JC1igGWLjlIDYv71LCdM9b/9gsCc/N4=;
	b=MQc1ekHYOEu9sxR2ihAcSTcNAYUF1YO0cxIzgy6k829ZFpQQKu8m92dDBIjYibbRLT
	q/j6lz7Em6HXOWnD1FSdcYqiXoDIAkUz6tlgX5AQF+FUwbYcyyoslJxN4EZyWcPTc5G9
	tc3wH5ewse41pjB2Hw7j4cwngh+UO22BUiAL4XMRT5DQjlwzEiImjnBBMBifr0TYcajC
	paXEDT3jb1ftS9ik4Mm9glQ93wViUlbIOPb7Q3BpMDi4QFwfrhNVvdVv4wxJ8QEsRsbc
	jdh5YVjiXBRbLyEzB4JCsDTdb5QwAfHGqKde9uzmChgcSha7uXyHKStXvNlmIzVEa8D+
	wB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X3hftL5zemI8JC1igGWLjlIDYv71LCdM9b/9gsCc/N4=;
	b=PdgD5e6y+m5zGPt4nMhuPyz++cutY1tfkOZGY7XCezeNPOSy8e8OzZmzgdUJ6RVEpS
	TPLb35vvB8u3KuA3QF1hu+csag2dKqgktR4Xj9zOGsLhuqDEgw478qdQFc9px86GGr1g
	d89tsKEuxLOxU3fSjA4/k0bSmWA9mnVrMqj8bkkro97MJ4vwN4GvY1PPYGU0yhVeA0hK
	aFVEEWtunEN8HU9mOCCurWNI/X1//ZqgyjfS/2y5Wi7MIo31lVrO2G9XV3z6zq1Eo0nY
	JshRVN2aPyrvk402k+FiEZyMNwciKQ5HIj+q/jSXp8mvIGNmdRrBxsu0Dld2zu9woe+a
	0uyA==
X-Gm-Message-State: AG10YOR2DyHaky2ptcDc3UP79nyZwHhC9zqvcpHFTsOIIefoInjLdU3kF4rTikIHu9tQYg==
X-Received: by 10.67.4.225 with SMTP id ch1mr31439218pad.77.1455639978355;
	Tue, 16 Feb 2016 08:26:18 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k65sm46913098pfb.30.2016.02.16.08.26.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Feb 2016 08:26:17 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 14504FC09F8; Tue, 16 Feb 2016 08:26:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 16 Feb 2016 08:26:03 -0800
Message-Id: <1455639963-13189-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] lssci: Add package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Feb 2016 16:26:17 -0000

The lsscsi command lists information about SCSI devices in Linux

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/lssci/lsscsi_0.28.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-extended/lssci/lsscsi_0.28.bb

diff --git a/meta-oe/recipes-extended/lssci/lsscsi_0.28.bb b/meta-oe/recipes-extended/lssci/lsscsi_0.28.bb
new file mode 100644
index 0000000..4b8cbaf
--- /dev/null
+++ b/meta-oe/recipes-extended/lssci/lsscsi_0.28.bb
@@ -0,0 +1,12 @@
+SUMMARY = "The lsscsi command lists information about SCSI devices in Linux"
+HOMEPAGE = "http://sg.danny.cz/scsi/lsscsi.html"
+LICENSE = "GPLv2"
+SECTION = "base"
+LIC_FILES_CHKSUM="file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
+
+SRC_URI[md5sum] = "4a39e3b09cd422e2cae3edbaf56b3176"
+SRC_URI[sha256sum] = "025d009a1af42bc5b2fca664c44c9ecdfd754356e4a44f5c6aced2420afadd50"
+
+inherit autotools
-- 
1.9.1


