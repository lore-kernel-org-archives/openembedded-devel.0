Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.10145.1585755189087945947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 08:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=Wa259Ka2;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 7935C60450;
	Wed,  1 Apr 2020 17:33:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585755187;
	bh=7mHMONpVzgSx6+uM8w9bVz5Vam0NGJYuRQMnA7SoR9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wa259Ka2UgGPpTV6cRfuqMa6ZdFkLKygn67lzVPzduprnjHk2rhTMDhURirr4/dG0
	 TkHWLd1dB/CzPMvSH+yXLjBYl6ZcvtXb1h7wU9CVBjEzH3DkSTAKL6NaHSYcuvYHAw
	 VttbKWfEEKRJ7iYK6Y7CDf1eJsztHHDDGz46NtGvUcZWwe7W8oeAFw5T6IHkt1PVXS
	 yoQVKJqQ/0KAcclz8QH1rSfkhlkMgxQhdjtLsUrHBaYqHO6seJGA/B0mR9m31E/0PM
	 MjECOffGiQs08+fE7xoCiFt+PeDa2tFYueGn6eJvvqvLOzAgJ0GQ/smSe8KkXiPnrz
	 4BiKTDGlSAnOw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/2] libp11: add UPSTREAM_CHECK_GITTAGREGEX
Date: Wed,  1 Apr 2020 17:32:20 +0200
Message-Id: <1585755140-23538-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585755140-23538-1-git-send-email-pjtexier@koncepto.io>
References: <1585755140-23538-1-git-send-email-pjtexier@koncepto.io>

Fixes:

INFO: libp11                    0.4.10          11              None e1210903291b1de9eabcad26e740a4b2fbcca692

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/libp11/libp11_0.4.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
index 655db49..7fe0640 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
@@ -12,6 +12,8 @@ DEPENDS = "libtool openssl"
 SRC_URI = "git://github.com/OpenSC/libp11.git"
 SRCREV = "973d31f3f58d5549ddd8b1f822ce8f72186f9d68"
 
+UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
+
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.7.4

