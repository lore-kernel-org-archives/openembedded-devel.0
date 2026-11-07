Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2217.1794083287896584227
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 12:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JumwrV7O;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-677bc4704cbso18036d50.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 12:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794083287; x=1794688087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fxmWTjNO776mQZyetjJDOKPyLkap+87W0+PllNZ5BUs=;
        b=JumwrV7OFO229SE3EU2UB3m1TGoX3mstmTHMLELT2otpxyUZPpkdoGv9m+2L+vG3W3
         xgUM2Kvapgq3QiZIIGEjhbjOkhMDOihC76RY5Uh4cTbQ1FD18AMH19DYG8MLIQPuaONS
         87EaYK/hAjVjx6zaLyaG19D/ELOLJSzi+A3Pgji5jaZonos/gHx3DHfRHhOAlAABuN8g
         itMew5iuqjHFBE3sZ4CkPj8uJg5jtCNQUUHggkqFWzgEePEdN3MVMAB+vy1ahP+HHMpO
         sD85wEoSqXGBr3yZfpMFYLu4ZmQDndKHtCbwqOmCL1xavZIxn6AAxSDsFZ1jqWFirJ4t
         0qDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794083287; x=1794688087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxmWTjNO776mQZyetjJDOKPyLkap+87W0+PllNZ5BUs=;
        b=oYHwAz0De44521HumG8bp/QDxb25C6qnfSBdFzivkAWsLNDld3U4mE52SzISryJBVt
         Yu//MNUHwVRBr4vZ7GITC8mTfAa8sdl7iPF4+ef2gAd0B5RQvqXi3JS7WSChQsqhpDr7
         kZXDhHY/T9lhGJ7QMEGN0UZXeniAx/qC/n15gm4xItPBRt1bFDAIBSAW+9SUdqlu6jCV
         5ZpykZG1c+vhDUd4odZXqeIyfY/XyLqcunstt4KxIk3X/dkPehLFjjfgzF/fXKe4E81S
         7bUmLBSsQGwzVX+wtpXDLTMducSAa6MFmIgC41PCZVToPSKjdcM0fJY8PS6V1r6Kr0Pt
         YLNQ==
X-Gm-Message-State: APuU4Z9cKO2gBTLO5jIujCpaQJhuk4venkiJdXn2wD+XRk7tHOejXIDg
	7rjVyqHF4owhxuomQijXz0pzYaTpXNxbzcw5U+YzsG7yoUyd6CG0wAif1+84BiBxY+4=
X-Gm-Gg: AYBFou1rWPBLzlyL1HyXfuVtXR365rbXSDCss5wQ18s3RtiPJaR9+J2afpxGGtN3gFD
	n2EutxTXM6Y0Nz6dCStTB8KSN1g4XI5BKGtQxGwCHBuDQfUSXljPlrA2P9Hhosxyc8SbrychNgy
	JZeBZ77W9Oeuq6aY0aNUv9gK3kDMni2NyYVDQFute45v7RNMRZ7V8A4i4BruTpLpuZ1cQ9QVQy+
	QpuehHDHZow/tfMBXg2EceMsD4vJ8eWaaACGAwp+z+xo7ncI8x46XiN+0SxyIEnyoQ6oDxr0X97
	1A+QI/OZ105kjNv0FI5O9tI2GXsf5g9Uxi2jQt5Yld03HSia81i8lbMZE9U5l5C03cJSvnokb6O
	U7gbY8/ZpZCa4ZKrbgF1SdxVdKqmm7S+6jFEkJeogK9cRI9TCCqD8yAfK6CAMf3p249TyhIPDt6
	tAVdJsCnpidSLRcyg66lAf+ijSTOkIroFNmMn80fwXCq9HnJXVdFsL85ONx1/9CcttofRz6867f
	BdPo9rTkeL5IZ7jkmdufaY6vbrfZNnwaaRocRQgdTkflHrIrQcquSd0lnd5Xuh0I2klg2F2qlhU
	/oNHkTrOTRnT+AwOIfWdoyYW+M7pRICwQpjfxUijBnYlNX0hb9DxGV+hN0q6eicRkf7gBWY8BZD
	cCa6VF+ZTKIpoTjZ+YMP5Ew3jiSpne9Gn2VDLfW/3gMUwDx9hXqQ4
X-Received: by 2002:a53:b78a:0:b0:677:aa92:759e with SMTP id 956f58d0204a3-67c14443138mr2053355d50.76.1794083286819;
        Sat, 07 Nov 2026 12:28:06 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b83e8bdsm262044d50.1.2026.11.07.12.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:28:06 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 1/2] libmozilla-ca-perl: upgrade 20250602 -> 20260813
Date: Sat,  7 Nov 2026 15:27:52 -0500
Message-ID: <20261107202753.16734-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 20:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132008
Content-Type: text/plain; charset="utf-8"

Changelog
---------
Changes for version 20260813

    Update from Mozilla repository to 2026-08-13
    Added certificates:
        OISTE Server Root ECC G1
        OISTE Server Root RSA G1
        SECOM TLS ECC Root CA 2024
        SECOM TLS RSA Root CA 2024
        SwissSign RSA TLS Root CA 2022 - 1
        Telia EC TLS Root CA v3
        Telia RSA TLS Root CA v3
        TrustAsia TLS ECC Root CA
        TrustAsia TLS RSA Root CA
        e-Szigno TLS Root CA 2023
    Removed certificates:
        AffirmTrust Commercial
        AffirmTrust Networking
        AffirmTrust Premium
        AffirmTrust Premium ECC
        Atos TrustedRoot 2011
        COMODO Certification Authority
        Certigna
        CommScope Public Trust ECC Root-01
        CommScope Public Trust ECC Root-02
        CommScope Public Trust RSA Root-01
        CommScope Public Trust RSA Root-02
        DigiCert Assured ID Root CA
        DigiCert Global Root CA
        DigiCert High Assurance EV Root CA
        Entrust Root Certification Authority
        Entrust Root Certification Authority - EC1
        Entrust Root Certification Authority - G2
        FIRMAPROFESIONAL CA ROOT-A WEB
        GLOBALTRUST 2020
        GTS Root R2
        QuoVadis Root CA 2
        QuoVadis Root CA 3
        Secure Global CA
        SecureSign Root CA12
        SecureTrust CA
        SwissSign Gold CA - G2
        TeliaSonera Root CA v1
        Trustwave Global Certification Authority
        Trustwave Global ECC P256 Certification Authority
        Trustwave Global ECC P384 Certification Authority
        certSIGN ROOT CA
        ePKI Root Certification Authority

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...zilla-ca-perl_20250602.bb => libmozilla-ca-perl_20260813.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20250602.bb => libmozilla-ca-perl_20260813.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20260813.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20260813.bb
index d5c7db4764..45eea1db89 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20260813.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "adeac0752440b2da094e8036bab6c857e22172457658868f5ac364f0c7b35481"
+SRC_URI[sha256sum] = "81f0bd9665eacbb6feef13b0fa16fbb30162c09292542b1206434e569196dd9b"
 
 S = "${UNPACKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0

