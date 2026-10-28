Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4948.1793215564421775746
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 12:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nkent-net.20260707.gappssmtp.com header.s=20260707 header.b=MyoMoywA;
 spf=none, err=SPF record not found (domain: nkent.net, ip: 209.85.128.44, mailfrom: nate@nkent.net)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10455925e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 12:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nkent-net.20260707.gappssmtp.com; s=20260707; t=1793215562; x=1793820362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGlIb0zllBQiyUAa9nk92pHXyZ/VOzigSYMBCA3z7Ik=;
        b=MyoMoywAJoXGLT3M5kahjNZxVJcrfnu+ridja0+alFrqoMbltxslKmkIcL/Q5IX6yR
         8SkQgBNgkSvS8Fh2GUzuc85uyahxMcAvCyn964lWtnLonp9YFpThItjp1hIeudF/8NIQ
         pKzzPtxU6EOiP6mXFFNLSp9LK9hBeQef9kFWzaFZKRm5zOfSigEkWTzcTVwwUWpNqpYK
         uMaT6nbf+B3lAQk13zx0Bv/NFZ0U0anlCFkHxs+EPvheYovgwPcZ17UrFpUCxaiV6yQS
         zeIh7yhui2fLjtgg7NfX1cm9IBJpZCex8/csRE60f6l1A/il7nXWgw/sE/qE80oLkSvJ
         G4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215562; x=1793820362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGlIb0zllBQiyUAa9nk92pHXyZ/VOzigSYMBCA3z7Ik=;
        b=e7UK0KZshR4TOWbUCAIUluxgj4Wz/CJBBBozCJjlrCm11Hj+3gSODgZsd1RlfpWN2D
         U9HQ0Xrg1YXht12lJdVf3e9+AvzP3Ib0bPQQN/se9qq6CYTw0AeW6W5Y2Ags6M3ssYdR
         8jxlVhBcL0LYpvxITaHC+NSl0T1Jafq0V+7UOjiOx8zpD2hj+E7BWMl6r6WOD491iS+C
         q5NlE/g7kHqYIum01snoLIaXMTCMMXr1sOG/LMTh7fwZ5Mr0HaM0uxtTtfDiSgOwJwns
         IqPMy+Kg4/m1KWCa1vu4UEmbT9U7qZmbw6zhSnLZzZmgrMRsbfix5wf2BYOXRzSN74h5
         ZG/A==
X-Gm-Message-State: AFq9FYJNhDeaKjanCqBuFbG3ZNne0fnsw9w8r5O87qRz1dZ9ZxTWg5de
	QcT1DproJWMi6sYlryfxcyAyv9lVIoczpeu2XmaR9GWFsf4vqASGiO6DUXXggremcD8sP3Im3t1
	yVJ7cB7Ljfg==
X-Gm-Gg: AYBFou3GpvkfqucR+/8nDVqlYvqgn8VuxEVq9zWiRAE7qPZiUcGjxbvXbRN5in93XSm
	hYK3Hz6TrNpgYoe07+oKL58CUOzVdyRd5AYsqYIXcTck4b4EiOgj5K2jEcJ4WJI3sHP/1hqRYkZ
	xUCsAuOBz+t2dXE8KG2saQFVRzIGBWSD3bjceNYJS/XMwqM7Zvx1dbQMeGX7VEpScW0kEAMRIgh
	n+oPRIF5AWuATJEtA1VAS1fEKJemOkoOnrUEpu5sP0jPtJyVtJTjspV8r4178nPq+/18c+hD4cP
	TeRhRZedWClyEzlCqJOplhh9hYceSDz+zmwCBfX5Q1QWcfiwoML/J0dMlaaypAJTUH+oyVnPzv7
	evNgiKxGMSJm06VyBVaUiv4n4kBfMFAqENhk9Nbsdu6YCXD2R3ZTg6eTWz+8ByjWn58tthz/oD6
	Qkvnbljc6FoQtZqHE0/AW6E/1x6Ppngw281Q/fTWHqa/Y8cWet20R0id1h38nsuItM6JgaOqq27
	U7qvPncbW9RUOOeuz7GVPy3mNeO3fxXF0EhCiDU73mY1BoiA4sHMzC5BIuDwPDRxBSav/Zgbcei
	HrUvwCoqZWeXryEeYZNAMDVk9OZsbo3xMW3yLK5fhe6ZhWC4UgBNIQ5R165pogWrZllQ+iQMsoI
	ZHxurrhLOcVFyLh3A8fWyyxNdWYtl1mUAWmO01gxDhmGmtSI97z1ZsWZ8q5pmbLG6wA==
X-Received: by 2002:a05:600c:4e90:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4a966a551bcmr67988735e9.13.1793215562491;
        Wed, 28 Oct 2026 12:26:02 -0700 (PDT)
Return-Path: <nate@nkent.net>
Received: from akatosh.telenet.be (2a02-1811-e507-d800-9ae4-d494-8afd-3e84.ip6.access.telenet.be. [2a02:1811:e507:d800:9ae4:d494:8afd:3e84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm30354403f8f.52.2026.10.28.12.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:26:01 -0700 (PDT)
From: Nate Kent <nate@nkent.net>
To: openembedded-devel@lists.openembedded.org
Cc: Nate Kent <nate@nkent.net>
Subject: [meta-networking][blacksail][PATCH] nng: correct upstream branch name
Date: Wed, 28 Oct 2026 20:25:12 +0100
Message-ID: <20261028192512.3603815-1-nate@nkent.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 20:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131629
Content-Type: text/plain; charset="utf-8"

Upstream changed the branch names between the v1.12.3 release and the
v2.0.0 release, which means the old branch is no longer valid and
fetches using it will fail.

Signed-off-by: Nate Kent <nate@nkent.net>
---
 meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
index 7f8a3986f2..f10cf51c57 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
@@ -5,7 +5,7 @@ SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SRC_URI = "git://github.com/nanomsg/nng.git;branch=stable;protocol=https \
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=nng1;protocol=https \
            file://run-ptest \
           "
 
-- 
2.55.0

