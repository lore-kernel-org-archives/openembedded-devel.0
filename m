Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.13704.1612653439029061279
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FHchcdQU;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d26so5707167pfn.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Zbz5lqDrLY7Nkfz/rbDcbcZ8YzpAw3bx+T/785DIfj0=;
        b=FHchcdQU5AN0el/XEQXsLb2CzJra5QrPPi2UXTzKgbe0P4v9jSBcyfNFHrzMhOHOYL
         1sTrWBkG3fYBCCOWWoyw0ZqdT76LJQPYDXrognUJkeA0+vpmzP+Imx9ajU80yJHwBs/J
         /zc3ylV2yxnqGcKME+CowFGQIP3TjipDpxpO3GPh6Ers7TrG7GW39Pk+u0V3ytneBBiK
         LiF1Y2ervjahOaxnH7/X/NHdWfLyWfvQo0SD4KP/0Qj1zteDFNpm4JPea53CTKzFTdlu
         Wu7fgEvjnpQ6NXumcnei/cCgb3wXXZ1vMBOmgaFML8/FhCiFQTFRrdTnZqlV1cniZAP7
         48+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Zbz5lqDrLY7Nkfz/rbDcbcZ8YzpAw3bx+T/785DIfj0=;
        b=hb5HUqj1s6+4uKR5Cgpk31g0QswYnlDg2v5YjTi3C9qcBb/Fdj5TI2ez9DCCm29TNC
         rC+8O/WuJnlCq1LacoyITL/Bwz16/EB/rNZSqIutoAl34HRXAyxcLrTyTYCMQqFBWHUe
         z/bOW14WQBCjGLM6odHE9xLR8PtRroc9+Sj0QAEZX/nOirkfgd7jPJxys9QdspojxfUo
         VXacy4fzr1DOt7S3DhwDIxoBrBAhevEnqMg52ikavkODXtabi8ra7Jqy+FYyJi2FoXtI
         ksvZfwodTp+Xkm3tuK7HI8kSloP+bw+aiEN0hQZo5ndGurTpQhGzBiW6Y+nb7hqxCMxo
         FCPw==
X-Gm-Message-State: AOAM531httYjzgYKp7ljZlYbpin5TJ7WxiIvke9wXru/xhiSZ8T6WETB
	AvPU9ARhkcS8v71tU61fPMW5tg8uV6H2Ug==
X-Google-Smtp-Source: ABdhPJwfXQJGU2FyzLXWuAnElTiarwE16fUBSclgIpB0hdirHxaOt50D8tDUx9NxSn+5nbCh/Eu0/w==
X-Received: by 2002:a65:55c4:: with SMTP id k4mr11301722pgs.435.1612653438426;
        Sat, 06 Feb 2021 15:17:18 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id b65sm14331882pfg.3.2021.02.06.15.17.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:17:18 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgargh 09/10] openldap: upgrade 2.4.51 -> 2.4.56
Date: Sat,  6 Feb 2021 15:17:05 -0800
Message-Id: <e615c6fceff7275d93e462f4cd4a14cc55b2d656.1612652802.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612652802.git.akuster808@gmail.com>
References: <cover.1612652802.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 768345053e83623e286ce3140756036e75c023bc)
[Maintenance update only]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openldap/{openldap_2.4.51.bb => openldap_2.4.56.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.51.bb => openldap_2.4.56.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.51.bb b/meta-oe/recipes-support/openldap/openldap_2.4.56.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.4.51.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.56.bb
index d2c5746080..4c0f179cb0 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.51.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.56.bb
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "0d2025896cf1c17af7304ecc57ec9531"
-SRC_URI[sha256sum] = "f490775ea4c6506b7210ee55a102c8f4aacfe9d1c8eaa633c7316d33a714be62"
+SRC_URI[md5sum] = "82a7dcf7aeaf95fdad16017c0ed9983a"
+SRC_URI[sha256sum] = "25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.17.1

