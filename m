Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web08.1192.1616557819421550695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 20:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=IdyAvaTB;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.178, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f178.google.com with SMTP id s17so28425303ljc.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Mar 2021 20:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qdbVR5yHRjNkQAZJDDgB7n/a3SO/O84Zc9Ws+Rl2wks=;
        b=IdyAvaTBsxHHQCVWm79vYwliSfMTpimw/ocoY90WLtUkMTb5b+DtbJs6R85uTCsI/F
         9h1L9WuhiO1gWocXc3HL8BxCaW0rJQ4vgxUUl0U/Xa4vPkeoQD4wjtELyELRm+AlEmeb
         GY84OPtqDTe/Ve2lHZnqxxnMtOuMyN+O8hClKlC1HFTO4MrGZR6vBEF9gNEINJqymZtB
         AFGHQkoKXq+eassor5DCmztZKIn4TlsvUENbJ/1MOGIlvsjnpTHxjPmupDQ43ZLHBZtq
         uDebT7cu3AOOeGC7A3as8T5RHD2wQOXLGK13iHXlbkoEMbP7gAG03mYhk1A+ci8xXge5
         k5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qdbVR5yHRjNkQAZJDDgB7n/a3SO/O84Zc9Ws+Rl2wks=;
        b=pyLthlAM33ibCDyu66mKEWys6T28fD0XJu/aQM25zbw8rF7+uVxhgr2wgAvJlkPjbP
         TogCAzgoXMS+fKtBkcPEnZT7FiKZD/7R5v+ljUIuhpSxi7gPx9TPTlq/sLveAq3oA9XS
         PJjuxOOR40Lnj080LD5QsSM2lXf3JzxfN+ADyxbR0IcUnBn/FwuqwKAsWsNylZG++Gie
         fbIcGM9zy2kvO/oVB+gxu7Fz1WHqqFKf16MbQ4yNDWSvOqVzVhqpjdYp/iWlQKutS/NQ
         V3F3Wjgpgk4dLJ02t4w/SyISxedC8iWE3c6I4D7PpUrYSgKysTHZEbLeD96qjIo007gi
         OUBA==
X-Gm-Message-State: AOAM532IpuVKWIWl13XMkKuFXMDyvC6NyQFqP0hIfnOU94SYGI36uJlK
	aMDdMAvYzFiWMRYDGHP9IsHPSGC5AQfYLDGK
X-Google-Smtp-Source: ABdhPJwjFFTR2bi6NSuLWcqIZ/VoA+YUeYP6+Ci2Z6CKa/2BJ43yI97lbZnmOsZ8sLtScQF95djblw==
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr771387ljk.50.1616557817019;
        Tue, 23 Mar 2021 20:50:17 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id i123sm132649lji.108.2021.03.23.20.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 20:50:16 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-multimedia][PATCH] aom: update to 3.0.0
Date: Wed, 24 Mar 2021 04:50:13 +0100
Message-Id: <20210324035013.597379-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-multimedia/aom/{aom_2.0.0.bb => aom_3.0.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/aom/{aom_2.0.0.bb => aom_3.0.0.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb
rename to meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
index 1ad457710..7ea9b199b 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_2.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
 
 SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https"
 
-SRCREV = "d1d1226af626a61f7ca664b270dd473b92228984"
+SRCREV = "307ce06ed82d93885ee8ed53e152c9268ac0d98d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

