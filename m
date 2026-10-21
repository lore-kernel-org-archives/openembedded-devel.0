Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8873.1792580508630907631
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nBc7erAB;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c414e5d282eso63126166b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580507; x=1793185307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKb6e92SsTZELp85utcqGuObJiq+t0uHp3tClTzb1YQ=;
        b=nBc7erABeL74+GfT0zv5d2DRgXdXJ0rJinrhG00Qfny1TvWghVz3Z086E9GREh1Sdc
         73iw2JDTo5gZLOjCGps0JkZUKam1p1wYPe2c4kToEGvujV85dcjV2Msg7wR8fsqGrdbR
         dwSF9FVnBEdEDB82rm0c9RXx6chytw8LYWRUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580507; x=1793185307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKb6e92SsTZELp85utcqGuObJiq+t0uHp3tClTzb1YQ=;
        b=hJVJAWR4U79Et3Qc/5lgf9FLnqmupsrz5l+NpmGHz57eoBNNdyBAGOUYu/rDSL0gbK
         guxbQupueFpG5yh6YqtquCIG6By+QlyoB35li2epSIanaAO2vR8pOPQ7ORCggukgG11B
         dLaXPLVWkERMcrHdEiu8A1dQEUV2dgqahctbFzmrGdGWao38xKZBmIkFZZbVYZdqz4Kt
         cZBwIBCdjKBbgmC6oRScV4/8xKXwt0y+FTpb773Wjz/Uji0/Ej3ZZogj2ZstElQDBh1e
         N4Ei9sQOV73NmRdoiL5dGqSxbtatVHlWJjzH6Ul1mLNDDT6YJ8CxLuuURrx0PR+UPos3
         XAfA==
X-Gm-Message-State: AFq9FYLcdL8RdafRwkqIFX6YmCKrzlAmKdNjUDuz+ZOJ6QxkSFM5EJTs
	tCWtRjdNyGlBCLhMsSiRwR2B3eMd2IpPCry8H0MeFWN+TWualsCZIkMuScDyC+ImKSc4RhDRT+S
	VBHZ+
X-Gm-Gg: AYBFou3avrB79oitPxSpXmmisjjZpX7ua+ZZuOWZFO9WwujFfXpdxDYO5TFsilG7Vkh
	rsElz0031qLiy3JMsnHqZmpH08PobPNit166tMfSUysRCI/kIaxNQ7RfJPFrXbT67HyprE9UP57
	802MtKL/oTwAbxHgMcZQ03GAKuyogyT37D9rUJlKct5geT6gzMPXaTEfpnSq/kqig5aCjXyBNJO
	lTR+NLFJjNmdMnsIVELB82GDWW+hLhz/Q4IAvIHx63qmOogj/5PrRvCF+7hnhoqWF4Tf5SyfSjz
	gJ23MmGShf9UWL+1pRFTajOPCfGQgQnYda++OsAtVNHoOS3FqxRV65chGzqJVk7vH0omaywiZ48
	MtImJBuuROMpFw4+7jvBqQrkmuIUrn105NwqcSCaC9eppcmzymbrV+26BeCWNUk2cCnBi3qk1an
	x8+f9uMJ11VbIeJmr62xY46sP4e1TcoQPHbUXUZJiSY2VmAeh011POeIeDdIV7SXvicgyZVE6rj
	FYQFjbIi+NpaXcTa8OoYBK3iAL2zYaGY091VgfDYstXuQVL68O9YJK4MrGGWToXf45rmCWzmJ8N
	nBOCbLyWNOlu2jypJtIwbUUiLdJjXwgRuM1AIbx7+RpcExYs/BXwe5cgkOwqsE6mA3N4lYgT7Yp
	yulGz
X-Received: by 2002:a17:907:7207:b0:c3f:153a:8663 with SMTP id a640c23a62f3a-c4679661066mr144055866b.23.1792580505157;
        Wed, 21 Oct 2026 04:01:45 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:44 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 20/36] python3-inline-snapshot: Upgrade 0.35.4 -> 0.36.1
Date: Wed, 21 Oct 2026 14:00:44 +0300
Message-ID: <20261021110103.1943456-20-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131279
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.36.1:

- Defer generating source representations until they are needed,
  improving performance when comparing matching snapshots with
  updates disabled.
- Speed up snapshot conversion for literal constants, especially in
  large lists and dictionaries.
- Built-in literal values are always managed; attempting to
  register their types as unmanaged raises TypeError.
- Scope unmanaged type registrations to the current snapshot
  context, inheriting registrations from the parent context.
- Speed up snapshot comparisons by avoiding unnecessary deep copies
  of immutable built-in values.
- Speed up snapshot conversion by reading AST constant values
  directly instead of compiling and evaluating them.
- Respect show-updates in the short report, hiding snapshot
  representation change messages when it is disabled.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ine-snapshot_0.35.4.bb => python3-inline-snapshot_0.36.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.35.4.bb => python3-inline-snapshot_0.36.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.4.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.4.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.1.bb
index 773a945b11..5d25934fa1 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.4.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.36.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "82432a58b7ea77a172515f5024cd26fdea8dc0f873c7a4251e4e0471a914db14"
+SRC_URI[sha256sum] = "ff57828c691eaafe03426de25f2c21a1e382905dcbe110934df862297e8c5f8a"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

