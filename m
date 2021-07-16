Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.94.1626452562708558193
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 09:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i0UxCxoP;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id my10so6658625pjb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a2CfReBW+nxMRnS2B8r4t9IWswbf5Cb9qvH+ON+toPs=;
        b=i0UxCxoP3nJ5MHtoG8iHsNcsDY/WessEXw8DU6lvoPdZRL7ebsXx76NgClb/fS/6zg
         TOmxW2vt18LzNvGyEIQVH6ON5djFjktpSWrINiaSwAZ1LdsWWfmar9Y7fGwvRw32ndp4
         jAoUl2NPjtUd0oHx4qlrAZlQ+LmK+7d/BPXQ5ic4Ru2YftytrE5mqrZBV7TKkhVm8v3T
         yLDO4wMFON2FrXCEyeG31/91aUHIE+ynR0ylgx6toXWyu0EeC0ZOwKL1haR3w4ojTPCw
         Fn4M3X2yoGZGdSxcqmD0e2BBC7CVw3StbK0FFCwZBfenD5U5qU32Ek5k4aQuM02FPY5J
         c1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a2CfReBW+nxMRnS2B8r4t9IWswbf5Cb9qvH+ON+toPs=;
        b=YjibssR9QJathHAUdZ5/AFGXtyNnCz5Qqol/sqnFKCdpCzwAcTOaA1RMORl3CYmKwv
         STpaN7GfPZ+IRAQcBuWFIfZ07YqOZvgRsfPcPfaw9JZFwemBn5GVryGEIEPyxNsjq8At
         ouWTHAqqh6sHdm+7olwmot1Yjz/whQ+zwsjSgrpHNTKbwL+nZYgWmmxdyGnFgq91Oych
         D9JheAEjro5117ClWT66CFPiEqZVdZvukbc0ir6/GaT+yTooILVKEdbk18lNmXY3Jodb
         msJkUR2PmwSdy/YCqLF06OcH5cRNmEZw+6Nxpwc138KvQzLSJSBc+M07w7FulbHhlPlD
         HmWQ==
X-Gm-Message-State: AOAM533Zn+1tZNe9h9L1aAafkF+J4y8t/sbjbQwVvfoxv78svEc94gN2
	UOnp6yuhelRzghgbEKwL/4tIufzrnLEc7Q==
X-Google-Smtp-Source: ABdhPJxWYFTq5NdUYZ2G0nXiMWyB5vCepGKxJp8N0oJW9SSsQEnWBVkWgu0RowmvbOU+b7fVFUs9hw==
X-Received: by 2002:a17:902:e00e:b029:ef:5f1c:18a8 with SMTP id o14-20020a170902e00eb02900ef5f1c18a8mr8571906plo.38.1626452561994;
        Fri, 16 Jul 2021 09:22:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id f31sm11715868pgm.1.2021.07.16.09.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 09:22:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] can-isotp: Ignore in world builds
Date: Fri, 16 Jul 2021 09:22:37 -0700
Message-Id: <20210716162238.2650157-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This now included in kernels 5.10+ so on master and linux-yocto we
really do not need this recipe, but there still might be older kernels
interfaced with meta-oe master, so they can still use it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index 72d6757804..0278b53380 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -15,3 +15,5 @@ EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
 do_install_append() {
     install -Dm 644 ${S}/include/uapi/linux/can/isotp.h ${D}${includedir}/linux/can/isotp.h
 }
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.32.0

