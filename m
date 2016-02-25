Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2F47735E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:13:02 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id b205so50124995wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=G4w+QirWqT4JP82g8H6GvIcNzLTsM8FE7YCXhD4ZfEE=;
	b=gqHr3ygqJFSjUeAHOlJHb59ZnQmfP5TUtn9ihB7uiKmaJLLJY8jWp2nuDxCJrw/i4C
	dC+6iNiVA08mRkIYuPTkMtx2hgCGFf1JPeNHBp5BrvOu94ShVU23rCQZWSwsWThR4eUe
	sat3PMUPxejTk0i7ALUxboL0TgkAjeAfAVGmLXvDWxysz6LESZTc05kj8wWej008vINi
	WrclwESqdkvpHgPjWOWPBo9U2n9/FqB591xoc4h3zKeXQ209dm4mxyTmFzNb1RHqM0oZ
	mVHut7uKoZfsQqnaLoyswBmve8kjMTTn6sKQ/gyKHTpzoojb5ZHGkuMFcOrhoHNFWZE2
	EqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G4w+QirWqT4JP82g8H6GvIcNzLTsM8FE7YCXhD4ZfEE=;
	b=AYZm/SaQEOshRnDvNIpY1ianZL9+7vKXpTeTUG4jAnsYmbR+IKAmuAhbrTQIG+GRZF
	6l6tS5oiJf/JzIlmmjK5QxqozM16WZ/QDt3zlInlTySnmJjt/sHQWOIa0MCgAXMySuDt
	vfZqbkIAqdX/j61r7h7oVrRcTbVAhra+nM07SLTndXm5sqU2YvfF7AVW2F3cy004uQpT
	Cz9HhZd95WfpPxj8nP+vKcyHW2gK0dQeplE6pv/NdPvPfc4KA/XLtuRD3iPx4e9e0oO0
	3m7iituvc80vcTaEH2U3TdcZ7qyyfEDOvIK8MRRhD4DhXTigGOc6kSAtJveNONzY2sBc
	jp0g==
X-Gm-Message-State: AG10YOTjc4BNvzYli5oOq8vfX90EtynKwvwHEIMjTkZgW/tK2IiePWFdbTZyGFjYp3BoFA==
X-Received: by 10.28.65.5 with SMTP id o5mr886003wma.75.1456438383374;
	Thu, 25 Feb 2016 14:13:03 -0800 (PST)
Received: from localhost.localdomain (p4FDF1458.dip0.t-ipconnect.de.
	[79.223.20.88]) by smtp.googlemail.com with ESMTPSA id
	hx10sm2163102wjb.25.2016.02.25.14.13.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 14:13:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 23:12:49 +0100
Message-Id: <1456438369-28621-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1456438369-28621-1-git-send-email-schnitzeltony@googlemail.com>
References: <1456438369-28621-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] geany: update to 1.26
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
X-List-Received-Date: Thu, 25 Feb 2016 22:13:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/{geany_1.25.bb => geany_1.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.25.bb => geany_1.26.bb} (74%)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.25.bb b/meta-oe/recipes-devtools/geany/geany_1.26.bb
similarity index 74%
rename from meta-oe/recipes-devtools/geany/geany_1.25.bb
rename to meta-oe/recipes-devtools/geany/geany_1.26.bb
index 59c424c..ca4f6b6 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.25.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.26.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     http://download.geany.org/${BP}.tar.bz2 \
     file://0001-configure.ac-remove-additional-c-test.patch \
 "
-SRC_URI[md5sum] = "888bd82d62759ac47a4a398fb27c8471"
-SRC_URI[sha256sum] = "8ee41da28cead8c94d433e616d7ababa81727c63e9196ca6758ade3af14a49ef"
+SRC_URI[md5sum] = "bd457caba57099cfa23b063e78b6f819"
+SRC_URI[sha256sum] = "e38530e87c577e1e9806be3b40e08fb9ee321eb1abc6361ddacdad89c825f90d"
 
 FILES_${PN} += "${datadir}/icons"
-- 
2.5.0


