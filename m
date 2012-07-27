Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Suibw-00025y-5R
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Jul 2012 13:21:36 +0200
Received: by bkcik5 with SMTP id ik5so1347501bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bMevSISfRSOMDBJGJqPEHkQTbsd+Y+0THZDFCkP5TFY=;
	b=f3Xb2JQ9VbKpvMmxPwLDY5zQY/YrYm1G66c9YvpOoa3PbUb+PTa58AJonNKtZJTgdv
	bsIADKqwtvSSAk+5iF7m1By0fAnh1s9r06aGqu3O8OkKpo6Feyx8S9SkKQOcXIPemsqh
	Dlu1ZGAj9dA60VFbe2zcKfZOBRInsBCL9W9sbkiFCiRl3POk0hzhw3wZthcCKyy7piUw
	d5o1kOZwzQSE+0UfUnZuZJ6I0fBjpk+ljiSCcyKyGGUyTH/CEgI16O6XcHJWGW1NHUkW
	xumGt459rGciPrUOicf3GyNzVSYGgv91Oi7tyjiq+tQvCKCwJHO30H6nccINfXzZYVRE
	+Edw==
Received: by 10.204.156.68 with SMTP id v4mr793744bkw.68.1343387404459;
	Fri, 27 Jul 2012 04:10:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c18sm768822bkv.8.2012.07.27.04.10.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:10:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2012 13:10:07 +0200
Message-Id: <1343387407-18340-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][RFC] tcpdump: bump PR to rebuild against libpcap1 instead libpcap
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 11:21:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb b/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
index 9fd0ac0..46b19a1 100644
--- a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
+++ b/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
 SECTION = "console/network"
 DEPENDS = "libpcap"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = " \
 	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
-- 
1.7.8.6



