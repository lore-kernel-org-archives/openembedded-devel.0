Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id B3A6871B16
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 22:41:07 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id xy5so46568778wjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2016 14:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=am/l5Fz38yq/cLD6lo+7Soomq3Lcz/yswD9ZJSsiYzE=;
	b=lhTYEIjjk1lyrsRhk9o+AweNL36wwkQphwE/NrDERIcZAyfwYwYRFK1/fK0KEiPjkA
	eY5HjhCHrMOFMpIOjgP6/KC3FD+0TTr2lcjboZsw55Z5PMtBbvZym1orb/H2me6LxLxS
	zEEMPJzLpeeJ1oItTsPw6v5xYQ4i4fS3uLhePdvlzxGGJ8hoHLo/JR4xtZnyCUfPrd05
	jS21w83hTF3XMVkXx+N6MckZp77467HNSJsy7MhkoSBye9lDvyTn13EPL3f0Ax4YccNp
	+aVHU1D1nIUnTX7Uzy9MKyrF0X81OyHX0fTMZO2oCJLmryzJ4+bIBp6DsjuEKb/Ogmq3
	eGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=am/l5Fz38yq/cLD6lo+7Soomq3Lcz/yswD9ZJSsiYzE=;
	b=SIz88wFOvOOC/peTXjeUhohu94KPGKUkqaJbYHTiM4EVpVqVvV79DTnj5/rTmE3QjL
	D1eJ5Z9AzrVoLKQipP9mqIvb2eHEA6fIogmmbmzb9xuQ395AP0o+RiSBi5YxGr94eB/X
	0iXMUch0HLNYRrbCZVeWDB8P9khvaJRpaJpxzz1udW483u2rbeelMZwqCaMaVFSdYbE4
	wVI8n3ZffZyGFSe/z4SxLIj8wV5Ydak1ljfBfYHeclY2izxMVCc01t5IGHex0o5RbuZh
	7JWr3b/DykyratFTr590BEa4i3TO2koU0PcDgifjp1ZktjhPvZRqelGN9vULDjPmXjIu
	4gNw==
X-Gm-Message-State: AKaTC025EnUUp0hF2gaTFYATfoKFHsBDP+fbV3Qq3B8G8vBGgQ8buGZM6FRr/8SzDwOJ0Q==
X-Received: by 10.194.85.137 with SMTP id h9mr54441274wjz.23.1481064068285;
	Tue, 06 Dec 2016 14:41:08 -0800 (PST)
Received: from localhost.localdomain (p579CEAA5.dip0.t-ipconnect.de.
	[87.156.234.165]) by smtp.googlemail.com with ESMTPSA id
	j6sm28060674wjk.25.2016.12.06.14.41.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 14:41:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2016 23:40:44 +0100
Message-Id: <1481064044-26249-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] poppler: update to 0.49.0
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
X-List-Received-Date: Tue, 06 Dec 2016 22:41:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-support/poppler/{poppler_0.48.0.bb => poppler_0.49.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.48.0.bb => poppler_0.49.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.48.0.bb b/meta-oe/recipes-support/poppler/poppler_0.49.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.48.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.49.0.bb
index ebe986b..ebb16d6 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.48.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.49.0.bb
@@ -7,8 +7,8 @@ SRC_URI = " \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
     file://0002-fix-gcc-6-math-ambiguous-errors.patch \
 "
-SRC_URI[md5sum] = "8d61c91cb9e99ad38bba1b0b4432f174"
-SRC_URI[sha256sum] = "85a003968074c85d8e13bf320ec47cef647b496b56dcff4c790b34e5482fef93"
+SRC_URI[md5sum] = "9e057ed8eee1f9979fa75d8f044783b8"
+SRC_URI[sha256sum] = "14485f0e1e43dcddf49cfc02c2ccb92910ba3e0e91e06f4bd2642ec00cb3a79f"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-- 
2.5.5


