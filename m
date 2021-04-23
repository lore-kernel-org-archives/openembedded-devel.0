Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.2963.1619137138287002938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 17:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GMLHGpWm;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id q10so34008144pgj.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 17:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vSaFS0/WkLpDjs0fNF7V/HhgiUVxtLPHfPUfGiuL278=;
        b=GMLHGpWm27mi9qhttZmANK3qOK525umdSPmvf9E6T0UZ4Irc+tfMc9X+NA84n6lJt+
         BSTeLcqjKKelPTMLbtCU/k5N7FW1sszCuSqYcUT1QaK6/zoVJohGdJKnaJYriUnpJD8D
         FXo5cU8vpD+usl2IiKBQYdun0lBZfIYAng+U0fnfqxbkPBMP3OL2aD8iDtLdccytTVNz
         OgdusN8TNYVx4NleaGOrwQ6QnwjERfFxYQn1Y8/qt0q0QsECgrRwDtaCLwussilUmNwO
         7TV2KM4qgM9b5uCxd2g7O17GhZ6b10wtf+A6RD3ShPc+/oPPb/UStaB2tYtyeHI5W7ch
         CGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vSaFS0/WkLpDjs0fNF7V/HhgiUVxtLPHfPUfGiuL278=;
        b=DKLcucN1cZ+A64xeg7yjy4t3wB5LkPlTo9PPzyi+D5CSASTFXFNSmIUKu6O7LtelxL
         4a0F+Nbn5uTF4kFA5PhyPlaoRYtgRVc3s1eSi7UIJj08D3/JbI2cDywv4/wn1bJqimW/
         S6l6OdKNWyXGvNlYPzYbqfJ5s0fZuFj9NKzcOxv1XNu1HKfHJ3bgwmj9SZ+yK5Jt7c6B
         Hz1MJ7dCWHB88OqgkDBGn5Rn8NKApioacoKDuy3LvsOd7pyvYxC9selItVDp1qL73dlO
         61q6fTgZktiCah7tmgtcOatuPYb9xuF5RAK9wMXdqbfAa/YWGnFkPMsDbbFJXMb9s/5T
         HRzg==
X-Gm-Message-State: AOAM5324GPiqvixNdA1OjmCwsYBR99bEpUOh3gYCplcDhCZyfSkeGVi0
	Xw8hgrdPyuuOzmOPZxSFzTWrSM378uU2qA==
X-Google-Smtp-Source: ABdhPJyL9K79J5mCgPc+zCi7aaSubFQmWZI//M3JOJHnDfx2inYD6XctPcrONPvUM0x6uudzSSOXiQ==
X-Received: by 2002:a63:7703:: with SMTP id s3mr1185104pgc.83.1619137137577;
        Thu, 22 Apr 2021 17:18:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id p10sm3260582pgn.85.2021.04.22.17.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 17:18:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] README: Make git send-email example work
Date: Thu, 22 Apr 2021 17:18:51 -0700
Message-Id: <20210423001851.3504526-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/README b/meta-gnome/README
index a11815fb15..1a91050004 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -13,6 +13,6 @@ revision: HEAD
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
 
 Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
-- 
2.31.1

