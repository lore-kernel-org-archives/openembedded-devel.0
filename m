Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36955.1793167100903452017
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 22:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JA4dtSVr;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-157fe9d771bso677660c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 22:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793167100; x=1793771900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGjiWWNGqzs/bVrYkJDLmhdAkVDcW+B4rzcPI3VEa/0=;
        b=JA4dtSVrlq9HvsIU4NKYLgxYXyKFYatufFr8v11vife1MrGTNeEeajsU9dwJtiDgZm
         O8wLYyCFx+aLQXYjX2GUIvF+NMaaII1PpJX45Ypa5tBdkhs/+pa9+nrDxRHcTFZkkQAt
         U/y0BGTIYp1tgRF+8N+CUNWWsj6jdUz9o6Rt1Lg78uuoeTAV0RG93LZUWvO3UBhvee58
         W4w4ihHvl0TOFdIwD4UyTYKQG4x0JrynZbMzSHjVpqXoJFWoSr1gnpZmtMXjP5EQCPuB
         vwBzjNRl1PO4BTvoGdAQS2qT4P+c25f43ALsl/U0Hg3N2cSwSygCUNhChHM3J83PiI/S
         1nZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793167100; x=1793771900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGjiWWNGqzs/bVrYkJDLmhdAkVDcW+B4rzcPI3VEa/0=;
        b=jNwNV9I4tzRE53mPfIIByaUUxVsPbeHcs3Q/ZxVUey7MfuT/C1Zoz8/CLesXN1HBdw
         TbkYXpzzN0KupXUeGQnrVpffMdmhxuFdkO+d+I0f8/VZqEzTsPc7ZeUzyOBAD+5gfsd/
         h4azDyjKizjWcSw8o5U7rG36pA+1XNuheWK3T8+/QZCo1yxwOKdITJxFEkALTgQ+JE9Q
         WaDBXxatrJPB8LXoH5rsvYMdtmNK5o+KcYh2VfT6ASk8kp0pMsynsHv71ckEfGD8gu6u
         2JGC6k+mdF+bBW9U0zoMCEYO6+kkLZlhNlQFhsYo2kWxQf21KIiLVLDlenVhx4ZVZEc0
         +d/w==
X-Gm-Message-State: AFq9FYIX92h7uGVokEI/P4BhWZ/jfmn1VfSvlmOk0E3N2DFrm2wYkI6s
	tL5xrzM0lNGDxUUkOAFlHm73U87D4kLLoLqVQYjXfc+Q/0v+lloDHmzzdr04LaSSP1k=
X-Gm-Gg: AYBFou0TdDDMxmiqPQ9deJj9/3zojyCHIGdtJD/6aS1XBqIsULnhsmNXKbQ9L+kze5z
	t8/Mg1SBdm3nyOwF+w2NFLFDDcPYy6wnAl7jrypsqcai0ZRsaSYnN/HVgiunwStxEm5dFt/3m0G
	ZcgKJjgWbxmWvXUeilKoGEWupMlOkc0NzZXB/DW+EHeO8mUs+EqbO1ogU39lI/scdrQXKsclS6W
	PdOlIxrw8wCH9Uvv8ezju3QFSjUM906lVL8wzw20UazcpJYpblL/cXnSqaUVOp8f8mz2cByx1is
	+iI4l+zKypm9eizcf6LolNvna63r7fW4TrsUsInh3KfnYVEH7JnvU4KNAI1uNJ+mrt3Rr41VcfN
	m5UtBodeQ6O+nlb3/4YAbaazAEA1Auk+gUYeuscc8inibHWw5vrHAjeeN9kMZSL7T8ImlUajM7I
	aRUw2cAJKVyw9r7R4H2ovmK5M0WNkpIWts9iv23vOwIZGHOWdRWy2bFoJdrQahC0vbowjIhpQZQ
	FmaS7djfYZjR5YZhKOmDodUbr9cylMtgrmkolXjqvBzEVilFVUnwgWAWgBCxTlhUivg6zQrhq0v
	hFee0D9W5E2wp1NHrlwDemj5/QjGl8hR/YBwhKRoOHpLVVXPeUA/cBGd/Nca/nPwA3fzu+A41WY
	XkNkezLalPu61MvuNboUFSP5WOewI9GmebzP473IavoHGr6X/g36Ry21ZP13MMnFjIabehP+z2J
	H8+/0PY5PM6mfKuepFGgy63/uviL4gvuN29D2t3S+E2d4KGauodccEd8Vp1YPmjzGEJG4DSX+h7
	q1lw4ytqeWKJQiBBUIPZN7Vn3C2Spi+FY2GcsJFMx2vFsTq32ptgm1NVDE0H0KxzRgBOlWBXV19
	YGJ8
X-Received: by 2002:a05:7022:f210:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-1a6ce2fed90mr2461522c88.26.1793167100089;
        Tue, 27 Oct 2026 22:58:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm2181914c88.3.2026.10.27.22.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:58:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/4] usbmuxd: Stop using gitpkgv
Date: Tue, 27 Oct 2026 22:58:14 -0700
Message-ID: <20261028055817.4055253-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131618
Content-Type: text/plain; charset="utf-8"

PKGV = "${GITPKGVTAG}" relies on "git describe --tags --exact-match",
which never matches here since SRCREV is not a tag, so PKGV fell back to
0.0-<commit count>-g<hash>, below every release. With shallow clones the
count is always 1 as well, and gitpkgv warns:

  WARNING: usbmuxd: Shallow cloning enabled - gitpkgv.bbclass will not
  generate sortable versions

Drop gitpkgv and let PKGV default to PV, to which the fetcher appends the
PR server AUTOINC and the revision (1.1.2+git0+01c94c77f5). That is
sortable with or without shallow clones.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index 6258bc5134..f45c68949f 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=ebb5c50ab7cab4baeffba14977030c07 \
 
 DEPENDS = "udev libusb1 libplist libimobiledevice-glue"
 
-inherit autotools pkgconfig gitpkgv systemd useradd
+inherit autotools pkgconfig systemd useradd
 
-PKGV = "${GITPKGVTAG}"
 PV = "1.1.2+git"
 
 SRCREV = "01c94c77f59404924f1c46d99c4e5e0c7817281b"
