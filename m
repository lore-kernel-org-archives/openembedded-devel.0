Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.12369.1597383422101858523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q8yCFvV3;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id e4so3893084pjd.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zmYt5hht8krAMwUMqNEzsw/Ebr/LNja1GZlH69FO9bg=;
        b=Q8yCFvV39cPu+pmFXTi6XTQSoDCrDEQQ4G57VEqJqkMHUy97yETfoxesA2UxZxw+ee
         UVfAKeERttXNlsMKzB5YUFydOTt1ViWWpu2FMZdMpOVkVDNXkEeerrNdAXule1lDisRJ
         U49T0Avbo9LtG4a3Rh3rJ+yCMHRdGGH+Va+kAQgVDx0jHKSY07MTak2FA/bfmESPZ1RX
         ZRfO7Gqm7WfqokFnPPLpLn067fj0jAgp5F0EX3cc3gvk1Ecp/mZEmwrVNkt1ASrttwb/
         Pihk053XUxBQ4hUM2oH0ml0pDeOmzo5qBQo9mk+QWAturT9OuWlXEUph3Uwe6TzFqlok
         7x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zmYt5hht8krAMwUMqNEzsw/Ebr/LNja1GZlH69FO9bg=;
        b=Vlf/+NSToBXesAcY8kiPTULFATSqYYqtez2nxqxQyxYHkGRlOAuor1L62/e4nH4Irc
         I2RbUeZi84fGrlSh2TDEloDlDQg/2qyJXzrIgjqU8EMuWZEw65gZ9Cvht0GAsXsQwKrE
         1fWiKSEsKaKZL2Xj/+R7Wq4yp/zeOLmKMrGRRVChdcALiS9tiilhp98hiJXimFpGu+eB
         +iO1cYbu10aTlYpvXI0kob+aViL60N2JryqaepJwuWDZl7QSjEHkXUj/+Vwj4W3Wy7su
         gRJbAf+uknQSvbr4GNqvEZnA7uVV51Fx10FRwFN+lQay2YsyJNXrFBNQ4Fld1Dmh65d6
         cBmQ==
X-Gm-Message-State: AOAM532xkdgK97xV7YTr+iI1AgvbaeqfJJn3BasNeRNqVLDD6jvI11W1
	V7OXceypbSPPRfmU+CYfe1c1YaxVx4T8aA==
X-Google-Smtp-Source: ABdhPJwJeHbUyHTk8QYKvZ8vIANjBQ27eH65NLhTGD9n/jmgrgixe7ya3ODKuNh+EXreMEtFkL4r/A==
X-Received: by 2002:a17:90b:4c46:: with SMTP id np6mr961200pjb.201.1597383421310;
        Thu, 13 Aug 2020 22:37:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:00 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/21] fluentbit: Use -fcommon to compile
Date: Thu, 13 Aug 2020 22:36:39 -0700
Message-Id: <20200814053657.1701247-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc10+ defaults to -fno-common and fluentbit does not compile with
-fno-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index 21d13ac935..411268815a 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -54,5 +54,7 @@ EXTRA_OECMAKE_append_riscv64 = " -DFLB_DEPS='atomic'"
 
 inherit cmake systemd
 
+CFLAGS += "-fcommon"
+
 SYSTEMD_SERVICE_${PN} = "td-agent-bit.service"
 TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
-- 
2.28.0

