Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id F203261879
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:12:56 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m10so7968936wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2eJXzXb8ZY4uDfLWnOxqs80NtNMOvKDh46R8VExW7gk=;
	b=j6kCk4kb/P115jf1dh1dvAT5GHHJvR2KRJrSBwHhajCkfMplVc3NTcYS15/IobOZNP
	KI8FkHuBGzxPtQf3wn6Tg219McpNr/xuyYU208q3S1NfPr1RIpfCVhN0hCsCwoMC6jEY
	XvRxlpvmvQctTK3US9+JVbc9/7EvX0iFl5LbgWrlohcAkQ5xmue7AYOMUetG4AdQ4Dx9
	dFevjXIwZVU8/o2iECBPz8jM6A8F52oMF8pIK7en6spcmn/3rhww6KfEGPerR0wzFN5P
	rC1/JY6VzvzPtbnnAYx5D+ZeVL5ZwkzrTshWZwCLhqIZwujorIbTrVijn8rIkuRolvDh
	XhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2eJXzXb8ZY4uDfLWnOxqs80NtNMOvKDh46R8VExW7gk=;
	b=GdK0aECugwygbH71/pg4zkXSh5Chx+i+YDWhLK/t770bpsOyMyaKVtTV1NDK706Sri
	XLxfZWvmIkujewXjzwfSTG0poh+epSrceav/he90f4bVfQPkma7gcSMvTIxof5gFN0Xv
	0gmOnqetC36d5KU+a04grjDXnfllgBbMqP2H6mITukF7zlUpOj/G5ew9USnBF8Bfz3v0
	8QvBTUs1EhPNSq/gmwpeQf/FwipIeAILNFCOHxqsLaKXr3qoTphxF4qWtm7yJHssttOJ
	gUo82PilWQlIRNpdzZQSYJfFj6Ll8NR111ZnG42SebrU9gpFsZlFGt8iJ2j7aHKAvl5h
	CVbQ==
X-Gm-Message-State: APjAAAUUPk1ElTOUHCInF6oel2FW86XJfJfEBN6ekZi1S9Z2P+jMuxy2
	dLq1vAE7zAWQLwrlwjY8MNQ+0A1L
X-Google-Smtp-Source: APXvYqzPmUff1ydq8IZS0Y5Od7qXKbKWW3TRu7PkU3SoWWoxTymmcqcCaWBpyRdudDcQ6yTmyptYzg==
X-Received: by 2002:a1c:9d0a:: with SMTP id g10mr826485wme.125.1582841577308; 
	Thu, 27 Feb 2020 14:12:57 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id y8sm8911422wma.10.2020.02.27.14.12.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:12:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 23:12:38 +0100
Message-Id: <20200227221245.22944-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/8] evolution-data-server: upgrade 3.34.3 -> 3.34.4
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
X-List-Received-Date: Thu, 27 Feb 2020 22:12:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 1eae3df35..4da3f8259 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "687d6d7242d60a8a3a3322eee6a45dca"
-SRC_URI[archive.sha256sum] = "d2dfac5ca76e05e872fbb06a57cae0dace64818c4dce1e906b0396888270c3a9"
-PV = "3.34.3"
+SRC_URI[archive.md5sum] = "23293554e9d92c6c0c78b5568b286efd"
+SRC_URI[archive.sha256sum] = "985c4b4b613c50c999a4ca5e9d52478acbea85e1e99bab3a8b6e57ba7eace8f3"
+PV = "3.34.4"
 
-- 
2.21.0


