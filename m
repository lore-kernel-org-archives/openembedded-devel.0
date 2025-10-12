Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EC7CCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 20:38:23 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.web10.26271.1760301499626608095
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Oct 2025 13:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i1V+K6V1;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63cd60ca2b2so3466219d50.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 13:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760301498; x=1760906298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=itdssqixFpImXyQrM5YbEwgYbNlvfOmGsIQ2GuLEFz8=;
        b=i1V+K6V1mbX734lkWZ2Xk86Y2+C/LrF3oLSyK3z3KeOU0ul+Nz3vXGpQ7p++k7R5Q/
         JVI3HErt/y62TioDw3DsCg0hrKIQShOj91btyYY5TW9S5o406FaBd7RFmQIDXlUrxcyU
         cE2XtXI8oo7JJQsHjobc92N747mwQX6dq5IHqnIRt40jbzXeJ6hN9/tLEgaMt5CNXDkx
         auAh0Bzi8ty4M1OFur6mZKGhp2l8XafyOXkkOhJr93VL21UodHI7xXamEyaTPFr6Vl6U
         dYa3qlENKEHkun6rkKIyK1eHR426GC6fjWAbKp//Gb/fX4cOgyf+YLu5EisUT5sZqEKh
         i6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760301498; x=1760906298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itdssqixFpImXyQrM5YbEwgYbNlvfOmGsIQ2GuLEFz8=;
        b=QVrE7A1Hi2R3csxFl/C1Z0s/BxfrI6+hAVxo6uQ5UMxVyfjEYY8TPg4kWaouuk01aN
         LC9FtRSALP9gdyUg7I4UOVpQazIxoDrggMlmfuHPaxGsmCxFizOJix6OObdcosZxFdJL
         sOlF2C0fz9XnXGyDcyoO5vhaX5jY//tyABVJqXn//qJz4y9GyOZiujqY8PAniuI5npcH
         YhkV40LHrkFb12YB1d9fFzkichSB0CjcUl7Ze1a8F3CAKYDngrZQ0nQB+EzPcGREWmH1
         tnpV8iMGrioipvl7pHzYFY7MOEsgnV2iJwWTVnf600mhENarrFtMevXhL1cVP0u6xhql
         PiEA==
X-Gm-Message-State: AOJu0Yw4vsKeuf5VDsxCdgtjo6jTnNIe3Di65bs8AHjNYzx9lr7UBnDn
	6h21bGOWCX/jcu8yQIrHEM6c4frVJg0mNKLL4zXhsytTCh8eMWNEggOdro1OfTEP
X-Gm-Gg: ASbGncvZc+Ssb8Q2p3Bli8tVm7t+qoo+ZFiC/WdTmPfZjLKoM4jJ/dJNZMehHLv5fpF
	yUVn1PYp8Wn8G7lvS6dCEfjBYnj8/bJBT6kgZFS7HmviAWmw4DdhSljmUA8nnMRIWzziff1uoV+
	zwaORYFYU/hdDlwV1uEnVdwm/ezg3oXVxibPrsTiQtkA0J33CBkzyyJnnY5W7WRjPjmzKH/OaH3
	+OF+2CM5gSfXBwNK3uz7g744HxKRMaePHwZ2ixRivmpotKiyaPUzHBGgmuM0xRnrMr7UzhW+ynV
	36CLQ0ifRHw0B9OWe4WCypgnIlCkfC8o0HXHBlBAtJiMTH7/iwFBW+ondAP/oyS0uH0cYU0OSl1
	FjqUEQu4TEO++dRkeDpvjwbgbAoE8/J2EOBE/KBcaKzGR2e1t8a9OoatP3K529DSD7fOtjMIKpL
	U=
X-Google-Smtp-Source: AGHT+IHQqJNEyuFHZvPfP51JI/GfjHN8DpcLYIKgpLEZRoEUwKwGDhd+mK6vLOVGxQ6xR/0ZNdAu8A==
X-Received: by 2002:a05:690e:429b:20b0:63c:f38a:9dc9 with SMTP id 956f58d0204a3-63cf38aa669mr6605819d50.15.1760301498276;
        Sun, 12 Oct 2025 13:38:18 -0700 (PDT)
Received: from localhost.localdomain (71-208-12-94.ftmy.qwest.net. [71.208.12.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-781071f8fe3sm21438457b3.35.2025.10.12.13.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:38:18 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libhtml-parser-perl: upgrade 3.75 -> 3.76
Date: Sun, 12 Oct 2025 16:38:12 -0400
Message-ID: <20251012203812.301344-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 20:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120523

3.76      2021-03-04
  * Add a fix for a stack confusion error on `eof`. (GH#21) (Matthew Horsfall
    and Chase Whitener)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...html-parser-perl_3.75.bb => libhtml-parser-perl_3.76.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-parser-perl_3.75.bb => libhtml-parser-perl_3.76.bb} (79%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.75.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.76.bb
similarity index 79%
rename from meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.75.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.76.bb
index bae4ebaa86..6205f7db0d 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.75.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.76.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "This package contains the Parser.pm module with friends."
-HOMEPAGE = "https://metacpan.org/release/CAPOEIRAB/HTML-Parser-3.75"
+HOMEPAGE = "https://metacpan.org/release/OALDERS/HTML-Parser-3.76"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://README;beginline=992;endline=996;md5=cab05784294bb47d
 
 DEPENDS += "perl"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/C/CA/CAPOEIRAB/HTML-Parser-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/HTML-Parser-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "ac6b5e25a8df7af54885201e91c45fb9ab6744c08cedc1a38fcc7d95d21193a9"
+SRC_URI[sha256sum] = "64d9e2eb2b420f1492da01ec0e6976363245b4be9290f03f10b7d2cb63fa2f61"
 
 S = "${UNPACKDIR}/HTML-Parser-${PV}"
 
-- 
2.43.0


