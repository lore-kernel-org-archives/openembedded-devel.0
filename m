Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7340160E05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 21:52:39 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id ep20so106287lab.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 13:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=tXRHV5SXRIU+WpbLVvWH5vGZuF/Am2EQcRyj6hxuryw=;
	b=bMpTKpc6OA4BFDgH8n+BYpZKrxafep5XwSZCzYUPgW83iHbLtBpIe0TGoXUS1oBd/0
	2vXT4yXAbl6SRgXm8haxHRmLN6Qh4lEbKRiNLm2QpYdwx7iBvpnw30V6wXsnV7f9MPCP
	XvoXUDldBeN+mdKXFvWIwIzYdqkNJoFLy0rwtrjR6O55xcAnuSNa6OftTjESr62qThXR
	rRLNavTStaBHgaUrWrLOF3FKk1mkTm9I6mqCUxi7RiTxI0tqLilvoA6cCgKseb+Lyq79
	B2vCu4v3Z3WB5/Dzu+MX1PQK4L4rOAaeh8xy56vt0/hCy1lA/l97tCaBOgreoPMBMbx7
	c2DA==
X-Received: by 10.152.19.65 with SMTP id c1mr6313111lae.49.1387403559280;
	Wed, 18 Dec 2013 13:52:39 -0800 (PST)
Received: from nysan (c-5eeaaa31-74736162.cust.telenor.se. [94.234.170.49])
	by mx.google.com with ESMTPSA id a8sm1114479lae.5.2013.12.18.13.52.37
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Dec 2013 13:52:38 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 037761C1390; Wed, 18 Dec 2013 22:52:35 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Dec 2013 22:52:35 +0100
Message-Id: <1387403555-26615-2-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1387403555-26615-1-git-send-email-david.nystrom@enea.com>
References: <1387403555-26615-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@enea.com>
Subject: [meta-oe][PATCH 2/2] pcsc-lite: Fixed broken URL
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
X-List-Received-Date: Wed, 18 Dec 2013 21:52:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
index 266781a..85ec414 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a39d325b7d9cf2f07826a5154b16500c"
 DEPENDS = "udev"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/3757/pcsc-lite-${PV}.tar.bz2"
+SRC_URI = "https://alioth.debian.org/frs/download.php/file/3757/pcsc-lite-${PV}.tar.bz2"
 SRC_URI[md5sum] = "3e4b777231d35ce35c15c0704f936eaa"
 SRC_URI[sha256sum] = "1e44049168d1ce55fd56c175f61206955254df0f385455f2a20ec7e8a0e6a77a"
 
-- 
1.8.3.2


