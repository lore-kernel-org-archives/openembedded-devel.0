Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B8310A88DF
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:32:35 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50368.1774539151480649250
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f/bE2r1t;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so12992725e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774539149; x=1775143949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlsE09915ESMPqKDEMDOBJpTC09wtD6nOVneY5C8aaI=;
        b=f/bE2r1t/P83aU/RoxEACfMPzRAPIxzVl/dZMXbs0iEwuzb7ajYVo4hoG5yL1EAKaH
         rsilLcXxSF6TZJhWKUHVDDxe51d13FrsfsEwcRTU2S1EbSe6hliZtwJdr0Dv3nO13vwv
         hqybh91/D1ZUqVNw7sTrYZmEWnKTKuV59WOfmjtRg73wsaFo7H9AJcp7oO5NISme57mu
         AWgdcTGKC43bgmIgSjiOtKfBd9Zd4ET2ymWQ4qnbVCwBsR1NAKrN4owobi5A8L8He6Yd
         p1e7R/mcacEn/fTbKjNipNf2zWDux3x9fS/3KHe2V9tqbQmfJDWGoYXj1VLjQPbeH4a0
         fTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539149; x=1775143949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vlsE09915ESMPqKDEMDOBJpTC09wtD6nOVneY5C8aaI=;
        b=iabD/jIjuCEpOEho3VaGv5zos8en2PJLmjNRRA+6i7SSZY4vKx64a0Gy7gHP9NP0C8
         1p+odu1Ot9xwd3kTxFU8W0srxPpN3g+BS3DfVQ/TI9ANo5wS/pymwGUWB+mlXKiId5xd
         zXIYAEwp/3JFjPVbBMv1BHob3qmyQlKDV5qXMs2Lt5Sz/APL7kWYF8RmS3X2i9R4Th6r
         l2Mobm91kqeUdztmIHti/6Tca2DaLSD8TQNQkwiuOJkctxs/HZbNviXpPdWMtDKb4k/w
         AqZXI4shd3N/Qbsy0zX8dYcrP9xjAg079JJYfZ0SWmzakyrDFToO4opMxWPhlmPrm3bL
         T3Og==
X-Gm-Message-State: AOJu0YzAoAQzmEMhGyuxz1ybPWWbv+Mrl88FLYGwiWrO+Wfre/TmRNtr
	JbzEoYxna+6ttkVR3uDv1ias3kLpD2+G5K+eoiPpANApFn5SETSfWsBYb4XZQQ==
X-Gm-Gg: ATEYQzzjNeyj8TPRXJ/5LS9LE/IV77D0i4EJd9RyTEgVe/ENYIicFS0IRJlBh8iZj4G
	wXVqfDEJPVq9shkcJYBxwXgh52JOfplcswpUZvZ0ZL8Uvm/MI7u0C/Dy10J/1okfzakPG0PTtrt
	ranJhan9ltLS+XYxsarJoeyNrnW3eH1iRnJD3napKBTY+xKkZxlnziKt/csGwJGkk5Z9vfmwbrx
	zktCF36/K8cDgpRA7gi2Bdv/7htu/fsCa60E6kF0eGOyv1oVqWHDx2/U4Yxqp31nGu/hZxlxnPY
	EuwL7c4LbXz+oR/fXj7Yxqwf4UGx0oIYNXSeJr4hU/0mLyhtY94JyegY6F4QVQc1GHAmWp114oi
	h059YCuiE+oUC21ixXUc53XljOc6xwqn9IdZpXiLxMRKVkroNiEIyWM1wMgw1WFeEwqmn6aKXUp
	PtidpJ6EcxCPvHWG2gMJCJ8Seu
X-Received: by 2002:a05:600c:3b12:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48715fc3677mr120948065e9.5.1774539148932;
        Thu, 26 Mar 2026 08:32:28 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722fa8dc6sm66936295e9.1.2026.03.26.08.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:32:27 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][meta-oe][PATCH 3/6] libpwquality: Support Python free-threading
Date: Thu, 26 Mar 2026 16:25:07 +0100
Message-ID: <20260326153210.2245962-4-zboszor@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125756

Use PYTHON_MAINVERSION instead of PYTHON_BASEVERSION.
The former now contains PYTHON_ABI. This makes the python module
to be installed into the correct location.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index 7ec01ecd3f..86d23f1427 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -24,7 +24,7 @@ export PYTHON_DIR
 export BUILD_SYS
 export HOST_SYS
 
-EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
+EXTRA_OECONF += "--with-python-rev=${PYTHON_MAINVERSION} \
                  --with-python-binary=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
                  --with-pythonsitedir=${PYTHON_SITEPACKAGES_DIR} \
                  --libdir=${libdir} \
-- 
2.53.0


