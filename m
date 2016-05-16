Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 248C277123
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 23:05:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e201so372104wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 16:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ewgVDIpNKcD1aUVm467rxU3yk6nST2VrrQYxStBj8Bg=;
	b=SfQ4NOUimNfxPThmQiPRJXjEcrucVXHMGaoHi3XNUUxfWm8YWRsayVyGsmO7j9xUTY
	IG8uCByKpKX7U4nK6RKs/+OiGa0iGBLaEl6oUyrbm/QpdmtUyncZYmPvC5gwfK4No1M8
	Yp0Ysz9iW19ZltUYDSZ1SpyWZgP0HhKcGZd8UIq7aoWJ6dFOY97Zv1LRTsT4CSUNhwtE
	+eWcgYjo2uLFpZJZlmNZxTn/NbCVZSeeCAn7EPRSsWpc/MLGVk6j9s9hBeKpIUPxsBA3
	qeDCFoMYUKTfBgxkYO5UzDbd3IL6ZWZg0Rxv8zpBXhUUbepyIIi8ymMmz7Q8TNBAGDkn
	8Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ewgVDIpNKcD1aUVm467rxU3yk6nST2VrrQYxStBj8Bg=;
	b=GJE3A3isaZDNsDGsOqLdYz7lrmdZs/xGrleye25cx93UorBi8jqaIA6SsqN2zWF/F1
	prLW3BVjwPA/sQJhGMraGkT6hkfi1lc0my4DK2bDlg4keYTnfNcCH4F8VEzmGzqApwg6
	jY9EgWC+i9AZHHKiWcTXix/CX4MtQxLmqoI0aLVUALzE7eqMJIZGfibBL06YW78by0py
	fFZJEi1HSgaX4dQbusO1UBTUkRkrntbmKOiT4oFPD4hMHsiJUE6Cilp3XASdQPQ0OIck
	TXlHn2QvBIMVMWn5cSgBLFV+oo/e+j6mdYUMTOz6w7WwYv4BTu+zOGf80IGm0kjyCW72
	/SBQ==
X-Gm-Message-State: AOPr4FUt8INqTxHc/6/7ySEiXkq+aOfx9BSjibQpK6XYav14f2ajAxXdZ+Zs7FxAI58myA==
X-Received: by 10.28.215.1 with SMTP id o1mr20659930wmg.26.1463439900987;
	Mon, 16 May 2016 16:05:00 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3536.dip0.t-ipconnect.de.
	[91.10.53.54]) by smtp.googlemail.com with ESMTPSA id
	he10sm36100458wjc.21.2016.05.16.16.04.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 16:05:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 01:04:41 +0200
Message-Id: <1463439882-26273-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1463439882-26273-1-git-send-email-schnitzeltony@googlemail.com>
References: <1463439882-26273-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] geany: update to 1.27
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
X-List-Received-Date: Mon, 16 May 2016 23:05:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/{geany_1.26.bb => geany_1.27.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.26.bb => geany_1.27.bb} (74%)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.26.bb b/meta-oe/recipes-devtools/geany/geany_1.27.bb
similarity index 74%
rename from meta-oe/recipes-devtools/geany/geany_1.26.bb
rename to meta-oe/recipes-devtools/geany/geany_1.27.bb
index ca4f6b6..686222a 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.26.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.27.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     http://download.geany.org/${BP}.tar.bz2 \
     file://0001-configure.ac-remove-additional-c-test.patch \
 "
-SRC_URI[md5sum] = "bd457caba57099cfa23b063e78b6f819"
-SRC_URI[sha256sum] = "e38530e87c577e1e9806be3b40e08fb9ee321eb1abc6361ddacdad89c825f90d"
+SRC_URI[md5sum] = "7c23f835f45def89d10884c1343fa29e"
+SRC_URI[sha256sum] = "846ff699a5944c5c3c068ae0199d4c13946a668bfc6d03f8c79765667c20cadf"
 
 FILES_${PN} += "${datadir}/icons"
-- 
2.5.5


