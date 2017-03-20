Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 95F49778A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:18 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id p189so10052369pfp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rbv9W5dOy1zEEzcSqxbdAePb2Evg/6mGFjaSjtqxRFU=;
	b=uv1ontgboQxU4Ipd6dWr48ZA2Qq8YD8PYZ2q0RRXP4f33IMsdqoM2mSFKFv/BB0a1K
	mSMC9PRTVcvs4oYOhKH8Mzc20qXteyb6pncHKH3pDeQkFj7ph4Fmt+I6mWPLRlZu/7Ea
	3SGWH7VpVnJDQiXtRzEOSdAxABr6W8M4WOTUxH1vCrrFqpOICEqhu42Cg5C16Tlv2Hqf
	XFJFNWPjlsbSN+NfJJ0Rq3qx/Ot5bYPQ6r3UYCRreVn2kAfTBfOa2jl8elSdbVKQ+twk
	uVhmyzkM7ViaOUzdWB8+fZIT8mekHjSKkCmo8Ictx2VjA8bOb7VBar7beBrY6VnxW+BX
	Xacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Rbv9W5dOy1zEEzcSqxbdAePb2Evg/6mGFjaSjtqxRFU=;
	b=VtjK8teCzJmF6KAOVl1N53sBHgxmtQE3dpcM8PRODjI9f7yFbV7Ps+/PhXLRIYggwJ
	9rxIbPO4qTWrJoIWgIvIs5epG4b1ui/Wh7ZqVj2LihRD+RLYq6H3SyObjKFimSjhblY0
	LU+0hGcsd7RzGPVogoumM3mm2w+TDbfsrBsfYAux9mwI0hGR6PG+iY9UeGNAwLs2E3zF
	lRhIfEtjHWG3GLa7J1UJhKmX5WL5LzWeMjLRRg/7OmHNyBLuiqTxyMrlc/8MsrKMLOms
	sEixCtXYz7OMEtvvMFDAwSb466Via0cHMmH3K9AnIQXny7N4D9PGAxZklToeg17pF4nN
	rXeA==
X-Gm-Message-State: AFeK/H2ixKBOsucr973m8yohctrh3Ah3ktRAAQ6yRTViXAiYd+Nu5hvnJupoC8vuqhREuw==
X-Received: by 10.99.123.75 with SMTP id k11mr17109411pgn.150.1489987939430;
	Sun, 19 Mar 2017 22:32:19 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:46 -0700
Message-Id: <20170320053152.29352-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/16] zile: Fix build with musl
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:18 -0000

With musl charset.alias is generated due to a gnu-config bug

Fixes

QA Issue: zile: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/charset.alias

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/zile/zile_2.4.11.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/zile/zile_2.4.11.bb b/meta-oe/recipes-support/zile/zile_2.4.11.bb
index ff0517c8a..05a6afbe9 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.11.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.11.bb
@@ -14,6 +14,11 @@ SRC_URI[sha256sum] = "1fd27bbddc61491b1fbb29a345d0d344734aa9e80cfa07b02892eedf83
 
 inherit autotools pkgconfig
 
+do_install_append() {
+        rm -rf ${D}${libdir}/charset.alias
+        rmdir --ignore-fail-on-non-empty ${D}${libdir}
+}
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
 
-- 
2.12.0


