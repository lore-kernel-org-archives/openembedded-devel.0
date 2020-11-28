Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web08.29601.1606544900733931631
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 22:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WpRqZp4b;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id j19so5956190pgg.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 22:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ExSi05l/16BeZtAAcSPUA5dL4TJpw5v/RSR5aZc3e4=;
        b=WpRqZp4bAiF//lSd5VqXogT0BsNZ4H7kanRktxm9BplarB5hTiKDnNY6sQqNISRyO5
         Z7I/fmyNUmiEUFwVzgkxOdqxmphD/YZQA8jO6fxF++9YPlpZL/TNpy83svumzsUbQeGP
         Wp47xqvoN7fhqI/NO6OC/WqfqdiUSv0FORzZGHMKeHtjJ9BhWK0FyFmAO31UEl3Mky8d
         BqA6kk1qdZ/rdkKqyblHX1SaBXyEe2XfuD8en1rijvJHkNi4Vy4eWBrAVmucNcCdCiSQ
         YkyKPncdiIQTIYVD7PvTOwOXa6UU1uvszhwqY5FuWmG7AS1BAlvlsnDeT+Rt4oc0w7jo
         u3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ExSi05l/16BeZtAAcSPUA5dL4TJpw5v/RSR5aZc3e4=;
        b=uKMUrW5fRNc9lbwbLyPN2pTu1uq9GaP4xSKnJN7MjLER91GK1nj3/7ncO72EVIFBx3
         evCbcIrZkWf455YraWWgMsQ8XR5OVxx5zivVpRRvCZ8xEqdVVRjSnOCBaV7JTqmFpauN
         V0oStjhNha1/FHkIAAH52VaFxeMpFNp7FTGh5fJPHpXz9UcaKAWMRsUzw/PbiYTNI7yM
         u5J3yQG4PWXW5MyNqgkXJylI0V8/238OEX+ewO+qhAbZwkIJhisSi/D624C8ymAacuBI
         dpOBcU/8lioRUTJM0PBlqHQjbjEWZH/llyz+XL5u+19UhRS2+LkL1RgrpPNnt1JIsDNy
         AoYQ==
X-Gm-Message-State: AOAM530riQDsl3FHx/yV7fP+aa8NTptnfU7bvsmDKqXgQW5O2MMAz30q
	bil3klkOclZWcMOJhImeGSyTnSdpTRd6qw==
X-Google-Smtp-Source: ABdhPJwv5j7RO8iUuTUya7+w5DExsQgL2zocW1redHA0FQlb95P3aT8sBd25+1Lwxbe5A+kWY3vowA==
X-Received: by 2002:a17:90a:1157:: with SMTP id d23mr14117765pje.1.1606544899842;
        Fri, 27 Nov 2020 22:28:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49d7])
        by smtp.gmail.com with ESMTPSA id er23sm3521911pjb.12.2020.11.27.22.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 22:28:19 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pipewire: Link with libatomic for riscv32
Date: Fri, 27 Nov 2020 22:28:17 -0800
Message-Id: <20201128062817.2036002-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/pipewire/pipewire_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
index 1a415c13c3..173b695e1f 100644
--- a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
+++ b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
@@ -33,6 +33,7 @@ PACKAGECONFIG[vulkan] = "-Dvulkan=true,-Dvulkan=false,vulkan-loader"
 
 LDFLAGS_append_mipsarch = " -latomic"
 LDFLAGS_append_x86 = " -latomic"
+LDFLAGS_append_riscv32 = " -latomic"
 
 PACKAGES =+ "\
     ${PN}-spa-plugins \
-- 
2.29.2

