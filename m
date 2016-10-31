Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 72EBC71A7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p190so14027207wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gcl/3O3dJ2pJ8YawxuqFeVfVgy0DKPNHsBxzz64Yqvk=;
	b=lnO9+EoXT/sum3cTLhARvhI3lhgjQp1awkrc6+Rg7wiuyJ1f3FR2fEb/wmvuFOn0RN
	jA155XjKjeT8LOLLyAftVJAi33uZvcTEhcF8MzIb6+hsrhPCt7ocraa6ul6gKD5gKAso
	uXrW+5xK0onMTU3Z0/K8sSCJGeFF7jbYfVq6d+Na0tsQbHKBrqHGA5okE5HZ1n42zXCG
	NhRfOJjYzcTAUlj3gCfnMnwkXiATzXofQhPpo3wl9P9p+2QUNMp0i8m+1GahyDNj2iDV
	74wWvmdtrAYJXUbEqn/W8PZGpDb7MpfGuYYZ/Du6d45dFXqKd2hC2nxjJefwHoF7nfLU
	bX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gcl/3O3dJ2pJ8YawxuqFeVfVgy0DKPNHsBxzz64Yqvk=;
	b=Z6Gq18Dqwu6WgnhMo/azi/8Rk6lrr9jGZ7uo4Xa4YvpgoK13TgDyyQDiHrc5mXjff5
	nHySaiZ2eB303Hpw/m1ibQFduY+Q73hBnzY+/exRhU8ClmtIXMFY4RQEOw/92ZLKzt5Q
	RF3LpYKT7YHFPP8qvABQacWTo0BtUZr046VaWYebCdjx9f+Z0ystgw4OUfup+AqguXCP
	eu0FamXXtIzX0en98UxaaUPmamsNLYFoTARfjV8d/KLU+KsSLxbCPQIBCmakqQ0Nbb4n
	SrGITmSLL6vk0ivRrYHvo4PkAr3Nl6smTk1VLoKkjoI7hwVBH/pUO67uhKie5x5IfVIe
	ZAxw==
X-Gm-Message-State: ABUngvdVGo6WazhqxIZmlX67nPjrfa0Pp3Dh9mtEOl2PXMpU/0OBAtDwkGfdNVgCzan+Mg==
X-Received: by 10.28.150.134 with SMTP id y128mr13984553wmd.6.1477951873321;
	Mon, 31 Oct 2016 15:11:13 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:46 +0100
Message-Id: <1477951849-32149-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/13] poppler: update to 0.48.0
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-support/poppler/{poppler_0.47.0.bb => poppler_0.48.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.47.0.bb => poppler_0.48.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.47.0.bb b/meta-oe/recipes-support/poppler/poppler_0.48.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.47.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.48.0.bb
index 071cfb2..c586755 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.47.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.48.0.bb
@@ -7,8 +7,8 @@ SRC_URI = " \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
     file://0002-fix-gcc-6-math-ambiguous-errors.patch \
 "
-SRC_URI[md5sum] = "669b195ff24173d35cacf1d20b6fe4fa"
-SRC_URI[sha256sum] = "b872e7228fc34a71ce4b47a5aea2a57ae67528818fa846e1e0eda089319bd242"
+SRC_URI[md5sum] = "8d61c91cb9e99ad38bba1b0b4432f174"
+SRC_URI[sha256sum] = "85a003968074c85d8e13bf320ec47cef647b496b56dcff4c790b34e5482fef93"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-- 
2.5.5


