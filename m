Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA0BC25B10
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:09:47 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.18163.1714388983228517003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=zZCptTE5;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.175, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2de232989aaso51548401fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714388981; x=1714993781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tpQDuKzBSC6tLaFhxmxUMc0AU6xJ0hk76R8ptA7Y0bw=;
        b=zZCptTE5ndxt7zsp/LG6OsdgTkrbmBq3A7+9OpxWcpBmVKjXMyGJn1KMGVewcfqg6+
         tWjBrHOAByYBq8UiT6n4GhX9pXdEHcqsYSwPWxUCDGLd7UvqYZ3Giq6jFWUj6+Bjnz1t
         c4SByu16dSTaHJPdMHZPPU5khQbJN+B+W8v75LNd/k6UwaNTxoZfeZ8jciIQCaxL6raY
         AipRQFs8G1JXpfVeKm9MHm/JEh+g9k78KQrz+0uKyr+FXrwrPUPu7ishQlYgCkAmrIrS
         WuqDqa+02e10F8tx+vazYu4adSziObzqr24J0GCuSLxPGV1esTDuGTNApK3hNkmMLbl1
         5X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388981; x=1714993781;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tpQDuKzBSC6tLaFhxmxUMc0AU6xJ0hk76R8ptA7Y0bw=;
        b=Xy9DRGqmz0Lybo8DPGOIjv5duULmzNCOqwAu3qJij213RQTmGpsiEAYRkafrufCxAo
         WB0WKWn7VCI+Ab4FRr2HlFUJF1njN5AjFnaPuYeAI/FoBig2LYdX0jIz/huTRiQ7V45v
         0gO4xkR8zBPkM38ih5rnWycKSDc8hAPpWiVGxa6SvPbPoziW3YEhNsLs7uWFicRA8sp9
         KMMhiOZ7noYDfO1tvQS2voFgKuxktMfEr1nm+yMYOLD6eGlVr4plv1X5AIcoZZfHunvb
         QSbJRCnwIQ0vFYugM09QU3ibPD2m8EQEBusNw+sqPhV+vaAYqal6jy3qYJQS5jHKOOJx
         E+4w==
X-Gm-Message-State: AOJu0YzftIyjcVfKFLoB/FKt5L1wjxnPSeU0SQmAH6UJOk8lf6MpCiUD
	/+FdQpy2JevZ/6IviI7Ana4XkB7NS+qp16nRb6dZDaLYBGh/d0G5++FDVhlB4sDutDdecYRB3QC
	4auc=
X-Google-Smtp-Source: AGHT+IE6V8WVptHR3TXq6/WLVoR4AqnKerZN9yYYhkwJ9h0pcyZlJWSESunlsY7VZtKeQgl3g9Ewvg==
X-Received: by 2002:a05:651c:19a9:b0:2df:6eb1:c501 with SMTP id bx41-20020a05651c19a900b002df6eb1c501mr6660924ljb.11.1714388981374;
        Mon, 29 Apr 2024 04:09:41 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0a4900b0041b43d2d745sm16210084wmq.7.2024.04.29.04.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:09:41 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] open-vm-tools: Update status for CVE-2014-4199 and CVE-2014-4200
Date: Mon, 29 Apr 2024 13:09:37 +0200
Message-ID: <20240429110937.55865-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429110937.55865-1-ninette@thehoodiefirm.com>
References: <20240429110937.55865-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110177

Current version 12.3.5 is not affected by the issue.
Affected versions: Up to (incl) 10.0.3

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
index 6696e552c..90d97cf7a 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
@@ -120,3 +120,5 @@ python() {
 }
 
 CVE_PRODUCT = "open-vm-tools vmware:tools"
+CVE_STATUS[CVE-2014-4199] = "ignored: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3."
+CVE_STATUS[CVE-2014-4200] = "ignored: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3."
-- 
2.44.0


