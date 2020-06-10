Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.5346.1591772588101732033
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 00:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Vupn+Xqz;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=0vpq=7x=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49hdHD6Tzcz43
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 09:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591772585;
	bh=ihYBj9PnJAmsJKkAA8b/wCTZwzKHVl+nePyjSd46268=;
	h=From:To:Subject:Date:From;
	b=Vupn+Xqzfx1fP8nZfLx+gMdKkLsTpeP2UXZw6Z407iPO1bYl5dqvvG3HSCfFW7+Wz
	 voueoq0umwWvmCuNqy25KlKhey8MUHtwlMN+8kd1kDOV3u6k9X3vBwqL++BjwZHCE5
	 ttnE/tnBhBasUhITqiEk5J6/EoOln+QYiSTWp5HPi4MHLuwp5aPQdkAd8be1ywnj8e
	 1bCZpKjA9C9/IJJDmJCjI4+pgjFv9rMN3qWr9B+F2JiVf44VrDkuBCR+PRX9ZzyreW
	 65xj319sLjcwKUp/VcJ55AqL3jrxnd3j9Hq7O2F21Y979fOAxbwXtnHQV+obEOucwB
	 X+Q4+W+HwpLODuFCa95tpqx/07KAMf0TdKGoALUMvC/XDGAmK+Mm+wEY0fRwCgJzHk
	 LwHYg1y4QF3m5rvoIDbt0+ZwKB7TaEZbBQ2s/GuM6VDL7LtDB1ez0hflw+hF/8l0U2
	 43tgSF1DRC2YNdYcstHlEIL3DFroaeW/TmAmlCxQ4HGOCKEDr7Fa9kBsUuN6vupCmk
	 NHkGh4lyvNkiL9D+FrYvWKkPOB9BUNc2WW9FuPy7hTwH0Pdg/3ibjCI12x3yifUJRD
	 nzETqzUg5XNO5LDLerVJ28UJXA1/kUARzcrZRT6YnMiI7XJjXO0/hKMJdt0oas341V
	 Xi2AMZg//92jBYIV970vYueQ=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] qpdf: fix typo in RDEPENDS
Date: Wed, 10 Jun 2020 10:02:54 +0300
Message-Id: <20200610070254.9851-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
index 3883a8dcf..600508097 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
@@ -32,4 +32,4 @@ DEBIAN_NOAUTONAME_libqpdf = "1"
 PACKAGES =+ "libqpdf"
 FILES_libqpdf = "${libdir}/libqpdf.so.*"
 
-RDEPEND_${PN} = "libqpdf"
+RDEPENDS_${PN} = "libqpdf"
-- 
2.17.1

