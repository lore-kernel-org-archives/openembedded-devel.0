Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.10748.1593562071201439725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eCVgfthy;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id gc15so2465639pjb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rHRBHdgblqoYom6bx9Odzxr0iaSeX7cu90s8eqIhHqE=;
        b=eCVgfthyX4MmHHQu2jlMZnG47+y90Mttc5v4yZncm7gVzz+0C8fDfkPtVw/DQI3Vch
         LeLg6Zmttw7k8iih1SvK4T0qJdBOw/l1Y4zYWzY63LQ59UkzOJQ6AgKKlOUWwR1yMnb0
         HiA0flBYXCYweYIFfU179FaFhd/Qz+UKT6ED81+jpT5q7b+1F8EhhdQWRUSJPqyHToN9
         /HlsgGrHcTvTcNAYv0ydGhzUiVc7eF5ECoDEzEMh60zEnFSIPRMRPWa9Q82Qc1g7RgEA
         0J/vhnOS+L4Y96IqGL/EQLcAnh7SkA7Vmb1IabNdle+pQ/+59hAgz3RFzdjiJ6MT0JIb
         YF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rHRBHdgblqoYom6bx9Odzxr0iaSeX7cu90s8eqIhHqE=;
        b=r2x2jgK8gzNSB7aJnyh28jJm2IPiS8+Hyx60fHp4o/JWzJ87zgIKq8rCXpDm+4GYCF
         AVafMv1uY73tL9tX1htxSzSr3Yuq9/KO966z0HpXAuVSARKNFUvva6QTI6+k7sc/HTT1
         vCecQiCyNe7xKiT/9kB3uubV5185Lv1DqboQJI6z7i0JLVoTUOcqgOPKf8rvyvbvrONV
         T0roQ/YDVa8pLfN6hXrmNUo8jnVFGXh9V6eUp+oEPZyPvbtiZI0R5e1tNXp9LHg9J5ay
         xyQph7XEepCw8DDh5S5lQPX+bAWB6z5y54fL8uktrKSaT60sVmTzzSAL3eSnIG+fO+Hs
         UcpQ==
X-Gm-Message-State: AOAM533K9Nq36+Nnj9eTrNx4P3SdYmzMMOuFqTyeOGxrOyI5NlnXY2QX
	uqr37ACYesCPSHh7CnzmniI9Nz+nnTI=
X-Google-Smtp-Source: ABdhPJxkXptlmlvxYsa5liStws/4ANCGWPoPh8rLaHdEW7fdzzasKc72W76wta4BgrWVuX5PXu+6YQ==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr20437645plz.9.1593562070565;
        Tue, 30 Jun 2020 17:07:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:50 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 25/32] openipmi: upgrade 2.0.28 -> 2.0.29
Date: Tue, 30 Jun 2020 17:07:10 -0700
Message-Id: <f7023576ac8c18aebddee97c02c6f53006ca5652.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

???Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0b0c102d8c6daae12894f47f9523fe27fca5b15f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openipmi/{openipmi_2.0.28.bb => openipmi_2.0.29.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.28.bb => openipmi_2.0.29.bb} (96%)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.28.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
similarity index 96%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.28.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
index f196eb9927..85634a70eb 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.28.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
@@ -35,8 +35,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[md5sum] = "ba37f08e306062ec73c7ed2a2bd4d5f4"
-SRC_URI[sha256sum] = "8e8b1de2a9a041b419133ecb21f956e999841cf2e759e973eeba9a36f8b40996"
+SRC_URI[md5sum] = "46b452e95d69c92e4172b3673ed88d52"
+SRC_URI[sha256sum] = "2244124579afb14e569f34393e9ac61e658a28b6ffa8e5c0d2c1c12a8ce695cd"
 
 inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base
 
-- 
2.17.1

