Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7761.1793057196972426875
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qqzS+bD4;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so791502eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057196; x=1793661996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uj1nrHyKAytE8LQe5Eo3nRqrTlDdSOlYuKjnB0gMtw=;
        b=qqzS+bD40lMnwqnQnw3gvOTEx8qS2wE7F8ySL0BXbOZda9eM2xRJ4S8TduFFu6kVc1
         hQjTLMDoF1vJGTA7uUkGdt83dSVuVXpHwvHKxA35cGKSKUNR3aw+My03ud+t0PWoP7oK
         3UEoODGIf9M/fXm2DO9riqMjZaGiJJ/WUisGXAjpwzanBxt5WM8urqxOMC8oj4lN38S6
         B0zboj+PfPm+a3LvcMdE8CZ3saYHOjfnmC5apy142WR0QepIX0g58FD7LXospllFTMJd
         AcORo2bukIcx7O7PlFs0EBEhy+zA07BkrAuybscY40+N2RLAxSnZl5OT08wIarK1zZKm
         L/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057196; x=1793661996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9uj1nrHyKAytE8LQe5Eo3nRqrTlDdSOlYuKjnB0gMtw=;
        b=2vkB8ZyU1jho/xjmAzt85jEpJIOtasoeNaGkyIaUrpylewze/mp8CKQT1lRMzUoHv7
         oHRNyLIn06YE9vrxxQ6mwzDfZVxtviFQLv+oDtt9epTK53hOS4QXr6m7ka9ELrbXX6V8
         VqSe6K/svI6forvhcwyWO47xyprN8rhj55oZU2lRfNMe8EakW+Nub+9UMdJh0+cUQMsW
         otDcRZduUrhPtODIfjqHij5QFSCs7uIdaENlmsCkQRxdpwT3Ph/mqvQFA9Ndtv9a/Fm+
         FGHmsWzr6HZpnu3Si4PQ1F2YhiJMzE5lRdQiTt1q+TZUZKZKg5tLnPae7NuV8yIQXac6
         Z2NQ==
X-Gm-Message-State: AFq9FYKXSOOLER5V3iCvi1YrGo3bbTSvNjdg4UZogx5Hqy2x+BUStLCo
	k4gyLREwcHArU5wjYLnJ7kr/LHvN7oemIz/lvPadW9J61cUyrR3OedbpcpRXIA==
X-Gm-Gg: AYBFou0CzGBmZIb4sv5qhZIGns3DBvlVxX8mXzVD8varBIjTJeohp+CCNtziU9bx0Qd
	wd7CxlXU4oCx9ZnfNfp/xUsVNPHNhMpxKZfZlsvpl8eFfpG89wr5+xRFt2C0bj/8CwHj51smg0H
	NekQFDgav/L/GpAAP6UKQgkPtyLMu4DfsYGkUGuOEl+KE/vfsaUKcP2pqZVThcg+x/0c4TTArWU
	JX9RXZWf13G7Rp2SCj5pRc0XPOhL0gO+8vQox72D1E+/attkGCVrvccIw+H1y6DcqirzB7tFfOB
	nM1M0o6nVRG/Z1/0H2P1IY9msv6sUEF+M7XBf6IzqAXw2gquG2dH5Q6qkQcS9Mq+eZUe8/tTw0r
	0XTxueiH1tDP4SmDpCFf/R/8z7rYMJxmeHLQMaOKVwuCLdwlJUikJMpz8drXgA34osQnu/mJXYx
	aBuKBFs+8WmUOoqrqB0Hh3uuxD5xdm45C5uE8Cjq7bSevkIjgeGkH95CZBQIlb9TuqYjT9WJCRk
	3+cpy9zzaKERgszP1TzLXcptLTTON/MsjfrPt6rMv+PyuhH9JksoVoMZMOCUi28NqHVDUI08gyc
	361DaIu5FuEh
X-Received: by 2002:a05:701a:ca05:b0:14c:1f57:3e86 with SMTP id a92af1059eb24-1993f3f1d75mr13534785c88.47.1793057196157;
        Mon, 26 Oct 2026 16:26:36 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 3/13] libheif: upgrade 1.23.6 -> 1.23.7
Date: Tue, 27 Oct 2026 12:26:15 +1300
Message-ID: <20261026232625.1275411-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131443
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Refer to changelog for behaviour changes.

Changelog:
https://github.com/strukturag/libheif/releases/tag/v1.23.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libheif/{libheif_1.23.6.bb => libheif_1.23.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libheif/{libheif_1.23.6.bb => libheif_1.23.7.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.6.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.7.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/libheif/libheif_1.23.6.bb
rename to meta-multimedia/recipes-multimedia/libheif/libheif_1.23.7.bb
index 1bffe00fbc..df1aaaff72 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.6.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.23.7.bb
@@ -8,7 +8,7 @@ COMPATIBLE_MACHINE:powerpc64le = "null"
 
 SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "f81f28ac014b1c28dee483ac45b72c6b05bc421a"
+SRCREV = "12a259a5882dd99d45ec5fc77e296a3b620d1e2e"
 
 inherit cmake pkgconfig
 
