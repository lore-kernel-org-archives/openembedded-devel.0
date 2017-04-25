Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id D3B1777B38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:46 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id x86so52372343ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8o3bwDB4DMEzFSBnmhZRONCKPaEVzBaw54XMNo+Cvnc=;
	b=YTcQBY8F9WT9wP1EwN454n5GNbCtA2H9TKw8Pj3I08WM+3ZUi0zRjMHEQUATGZ/1zj
	O4O043lbSjweOsenfcK4ljy0FiJz1Sp0PS2RF184u3GppDpopR96PHL1WfFRdWw1cUdW
	EFG0nkwkdPLoykMXW39FIxUROXJM1lXt3OcRCore9Q7lx50EqXTSZJNWxBJURUYxBCP9
	lDyKeyoS/i7qW95oDTZITAxiAovVoEvn/cZyKCvNnZEbxmWLkZNyxHN6gzRQFco6EtDT
	fKMhbNw3PyZqKeNsqke6EJgQQbjOLfSJls4ZEuU1EEWbP2Jp4JMM+8V6ObbnrPnmUO9u
	Kvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8o3bwDB4DMEzFSBnmhZRONCKPaEVzBaw54XMNo+Cvnc=;
	b=YmDXfMI3d6SHP6fX+jjKpqR0eNVCyGLWpjYmHwTeEBn7rZWyurkX2Pw8NLtpsxMyol
	BN+h/u3h/YOoTNt5Lnp6f/qYbDvbi9aMfG943dl2xXTvSiITN3oHLIk9FEMHkxGrcG0N
	NiOYPkYDSGyUA9iA5mwy347MLSSKI7Jmhq8BZZAbM3XbhHx7V6FjJ3CSlYlxUnbw0Yhp
	AVsCPpCsAwImA2cGKwIRoK7mm2QUo25ZKfmRzn0rQrhspVjb9pTgA85BZWiyK3H16hY7
	XnZisBpqBCyjxgtDK4E31f2KHeY62GU4oTceDR2NQZ4rJ77LqP8aQm6t4nmpomE3v2AI
	RNJA==
X-Gm-Message-State: AN3rC/5Dt2GOqnXzMrAKaAftVcXEhhBmfeZDaGAAJjSziiWasa6JpC8z
	IPNo1XWTIXQfEw==
X-Received: by 10.107.20.211 with SMTP id 202mr11596609iou.94.1493092068173;
	Mon, 24 Apr 2017 20:47:48 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:18 -0700
Message-Id: <20170425034719.8630-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
Subject: [meta-oe][ 10/11] frame,grail: Disable PIE in SECURITY_FLAGS
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
X-List-Received-Date: Tue, 25 Apr 2017 03:47:47 -0000

Doesnt compile yet with PIE turned on

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb | 2 ++
 meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
index d5a73384d..da1a2a36f 100644
--- a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
@@ -20,3 +20,5 @@ PACKAGECONFIG[x11] = "--enable-x11, --disable-x11, libxi xext virtual/xserver"
 
 PACKAGE_BEFORE_PN += "${PN}-test"
 FILES_${PN}-test = "${bindir}/frame-test*"
+
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
index 83ca72415..22fd0f48e 100644
--- a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
@@ -21,3 +21,4 @@ PACKAGECONFIG[x11] = "--with-x11, --without-x11, libxi"
 
 PACKAGE_BEFORE_PN += "${PN}-test"
 FILES_${PN}-test = "${bindir}/grail-test*"
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.12.2


