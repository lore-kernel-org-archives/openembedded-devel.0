Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.6576.1586256688852229545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 03:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=kErRX+Y0;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id EA31E6029D;
	Tue,  7 Apr 2020 12:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586256686;
	bh=9yiB5zLzzo+BcXocfsJtzl8oYm9irOHxkg+rdx/xNi0=;
	h=From:To:Cc:Subject:Date:From;
	b=kErRX+Y0ue4UEc2Se8eRb5GsHY/VmEadko8I+c8JxKSqWiB9aoHvQPZtJnvM3ZDZ9
	 3lIrG91syMUZ2BBF3byUgjv5jPRbqXj5X9zkgp52xcvVhoMeF5OR1ZUHot3aIIlibY
	 LZ0/7aSj0TtvBSgriVk9Wew0+CIo83ebq2MLOBRhOqtOZ70tP6sD8AmhRXLtO7DGUV
	 i1WSlTHXU3LbMjmnbw5uQj3MGSKIevBCYEv9sqj7q4ulcfaEqwIDo9sTZj8UFnkusw
	 rjoQ8kv7MDR/WTJvXsKjn3CAhBdEBA1BLIpBktTbJOU8aMhAo2jje0hAc2qjCFlq5O
	 /JKLeyR1h6lig==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] fmt: upgrade 6.1.2 -> 6.2.0
Date: Tue,  7 Apr 2020 12:51:24 +0200
Message-Id: <1586256684-29815-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/fmtlib/fmt/releases/tag/6.2.0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/fmt/{fmt_6.1.2.bb => fmt_6.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_6.1.2.bb => fmt_6.2.0.bb} (89%)

diff --git a/meta-oe/recipes-support/fmt/fmt_6.1.2.bb b/meta-oe/recipes-support/fmt/fmt_6.2.0.bb
similarity index 89%
rename from meta-oe/recipes-support/fmt/fmt_6.1.2.bb
rename to meta-oe/recipes-support/fmt/fmt_6.2.0.bb
index ff9bd7d..05dc94a 100644
--- a/meta-oe/recipes-support/fmt/fmt_6.1.2.bb
+++ b/meta-oe/recipes-support/fmt/fmt_6.2.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI += "git://github.com/fmtlib/fmt"
-SRCREV = "f94b7364b9409f05207c3af3fa4666730e11a854"
+SRCREV = "9bdd1596cef1b57b9556f8bef32dc4a32322ef3e"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

