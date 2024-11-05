Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D03D40CE8
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.30774.1730839985681461834
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ClZaSFcI;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e35bf59cf6so2452477b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730839984; x=1731444784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8G7WucFPjzD4m7BDgOHxxHk80NjoNz+srvYyfmYp2DY=;
        b=ClZaSFcI7Xes26Yzrueot1XPNii5Kd5h8H+zOP5vi+1Tf0/4chgEiR3nm0etlBP2kP
         HPhWOpfJmCPdP3bkDoMUsu6WgiRGPFsWPqlXNziUebTZ3A58+Qies3R/ZfHj3bf5sc68
         GhO6eg+sJvpelVyPpIe/SGlk8vzozBeV1z3F38uCeZykfY40S+9KRmJqsChPWDLauIQR
         JwVVajUVIrTz1CBiiLhsPHRl1XYkGTtEqY7AY+1N9P/fR3Gi5EHxAbS0mp+jq26Ee+Z0
         bSV3eHT5T7bdtFaRHocPOvpnk7yI+fHPHhDp0QKmMk03mdSGXmVBQT8ws+OR7VJvdftm
         X2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730839984; x=1731444784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8G7WucFPjzD4m7BDgOHxxHk80NjoNz+srvYyfmYp2DY=;
        b=qHaS8nbGJSSApAtByj/gIETs4E9IkFW2fo0myBtDUHE+Po0PP4q7etJcy8Etjo/mxF
         bH1sbQYhvj2ox8wSW5iih2qmoGng0gxJN5PqJg3yjeIRtGtDtKSgHsB29mAVBrCAZq1l
         2OHvrmiMRLL2IBBYYlBrotiYrvWQTOM8oToAqWWIsfendSYdJ/HWsXiL6/gGtQbXv/97
         3UCOD97STyhJJD/2+aeuKYNKxi/0KSsoM9gCC8tQOYjaYBAKRj2hRdJyuHW+gyw6f4Mm
         rVhDIibidjaY4mbW3N/iBVZk10n5pLABmb8EWl4KMthbdoMLKj8cjn4iYycyYWwYul+Q
         iwqg==
X-Gm-Message-State: AOJu0Yym9voZ9BoG3LSGXioCfqq7aOfQK/6Wzj1LSlGcsFvo+ROX7tAt
	xHTIg1mVPBbN0A+TqYzSOoo7yhFdPBEahJsEfCC1USE4mczxGwQAdmu9VN53
X-Google-Smtp-Source: AGHT+IFnfU7pbPEwKkfG8USxHmIQNV8dWmqxyMgnKDruj4QeT/ZVdoTmXDD4no56iGmd9msEe+CuhA==
X-Received: by 2002:a05:690c:63c8:b0:6e3:2b0b:104f with SMTP id 00721157ae682-6eabeecc864mr204187b3.9.1730839984260;
        Tue, 05 Nov 2024 12:53:04 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:53:04 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 143/161] wbxml2: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:49 -0500
Message-ID: <20241105204707.4155-143-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113659

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
index 1c5a18e86..2d87f1356 100644
--- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
@@ -8,7 +8,6 @@ DEPENDS = "expat"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libwbxml/libwbxml-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f5031e9f730ffd9dc6a2d1ded585e1d1"
 SRC_URI[sha256sum] = "a057daa098f12838eb4e635bb28413027f1b73819872c3fbf64e3207790a3f7d"
 
 S = "${WORKDIR}/libwbxml-${PV}"
-- 
2.43.0


