Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web08.468.1617594730965674679
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Apr 2021 20:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nqDFMg2H;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d8so5045728plh.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Apr 2021 20:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PB0dvBzIJDyCzGVAGkhCra3giEV77E9PIjRMmRiPt/k=;
        b=nqDFMg2HdzXOAexpV7zgmcf7jgY3e1LiT1xH2asGee+wKPlXy9N6PskBYnplsu8jD7
         WYFqatWmGDZIdIkRgSBUrZv8SIG3RJoFWyM4HkbyEXiPaIoKf9lbiJLShIqNaTF6cJZe
         o2hOiPf4MY3eon7Xed/ft2e8XuYHDUuGjQhEIdTigWbJ6FJSU5oSd5TMpus6XOKylnuv
         TbzGddxD3e3yNsC2DdHR36FSYt9nZat+HjpaQr9bR6tMcmg0oEm80OSfUOpEDq9Z3p2V
         2fkhpv+9wyqLN9zsReRmdueCqEeGWNaxEmJJMxe4Hm0B+1jt0tTmHRxOiLC3gFRaUyUs
         M9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PB0dvBzIJDyCzGVAGkhCra3giEV77E9PIjRMmRiPt/k=;
        b=uHSI+mbHP/CzleiDuyBdPgZgg4gl7nVa85EH8YgyzW8QM8khz0rHU492nQJBlGtcbD
         Bf5gtGAIDwEixyzDi+JwNyfjqM2ONe1K7eBKsH9CdVxNDGBona7HkJ9A3NmhxZSztZNa
         QDNglhNX93ya/V/wUvjbe5KLniTJYpqeu73i/3nb0kjqsmTMDrZYY6dYCyNFC/q70TzA
         L5q5aT0v5bs0kX25njFDo7yEt3t3GZvTwd5dC/oAiNrnsOqnzkYQrkLisvtdlvSgnr4r
         ehsdCFsvAQRGNnbOeX7/n/tXolg33c50qgPPbUG/47ENyssfKrY1GxWtTK3Nixy6s+cE
         0j8w==
X-Gm-Message-State: AOAM531U5G9kZzzDDPtQhcQefds9G6QGeyucQXQZmGrPG6LRWsuHGvAv
	cn/jLWTuvjSF1NqzDCj9X16Gol0g5c0TLQ==
X-Google-Smtp-Source: ABdhPJw6ZmjS6Hr3FaYjcZNlPS/+/8WIPfYv97pxCVL6Z1AFWwNw81b9C2uOUmoq26l8vJiQP1RsGQ==
X-Received: by 2002:a17:902:bb8e:b029:e6:3b2:5834 with SMTP id m14-20020a170902bb8eb02900e603b25834mr22636749pls.38.1617594730251;
        Sun, 04 Apr 2021 20:52:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id q19sm14443040pff.91.2021.04.04.20.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 20:52:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] iwd: Upgade to 1.13
Date: Sun,  4 Apr 2021 20:52:06 -0700
Message-Id: <20210405035207.196290-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.12.bb => iwd_1.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.12.bb => iwd_1.13.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.12.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
index ccdc65ac6c..1654bc1a75 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
@@ -7,7 +7,7 @@ DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
           "
-SRCREV = "bde3e0f6e3364e9c884b6b93a944d8138345b8e5"
+SRCREV = "f80189d161b2e346458cc536785d55dc05845320"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.31.1

