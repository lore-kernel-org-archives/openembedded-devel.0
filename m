Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3637.1792837519712326017
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2026 03:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Iu/JqawM;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e946155442so13648785ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 03:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792837519; x=1793442319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MvTeX7SQgdnQ6zfFtjLnEnsIZTqAF98a6e5JYYK2eU=;
        b=Iu/JqawMldq5esgPTDvpPEAa71B+Yg8Chn8R3mdsql+JYSw6c9q0A77WYMf9rwa2SR
         ZV5DaW5uOJfH/Gfa5+hlSYuQzVdvmkINBy6GfLx0huyVQPzz6M2xnuB6ybtRQ9pWgJIg
         cnNPrisPLJB4K59ZmOarePWl6T78SI3EkuEEp3maLclW8eeFk0DG18vwDmkyN6GfJZT1
         wRzG/AtXjKoyv0kG8qUgZqR8maX+E1azfd4TtiaAE8TDiF+3UcXFn4D1EYBxXBeew/gK
         KUjwEmFgCtQyfjBPFLAVs9wl0Sfev7KqgLu2TGCY1yVRIAHIZzex8HOQe3fdPa+TOJ7I
         WTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837519; x=1793442319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2MvTeX7SQgdnQ6zfFtjLnEnsIZTqAF98a6e5JYYK2eU=;
        b=Hf6uJ6qmjq+OjlDfmadykAiNn+/zV9Zd0npC6xxxsZ8PLExZ7DlRr3sMb7OvuvMGVI
         yOdEFXmx8SPFGpzyK1R9Ux6ll15gl9Mdl9g6Lkl9fAWGa3y8nQTz4eiJkkFYsq5J7eas
         b/a4sLYXo0xzkq/v0+ysVr0n6gvMLZpv4+0Ddu4AEtdrJ2c2hSYZQI7zplyvHxjVWO9S
         S2HVyoU/s5t24O9bsrKZ9NBegAhd3FSlatXjfr3SkWzL4I1Ptt52uGVk82K83S6fVgEe
         8V+gv/s35VAFOJeW3fuV5/04+kAD59MoZdnO7Tjy1XmdMoYcd/309R3JWirjvI0C3apz
         8aUA==
X-Gm-Message-State: AFq9FYL0uUN5gzxNMzCkYY1C8Q9tvpzHVy/KdQ8inuZA/5g2Wt3w5LNN
	P+2au5jvdHsDHCd94DiF3y/uY3gY8FfhXAD4eERRWa0JjMBInjUujGv99erCxMun
X-Gm-Gg: AYBFou2ItMDJpqP2hIE8kT1o5bqBWR0EjX2uiTUJxodP8Fj34hGoae7ZfhM8Vn7nO4t
	OhqTVlnOL/u2pNY4Rn+zFaV1IWY0dr7FWFQmwHQzFmWmoNic8Bq/J0E7xc7RCVkHNzAyydzku8z
	HyhonR4hmGEIXpKgh68ZRpLGmT9r1CN85FhoCeTDscuwhdEvYHVjpaWAFNZiviCQJcCyk5n7kyS
	YXIuDuEHbShzrz46t0sNDkreT6S94xqO/kHKjdIIMR4sqOGX7w6nj43K9v3huIeZlWEbaJkat18
	ceTksdbL59rzRpWM19JCw2SWho3S8VNdXdJS5SIAhCkXv8LSwyirmACXZbRi8riGtWuCdCE2ILZ
	w/ptCUu7fd5pV1qXF5hZIM1HpMJe7xxNtvKKkOmSONKZ9ly+8lb3J/ufnZnKnALPigPCc8vSCAW
	GvFEs6xl6jtChunWUjXNEkwt4L4JJhpFpf7irfgo+lhYnkrUw1Qy0aGeTlu0YZ2+MB0qeJRmm0U
	tpp8Qjjc5obIXDELn5OKB/6JToDzwXfahZNo4NYutwQHiOzcaBOEbeOSHlZGORCEs9bs81hZwxP
	timqqzMkr9/TbCI/juzpCkua/DU4yjEWCnMm7r2w6uxB7Cj57m2y
X-Received: by 2002:a17:903:19ce:b0:2e8:b5b2:a9f9 with SMTP id d9443c01a7336-2ea9c7ce0ffmr13407295ad.37.1792837519051;
        Sat, 24 Oct 2026 03:25:19 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm4293935ad.64.2026.10.24.03.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:25:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/7] libtorrent: upgrade 0.16.25 -> 0.16.26
Date: Sat, 24 Oct 2026 23:25:02 +1300
Message-ID: <20261024102507.2256303-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
References: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 10:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131394
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libtorrent/{libtorrent_0.16.25.bb => libtorrent_0.16.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.25.bb => libtorrent_0.16.26.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.25.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.26.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.25.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.26.bb
index 5b7133e645..9d0fbdfaf0 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.25.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.26.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "6ad3fecf3e7e7aa86855445587b532a91256f344"
+SRCREV = "21daa3b96a3b8cfe14961545b5115de7ed12da95"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
