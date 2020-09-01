Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.8342.1598999785860225039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XBAdjT8v;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id y6so1290379plt.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UmuHKtYHs1QnStg64YhaLZo4jYx52na6CcmV0Get7Hg=;
        b=XBAdjT8vNCHngkO5dczKuMrT4fBZc1VX1din+3HpCr8LbRLfA6a9AuCT6qVjxLqWq8
         Ekj6YTBdM0Y3HeIBbF8rsy/FqkuVy2enqOWlHZMiMihrG/GgmOiekSNQMkNSf2X4fdam
         sgroCX4SxifjNjKvw07NK7ukUW2bUF0nQ8IJjOfP2ey7kG8FwWpmHJul52NVaVk1cUqC
         4JMq9wxdBdStpG3GlU1AiG0/rDqQI8ixZGlfznSN+PqCktfpLAUz48cIbKIl3RfiYM2x
         DYqbdK4tmExC7JefsN0QydSAiUjKRYHgAsRdZFqTACuHEFTQZ+qFbznXmSpZK7cvj3BE
         kFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UmuHKtYHs1QnStg64YhaLZo4jYx52na6CcmV0Get7Hg=;
        b=oY37q+tyNT49ZCVQXReKwcq/uYig01IuVaoT+xp7lY+vN5Y0PZF2NDCX74y2L8ER+l
         BUpLTxh5MfQTS2Kku3bsl9b/FLoPPip5M9UUwg8WzIysmfm/PchoTudIbpZKqzv7Y62d
         y1xbHps1DrNOl0QX+pJkNTOpO6y/NTlwSa4J/AOu1MkpZNJ+DDHy8Oeyt8NLoCfTP2fQ
         bG8k6n8JbiWlelhgwFGHGRSDJluOQtYEZ06kuEcyYHenGk9LfcOjlnbTJpxR1dvMUkOX
         F7GHONRiBVVn3sisr4EEDBFgQkZwrXc6X+1Ae5FZff9kZRvO7W7mCRsso6JHYLQezgHC
         QxaA==
X-Gm-Message-State: AOAM530zOY/s6RLAN0vMCbWNRlajNQEPM4BbiXPrp2c2yUoRobL+nF/W
	J5ojFLMoZ+h7W+D4+Y8Eq3XDIlN7GDXZdQ==
X-Google-Smtp-Source: ABdhPJxsJnd3BagDdY8wBiiUAsbd59jJcLcMiYJOU5lgS9ivQgyEOx8VCV5d3NEyTcPMJ0BRO8Slog==
X-Received: by 2002:a17:902:6b85:: with SMTP id p5mr3221135plk.235.1598999785136;
        Tue, 01 Sep 2020 15:36:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q34sm3157964pgl.28.2020.09.01.15.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:36:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 10/10] netkit-rwho: Convert to ontarget postinst
Date: Tue,  1 Sep 2020 15:36:12 -0700
Message-Id: <20200901223612.1386026-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901223612.1386026-1-raj.khem@gmail.com>
References: <20200901223612.1386026-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting the service is something to be done when its booted on target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
index ad543b0fbd..308582398d 100644
--- a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
@@ -82,8 +82,7 @@ do_install () {
     mkdir -p -m 755 ${D}${localstatedir}/spool/rwho
     chown -R rwhod ${D}${localstatedir}/spool/rwho
 }
-
-pkg_postinst_${PN}-server() {
+pkg_postinst_ontarget_${PN}-server() {
     ${sysconfdir}/init.d/rwhod start
 }
 
-- 
2.28.0

