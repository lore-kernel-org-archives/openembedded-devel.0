Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57E710A88E1
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:32:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51224.1774539153662748290
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Rc3jgatA;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so11116645e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774539151; x=1775143951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MgCGU7JgctbdXeAaL+O0m2ngscy4W4BHqWcBvSLJ70=;
        b=Rc3jgatAGylaR5xCxwkJ+FAQ3H3pXnfkJbNLqdw+eX4WvQxs8FGKxrTW04062LMT29
         wxrzJsj53IUiihE3lXV7OhY6o0gKxC7zSutt/hgKZO9wyQVT7ir+COVrMj2DgG8cmMkk
         UIjj8UsX1pU3v99hMtMA6Q5n5dwaSKEGz4clXOOA/0T/ZNt1lSQycYF1rLlbshlc2YBT
         BzlZLTf5IjjxJ73bB97VBP9qEsqXwPxoOntV1nFsdki/MtVqbiNj2hFLu69d8t6F30Z/
         nlN1vro0R1/WGhEDnVd1H5xIx+PeSFx34M0vrGLuyUHaRgg4BlLKpoDA3olhqSPAa9vv
         9DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539151; x=1775143951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8MgCGU7JgctbdXeAaL+O0m2ngscy4W4BHqWcBvSLJ70=;
        b=Zl9ZDNc3R/HB7hI4xRUdih2zjceCy8bdH1P1JVJ3dX97359PimC78/XJI0UXXr2zCj
         m39HcaX1akkIrG+YpnPXFj4FaEq4HynjbSASr7rXSKn0aro308XoyHr+uxWrY+HRh0iY
         h52UdQscw/gY0l/asRdS9SWaWJQBdXR6VKfN2YFAqq0b3McjEM8PegVANFZmxCYGj6tv
         XpXnfBOIGzgwLmf5NtGsIjKjgYBFURt5pQyfIuTzpi7j/pbMgLfTrTyhJB5iNG4lMdMd
         K1/o8/sbFq7Gh+KYew+tEUgIq3Wo299PmPCbL7Xb1H9hcAK59UPlmRjmXNRTEUWdOYXa
         rVdA==
X-Gm-Message-State: AOJu0Yypw1dT+4XkZ8FMmGHKlHFwMNJRuD0B/FDLtu2tdiUZwzwqS6SG
	JKQmWnC2eoTdAvu9D4FLVHe6op7nk58eKZz5DVsIQWJmZ1cWSZGltXCFC6bpLQ==
X-Gm-Gg: ATEYQzxp2a5LaFV0ZBGilL2/vSwhAgJRJF5IwiIaEPEQ2ima9dwFBcPpO3l9bljooxH
	Hx1+YSCSWp3jle5ss956KVqLgotizwhOwDBNQbzQIV/AQXfBEykxJyRfuls+EXJ5d7UoBgvTOPt
	K5hyyhMShPf3kvTkUKAUd991xF72UPvZUndVmLTwc/ZilJil5N692ZvEqL8qXD8MWRsA0FbXwR3
	wujDFyGDC+89zcEiUQhzSyZS1jroara9CJYH3lbmfquTIHiGSSaoIu7gdVAlv92VPCBqnLR5d2E
	5ayyNjQDosLw++v/KIuwgUSN/evDvgmGkWTQP8lYwFD/xRdDxBs9T9b3eygXajFzydW+indaixf
	Bet0sdLqD0mmuPmKiBwyaQHKyffdFEGthlE5U1FQWfLpapiEIFD7VnECYKKPMinM+nElB5KMJIb
	XYHX+o6X9/33ObRg==
X-Received: by 2002:a05:600c:a15:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-487160672afmr135343395e9.25.1774539151099;
        Thu, 26 Mar 2026 08:32:31 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722fa8dc6sm66936295e9.1.2026.03.26.08.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:32:29 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][meta-oe][PATCH 4/6] upm: Support Python free-threading
Date: Thu, 26 Mar 2026 16:25:08 +0100
Message-ID: <20260326153210.2245962-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326153210.2245962-1-zboszor@gmail.com>
References: <20260326153210.2245962-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125757

Add -DPYTHON3_PACKAGES_PATH=${PYTHON_SITEPACKAGES_DIR} to the
compilation options to make sure the python module is installed
into the correct location.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index df60fb5a81..ee752dea95 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -45,7 +45,7 @@ BINDINGS:armv5 ??= "python"
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', 'python3-${PN}', 'python', '', d)}"
 
-PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}, -DBUILDSWIGPYTHON=OFF, swig-native python3,"
+PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON3_PACKAGES_PATH=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}, -DBUILDSWIGPYTHON=OFF, swig-native python3,"
 PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
 
 do_configure:prepend() {
-- 
2.53.0


