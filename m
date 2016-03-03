Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7C5006FF56
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 11:26:58 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l68so126634478wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 03:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I6mobq0VI+fmjK8dzmIC78KcxXwTUk2YlqIBpbkolyU=;
	b=K6m4Qj6rg6NkCqutaBAAMl/FTN07895A+kZDrEAwyhKwHkeZbj/a2mobqWDUU24FI/
	l2rw0UY2rcH6y6ZXmQzocqJ9Yura8aSreaLsWYSKHYOlUayAIdvhLIOBNY8e/gpTFx7K
	pYTaGSekCpQzxNX/++1t3i+IxTXX4/IxBbFoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I6mobq0VI+fmjK8dzmIC78KcxXwTUk2YlqIBpbkolyU=;
	b=YV4QTCrgCgXFdyhivhJ6NHLCSDLOLfMRDzLh/clzGPZiMhBTFVUjU5IT/ExCdqUalr
	7amhZ4clLVOBClk3KELHsv0odLAFVO1i9dZi0NwQt3nTQxeO77NjjXSP7DHdP523GYoG
	4qAlNsSSwHrxnYNkP1Ptam2qIdGlz1CAhm2LqtI+XO8gsjmAcx8G2vi0LpenS5to+HgX
	BiZcrKaMpjDza11V5KScWa8MqrjM8V7/Njt0tny9lrMyUPaFmyvdXG9THOPL6CTPZjmm
	O+SUG/KCWr7sVhE7kaHo/HlUKHBjgN+Npjebq1Hrk+CFQKVRM2T1jpnnS+PHQSekPGMs
	N7Rw==
X-Gm-Message-State: AD7BkJKVWeawbMixUxB4Tbvd8iHUaU++R0fyc4WjD8nKlATgzpjWa++glWPjYzCxVTlqzoqQ
X-Received: by 10.194.236.233 with SMTP id ux9mr2325657wjc.161.1457004418548; 
	Thu, 03 Mar 2016 03:26:58 -0800 (PST)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by smtp.gmail.com with ESMTPSA id
	lz5sm40061883wjb.5.2016.03.03.03.26.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 03:26:56 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 12:26:43 +0100
Message-Id: <1457004403-25978-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1457004403-25978-1-git-send-email-koen.kooi@linaro.org>
References: <1457004403-25978-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH 2/2] efibootmgr: unblacklist
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
X-List-Received-Date: Thu, 03 Mar 2016 11:26:58 -0000

Also fix style issues.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
index 9b611ce..45b4676 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://github.com/rhinstaller/efibootmgr/releases/download/${BP}/${B
 SRC_URI[md5sum] = "6647f5cd807bc8484135ba74fcbcc39a"
 SRC_URI[sha256sum] = "a66f5850677e86255d93cb1cead04c3c48a823a2b864c579321f2a07f00256e6"
 
+inherit pkgconfig
+
 EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cflags efivar` \
                  -DEFIBOOTMGR_VERSION=\"$(RELEASE_MAJOR).$(RELEASE_MINOR)\" '"
 
@@ -24,6 +26,4 @@ do_install () {
     install -D -p -m0755 src/efibootmgr/efibootmgr ${D}/${sbindir}/efibootmgr
 }
 
-inherit pkgconfig
 
-PNBLACKLIST[efibootmgr] ?= "Depends on blacklisted efivar"
-- 
2.4.3


