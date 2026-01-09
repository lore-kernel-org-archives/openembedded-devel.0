Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E376D277C8
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 23:44:06 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1254.1768002244434192245
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 15:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FBmOZtfx;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a09757004cso44819525ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 15:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768002244; x=1768607044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/flga7FA9Zzr+VijDHRTA3xuhioIwF32T2sUAKwzCbY=;
        b=FBmOZtfxIwQZ5/SJ9x1oLcecqSyELtL/DvOTj9zwwJZBSTBD2P8THp++4sKEgWrkZC
         po6/N5NY+VFDOlrsb0VdRoRAlKnIOqgyTqtM6Ye2gPQcmcdetWJ+TO6Ubd25tu4VoJce
         WMtUzuhDUe3OS6vg3OVdAGIu87r639r/6L2wFgbu/iEwGmvTldWviapXMLRNKEVaj2PW
         2qTea1cqv9xwmYV+/RPhDGPsP+toSR4mShtrm7DADURJS46/bvXvM/YtmS1CwObZ4L4R
         h0HH4i96brSmL1gSJns23VpZ4sjjjPIyH6BqMnTIGoMhv6VOy/hFfVaGEZCV0karZz7K
         s3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768002244; x=1768607044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/flga7FA9Zzr+VijDHRTA3xuhioIwF32T2sUAKwzCbY=;
        b=DqSseghSF3MrC7ZuBCY7iD3GC9T5LQdFt2PLcK5kBAhtfR3LJYyPhD+E4SzLwLcylV
         sXj8Ly9b5fY5cL4L58laDl5RrlSkIQlbYYAHu7ILvrHsUmD5+Y26vuGgqPXH8JVHy1Y6
         zNALqI/b0YqpLVoHwCqRI9d8XK5OxDblvBAG0b5KiFo+pdNvegm/t4Dni/e4kx6sQshk
         Kcn/6qO61aA0QvIn3bmx/PsPmczfJ5EoMwrbapVp8K2Dh2uF0/ahwOxZQVz9xHh72p/Y
         NyI7UMN5lN9NA/wgbaL+iGsfveAi0R4m6rii2eRsRqrmkx6gGPxkxxFCEpDZDBBAbYUL
         zv/A==
X-Gm-Message-State: AOJu0Ywz516Qno4LuLCXA6BQ52Jmt5BOI4w4Czj593PbepqMORnxe4Rp
	GIeOpPNdHxVq4HuoHb7EblP2pvafukZnCBolKM8rciW1XvZFR7fHWKW4r/YEZg==
X-Gm-Gg: AY/fxX4RU72zv3XLOWm4bD9G48XKleSZxp9uNJ2yKsLkrz2xlnq/8Jlk0/bygJ9kNbY
	+mfSwaluwXLqx8jr710qP+YFhhNJPfO1hJhDSw2tPoXuTIswMShBoCutEMFo3e32brtEtEmhx9i
	IIXj+4nKxqP0mwQ0NeGFaLMfjMwYYYertGQRHvMTZBEdcXWXLJ18QzUNn+PMKWVbbYji6Mny1A3
	h01VZeo28ullJIAxEnBJKul9z2kIKzcNyRi3XU9HgDiMASuWFLEjmvlFZhON/TX8bocmCFsnjJh
	yJbnniMlnxO1Q21iQOipypJagG/hYfaT/sAfX0LZs9s8DWob1msACXR1geIVkcClrLAYFxN6rLZ
	fTTaNN22g9u32SNAJ2PxV3HUKFWVOiLMyqBr+X7nwMCBG1D6qovPNYIuEwBHyh4NxxBtmMtEn6w
	k1f5jcqil0siCBDkPqGCyGU9xsg3ELmJgCAg==
X-Google-Smtp-Source: AGHT+IG9CZOv1s/FQbCNe3kGtAnTlSvmr2WkvLXf1ZqsXQC7Jiwtk9YkRyY08Sk4Tel8aZwKMQEoEg==
X-Received: by 2002:a17:902:d50d:b0:2a0:bea0:8207 with SMTP id d9443c01a7336-2a3ee49e052mr112541145ad.49.1768002243543;
        Fri, 09 Jan 2026 15:44:03 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a31dsm113934675ad.9.2026.01.09.15.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 15:44:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH 3/5] sox: extend CVE_PRODUCT
Date: Sat, 10 Jan 2026 12:43:44 +1300
Message-ID: <20260109234346.3098858-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109234346.3098858-1-ankur.tyagi85@gmail.com>
References: <20260109234346.3098858-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 23:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123315

From: Peter Marko <peter.marko@siemens.com>

Add all relevant items from queries:
$ sqlite3 nvdcve_2-2.db
sqlite> select vendor, product, count(*) from products where product like '%sox%' group by vendor, product;
commugen|sox_365|1
libsox_project|libsox|1
sox|sox|3
sox_project|sox|10
sqlite> select vendor, product, count(*) from products where product like '%sound_exchange%' group by vendor, product;
sound_exchange_project|sound_exchange|16

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a68c3df41cd7049f5b156955d70cb4f76b6d9f76)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 011cbc2a9d..a79fb15d39 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -34,6 +34,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"
 
+CVE_PRODUCT:append = " libsox_project:libsox sound_exchange_project:sound_exchange"
+
 inherit autotools pkgconfig
 
 # Enable largefile support

