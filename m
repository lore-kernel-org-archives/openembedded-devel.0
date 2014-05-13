Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f177.google.com (unknown [74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4E58660196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 12:47:43 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x48so317722wes.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 05:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3P8/Af/mrEA9rky+AJNplotsMnWnwwnILFjVKLey+V0=;
	b=LLOIes/nyrtFCoi4EbouqBo00uFfnL6zvOMQ2sbBHAmbXhXuH2gJXI2PpGV7LTQrEb
	ML/mtyXrqtDamAb1/j1cm2dsetIDfHJxneWJJXT4d/SH5zTVSz1UvjUsojlxMwxvrTql
	+lQY3CC2cj+2lFIpiKNecbJ/bOAkjdiAbyKGVSS9GT0V1DhOtBc1VrpAvH7kMLyFCCUg
	64P6QZEJkyBE/abRgGoALrWjNH306ysvIrdJuNyUnw87Ph/GrgH/dbEVmKo5ygtG4/Xp
	M6JwojpgriSAFbvHERk6yDbq55uWZa08Zb+RaAnlCKGiYCAegx2Gjk0YSCB9Tz6evsma
	L8Vw==
X-Gm-Message-State: ALoCoQlV1FqbrwA9EHZoeLhXTQHFC+pMglWpyULCoVHE9nYIU0n/QOm4bXD0e1gdLcIf5OyympBH
X-Received: by 10.194.92.81 with SMTP id ck17mr27197651wjb.14.1399985263886;
	Tue, 13 May 2014 05:47:43 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	jr1sm18644625wjc.13.2014.05.13.05.47.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 05:47:43 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2014 14:46:41 +0200
Message-Id: <1399985201-3142-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] tmux: fix S!=B problems
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 May 2014 12:47:48 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-extended/tmux/tmux_1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
index def5520..298cfa5 100644
--- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
@@ -14,5 +14,5 @@ SRC_URI[sha256sum] = "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5967c56881a
 inherit autotools
 
 do_configure_prepend () {
-    sed -i -e 's:-I/usr/local/include::' Makefile.am || bb_fatal "sed failed"
+    sed -i -e 's:-I/usr/local/include::' ${S}/Makefile.am || bb_fatal "sed failed"
 }
-- 
1.9.0


