Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.165.1614638071645940596
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 14:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pc1jack4;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id l2so12574148pgb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Mar 2021 14:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HvyuXFI+72JoeQ3rJxTuWHvvSMtNCxuX+3iG2Qx2RJ0=;
        b=Pc1jack4uIRofTJGGOWfp+hkF1fS4GBOYEfASFLKa2co2/t8Ht5zCOiuE7nWRSWS4h
         GjUXlTzXM1iHy5SQKLiTRGO5lDcEmmxsOXYenhAUafJUqtTgP+iOg36E0xJJ7tKgLfVa
         /C0+2BKq9gdJpaY9n9H8GIc4xMSGKfTk0DM4yuvJtIO/K5hNbHKSCQgr3NWEunrIE0QP
         aCD9UtQG/6xX8yaUkox4F88VgODxgd0UZkEKgfVRhRe2gW7cDJsSqrS+WDHhXnqdKNw+
         cdYMhqo60GLPoq3jWkjVPqRBa4SMY70Fvl9RymSb7EvfZtZObBemAG+F2DrT93IQYuUb
         sLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HvyuXFI+72JoeQ3rJxTuWHvvSMtNCxuX+3iG2Qx2RJ0=;
        b=LMtUazriiX0pxjg5R8Bk1nB4wHfD40McL/MWZCBQz6ZUkpPNczbTqrofvE/6LnyTqE
         eaMd/Y7WHsS86k9pVQFFnZBb1EOkl/DE/5B3wm1aPgPRmN44cWAxlNQUzbReQrjByvt2
         6b1IdHQByyJKkdGGXkNU6ysFK9Vx2enHcMwE+JI/0zI+kiKYYi3oK/Blgvl9kCHGKgUm
         xliHbkkmUnTKAja4R+MHj1WIkebt++mC4rEVXv4Z9aDD3rb0H47hqHapDcRWkzQ//k1F
         BStHzV2pKbhK7B2BkosZOKAF2VsPqphtJWcw1blVUlx2wYmfjbPwnVsqVNyrpCdd4eua
         WReA==
X-Gm-Message-State: AOAM533wcwcnRSETtj7llTAgSl086nc0iODlNYGYW+RwtOLUYowvZ5Q0
	toMvGTBQqILx+9Azh8RJJENKSHlX0xV5tw==
X-Google-Smtp-Source: ABdhPJz1yXemDS4SgB9iT2Cy0MVlN1FO2EBgma3kL/gh6OAfzGbDDoPHseR0qWWrhVB3iaTNDOSFvw==
X-Received: by 2002:a63:4207:: with SMTP id p7mr15622053pga.406.1614638070891;
        Mon, 01 Mar 2021 14:34:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id q2sm18698828pfl.158.2021.03.01.14.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 14:34:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] dvb-apps: Allow insecure inc paths
Date: Mon,  1 Mar 2021 14:34:26 -0800
Message-Id: <20210301223426.1991847-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301223426.1991847-1-raj.khem@gmail.com>
References: <20210301223426.1991847-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Latest perl have switched the default to not allow the unsafe include
paths like current dir (.), but dvb-apps depend on this behaviour

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
index f354ef3872..977a9e7922 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
@@ -20,6 +20,8 @@ inherit perlnative
 
 export enable_static="no"
 
+export PERL_USE_UNSAFE_INC = "1"
+
 do_configure() {
     sed -i -e s:/usr/include:${STAGING_INCDIR}:g util/av7110_loadkeys/generate-keynames.sh
 }
-- 
2.30.1

