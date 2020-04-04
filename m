Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.558.1586014945312088651
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 08:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=hp5AUu9m;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 8717C600BC;
	Sat,  4 Apr 2020 17:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586014942;
	bh=VWpVkJYvS0dBQ8571kP12RZbIXR0uC8DqtVKsOtpdX8=;
	h=From:To:Cc:Subject:Date:From;
	b=hp5AUu9mX0VUE04imc0lAagHG80CeeplFm9s1WoGexQUIE3ohY8yKSjCgqHd19lFK
	 zxjmNjvFtu1anmb8oiXXeJjzkLi6IQ5MNxaogxrsmeW73Mf7j5MujCQaGDsJHxr7Tl
	 SU5J846IyHEkviz/P757VfLxAVphjPLnblbTS/m/k7wLPmduep2n3QpHVvpNYbdo5H
	 695c8TPzRqHChk7BmAeuGnikZN0pWuvCGauiEk+fVF6eyUx1kF9di+VmRSUP6q/Ysu
	 WYLtqUp7jF8p43d3o1JZLUb2SdH7+/XIZmwvjeBiXk2y4iWa57Er1dp5xsqd9jagof
	 6gIQ5+Q5FZIug==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] libnfc: set PV in the recipe
Date: Sat,  4 Apr 2020 17:42:19 +0200
Message-Id: <1586014939-15136-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Fixes:

$: devtool check-upgrade-status libnfc
<...>

INFO: libnfc                    git             UNKNOWN_BROKEN  None 2d4543673e9b76c02679ca8b89259659f1afd932

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-core/libnfc/libnfc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb b/meta-oe/recipes-core/libnfc/libnfc_git.bb
index 64c5f5c..2851ecf 100644
--- a/meta-oe/recipes-core/libnfc/libnfc_git.bb
+++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
@@ -7,6 +7,8 @@ SECTION = "libs"
 
 inherit autotools pkgconfig
 
+PV = "1.7.1+git${SRCPV}"
+
 S = "${WORKDIR}/git"
 SRCREV = "2d4543673e9b76c02679ca8b89259659f1afd932"
 SRC_URI = "git://github.com/nfc-tools/libnfc.git \
-- 
2.7.4

