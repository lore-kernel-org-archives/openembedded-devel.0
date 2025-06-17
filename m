Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1B0C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 17:17:03 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.25218.1750180619442333944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 10:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=CnbBchHN;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d0976776dcso657483385a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750180618; x=1750785418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dT9F5z7iGO/K1xVc2PUnECzLyufCHrmea5ysyDUplS4=;
        b=CnbBchHNFDAcaq3KssXdyyBUOET0IH68Mph0F6QFS+s0SPPVdnL9DzqoTvj9k/khO9
         GyAbS6cL2MZSaucEErUFQ6I+RHM+NCWShGELo6mle3otgFn6syK+aIwWKtj1378leDsk
         kNHesEAACPYxorMlbGtL6WjyBoYjrxJr+VelkLclL/cW6JRAdpfM9lWM8gtxiBTLieP/
         9T1JkLKUR6wB4/JqoaMu7ig8J9S5nvvGJOUl18vEAz1fWBf1wCtaakboJsHr0JnU3wZa
         RYfIghBBcFnVa+w8dLrQNxuxLFhzlc4KeXe9CNiVGoEgkfkXzJO+gYaEpN6e2EG0MaVE
         1pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750180618; x=1750785418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dT9F5z7iGO/K1xVc2PUnECzLyufCHrmea5ysyDUplS4=;
        b=ncgVsPBvKiMruH0j8UXRpmsd18+5cz40UI07Li86dG87ekT+bAcNG3Ve5cvB70bU+U
         039eOxC5C6xZvPEvbziyEvGmBI8WmZ+dbdnE7Syhxv23cFHF02YTlUAjWGIgBlvXIfcB
         CKN2ID8QGNJqOZ9vycTrUNuUTn07dmCv3j/QQM4PMt10sYTZV71Y8TUTCAKvm2MKPbr+
         JsKQk9R0fMtn+WE03GnGkyyXIwreXpvLnH3hOnMr6J1agYFcKLwXSxYgmLnps6NwHIUs
         1OMDUT9oGBXNX1MRRDENKYlpgUl8Sa6y+LTa6U9mdXTMdV52qQLaszpH6aONGSLXcprT
         VbQA==
X-Gm-Message-State: AOJu0YxEX8zAd/qyCn/l6RP25JHQFdPosr9LE0h7SdjMaWMn5zFMksWg
	/kFHW7DHIv11RKZPbbuhasiK6aQ8//+zNLB/MyH8ii45nT5DCpUVzi+iW0jBhmRatbFDmFs4oCJ
	xbWio6/I=
X-Gm-Gg: ASbGncvRKktdpNbf4zd3T21Ma4U/tdxOQ290OXu4BkTdddRk6OyQoZ5+FQVWeus70Ol
	ZCSRwjIwxYIP8VkUIJ4kmIRPiX9zGAwWhMyiEATWN/sBdeHiTpjgjEOdl0iyD9j52e1dgXFkM5Z
	MFWxMwUkLOOMRhO5UTViR5LhpfEg5aqEOOUkUg5yz0a/GsR4jDmXSSURi/BaQpnOTvmijZDfy4Q
	UeAUzMMkf+tQgqcGLtIJOp+Lqayih9p2yVL79oPt1lCQw1lwfTL0QFNt2vpvGjsPbbB5OWe6Dtv
	kJLg98pl5fDfDgjSkZEBjrD+xDLRkEkEYft1fNp1cy+TH+GrAdLXVRYYY+lAuN0EdN+NTzaMlXc
	6kdfS+4agquHR6vY/TSPGtA==
X-Google-Smtp-Source: AGHT+IHZTYBOHes9Sq84xjJrkkWNuiT7mOAIQ/BDqWbAQt2C2/PyGZS0nNPhrPCVqnOKmjgDqVUSug==
X-Received: by 2002:a05:620a:4883:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d3c6ce1169mr1989017885a.34.1750180617653;
        Tue, 17 Jun 2025 10:16:57 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dc9f0bsm677861485a.17.2025.06.17.10.16.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:16:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-colorama: remove recipe
Date: Tue, 17 Jun 2025 13:16:50 -0400
Message-ID: <20250617171650.1329668-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 17:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117930

Moved to oe-core since pytest needs it. Also remove it from the
meta-python packagegroup.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../packagegroups/packagegroup-meta-python.bb      |  1 -
 .../python/python3-colorama_0.4.6.bb               | 14 --------------
 2 files changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 6866ed93cb..21b79b9c50 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -69,7 +69,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-click-repl \
     python3-click-spinner \
     python3-cmd2 \
-    python3-colorama \
     python3-coloredlogs \
     python3-colorlog \
     python3-colorzero \
diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
deleted file mode 100644
index 3871244031..0000000000
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Cross-platform colored terminal text."
-HOMEPAGE = "https://github.com/tartley/colorama"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
-
-inherit pypi python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
-
-DEPENDS += " \
-	python3-hatchling-native \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


