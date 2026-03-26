Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CE410A88D0
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50965.1774538517223312001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rg2ny9W5;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so9257325e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538515; x=1775143315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak9xR7jFwZTGt8+TrD+eHWc2L+V0O0BBB7F9oMocSBs=;
        b=rg2ny9W5MvLJojop5fxM8q07w6nFyNytdq+iQQUxTBrL1VtcA5XKWBpSqUNvXTthRB
         IXtgk5lSHm8sMrdqEJiV6OGtXlKI5ALtzHhMbAz+pTYP1HEOdIU8X93wUfwLvv6dlMe8
         D0tVaxO0ij8G4zfyCamg7vSC3yFOdAPYh4eq11vpTpN6KTWqJxp3fsqgxiGqOnNcObzV
         La87PCLfnB/twY+vyys6YOObcMbVxNo5k5JIshbQ0KVEOxJf9TTrEamvBo78/RS8iowz
         bNOxqNtTcrTIxVNlWgABpSumJINnRiXzX9F5+YmT5nkdySiwHVt178wGLxJcrm0Fm1Fv
         haVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538515; x=1775143315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ak9xR7jFwZTGt8+TrD+eHWc2L+V0O0BBB7F9oMocSBs=;
        b=jyIOJQzeRsaS9CP9L0KD/V8zCFFCcMDxM2gQ7Av1hSSY+3kVcnvLyA9ba1wH0/hy6v
         PoeRW52kdjbImDmEOgSoBh9HVrUqC+B71PXjRMG8LT+PW8A1yEP16CumO2UhE9lbmeq4
         xyN/mWid3kpxqKub5jrdiPyg4jfw9gMU58MbTz/8iwXJ1RudA7JKIN0qyQqfN95JVG9S
         4V1YydnSW0lrPDkZCQbRb/pisFaPxnSOiNGdEF4NeysdRwMNVt+y+gh4uOAIBHMNGWfc
         PCEKwgUAnNZA4jjf5ype4T5d1/F5EQwd7U/Kro6G7vFweBBncH5A8/eFuKHLbMc/A3MJ
         arsQ==
X-Gm-Message-State: AOJu0YzkdonSwH1kxy1vCJMDgUrKx72dfG6ovuNtHfqMrWeN9Dkmw1e1
	nWX2sbe8ydZIxbpPDmFhrKrbrjysXCpgDzbP2ehbZvLGOMyrrq2N1kakA4tUcQ==
X-Gm-Gg: ATEYQzxVbTjJeRVWbl0RCNqmOpHmAIINIm47ROpslNFMGS5+Z98cTDnhzNHyBWjrniw
	85l1gzclaM8wEBYdvRJ+TykeAsbtjROLZ+xWaM7hAFRBP7GITEX4//v1vhESTOs5RCRMexo46sW
	bQSFQJ3q4ItfYVXSBxtY+9X6fXxnx8DRTs2QOM0PJtNX1Jretvvee09+TiN+wpFAviv310bZnOQ
	/akvyo9BOVql2slbtWlJb94fJuvlulCTTp75+PbsCOrkSX3TIzE/SagWE2R0ZCb+0pDopREQ8Tw
	/tSk6b7ixIvR8BkxjqULBltW0Y03Dp1/4HSwEfhJYsikHSyiDXXsL+QlDTnXeQcppL1AthtjZ1X
	e/HQuSOrUp7CuOLotnoxq2VxET9vysownL+4cSVEuFrLFl0p/2BDS/bDc2st1wYnAaajNJavy1u
	2O7nl+ykwTW9k3Uw==
X-Received: by 2002:a05:600c:45c4:b0:485:5981:1411 with SMTP id 5b1f17b1804b1-48716071b48mr120830535e9.23.1774538513313;
        Thu, 26 Mar 2026 08:21:53 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:21:52 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-gnome][PATCH 01/13] libuser: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 16:14:26 +0100
Message-ID: <20260326152143.2224099-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125740

PYTHON_DIR contains PYTHON_ABI, use that.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-gnome/recipes-support/libuser/libuser_0.64.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/libuser/libuser_0.64.bb b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
index 27cbb43486..64b51e6c97 100644
--- a/meta-gnome/recipes-support/libuser/libuser_0.64.bb
+++ b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
@@ -26,7 +26,7 @@ inherit autotools features_check gettext python3native python3-dir pkgconfig gtk
 
 REQUIRED_DISTRO_FEATURES = "pam"
 
-EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}"
 
 do_configure:prepend() {
     install -d ${S}/admin -d ${S}/m4
-- 
2.53.0


