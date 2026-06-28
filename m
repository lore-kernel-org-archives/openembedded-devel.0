Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B26EC44508
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:06 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69124.1782634316361731878
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FEsS7O+s;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bf132969bso3406647eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634316; x=1783239116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8tUK2mfqqT+4pF9S3iST6OUbYkFdx8FG7HCpArlE/Q=;
        b=FEsS7O+snuUWiQXsWdOZfH70TfTW73GxvzHzlXwJueQXYklDqWzBkbORxkHYNNGtUz
         n0n+dJxlCjEmb+0tXueLrDmeP6yFEwt+OKpl/Hyrme7Ysx9hPDjwxX8JObHBxpVGDNdn
         9bEpKkGTQyiCktKCALqPNDe2Icga+Eglym2onX4DrrpkoZCqthMvFnwBzgYeo21ChMnv
         99SNAsd86egxVzv+1QnxQlWWi7FnrRBTluXDpSFeacCNr2hw50q+wc4edQ2c6dFlkr+d
         H0+QD6zqI1LLTsgiHs2nfZoH255eSwaxg7RishptS0f+6u9d5G9728QiJFffLjqZOQsm
         NTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634316; x=1783239116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8tUK2mfqqT+4pF9S3iST6OUbYkFdx8FG7HCpArlE/Q=;
        b=XMaKh8ivNUozadTjP/Vab1lcxqbGr2EhJG83ssDcVVYSIi2UFItDBS7NHWRbL9K/fz
         RCGoaw+mMFqvaxZ3a44MihHg1iFGAQIj2NFJFA2ty+I7hH7WgWefRrDxu23kTzCmJPWn
         FukhI/2uT7fF1xzLqloAgvBe2Y55L/ZAR3q93XxQ2BHrp+fK1ADCwZT+jiUq4NrZtAfB
         AFtHPBsRxS1MlaI9HHn0RIRg2dCKhCLwSQA2TLKOt/8MPa3+B4dN8J8m25ah9jpWgDnR
         i9ebXmNnGk+jAEmq66cDbiPReX9m0jEKuzlBcVwgo1GMAz9RZgPRG10Gqh0/6YDU3GK1
         OnJQ==
X-Gm-Message-State: AOJu0Ywu1GEV8FcvEqIA9ROp6V0RJvzeKiFNsxUrb+wdUWVmGhxV36xd
	dnY+9V3mk2vA2XtgSbuDWU2Ycgx2InfhtIsVrheI+Rg8ERHZDeKzJbW1YDVGzNaA5eg0hg==
X-Gm-Gg: AfdE7cmQRzMd13KKMXL5BMXT50VLfkBu25alkfYeGHxCM+FRrWS65D40HkBNXOxNE6e
	G7N3jFMePwmLNb2GvhIiFTpGPYAH4ROAEcaTwqWGni2Cy1gaVvXICaJDurF1lX+3yupwCtq+ipl
	QY5FP6XMFS9rsWzHkcjSPkDATOzAP49hgLXp7YxGKKfyntBn7DOwggu7aotsVbMxI/aGpzgwSSz
	Dmpg+2rU3XgSf7z9LQK5LSDOCcqKt9DWnSLkeeeavDRBBArcwtozHBKw//mTPmr2sslbNOIH1eW
	EOh5Phap4Z5Hg9+smAimbcvZmX8AZSeqLSW+oRHOTCmHWcQhybytZrDV/+IBMDtYNnw7GFpyiIK
	WpYGbZJYejsyHCGSsa0cjjy/+1QPLphX7ZOOPpKWFygLjYU72ak4cpLH170zk0n1/jElCu6xApF
	+uamugqdcod8cCN/nkmf8FjICotfx9lVRki6MDwmy9HHVdU19+6oHh0PL6kCo9wVBOCTu7ATOav
	glOSojbdVCirEJnmigUl6DiqMGctIj/f/DJ6DNbfNCWLBt1EK5kUxCoPIRPg2aRjKScOiAJk0hd
	r8Ml+ZfXl/MgnXFxLFQKmjPew2GJFA==
X-Received: by 2002:a05:7300:fd07:b0:305:179:4dde with SMTP id 5a478bee46e88-30c84e5b383mr12922068eec.35.1782634315659;
        Sun, 28 Jun 2026 01:11:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 033/128] weechat: upgrade 4.8.2 -> 4.9.2
Date: Sun, 28 Jun 2026 01:09:44 -0700
Message-ID: <20260628081122.178348-33-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127843

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-irc/weechat/{weechat_4.8.2.bb => weechat_4.9.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.8.2.bb => weechat_4.9.2.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.8.2.bb b/meta-networking/recipes-irc/weechat/weechat_4.9.2.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_4.8.2.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.9.2.bb
index 458a8a317d..b01f3c6c0b 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.8.2.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.9.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "7e2f619d4dcd28d9d86864763581a1b453499f8dd0652af863b54045a8964d6c"
+SRC_URI[sha256sum] = "d1389a9e521bda0c4ebfa108e2abf885ee6c5150c385299f5dca0181a43a0914"
 
 inherit cmake pkgconfig
 

