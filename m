Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7496.1792574955670573436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ail8afqt;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-156cbe59524so243792c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574955; x=1793179755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gh83cfskHLvKV1uwY+k6XSG1tepLn+dpLgGtGNQHReE=;
        b=Ail8afqtNYMOmzXAnXG9JK1DrtatA6+vJDCh9WAXqvk+stah0hC6JuD/ShRgk6rkup
         iDy7oGz6PvsiLnsg9EmzMJpNYB5rqyfyCa7m8oLg1HBvMC06qq0ePAa7ThlNRjE5W3v7
         7daChU3tckXtL96lGxRwdXEX6YLrzWbpQoQ0d3C4Yj2IqZ0W8ucqEmFQNWLZBahyax7K
         DwHbxmN/HP2oMbbwiIdaBuo/bmlI1GjzLY1tHQbE9I6fozamypPm2U6YvZ/g6/ScY2Dq
         UPSLln54/734mp+qtw+elEPLrcxKHiZ4KUA1NhL40+JRUG+wjeRMVdURA+mc3ok9Hc5Q
         kbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574955; x=1793179755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gh83cfskHLvKV1uwY+k6XSG1tepLn+dpLgGtGNQHReE=;
        b=yZBM/U9Awb3hys5M9cFiH0HQcJNfB77ReJCjdrqJof3lXe2HwZB8LqYCzSjaME1qBO
         oFCxi61f4TAkLlADpP8tkmTH/3s/VebKQ/U2Ms2AJDk8hefCmPAnIll/MoB3x4kkTo/E
         rOvjNn46ExEXrUwK8teM6gsSKnlNr8CJ8NYmFPT+9n7PLp/MhlV5TLQyBYhblCC2TpJu
         fLzjwJ/9kvwCh4iXFICbJkSsn/K4awnrlVeS/390PtI8n6W9pEGgZEiv5AEcuH27wrSg
         GRYmc69ed/7tNjZfbEr+4nkADM0E5xCl9C9Hc9QPHNidsNwiLKZ5MfhzOGu2cos+30AS
         Kcjg==
X-Gm-Message-State: AFq9FYLJX7niEyDhZx+O8T8H6Wy/2IFpFaepzRs0DZpIXN6mptn0ZftV
	jsfNwuzbTBeQQpVt9unN5nc1y806V8DE9eBq9jGK7EelELf8YseaDtAOHIqqRg==
X-Gm-Gg: AYBFou2iGGNb6vLEDUcyscaLKqrbK6rOjpSGsuSmXTLlyB1Crn+/nz6NmYg4+Y8CxbX
	muI4NOG8VSKMsRphw3gyn5v+j69GgGxUjt1THy90SJ6xHTFt10f/8Br253567Ft/1FIgmZJB1hs
	5HD0k4fsL2qMgg58tnoO6bXXoYVcygz7TsJyrrso4MF/rCX3oj4ohxOdnQ6WHdMSJdmtmCGE/iW
	Bdgp7Ru1VDPjXGfBcx2eN+PsWNlVnLyDkY9jXbMA2A9N25124bTOFnaBt+EI/XFmMoKvoKliYQ/
	EJRfT6SBThYa8sS2ZOhM99aaznj7oGCzRLaEqr/7c0g86wCQIxOGWhuFt8B7ly/GvzDbLNcPkF/
	+mfXBZeNBHNW5gau4Zcq2kfxyKPR4RPDxiZH5agfezn16WT+F4uL0tRGGorp4U17NOXPh7OLsHB
	LFHyTSA2Lj9MQhhrtnpIrBbuuUzZCCutesoTXdplaoYSLKhjTnjmBlZtCZbCP6PIr/aVKnB8fXW
	AwcNf03YxrpNWrVvei214d3MMKSPiPP09X4AdYGJ30LcXupAqSs+D9u5/WwgBXZeFgQIggnkvEy
	uSzEGxOaimCTfh41iBt0NXbgyIbz7/g=
X-Received: by 2002:a05:7022:220a:b0:158:b944:b20 with SMTP id a92af1059eb24-190a4a3524emr3125687c88.11.1792574955017;
        Wed, 21 Oct 2026 02:29:15 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 5/44] flatpak: upgrade 1.18.0 -> 1.18.4
Date: Wed, 21 Oct 2026 22:28:18 +1300
Message-ID: <20261021092857.3585453-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131192
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/flatpak/flatpak/blob/1.18.4/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatpak/{flatpak_1.18.0.bb => flatpak_1.18.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.18.0.bb => flatpak_1.18.4.bb} (94%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
similarity index 94%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
index 879455f63c..74bfb89e62 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
@@ -4,11 +4,11 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = " \
-    git://github.com/flatpak/flatpak;protocol=https;branch=main;tag=${PV} \
+    git://github.com/flatpak/flatpak;protocol=https;branch=flatpak-1.18.x;tag=${PV} \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
 
-SRCREV = "5de2b58bdafde88515d9d6b9189bd1cfd3b88c46"
+SRCREV = "a02d0ba48abe9aacc377de15699e5d8c024b5669"
 
 
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check useradd
