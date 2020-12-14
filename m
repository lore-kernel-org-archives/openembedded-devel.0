Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.30423.1607925877393608337
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Dec 2020 22:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=naci8+i1;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id w4so11726223pgg.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Dec 2020 22:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3t80EvXlb2Stju9DdluhwZzUrZbkwfW6sPt4o6l2/8w=;
        b=naci8+i154iU0ff8sP3Hsw/N/CyeaWPlE2ClZor+OHl7OdSvEt690wEOB+Zll9V/Ar
         vuoPA3SD1g5lUPn5Orb+07hlm6SNN0QOcfdpdKz2EmVXpshqVwQjNlUtwseSXS0glia4
         BuKQdWrYmSv2em8FWpId5rnMOaflEjf3JGBqjsAaJFiA8G+3C+TPej7mQap/e5zHwaWF
         e7344rh1+oLBOVN0SIiS9OYD1cGCFL1IY2xKhrCjP8nA9vhe/GeKYJfpR2A4MJdNqsb0
         6CS4nV9yEU+bU8zxgjxHD8Ra0tLCSeQG9MMmOeKysEWa7b9Jagk86WXjepdmbafqM7WQ
         4Hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3t80EvXlb2Stju9DdluhwZzUrZbkwfW6sPt4o6l2/8w=;
        b=JJ03MINPQcoBrh2LQhX9Bu9+LXKUlWwPsMnXmQ4GE4yTnkHJozataUgHEsrJxq+3/Y
         3iVwLOEV2iD5qAdfz8Sr7VH0CEhWi3drpL41bcnP+xk+KK4uVeoMnprR532U2/w1m/so
         /QSH1CholwJ0jbF3L9MBhsmcnwvQYdxTrJLzy54zgP/3dXcShzN6EMjDMZFpfOHOkN79
         VMAvKFEIWhQsFQH9XjQpO9TkZxGA3KSO+omyys3v+W6kVugplj6jDnuGMcjGQXRFO95V
         nzoDgi7MZZwdfVub8m+AT+ze6MQWLD4AEdRaHYsOvbI32dIVh1QdEM5Lop/hl1H3k9ty
         mZqA==
X-Gm-Message-State: AOAM531fe4rRNpD3u2kWMDZmy2lFK2aYay3SVEJkp7zCiaQv0m5qDcyq
	IqfkX6DU/F5Q2onwbENA4f7BPDUMSbMSKg==
X-Google-Smtp-Source: ABdhPJxmGgwnnIJVPTZRopQK2aW6Lx9KeHOOFMYbzCglImmSR6kTjw1rZ6VNCTzAHM/DpRroswwHig==
X-Received: by 2002:a63:1a58:: with SMTP id a24mr17453099pgm.118.1607925876768;
        Sun, 13 Dec 2020 22:04:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id e29sm18071084pfj.174.2020.12.13.22.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 22:04:36 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Roland Hieber <rhi@pengutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] openct: allow building as native package
Date: Sun, 13 Dec 2020 22:04:28 -0800
Message-Id: <20201214060428.2133-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214060428.2133-1-raj.khem@gmail.com>
References: <20201214060428.2133-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roland Hieber <rhi@pengutronix.de>

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/openct/openct_0.6.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index 7ea0d4174f..3976f77700 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -79,3 +79,5 @@ do_install () {
     sed -i -e 's|\\(LIBPATH\\s*\\).*|\\1$so|' etc/reader.conf
     install -Dpm 644 etc/reader.conf ${D}${sysconfdir}/reader.conf.d/openct.conf
 }
+
+BBCLASSEXTEND="native"
-- 
2.29.2

