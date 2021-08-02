Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.17508.1627894956895680795
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 02:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fn2s3R3p;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: liuxiwei1013@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id a20so18992915plm.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Aug 2021 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NLTSsLUO6NYl0i3NNlFCyC5MN5itTwveuTLP9+/AvG4=;
        b=fn2s3R3pd6YzpXUZy5i/KdeUE6RpyNemELlXUnDfzIIxp9vh+kU4xHl91Psc8XF0c/
         ++WQKniZ9XPVqYBrifZACGMErUP65a31clF4u/mXKwKK/eMWmr62U8rvx11SxxAr0Y3d
         numIoK+/1q8YtdcEudWS5C6LgN13ggrnXXv4VAR3E6OtrAzKERWgAMI+dtNiIWimpYDq
         9LmSjv+qoQ06EwMOn/v82YJxGkqPFUjCspSnqZAojTC95ZaLJQgydz6JTsgp+tDhxBwp
         ZX0An9HDWPUt9szhQPsGhOJkp9Djykt8NeSJK8nOEf2hWJtWXdbQbCCV2MPMzfU+Wmng
         mMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NLTSsLUO6NYl0i3NNlFCyC5MN5itTwveuTLP9+/AvG4=;
        b=JGG5lFyphkXh/FumG3YTjE/3ZTRzCFJ/8wY+hAg91PBgF351Y82P7N3LBfg4W2nTi+
         zcXJDQTEKlBt/8vyk7i/rkV9q33XRPwDpBPZSLqgaJ3dTrLEJoOmW4LCthaXIjQUieZH
         PD9t06M1So8QfQHR0neZ0w3KsJ/a1/50ARmRuDzw0TBqj0xLmV6HDWa8L5tTKWAo8izs
         5WVuRZ//S+KRmgSXi16q22nv9b10WOagh6vql0MFstIDBxN0vaiFn6WND91p5Rox5wv0
         bz7KuMCI3x4ZVBE7HiY313RZc2eDhNOqMAeojIQ1ANBz0um4A0YbsDZOSBzhxDk6yjEH
         mcAw==
X-Gm-Message-State: AOAM531uvo6gaZmjURlHExKjyDNaRFGbNkuVMjKb4CqKWPLudIT9liga
	g0XY5bZr6vuZ3YHSXfMabe0=
X-Google-Smtp-Source: ABdhPJzZsZyG43gX4vqyt/UNBYVlR4euF2UkZvEm+wmkgg8nOSaB8eCjPntboxcu+yPlGIkZN0iIpQ==
X-Received: by 2002:a17:90a:ba82:: with SMTP id t2mr16445291pjr.143.1627894956437;
        Mon, 02 Aug 2021 02:02:36 -0700 (PDT)
Return-Path: <liuxiwei1013@gmail.com>
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
        by smtp.gmail.com with ESMTPSA id q28sm11007121pfg.118.2021.08.02.02.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 02:02:35 -0700 (PDT)
From: liuxiwei1013@gmail.com
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: yocto@lists.yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	sergio.prado@toradex.com,
	George Liu <liuxiwei@inspur.com>
Subject: [oe][meta-security][PATCH] meta: Fix typos
Date: Mon,  2 Aug 2021 17:02:19 +0800
Message-Id: <20210802090220.10668-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the variable spelling errors
s/SKIP_META_SECUIRTY_SANITY_CHECK/SKIP_META_SECURITY_SANITY_CHECK

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 classes/sanity-meta-security.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/sanity-meta-security.bbclass b/classes/sanity-meta-security.bbclass
index b6c6b9c..f9e2698 100644
--- a/classes/sanity-meta-security.bbclass
+++ b/classes/sanity-meta-security.bbclass
@@ -1,7 +1,7 @@
 addhandler security_bbappend_distrocheck
 security_bbappend_distrocheck[eventmask] = "bb.event.SanityCheck"
 python security_bbappend_distrocheck() {
-    skip_check = e.data.getVar('SKIP_META_SECUIRTY_SANITY_CHECK') == "1"
+    skip_check = e.data.getVar('SKIP_META_SECURITY_SANITY_CHECK') == "1"
     if 'security' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
         bb.warn("You have included the meta-security layer, but \
 'security' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
-- 
2.30.2

