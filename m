Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1A1774DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:54:43 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v125so7023892qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:54:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zaz/L7G7wAtkjjDsTEmhRZmVDFOHqHXekwaSIslQhVM=;
	b=FTpcIT0V9ATRggTaCXIay+Ldyz2CIv73VJbaN50Y4mLezx7KfHEgFTgz6mFgKbiF7r
	WMAddEH/DVz8ZahKDK8O+VpJR7utXnro7jQCSR9yaTtvL9JCuuKfX0gsHEskRgnK3h+D
	wdJ5aFjOpv+M6g2AkJgXdQBE/XDr7wACLKmkbg4v5yMRreDP3fK/zFbfYrVOV6DNS5Hg
	8a2RgwRMqlj5nbi5U5pJC9GBPFn5JYq2NDdVkotTrum7CF9nM0Rd51ik0PXHelQ8RUY6
	7lVg4FcT6BiF8EnaQeCY72UJwjQiYAlWm/+2eJxh9xbRF35w0Fzgt/AXeeY1zUfSLSZe
	eGpg==
X-Gm-Message-State: AMke39lqxViLRx2dTEhca+1huMCRSOi9r9Y/X3Ucf2bu1KZgfnEGrcwidPjDpJXpeEZTWA==
X-Received: by 10.55.71.148 with SMTP id u142mr3785174qka.277.1488815685172;
	Mon, 06 Mar 2017 07:54:45 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	d189sm3356243qka.12.2017.03.06.07.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 07:54:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 10:54:32 -0500
Message-Id: <1488815674-23600-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/3] python-click: set clean as broken
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
X-List-Received-Date: Mon, 06 Mar 2017 15:54:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-click.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-click.inc b/meta-python/recipes-devtools/python/python-click.inc
index 163ea37..718bbab 100644
--- a/meta-python/recipes-devtools/python/python-click.inc
+++ b/meta-python/recipes-devtools/python/python-click.inc
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09e8b7869f94ba9e9a7b260d53c65dab"
 SRC_URI[md5sum] = "fc4cc00c4863833230d3af92af48abd4"
 SRC_URI[sha256sum] = "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b"
 
+CLEANBROKEN = "1"
+
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-threading \
-- 
2.7.4


