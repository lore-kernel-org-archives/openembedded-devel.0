Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DE74F771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l6so16767380wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NgugCYVHgG22uo2roVZeGojJ5JzTeSbhPVwzMLSKIiE=;
	b=uJwxKfn5F4ovUaajl3L5cNuH3WtZBbbJfWtR9Jo6OCF0EbYnDEvVjpGU4tzFhQGtUV
	WYhl2GRhpGPV0ozqcPqMfDXYwaJigyAFHAbSDbl/RbPuddxOkY+z3rHJAqzwU6795tSx
	Bo9bPpWufzISxeTFWs4/LKcP12lLC7lQ/FbOYSeG+2Jt5MEhpBnFaOy9CLJPX2J2xOEt
	lJ/u9S7ahzFJBkP4UBQf0BhuS39cnv3fYKI7XQ47J8bux3ZcZMCjpJ4861BPIA+AF45p
	YkjI6SRZ4lO4eaAIhKY671M7E4i/A0Z6s7ZjcTUCF3kmmstbVnvBV3w2CKPhA6XTAXyb
	Aqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NgugCYVHgG22uo2roVZeGojJ5JzTeSbhPVwzMLSKIiE=;
	b=j4NtDzkAgoLLIJsZ70A3jdsN4Gv6MRrmY2mcwoodL5f+m1vz1VdrxGH8OwKW+GFlHO
	tv0xXlfMDX7KuvP+Rv6wrVPjBHYBZL3+hUSyFEQw76guFZjq557It13qvCU7CCMV2TS2
	lD9GcrSJoRAalQt0gKG0ZXmnxI6UFqtEszeXFTL/ymYefHbxT69pcZbZdBJZGyOKFnF7
	vqchgPr7llzYH8fU558Qgwtkd2Po1tcPp3jrrSTGL5BnDbFcuVGA92W+QV1EVX/dkbrn
	ikSjpfKoHYmBLhhx8XiJ0RO9i3FdzTJMS2eLod1wWqWUI5eGKxVGVWfkR2OPgA64lxLH
	NIWA==
X-Gm-Message-State: AD7BkJK8uWHlhjx0BnSdWoh7Nia5wu/mMXLLQLEbrYUSWROCjwvahO/O4uUrzQg/d2H/eQ==
X-Received: by 10.28.177.134 with SMTP id a128mr15066134wmf.55.1460317322519; 
	Sun, 10 Apr 2016 12:42:02 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:19 +0200
Message-Id: <1460317290-4787-21-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 20/31] qtwayland: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwayland_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 78d8a3e..a5e3abe 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "bebe9beff3e9874498474cec32634cf281ddc453"
+SRCREV = "29b8bd8b1117589341110502fe516bf22c920747"
-- 
2.5.5


