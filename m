Return-Path: <dl9pf@gmx.de>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Dec 2015 21:04:42 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by mail.openembedded.org (Postfix) with ESMTP id E50F960116
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 21:04:42 +0000 (UTC)
Received: from elrond.auenland.lan ([95.90.4.156]) by mail.gmx.com (mrgmx101)
	with ESMTPSA (Nemesis) id 0M8IuM-1aMXf70Wos-00vxJ7;
	Thu, 17 Dec 2015 21:59:39 +0100
From: dl9pf@gmx.de
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Dec 2015 21:58:59 +0100
Message-Id: <1450385939-18902-1-git-send-email-dl9pf@gmx.de>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Provags-ID: V03:K0:8XrxAT+5pFMXVxFiqu0pI8QKSreCxKhv8b+aYBwydzmQI9Aqvbl
	vOogPkg6kGqI9GFybUcTlzYSEWrO8oVymsNYvdN1DVIW7epFk0c0Z5SS7B2Un6l8cAgT94R
	2HBbbBBFWRbWQx/FJay2b/7Jedjw09LiQpQF9MJsu08rZsocnetyXyejfryZUX/zXMX8XiJ
	s4yu3tf/d44mFYzd6CXBw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:vjUu6e2PSI0=:8iA9pWuxSQcQMshdQyFlE/
	bOGb+MsPQLvnh+kl5+H0J5RJIo7rM3YjC06uJKJhc7pKYPhnCYz+uwCL77rYt3KzuBw1/Xx2K
	q6LYG8zMxeh7iDNB2GxuQw//bW7QMcPDvVwXoYQ0/hvz0gHYut/oVeBYAgSwQNgg/6keGw/X6
	sHliHxmldLwIrr0ZqtLysJyhwod/jr4NCt+sUmNo8Ax9T3F79V2zfGpBZQegUuTVjKekLBana
	NH5FVenmTI4kXk229Blmed246Y+LrBzs3QGrXN8eIVimWpxAMrAqixHA4Vs1t4YtmT7E/BqM9
	3BZkchTxAQShHNkRKSxAU87Nwb6Xq5LWV6SqMB0Frb1k0juc3ki3ONnm9fgE5gH5yDqQDUi5e
	7hdMbbhYQ/kDWJKT+dFBuRnRw0S/+9rKvVL19qVB6xHJLCXHQklHeZLndt4VAia05NNP2nXjv
	H1i+O/ECs+GJRpCWRlZ48Cs1z8XqFiecGGbsBj48AbOeZSR/JUkLOIGbmXIB7f9kVxOHRn3DE
	FaBU7LdZ2iUdjZyv/SGFsasYrdTaVor8tBQfs0O1cmQuX7K8Zsq3ROmej8uukPFiOy+z3Z/+F
	u1CPcI+8G+zvxUDJSze0P83qjBcaipAlog/E2iEGfH/TzL8O8Gz2iAaPAgL2sQrqqcE4XhoM2
	y0n9lNkmXNnDkVuyLhrw35MuZ+o8nO4vihZEHLVLBjwjTw8TBeebsyAyl1ery9zpTbfJ+VjWK
	CaRyRaN5rTiHdy7gOn9JaSk0hnrpmvTcLeVufWqZrIoZEGxGVjEmj11k4Qm8tINnZNSh1AcvU
	vtdFrZp
Subject: [PATCH] Fix connectivity check for BB_FETCH_PREMIRRORONLY case
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
X-List-Received-Date: Thu, 17 Dec 2015 21:04:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jan-Simon Möller <dl9pf@gmx.de>

BB_FETCH_PREMIRRORONLY sets BB_NO_NETWORK (implicitly in the fetcher).
To avoid the sanity check to fail in an offline environment,
use the same override mechanism as in the fetcher.

Signed-off-by: Jan-Simon Möller <dl9pf@gmx.de>
---
 meta/classes/sanity.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ad9dda8..62dce92 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -271,6 +271,9 @@ def check_connectivity(d):
     test_uris = (d.getVar('CONNECTIVITY_CHECK_URIS', True) or "").split()
     retval = ""
 
+    # Check for BB_FETCH_PREMIRRORONLY and adapt BB_NO_NETWORK
+    if bb.data.getVar("BB_FETCH_PREMIRRORONLY", self.d, True) is not None:
+        bb.data.setVar("BB_NO_NETWORK", "1", self.d)
     # Only check connectivity if network enabled and the
     # CONNECTIVITY_CHECK_URIS are set
     network_enabled = not d.getVar('BB_NO_NETWORK', True)
-- 
2.6.2


