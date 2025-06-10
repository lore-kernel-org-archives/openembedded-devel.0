Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440FCC678DA
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 14:43:27 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.88988.1749566597992739877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 07:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UXPWS70k;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e447507a0so44243287b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 07:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749566597; x=1750171397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvocMr2BCGLQ4TfKAo4mp5CqrAlollxqJ9JbTzSmSnU=;
        b=UXPWS70kVgjXFVoKtzyEftw9lmL79B01f+Pd4y7HY2tSMTv+eD728gokgveNwAdoyw
         kxX5vxEaDSXAyH6JDaTtJNPuBbh4cQrvS97gJIYvS+7rIFnCeGwohKoa1nINrYS+aGdz
         lSZwtsQA/4u3nG31JzB9YM8dGg50x71+4sl/pUvFj9LVbkEE15MKNqLvPrSBhXn2/OhK
         ImF5ZAxL7iM+/p44yO4XTDMlIOcdBGQSRm9uahQGcs4jaYTRmlFtG8TRkeZImZzNSvmq
         k/cjZgdLvNzUUxnzaQOfUPCsrZmGnu+cHlCj+rbtEIiNtOu8ui8etCtgxNMHiZrQP9cR
         3X9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566597; x=1750171397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvocMr2BCGLQ4TfKAo4mp5CqrAlollxqJ9JbTzSmSnU=;
        b=LrC+HCRDNQ8JsBon7I2KDl8SHEnK97fZIpS25ZEEcipdmtRcgFhUNsOh1Hq1PEUMFn
         VXzezmU4L7b9l/PRkW5HPttu+yXGMk3agWHWv8DCKe8XJFBzVpO9euCHim7twwgTCQ1b
         kwlRv24cjiBaWapwCaf7qB/hOBq6Xn+M7XEfR+eEe0ZWrgzvKZiV5t5U0IeF5lV0cDEs
         +k5DX2KP+2ylOARv3WyimhYzFhQA142MIA1lXeryDlVm6i2lpPE1LCV97Kbr4ANBsUpS
         6mgkHQG7UuNZVvaPvsQ3dMgrqK4XJa2wmOUBS4A072sY8ym2kn5oPOvFNlTKI29eapZY
         dCdA==
X-Gm-Message-State: AOJu0YyZQSpVveG0S9DXn1/pklbiUimaMM2jxZMMUD6DhjkRF2iRd9A2
	CWJoGTtH91Cr3FSV1ClNbMe73owoSkFX9JU49+fl3LMQiUD/b1PR45Uzd086vzMv
X-Gm-Gg: ASbGncvFEdwv6DtpgZWavYxniahOJyzt77DckrD+DTaG1gxRSIDxtWWXq3NHzT54XCr
	o/pjet1QEefbjT8pYZyul7HxZnd7f5NBD27Ic4Wso6r3fTI8yP4dwHh5BRXVJJ2Moufqxk/p3BI
	XyUaQLc3SbL+vRQ9ScuWeT3xI4PtzYdade3Pk+EZeyRLWzEZIPDn41cY2CAPEm/2mNydEXlJg+Q
	QXpWRHPc6if8JYrgVQelgPn0cNF9FvrlMimxi1YM8ObzetKVeeMIUHEyZBm2Mmgh/VGa0gbR2b2
	xnY8d4gOrOaVLFGseDcy4x16DTMCFAiCIv3rAcF6HBnQS3RQqWZT/bSAze3XGoZgCArPxx3Kgom
	ZHzZ6YuviyiueXlG6kvoo
X-Google-Smtp-Source: AGHT+IFgzxCyX0JCL+cqrp0nFdHpr+WDtb+W63LQD+3qhT+MvQYgaLUo4JLCk+vAx2PBeLLNtM4wlw==
X-Received: by 2002:a05:690c:1c:b0:70f:83af:7dab with SMTP id 00721157ae682-710f762d432mr222400357b3.4.1749566596448;
        Tue, 10 Jun 2025 07:43:16 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a0fc34sm16379947b3.97.2025.06.10.07.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:43:16 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 4/6] orage: upgrade 4.18.0 -> 4.20.1
Date: Tue, 10 Jun 2025 10:42:52 -0400
Message-ID: <20250610144254.884143-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610144254.884143-1-schonm@gmail.com>
References: <20250610144254.884143-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 14:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117868

Changelog: https://gitlab.xfce.org/apps/orage/-/tags/orage-4.20.1

Changelog: https://gitlab.xfce.org/apps/orage/-/tags/orage-4.20.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-apps/orage/{orage_4.18.0.bb => orage_4.20.1.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/orage/{orage_4.18.0.bb => orage_4.20.1.bb} (84%)

diff --git a/meta-xfce/recipes-apps/orage/orage_4.18.0.bb b/meta-xfce/recipes-apps/orage/orage_4.20.1.bb
similarity index 84%
rename from meta-xfce/recipes-apps/orage/orage_4.18.0.bb
rename to meta-xfce/recipes-apps/orage/orage_4.20.1.bb
index 83a65885ac..cc17393504 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.18.0.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.20.1.bb
@@ -6,7 +6,7 @@ DEPENDS = "gtk+ xfce4-panel libical popt"
 
 inherit xfce-app mime-xdg
 
-SRC_URI[sha256sum] = "6313b49b26cfa39fc5e99468f3fbcfe0fa1c0f3f74273f03674f1a7d6141a3ec"
+SRC_URI[sha256sum] = "7e0331167ba438e494e0dc7fbdf03843fdfa4004910f4d5b113afea77b3eecc0"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
@@ -15,6 +15,7 @@ PACKAGES =+ "xfce4-orageclock-plugin"
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/metainfo \
+    ${datadir}/themes \
 "
 FILES:xfce4-orageclock-plugin = "${libdir}/xfce4/panel/plugins/*.so ${datadir}/xfce4/panel/plugins"
 FILES:${PN}-dev += "${libdir}/xfce4/panel/plugins/*.la"
-- 
2.43.0


