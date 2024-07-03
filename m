Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B273C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 16:50:17 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.55368.1720025407499827200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 09:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Dd3iizPj;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.215.179, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-75a6c290528so491176a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 09:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720025407; x=1720630207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cn4Wh39CoCjI7DtZjg2rpxRedCRaxySI57N9TJS3Uko=;
        b=Dd3iizPjbFYwh+8CvargAqXxd49jZUG/whixcfU32UOYK/ezyOR+pQd93EhmPG5Gi8
         svLlzh1Ev5dblDg6VQfkYqinjScapxAFrkUpBf+xBFyWcwqC+7RfSd25jQS71FYc6S0E
         nk21hgim58OEmZeU1yVv7YnlTdFAKWu34frIeEy6dk/qg2fnyTk1Fcdi/XBlTzX97CW9
         d5149D6fnxXSS0/NGbfXqafnW5E5nhkcqrL/1NBPvTpK5SwVaoGfen+1E/fJApraKRAd
         KbviOWuXfaZlzDnW5CF51zLABUiWyGq7zjqtQbl7NjG9Ng5kOJx0/FA1lmkOuAj6lyi3
         urtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720025407; x=1720630207;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cn4Wh39CoCjI7DtZjg2rpxRedCRaxySI57N9TJS3Uko=;
        b=azo4Obi70yLPSjWtWXMoARYnxV6IgRVsGf/BZpn94SNQHgtUWRjL5E/v2ujKbnAttt
         4EXCKNByYXvXvgpWXqhxOp1ooWk8Gl09glw7lb4q0Fcn6qU3v/srUsxTTxtJryHH4JJB
         TdCBMGdvdMLOi+k7FhYeWOppJAIkAfVLGmXHohUjRotUrDCWVV/gyXvHbeZPfi2Mgu9F
         feti5QydZAiqHDrWQ/exXXXGSnIHiyW7be6XnnIp/aXjJpz9PaysfBwusnk10pFU0JlF
         vS5Hm5qiL3Zwntz7TY3h9O209EsM3kwU5shUPccy8gjgZwpZTklRnT42HKZbUC1eh3EP
         JD9g==
X-Gm-Message-State: AOJu0YxyZOR2I+Vg6Vt3MeQKg6+A6YYb0slZPIG42yRNO2Lhq9MwHBJJ
	XE3CDPoQAia6wqOPxnawDQolMp/y1HmpwSsxa28JvHU9dtQfBiMekBZPnSR8rFu1CG3bysqzk7C
	w
X-Google-Smtp-Source: AGHT+IEzB5x8r26wE5tbjzwhdwg5/R/iioFF2L0y/x3yOBuMJaWY5OdDxPW/kNAyYRcUxv6877XMhA==
X-Received: by 2002:a05:6a21:99a5:b0:1be:dd1c:a6dd with SMTP id adf61e73a8af0-1bef60f3d0cmr11648160637.1.1720025405367;
        Wed, 03 Jul 2024 09:50:05 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708043b76a5sm10991116b3a.149.2024.07.03.09.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:50:04 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] gimp: CVE status update
Date: Wed,  3 Jul 2024 09:50:00 -0700
Message-ID: <20240703165000.28528-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240703165000.28528-1-ninette@thehoodiefirm.com>
References: <20240703165000.28528-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 16:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111233

Update status for: CVE-2007-3741, CVE-2009-0581, CVE-2009-0723, CVE-2009-0733

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 833341f85..a17e03b10 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -73,3 +73,8 @@ do_compile:prepend() {
 FILES:${PN}  += "${datadir}/metainfo"
 
 RDEPENDS:${PN} += "mypaint-brushes-1.0"
+
+CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
+CVE_STATUS[CVE-2009-0581] = "cpe-incorrect: The current version (2.10.38) is not affected."
+CVE_STATUS[CVE-2009-0723] = "cpe-incorrect: The current version (2.10.38) is not affected."
+CVE_STATUS[CVE-2009-0733] = "cpe-incorrect: The current version (2.10.38) is not affected."
-- 
2.44.0


