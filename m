Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.5473.1596028181950558268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 06:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=1ZMaFp/2;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id t23so1442640ljc.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OUTRuRLAaPK87bhfkCl4KpqT5731L01Sq4G8AZdxezM=;
        b=1ZMaFp/2IPlLjlfreUsIncdL14ydg7I8tg+Vivfl2wN1jc/p28p6stJTFzYmIJjmwb
         pJZeZcu94lSABAbZieLTFP1IenPgCVjl2whstOb8fS3+C20pUz0P/7XE24iWxPdZF25K
         rt24Wa9C0Zv58XGZLWUX8Nb/PMWJjt/nzEsn4WULc6vBow8fUGIhlrxVWzOeUX64tiDp
         qGKVWeeFYnY7olOJm+jlbaX33hWn37TqowH1nCsQhZBcwiv9FUTt3OdFunkNdWQQIamg
         AAj4it1AJsHNRGuvsKpTJVPLrWiIV1kEQU4DuV4F9ccGEozuQgnVpXif4pSRSj07kS/b
         K8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OUTRuRLAaPK87bhfkCl4KpqT5731L01Sq4G8AZdxezM=;
        b=dUIP9xetiKAIY1nJWe/TnEM+5XWkYD2Tf6XkJZGZxvMHTEGaGuBFzFyqjQSYNsfuFr
         lkj0qXR2OEBzKzXMKuiL19k2bpAl0QlQiBcBveZ1kkcIDNLWPqPFcAuhHkoIS3+lvvRf
         HKSikPX2kvA+Ug6U/ECERHJzhUTL68UgEZ60wHtuVFWi+GFS0da/wmcvI823gpWklRf3
         uLwj4dFAUHSeGRc8tHjtlGzvGiaZ9m/qx0Jx63X6nh/MQRezrfLLzxK9iRe8a09RTo3d
         dI/8RD1N++spSgA22xzwOt59FIAKpHwAh5Ky3w4ckpk+oq1im08Jb4b7wKIH7OhTnOtB
         cHTQ==
X-Gm-Message-State: AOAM530UWfn3tThfCJtzTM0Akm6Ka+YgTP1b+BLF7L+8+vGbzAX592ct
	rGjX+YyaALVOcTaxz87Y2R9pZIO+2oo=
X-Google-Smtp-Source: ABdhPJzY1AS2DPrJsnHox0ufm4olQdgfkvimyRitdwkj4/pB02WIFqPP6pQCvG/RoUa93x0bvhnRYw==
X-Received: by 2002:a2e:2c0e:: with SMTP id s14mr2477172ljs.28.1596028179558;
        Wed, 29 Jul 2020 06:09:39 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id d13sm447149lfl.89.2020.07.29.06.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 06:09:39 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] fping: update to 4.4
Date: Wed, 29 Jul 2020 15:09:36 +0200
Message-Id: <20200729130936.3446227-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/fping/{fping_4.2.bb => fping_4.4.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/fping/{fping_4.2.bb => fping_4.4.bb} (86%)

diff --git a/meta-networking/recipes-support/fping/fping_4.2.bb b/meta-networking/recipes-support/fping/fping_4.4.bb
similarity index 86%
rename from meta-networking/recipes-support/fping/fping_4.2.bb
rename to meta-networking/recipes-support/fping/fping_4.4.bb
index 594f5b9cf..125fdfa70 100644
--- a/meta-networking/recipes-support/fping/fping_4.2.bb
+++ b/meta-networking/recipes-support/fping/fping_4.4.bb
@@ -12,8 +12,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
 
 SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
-SRC_URI[md5sum] = "218e71764177a8ce25564a7810f8e729"
-SRC_URI[sha256sum] = "7d339674b6a95aae1d8ad487ff5056fd95b474c3650938268f6a905c3771b64a"
+SRC_URI[sha256sum] = "9f854b65a52dc7b1749d6743e35d0a6268179d1a724267339fc9a066b2b72d11"
 
 S = "${WORKDIR}/fping-${PV}"
 
-- 
2.25.1

