Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A0E10A62E3
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:31 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48357.1774534350176441184
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q2//1awV;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fe655187so11805065e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534348; x=1775139148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQDWN8sD13TBgoi6JTeU+5Vi9yxSudpaP4uM5+8DvWs=;
        b=q2//1awVVeQhKJudQ/QYkbAl3TQVo83wCbcQk7+R3IF/IUg4smwPA3xXklJ69SXYMn
         C3DbgCocyJB4LQ/EOKSxms1PLC6moIwZDPZLWyb2qxFT+2IcBdMvqx0zXU4TUl+2zp5h
         GiCCrrMtkXA6Pa9F+gFtUkML0RSQxfbDmU2N1a+rCgJSWmr5oxc2v4hTERYDjiTNXlXS
         uTeS10SAXyWLXttj39rVXeDGCGfvAA6Ft1pEzVt7YvIKBhhkYNiI/mRaaYHgMVWGbd1O
         tSE9l9PbJJ+ZLQBBxZ5cNB5U7S1esE7cY9xfCcexqJhuQ8WJYnc8XjglWwDwVbf40ivJ
         QLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534348; x=1775139148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FQDWN8sD13TBgoi6JTeU+5Vi9yxSudpaP4uM5+8DvWs=;
        b=KPHw2LLKJ2TCtCe36DwFHxNU7OIE6b1nmtYvIjBjxIl5QMIMTlhcDTVU/FWP7mYwgV
         ohcMytNKkjuWgSPZ+cHTH5jMrbazi8CuJUgCwNTo6vqOtecnOPCovOHhmONAIdgUtUmZ
         WlKdox3JGwl2rDTVLa2NAEK7FVlhxEV381ZLdfvhIWAV/QEERZ5tpxt3XNZxhfpEcpNA
         igKqE4lBkNxpQEN0rL1kBrikhzadQkMWYjE1guOW9kIXfulRlGy9JrrgpIMiNJ3MOVjM
         34zmNSN6C5WSWISIxctvFFgAh/b+RkIWjfPYgdxWEuSN03QyqC/7GaKn4AMjjYbxLOv+
         wjFw==
X-Gm-Message-State: AOJu0YyH2iIkV+wFNUZj7pJ5bT1oEtx6jK9ygh3bEvESLExSilMb8pMp
	FnjYYnQ7fkM77YB2VX3vv+N5uk9s8N0Dv2gof2emoAthdiF7LoI8u4UoxD/zXw==
X-Gm-Gg: ATEYQzwtyvtDDA1NZ2nLFMdQgP2EblajpSHJ0W4135aZOAFd89a71RLBPrDL/XQt+lO
	0Ble/A9/RlCPhEQwgUWyrWLult5TZJePylLJ9dkkDd1Pg5vs9Mf36EvCcbn9rTg0AkIRtTnmFJy
	BoYU2qAyojwUSvKiEEbBZPZUVLB1+jxwiVyi6gg4xt1b2PdxRwShR6e0ABBgN9DyaFM/lsS5osR
	+rEsuRkUvnxjz4rL71gsr8l5FYHiCl6mhCVTKWNkzMc31BOyhIKEiDzPkaSObRUPCHI/DEniUrJ
	/BnAuXSBQhXMH57xNMpz+N7jwmKXYAF8PQ+900zn7kH65Lkdx5KQVF+apPi29kT1FJGKCGZbITj
	sgMzCKtEYRmPTytMMppDklNqlGfYXHrmUg1pTyv2syZe1vNIVG0runytfd3AN3WFa5xonGS4EdJ
	GYXDxDNoY9S4Ri8g==
X-Received: by 2002:a05:6000:2405:b0:439:ca1f:3929 with SMTP id ffacd0b85a97d-43b88a0cffbmr11951116f8f.48.1774534347581;
        Thu, 26 Mar 2026 07:12:27 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:27 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 11/12] libcap-ng-python: Use PYTHON_DIR for FILES
Date: Thu, 26 Mar 2026 15:12:11 +0100
Message-ID: <20260326141213.2081121-12-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326141213.2081121-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326141213.2081121-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125732

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
index f702056f02..f13c2eba17 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
@@ -14,4 +14,4 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install -C ${B}/bindings/python3
 }
 
-FILES:${PN} = "${libdir}/python${PYTHON_BASEVERSION}"
+FILES:${PN} = "${libdir}/${PYTHON_DIR}"
-- 
2.53.0


