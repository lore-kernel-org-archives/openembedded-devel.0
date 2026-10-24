Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3640.1792837530012834453
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2026 03:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xd/xmvZV;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e831e86ebfso9797065ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792837529; x=1793442329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzqcc2PT2H/ydUY7xsr13ddS73cIqVmnJnaWwUdlY/g=;
        b=Xd/xmvZVHpRaFoWdvE9ri4cvCLpL1Mtr3jQfFWStQCHuglbKlixYRGR0OyXMKDBTAb
         /V9KsvYiu+ToyVvVkCLxPCDC44zZa2n2it60Q7ODtDxCDzqEd+KNdkhTvdny8xu63EHT
         BeueXFe+NUK+wuwVtkfj6rYznXsBbLx7g/qPlV4AcsRoZFY9knuhTIDe8aWJn5Qv1CbS
         CdPKfXp/z1AKYP5Q2pgTp3+RxU0GieqA9Alo1h/Vc2O8tlpS0CN98qgfAWrbb9rZF3+Z
         Z+dJ4hFxOf+s1RBCLzDacxqJNWgeWdGe2Lcst7jD/sUZBHrchCMfEau509vHfo/GalKf
         7Cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837529; x=1793442329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzqcc2PT2H/ydUY7xsr13ddS73cIqVmnJnaWwUdlY/g=;
        b=stW95oWNVVcQDK7kyHGmJtuVnJlUSppHSv794GwDv280NlLcXAbqoVv548RCSy6jF7
         SeGX1Vph+L9lvExInY3bfGKv02nEl+y2kwwDq8r7z6VcwJ0zSoY8mIAcBDI+uSvSdSmE
         Ih/1/ktoQBBGahMkMRmWPour8xhtrSrzzRsLfK6LbgV5Mdq42Fh6rmy6u06qhxcVkwkZ
         G8uRfK/uB4EHue7Yx6puVguWDq6pSmANZFF7Cs8IngXKlou7xWtBPkF+l+7Lf89ZC/Ve
         YzcViBKnj4sBBaRdsKnaAu76SP33W3itAMZtLBubdXCHgYu9u6D0R3Aa5xBnmyuwyaS0
         zDrA==
X-Gm-Message-State: AFq9FYL/na+yJnKHn1bQRr0MJQUvTSjrUapz0zPYcehYQStHwwcsirMe
	iP+HA7xHy39C8SjAJaapM5XH1zcOFg3/riGC0+Nh6XvGfEPNSDpJhygBao0UKWYQ
X-Gm-Gg: AYBFou2vj0GOb9igreK0W/BLaapastnpRKe3xWwyAZ3xAw5qna2zhfEM4JWURKKLhGV
	WPKLjoM061tQRGT9odwNGzIpd6DPQ05ip6L76CqTre1u9Nunh9AhJz1VjIcKeqf7fS1aDgSIhfr
	YiAvUJT+Ukkpr7fZlffeR7wFL7lstyDNBtCdQKzYfbYFw9KVsp5HR2uBDJaWHP4sc5r8Djb6Q2Z
	+B6C6PTHvBnW+xmEdzLeiXo6OcTwsBbCy7KAU5GIoZoyIdbXW+aVHI84a1EGrAq5pVrSfT678HK
	CLUE7d+0cS/JMXNc0Ko//XvRgllmcadfMZCmSczxslfF88Ce5Uk+SHzi9B/2Mf9IY/tQlDD2FD1
	k/erTRNCZfBBvUOeYe/BrVRlIODVRXBCMdZeJTPY0diEyv1Zq99Y4gToImgKhlC9T2crm/4+ZhP
	V5ZQjmvWFU1SNhrtpsWUXO+lET+6jC9NsFMvseoT2NLnfuCTKOIQHSG0xOjaYK1H9r6fgW4Crxz
	cR65urv/JvBgfDlmHktItGw4YdUVXL+LfK3Hk6EUJb0m2BdSIa4FqWqNEJty1WMWkFgff6lCOjU
	8Gjmwwb9aVSiRv1RIhCZ0fKOefFeGgvw8vheai//+4jG4A25wRcX
X-Received: by 2002:a17:903:2d1:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2ea9c9875edmr12317265ad.55.1792837529307;
        Sat, 24 Oct 2026 03:25:29 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm4293935ad.64.2026.10.24.03.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:25:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/7] rtorrent: upgrade 0.16.25 -> 0.16.26
Date: Sat, 24 Oct 2026 23:25:06 +1300
Message-ID: <20261024102507.2256303-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
References: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 10:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131398
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/rakshasa/rtorrent/releases/tag/v0.16.26

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../rtorrent/{rtorrent_0.16.25.bb => rtorrent_0.16.26.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.25.bb => rtorrent_0.16.26.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.25.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.26.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.25.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.26.bb
index 26cf52346c..99719f7527 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.25.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.26.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "15ccae27deb9aa1dc8e46ea0ed218a673ccc5732"
+SRCREV = "62899bd053c39b70380464e8f64dbcfce92579aa"
 
 inherit autotools pkgconfig
 
