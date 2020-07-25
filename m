Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.7940.1595675812827679157
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 04:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=q+XLIBDH;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.177, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f177.google.com with SMTP id b25so12496484ljp.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+hU57LiMfkIaeHmBmDM0cKedMOk9fhQVSUWpke5RYSU=;
        b=q+XLIBDHutE/SxHERW+GXk+otq895KZ/b9sXM/zgTfv+FZ0ZPOa5EXP/W8FJmIQW2C
         3+ejP55kwS/FrQsQ99oyq1Umqh9FgQ8hCkIBC892JAzCOKLFZ+EE0CFmPy7VXYeSGpxG
         yZGS82DDHzKCSUeicjRhmLHJYgRFTlZglZlJ/ZnSWAqgbcmHjKbWj0CIEbag0mbD0dwo
         AnpXCUaY68dX9XhIS88eZ+Mi5new8+b2tV2j7iDdtVX2u2VVSKdyyygY+6xWo3npPy1o
         KQz8c0cI3axjOuEef8kJ0SC6pj6HAW6iaRIHGp1xw+uEht/JPwy+CAJi2+f9eARo/lof
         xTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+hU57LiMfkIaeHmBmDM0cKedMOk9fhQVSUWpke5RYSU=;
        b=gHFYw6B5c3aMW85YV8aAqpGYuA8PdT3k15ziOmDjLaOqOi0y26kTI4KX8ArD6O4ASN
         r4lCOIP3MJoX1IR4LZ/3q7MzrrAj4cw4wkwwilWmTreHcTznADlXJcvKs6R2IbgXDKmx
         q25r/DGmYPDiWB/SIrslxp0tsqzZJwM7Kb4Iubr68k63UTKNzf5pvc/W8GDmlhGFqHQw
         PGZhGNc1A02agOurwP5+hj78h2zHprnQGq6oQ2ZF0OFQPileT1wo4bABv7GhTVGmTjp8
         Z7OgAxRZZzhe9oFai1bxWnCwVXdGaEnX2c0V01b2uWWwvobxvNLoButLqQNs+IqqRJpH
         vcEw==
X-Gm-Message-State: AOAM531kRPeuQU4E79525TrH5Cm8FLlysEPL8BMvrf5euj84+B43u0hV
	gJV6Iim/Vu1rXp3QahLDvafnWmMeHVw=
X-Google-Smtp-Source: ABdhPJxW/q+G32ueeAusrhZzX2gqlbFdVISwDyhCA0yPqSbU7IO0v1OBS15DG8BMYxKiJ0NOo/QIZg==
X-Received: by 2002:a2e:9dcc:: with SMTP id x12mr6626442ljj.261.1595675810804;
        Sat, 25 Jul 2020 04:16:50 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id r13sm949935ljg.101.2020.07.25.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 04:16:50 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libbytesize: update to 2.3
Date: Sat, 25 Jul 2020 13:16:48 +0200
Message-Id: <20200725111648.2179171-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libbytesize/{libbytesize_2.2.bb => libbytesize_2.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.2.bb => libbytesize_2.3.bb} (93%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.2.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.3.bb
similarity index 93%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.2.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.3.bb
index a954499c69..db8270f49f 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.2.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "e64e752a28a4a41b0a43cba3bedf9571c22af807"
+SRCREV = "96aba1e99aa40a21df980bac4f2ed3bd1e25dbde"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master"
 
 inherit gettext autotools python3native
-- 
2.25.1

