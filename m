Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACCDF4368A
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 10:11:48 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41427.1776420699942898449
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 03:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gPp0z+sD;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: mail2szahir@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f943870baso15936b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776420699; x=1777025499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Azp9MUIQFEUN04Lfe5V5YQXzzI83MGY+rec3fF6Pi3I=;
        b=gPp0z+sDOXOmoLuX4TUmO6cxQXhQYpo7gmy6PQlgDdYuFJjHQ+L1Oo1iBtNFc4s7OM
         j0OYO6CahuKcwxAG3oLdh3ZBiGlRL+AIflHIRjy5OWrm2r++MHqbXRJO5wmUdTbFdIq3
         hVUP8RlP/CGZaCmqK4VE/0le65vgRJ7KNSDW3hRfOSfd1U/8nlaYXBjCr556nVO+KVA2
         aQ+kx974AZUwZe6AiWr9v0jskeRh+cp7u0QjMb9wzWPGdNc4cvyZDq91HmUQKrsiDPBd
         dosraeqhV3NaBTHMFpR7I2xUwrR+Q/58WV/COQF1L/nSvqfxesx1+1guqLIaPFAKNbKn
         1ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776420699; x=1777025499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Azp9MUIQFEUN04Lfe5V5YQXzzI83MGY+rec3fF6Pi3I=;
        b=UYbhXUJFcDVeWlplNmOLjr33po+F4iybuQrwc/n8Dx9lGw/cEFuC2TuUnQVtU1OHrl
         /WtCzNs5rsQGzBsYWOCKR0v4RD1KBcZ1q5UyKHa/eVf2FW3xUMfSprF+eFSLBIrQ/AAt
         BNe+Ie3m3K4R8tmaYsjIiQ0z7ZPfKF0tYo9K39vmsVuWtocNDhetwPslezJwldfAe74K
         iTvPBVFsDTo//TMdb1hS3biehQoPXZ0EeGqCMZ9eLUDU768ki+HCjPFhOluKnmxKK6ST
         R98y2OIq9wCtTuCECz1/w7L+IFjNdQJMO7RrVo1ynRRan/aaaTOMUE8MZy7zW22XZ25w
         feGA==
X-Gm-Message-State: AOJu0YyND23HrZSihtmcOvGLb0d+Z7lbbEODWWgDHzMD6dK6Jen3O9zt
	kHAIhdBjw3XnZSmxV88BKwo/dxRgiTn8QCbAxlsojdMvXjwfrUpzf8RyGjbuaw==
X-Gm-Gg: AeBDieu7jqHKJuZOpyn8H2ffiZt3n/3Acu3KkhpHGVw+B2JQAbVW5BKEIRe+2Lx+r7I
	VhWnzQ9zYnsyDlf0xGtVuodd2KazdhLiKtFJp3lwo6lpRIFWw0CzIIXBrc8HAIU3rnvYGGEvkbG
	nxyK9aZWec1waR6qwOcQb3VM/8P73/4Qfa1VL8gYePqtpRU7WpUPL/H5vZVEti6VwvO35Ju4np5
	plpwGImn/keII0rMIg/9jGsm94INSAoOFC0APKtBWLt9S0l+YWeo+q1QIcbYgHzRtFihW35/RGh
	7n5tFbcgCeN7ru/aSYy4Gbtqd2CUmEuxVLfjT+ZWgOEK6BgWBbhBv9VBJfnBTkLRd+8FJ/lvfqT
	snUGznDa6ny6o37CBaGeMhTp1GPs3QVi0HaP6bw4OZJTiiEZy6w5/1LD+4PBSr9Jh2JUN6wTpw1
	LNHBqNkta/RCCUO90bs02hjc+I+he23k8wkx4B0S5zhAvXRhgR2pdMN//cqRI6bvAUk8g=
X-Received: by 2002:a05:6a00:6de7:b0:82f:776f:a78d with SMTP id d2e1a72fcca58-82f8c888e09mr2299777b3a.19.1776420698944;
        Fri, 17 Apr 2026 03:11:38 -0700 (PDT)
Received: from L-17367L.kpit.com ([49.47.218.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3f31sm1870222b3a.37.2026.04.17.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:11:38 -0700 (PDT)
From: Zahir Hussain <mail2szahir@gmail.com>
X-Google-Original-From: Zahir Hussain <zahir.basha@partner.bmwgroup.com>
To: openembedded-devel@lists.openembedded.org,
	zahir.basha@kpit.com
Cc: mail2szahir@gmail.com
Subject: [meta-oe][kirkstone][PATCH] rocksdb: fix typo in PACKAGECONFIG
Date: Fri, 17 Apr 2026 15:40:33 +0530
Message-Id: <20260417101033.23598-1-zahir.basha@partner.bmwgroup.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 10:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126431

From: Zahir Hussain <zahir.basha@kpit.com>

Corrected 'gflagsi' to 'gflags' to ensure proper dependency
resolution during the build process.

Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index 7bfe157c1f..fd20230b3e 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -31,7 +31,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake ptest
 
-PACKAGECONFIG ??= "bzip2 zlib lz4 gflagsi rocksdb_static"
+PACKAGECONFIG ??= "bzip2 zlib lz4 gflags rocksdb_static"
 PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
 PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
 PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
-- 
2.34.1


