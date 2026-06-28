Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF3CC44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14748.1782634352850580769
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VBxOEUOR;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3619577eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634352; x=1783239152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oy9vJ1BBeshOwvEm1aqPHUqi6oKNHnGZW7U6fNkFCJM=;
        b=VBxOEUORg/f1zAe9EOguAdsaTQIA6E8u3doXqqdMWYeosiO5PymHIC91T00kaNEq7H
         Y2TdVPp4+oR32FOcqjJCvLRHOVba6qpjxkHY3a1vMXy51YUlRGWaWSCuxnEMw5JuzeP0
         LPSrfPcG4vVb/2/CSTUSHGAsjI6eYS0p4BC9bo7FY0byvbsvrjcxtrqyzquctJSjKZ5w
         g89712iHDqknWrZqRfzjMYy3maibDnpCjTUzPBTmNMAGRNh3uT6AEYR8+LuIjSECmkAN
         y1Ey9OY02Jc3X9G0LMPs0/L+cgEnEbZN0NZleOHKZ4NKiuKL1SolcUI51NZCCJduYa+P
         qouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634352; x=1783239152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oy9vJ1BBeshOwvEm1aqPHUqi6oKNHnGZW7U6fNkFCJM=;
        b=OoF/AELqUXuDCXyF3aGd+IIGO+TbcA0J5dMU4BLeXEVhR7ejXVZeQHX8hLbfHzyq/1
         GSrDivc7HGjpjfSRKjb7qmX2XQy3NwrjiKVwBBCj0EhJqkPfFegJei/8GJKkt4xHi5d7
         QQK58wKCYy5Muo5fjxuHMVe0xozZfYSeePMsVrKSY/8Vqdk0MkxvfCdKi/c8ANS2ldpK
         N12Ukp9C70uDonVw6ktAce8IOL3b9OPYoyv33NA25GcnmPsjs2xgrHOd3eA03uUGuxM7
         1EfGIaMSf4dKK2GYupSCxuLao1OH6Szv472hzuWF2o0d9z3TgxBhZM53rkmgOa7avqpj
         niBw==
X-Gm-Message-State: AOJu0Yx2taNpa41pmYtN35XUW+PEwppHRKKFI8M1SF36NPNUDIwwQVVa
	rWcMY6Bi0D73f2rrQAIKnY4HyqCMoDYlk5Cm1NFn9HY8jeL2Yb35QgkrNU9AUMEItuv0kA==
X-Gm-Gg: AfdE7clTXcXib4ZNOxLIjRBiTZPMiQdOWUp+oDRZjg4bGPiDsYzsCZ719V7Ny5EP/Ij
	1M5k3MpwpZDMkch+c7vPHJbkh/MWcN45vOL53jx+tKYzZSG5eafY+PMOYwIw3sBU3+Bfh7E6G0I
	pUjwtFbf71MWCNhO686uutyDHP7R0wod1nYevJPK2Keab55i8zRYHqTo64/Ik8FIYT495vKIot3
	6RfR2as6f5MGeZsWfDTsRfFYT80IF39l3Hdy+hm8+LTDcu3l0+XzjOwehan5MR+W0sQWYT410yh
	DpvT+IzSkPG4ReZJSh2gptGKTZ+WUwm7XIv5GJKyyYk7W793Eyr8O2os/TkMZ9SjhA+Dyz9Im54
	f7jNuNoYMriBvI6Qt1VzD/FkUr57Qwt9/BQoZ6PExhedztSFnijl9cA1LqIwaGnlPBnv+ix9J6J
	bQ5R3Mz1JfjTUwf+/SBbK4IJtolN4fDtXoU31ynmYLy8OgSx0Q/7isetZunw1wilAHXE1H2aKHk
	y/2FAdUQT8Bi3HXwFxkwTYeikV7LXIC3N+ewo4IUaCUvGPxL2c2pxs6ZI2jwm3Nq1qMn6x2a5f1
	w/3uXSwnoteQ/QKg43Yn0Bg7rFyvHQ==
X-Received: by 2002:a05:7300:1896:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-30c84b1f43cmr12729584eec.2.1782634352124;
        Sun, 28 Jun 2026 01:12:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 073/128] gtkwave: upgrade 3.3.122 -> 3.3.127
Date: Sun, 28 Jun 2026 01:10:24 -0700
Message-ID: <20260628081122.178348-73-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127883

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gtkwave/{gtkwave_3.3.122.bb => gtkwave_3.3.127.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.122.bb => gtkwave_3.3.127.bb} (94%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
similarity index 94%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
index 0b87c1b21a..774a30e1a4 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 SRC_URI = "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
-SRC_URI[sha256sum] = "6201b5f93dcaeafa92fc0ec4ad4baeaf60acf16fc8f019bbf061cf4ebf27938a"
+SRC_URI[sha256sum] = "f19da2db43b27bbcc669725843451945a68c3a4ce232562e341d6f63b80b55e4"
 S = "${UNPACKDIR}/${BPN}-gtk3-${PV}"
 
 DEPENDS = " \

