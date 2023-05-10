Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDCCC7EE26
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 03:25:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.8125.1683689107663324737
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 20:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QD2dfDyT;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1aaebed5bd6so47843865ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 20:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683689109; x=1686281109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lb5xpamDWYabpy00jzdHB9jwUzUptptcCl1JBF7i4yw=;
        b=QD2dfDyTvamqfu26aNEzqnMM6OVXKMyBdfV9g8EwQgcTAWRhmJ0JZjMo3wSgVpE3QC
         gnZzi7jTMD/YzoqgGzbIAnfVq6lpaUzh9YdPfiVYQHzOHIvZq4jXEz7R0mi0+WWq0LWS
         xfAgTsSzR2lvl6CH0XhfQXb5UW6Ss8LLE6C5jceHbQNy7sAG+eAFXlIYA8lJZKE7kUcS
         stua2GeE00TuAn8xh9bil9+DtuDgM9wIH05IGV9BcbEN7vEht3JEzZze746jfu2C/1FM
         jK6EgJXYRbzj3Pj8HORuBB84YfAyhWVWmJxZbjBXCHsKy7F1M5aY7klTskVwvZKEhxgt
         JMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683689109; x=1686281109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lb5xpamDWYabpy00jzdHB9jwUzUptptcCl1JBF7i4yw=;
        b=J/U+w/Uc+I5sKOnfVNT5OHVMcLMfDMdNw4nIZeYA+os7ZLkwmFNJrVA6tA2QCFC2Gr
         KyUC46bjcXDDs6LmIKMI6NGT4rtXq0ycfWB+Wd3GttJd7vife3jatEbRhaTdSo6fsRCA
         7oa5hoD5MZJ059lrkhNwKzsEuU4xWJFj9/sqkYAseq75/YlkxUDNrGbKWVOoh29jD4+k
         7eU+YLt7ToeZtEOMDfnJdMZ0V6bGIZ9iLPVa/zE+hukOL+2Y966OusH9bLzMuRSnJFQi
         LPC1Z7PgMO/3QgES8YTm10o7l5XO2MJOl3+QzrDonrx3mUms/TtjHHWpdX06gK49J1rb
         xjJw==
X-Gm-Message-State: AC+VfDyoUQaQY4qQ8fmTktYxZttD19s2gAMnMBeub76XzKCV007F2qTQ
	/Wm7Nl5YgEwoNvqJwA/c5khuTP8qZrGiKQ==
X-Google-Smtp-Source: ACHHUZ7JuMg+9W1miT97taNHaNLdVN6fzb8iw4F/s+XSG4WrTzCJQfuUzyA/ihkZq6pOmjomNgRcHw==
X-Received: by 2002:a17:902:ef96:b0:1aa:ce4d:c77d with SMTP id iz22-20020a170902ef9600b001aace4dc77dmr15545375plb.24.1683689108595;
        Tue, 09 May 2023 20:25:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001a505f04a06sm2446100plr.190.2023.05.09.20.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 20:25:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] libimobiledevice: Update to latest tip
Date: Tue,  9 May 2023 20:25:03 -0700
Message-Id: <20230510032504.457574-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510032504.457574-1-raj.khem@gmail.com>
References: <20230510032504.457574-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 03:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102525

This is to supported latest libplist

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libimobiledevice/libimobiledevice_git.bb                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
index 52176872cf..c17c7224f8 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt libimobiledevic
 
 PV = "1.3.0+git${SRCPV}"
 
-SRCREV = "2eec1b9a172354c8521123a767d998b17bd2ac18"
+SRCREV = "860ffb707af3af94467d2ece4ad258dda957c6cd"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.40.1


