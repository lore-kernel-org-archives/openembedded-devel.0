Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.18745.1586098608255747866
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 07:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=iPZexUgU;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id C4DBE6029D;
	Sun,  5 Apr 2020 16:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586098605;
	bh=+e4MGkp1myb6w0U72PA3MUx/8ICb3yLpDm6HOPpmuUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPZexUgU0KbBBlfJ+J01/PN2mBsqzKnKZCdqDj8yflUmEbhicMBRiL8dX+CKEn/HJ
	 BtkBqr5z/2Ng7fxzZIh3GHX9ONQaRPH6wc2KdPYYLj9VkJvV7A7gQsYhLv34U8rS5k
	 o6+CL1ba+96Pzlkb8sn6Ppx+njUflyLFeWiQjEzsTxM2NIpZ+yex02f41KWDcDrjWl
	 J0iy5Mb829/C36NO1n9SRxDh8JymYJ8O/fyHtRTPM1STqSO1IiCdrZXsBFPq2C2G6v
	 RUY8nSjt7MidJeDKRE9LQsb651xWSGWhViN7h9HLXyelcFiB5Q7m3mN3KYhSSJRFUO
	 DNtxcvOpcQbXQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/6] pv: fix upstream check URL
Date: Sun,  5 Apr 2020 16:56:36 +0200
Message-Id: <1586098600-13571-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>
References: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status pv
<...>

INFO: pv                        1.6.6           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/pv/pv_1.6.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/pv/pv_1.6.6.bb b/meta-oe/recipes-support/pv/pv_1.6.6.bb
index 9649555..0eef82b 100644
--- a/meta-oe/recipes-support/pv/pv_1.6.6.bb
+++ b/meta-oe/recipes-support/pv/pv_1.6.6.bb
@@ -7,6 +7,9 @@ SRC_URI = "http://www.ivarch.com/programs/sources/${BP}.tar.bz2"
 SRC_URI[md5sum] = "ff3564fddcc2b9bd4a9c1d143aba4b4c"
 SRC_URI[sha256sum] = "608ef935f7a377e1439c181c4fc188d247da10d51a19ef79bcdee5043b0973f1"
 
+UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
+UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar.bz2"
+
 inherit autotools
 
 LDEMULATION_mipsarchn32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'elf32btsmipn32', 'elf32ltsmipn32', d)}"
-- 
2.7.4

