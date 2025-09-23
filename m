Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F74CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:34:42 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.3665.1758648872743075709
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HE8nhgUL;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b07c28f390eso1069745366b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758648871; x=1759253671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+fwFRbNY+UxBJnH7TI7JX2lCcn7kYPuPzvk7BYOTbkg=;
        b=HE8nhgULvwpBqIq3JwBpDxxicjc0z1bauiW6hBTrc/69KYrrBj5bCN5DNsA0SWrKgU
         TvgUxQjSaVlKauoyG8OqT65Xw/x9XMza+Lni+cgwnMijS5pe6bsEqR8ZZ2AmE+E33fCZ
         MyBddpnkrYRoPL8Qf69togP58QhkQUC5EXLL6ricy7kdA9V4OB3gHYu1TG3U1tzIEr0x
         /YIKoEMmuiM929/iiEZ7eKcGijmn8A9L/jNRSUWPT9dsxsSwfg1SWfByi0Qmk8Uhx8io
         Tw9CEkDIRsoF+8ZGaYCxtnZZPT9xVAditUwMGESS8uD5yRekloe5SCpozl5EvhsT1Ihv
         gGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758648871; x=1759253671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fwFRbNY+UxBJnH7TI7JX2lCcn7kYPuPzvk7BYOTbkg=;
        b=vtoZFlc5RZt247Ge7T0G1QQ9KDQ0Zrz0RSt/rrCs0kehgFBbpd8TarC+PdPC5YEaE9
         wBYkGd+f9u+kiCsa4ea6TVBxvZDDxNe6iGUZXZ8kJ7OgB+nM8br7hOJDVX1vRVwrtBF+
         S4BNDBJFQPt3R5SV3fn/hZItZEsBgUGqOsr4gDi4kKG9T9MwF1ixh7YsJzD95eTrIeo4
         OgKu8A9QgyFMLjMev7UujNZ5yssSn0ZZRlOngtPqKU1ziDZ9s2N/VJ/pDuhCR/J+siII
         /OQivr8CwkLUmuAz/kDPrudu3vLcgBWpGu6ybfsQYeAoDCKfwbzDailhLQn7ji6eOrUE
         DjBw==
X-Gm-Message-State: AOJu0YysTiYwK9yLwJTYlJuBxg84kSaLvl2nOpx3CYpOtcYH6lBLSGMx
	ybkcoyGMbccHMcqipWV5NkflWbBefECwP/P1gdkIjFwNWiR4KlV8ehTwfTp9Z1pk
X-Gm-Gg: ASbGnctX5nZeVWzIDHsry3+ZqVkc5WzKLJ4YVxXx9GL6qE+Y5+U7LXK/VZMB5h0uU94
	fKHX5B0/d6WHTi6766SbGuMXN+sxZeJYAc9BdXB9fq/PN+oXa1rpr+bFxGzuSX3e2XzDVCGnnwF
	Wuf4MaYWWwX/QHWcOEtKg6T8Lt4EOFwhBo8eN0s1mJKR47KoPLiJrjqiAZOzT1vByVNVY3LwHcg
	9m/dKbEw5pwvnOhQV4p7Mj/bnAh+t2+04Aq7k5JM8H/0WpFHj7FQIpDR43Zhe5m87CJq5YADAc4
	BH6Ebmpc+GWibkZ+rkW/eowIZkqOVV0vGA3gUiLGV+Dl1WwRz6Gbse3gvi2PIRui5aNmfSM/Ug4
	xMa64VR/4iz15MuF/vUuT
X-Google-Smtp-Source: AGHT+IE6n0DpP1I/pYqKzIMXal8/qHVUmoXL6cxpGCr0vxY9dXq2oJ16kTml95Du12fbrnOhuAXNYw==
X-Received: by 2002:a17:907:9414:b0:b07:cd08:ff34 with SMTP id a640c23a62f3a-b302b22af4cmr309865166b.51.1758648870867;
        Tue, 23 Sep 2025 10:34:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b26847b9f37sm1016229466b.18.2025.09.23.10.34.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 10:34:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tokyocabinet: switch to working SRC_URI
Date: Tue, 23 Sep 2025 19:34:29 +0200
Message-ID: <20250923173429.2283540-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 17:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119722

The original source seems to be long gone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index 75f68ab5f5..a7c10128b3 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "http://fallabs.com/tokyocabinet/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "http://fallabs.com/tokyocabinet/${BP}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/t/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://remove-hard-coded-include-and-lib-paths.patch \
            file://0001-configure-Fix-check-functions-for-AC_CHECK_LIB-test.patch \
 "

