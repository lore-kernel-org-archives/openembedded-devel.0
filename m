Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEE6C77B7C
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 00:37:16 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.5516.1683679034514227339
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 17:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KXVBiHhK;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1a516fb6523so61973305ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 17:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683679034; x=1686271034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6sJkd5sSbR046i+rrW67vqAobq6g+SmycsMESsvXA0=;
        b=KXVBiHhKSqdbMfYEImZg+dyHgie9CfTHdP7YiDtx+bEsROAVILUG7+Q3Ov3CBvnD+3
         BOJhZuixsY1vVZ+WbkV4eEYgC2tvWPTdunJobhnL19b0r+qOlvCZp3HKwiTtwEaxKAyx
         BMrZJME55Ef+d+QOf1CWPz+Y4ZBsd7tU9Ja0M02WWCNIiy4dV8wv/OAPSTYyrETBtQWi
         M3AbT3tp5Du4YKudbTkmVQx0Nf9nTiMJSgOuij8ARzVtmPmR6HTvCRUtMFLcF03FSSFZ
         DBLAfGkiSxt3GCK1l4m8aI/1CR+OLAQdN47cT34rNGRj6LxyNnENBWDWwkO2MDWR+NNd
         EsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683679034; x=1686271034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6sJkd5sSbR046i+rrW67vqAobq6g+SmycsMESsvXA0=;
        b=hx++xo/jreK4KLoO6wE1TXCL00rBW9+Q16o2xFquU66s507zA1e+kMmC0zlII26P8r
         q5mkwBa32IM3P/EWMpYC0pHp6Cq+Ztz8CcKxer111rtQf5TR7rICJxMMukkJx+QrBTBS
         dedPYOe0HKVd0f4E2FMlbftALpLhCkkuThA2hTR5/C3HXM85g2ZyYpBSYHWuqn/2Q61p
         Lw5PuuGz9DhTG8/rKckjpMMNy+ShLlPj17MS4Vb8xOwQvByE7yBwSISbg3biQBg1dNnc
         yARIuFtWbs+lAoeLIvCIe5dfOpYhEdym7NIU0GTD64UXAILCR+0voOScGltLatAXU883
         QZbQ==
X-Gm-Message-State: AC+VfDzRsO2CpQSHAtcGMgtm0ZHZtBsTTD3zmY9JXMSKuP9kCYmjegB4
	DudQEdB2Ma2zW35yoW2vqd6vEYCu3Y4TUg==
X-Google-Smtp-Source: ACHHUZ66PuXRcveQzVm5Oy9h/gnjVjrLt8sbmX+ujAroTjw9gHKHKAjm0TBkVMNMimSilkBf4WCTZA==
X-Received: by 2002:a17:902:d2d1:b0:1aa:f5dd:2d63 with SMTP id n17-20020a170902d2d100b001aaf5dd2d63mr20417594plc.1.1683679033645;
        Tue, 09 May 2023 17:37:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id lw6-20020a17090b180600b002505f8b9c53sm5878673pjb.38.2023.05.09.17.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 17:37:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] usbmuxd: Updgrade to latest on master branch
Date: Tue,  9 May 2023 17:37:11 -0700
Message-Id: <20230510003711.1343334-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510003711.1343334-1-raj.khem@gmail.com>
References: <20230510003711.1343334-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 00:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102520

needed to get it working with latest libplist [1]

[1] https://github.com/libimobiledevice/usbmuxd/commit/049877e1f7a54f63fef12dd384c9a22fb38b3514

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index e9afaf5712..1492234495 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -11,7 +11,7 @@ inherit autotools pkgconfig gitpkgv systemd
 PKGV = "${GITPKGVTAG}"
 PV = "1.1.2+git${SRCPV}"
 
-SRCREV = "f50e52f3393a9149ac65fdda8f0d425109efc7fe"
+SRCREV = "01c94c77f59404924f1c46d99c4e5e0c7817281b"
 SRC_URI = "git://github.com/libimobiledevice/usbmuxd;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.40.1


