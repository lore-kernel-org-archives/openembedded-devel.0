Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.26095.1606518649300918186
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 15:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=MvvY6DD5;
 spf=pass (domain: foundries.io, ip: 209.85.160.195, mailfrom: ricardo@foundries.io)
Received: by mail-qt1-f195.google.com with SMTP id 7so4286898qtp.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 15:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbMmnLWr7Gh+L7vB5eMqjuQAYC4gCUrNr4aHWkVu7aI=;
        b=MvvY6DD50OWzbg+qdhmHnR3+RYTf+uasBoUzPnkLGugksHxCELTylH9k9p3Zl0eusr
         lHSsVeY31cfWRRmLvAdjo3SN4q+PRb5QeUUrcVVYonVK/k/UJc+dwaBwoCljaQbOP2DK
         wsvTTRgIHkW0QGJ1beUmdy/7JL1m7WXPc0SgCzBZN4iKakb9z4HcF7qJ/D2StRm0ARqZ
         TWHsNI1hs0lAmD371kNrMFjumrvgL4+zkmzvRIo4wmN3hX4AeaGvIwYV7ypRcAap0y8t
         E18+wfLGA5YO4TM+9YQJHzob1w7HbDzy1cnYr6D1Il9MUuQccm/jwyt6kCJws7Kb2D5U
         gY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbMmnLWr7Gh+L7vB5eMqjuQAYC4gCUrNr4aHWkVu7aI=;
        b=R+DFUkQ1Pp4JTwaoihBrY15en5H0RxLj+010Ilv8Nn0bdplZJqN/Vvy6lJFAZrf7fc
         ZmWWsigtOlHVSt07ifHExz1Yt1u6aM/vJXMlBayE1FkzRRaiHC8mmglKur6wss2UhPKv
         XL2ExbjqDsUMc9uoH+Plwk8No7c94YtxDVJ/7bAbUshHny3ifbbkSu82drVz7RWnubMN
         gryKNts8aC4nr7MM7rwjme3RHGBGxSjbKEhpIpZHLjn5ylWkv4VD9K5pMoxWsMXdQJNk
         5iGEPcLYc+UzJZ4Hx68OGROHcbwz+m8zAJn7KnDqxmLTQsEPVheVPv1n5V9X4coagqbK
         OIqw==
X-Gm-Message-State: AOAM533WvZFkOjur3g8fWFOZ/PCxd259aUGfLNhKKTVk9alt75yd/Y18
	yFKZhIxdMH89wCimOBEKjKNhq+2N/V/s
X-Google-Smtp-Source: ABdhPJyJleWD0BR/YlwbwTbVPC21cNiV5yg56EfSkS9hIO8HKKLKqOQP8VRgvAwpIUpbP/DRFYsKVg==
X-Received: by 2002:ac8:6608:: with SMTP id c8mr10133258qtp.203.1606518647873;
        Fri, 27 Nov 2020 15:10:47 -0800 (PST)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:768e:88c1:b38e:ae63:9ed3])
        by smtp.gmail.com with ESMTPSA id 5sm8041174qtp.55.2020.11.27.15.10.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 15:10:47 -0800 (PST)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] wireguard-module: upgrade 1.0.20200908 -> 1.0.20201112
Date: Fri, 27 Nov 2020 20:10:31 -0300
Message-Id: <20201127231031.8899-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Relevant changes:
- fe40226 version: bump
- d0bf51b qemu: bump default testing version
- ce8faa3 compat: SYM_FUNC_{START,END} were backported to 5.4
- da5646f qemu: drop build support for rhel 8.2
- 99e954f netns: check that route_me_harder packets use the right sk
- 25320ac noise: take lock when removing handshake entry from table

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 ...-module_1.0.20200908.bb => wireguard-module_1.0.20201112.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20200908.bb => wireguard-module_1.0.20201112.bb} (96%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
similarity index 96%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
index 4e3f3deca..c540445d7 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20201112.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "d97b575a47fb26f27965bdc9e537c85f86165e42"
+SRCREV = "fe402261666821514377d06c2c68ed9bc19e7634"
 
 SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat"
 
-- 
2.29.2

