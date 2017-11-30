Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 15BFE78682
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 19:07:57 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d4so10123517qtj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 11:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EwVNxTbG210yilBIn/nflPNOJv4WhDfgw/nSS5iCXJE=;
	b=Bj+UlzZtxPmczCHLyPUplC8f5SlK65LJ9A5P0pRgM0oq/u8Yft3Yg5rlJ8d44hZftK
	O31sIQdS/tbUguMZK+tS2c4q69frdqq+u8yHlI569aNj18UX9ivk1JMuJgc48V4GYJgR
	eQpmBG5GuLGbKRiwO/RW3UU4g4OJg7M+8hfVhEkc6PEm84bdAC7pr/MMi2jjePom4edR
	14lb8c9Ek5Q4l07gS0wjDHiM3iYL1HPRS8XUQOY3sxh6onyDS6m2DvB4Eb0kiOa26c8W
	2CkOAMpk5tu2/pWrIKzNHRWAcZzicWticrtsJfUQM7Ipx2Y6xJ5Vjai7s3KxJce02xE8
	Sq1A==
X-Gm-Message-State: AKGB3mIyP1NPbGVrTxwJrGQ43O+Xmpa4WYjw//cEQr8EcnLSDC93XPvE
	zz3JTud9NXfY3VMW0Pj4tOXe7ymN
X-Google-Smtp-Source: AGs4zMaycDT3/68sm9uDfdPt0PWvwUlyCIj4lJ3OkRFfGY8OwXhOEt88D7euHtAfaZk5NHLziEUIjg==
X-Received: by 10.237.53.235 with SMTP id d40mr5169957qte.40.1512068878587;
	Thu, 30 Nov 2017 11:07:58 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	u83sm3379062qkl.13.2017.11.30.11.07.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Nov 2017 11:07:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Nov 2017 14:07:51 -0500
Message-Id: <1512068871-20922-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-yappi: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Thu, 30 Nov 2017 19:07:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-yappi_0.98.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-yappi_0.98.bb b/meta-python/recipes-devtools/python/python-yappi_0.98.bb
index 51308c8..651ce77 100644
--- a/meta-python/recipes-devtools/python/python-yappi_0.98.bb
+++ b/meta-python/recipes-devtools/python/python-yappi_0.98.bb
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] = "5f657129e1b9b952379ffbc009357d0dcdb58c50f3bfe88ffbb992e4b2
 inherit pypi setuptools
 
 RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-threading \
     "
-- 
2.7.4


