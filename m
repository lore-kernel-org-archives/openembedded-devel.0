Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5745.1794975208279873685
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=U2ScJ8aV;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b546061d58so396528c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975208; x=1795580008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkePjvOpaPecG7ke8vhhBjgtf3m0BUtYkuVDKrwRbuw=;
        b=U2ScJ8aVxSXt7FQ/Ww0aAI1IINK7rx5M1lqbK82NDQg2DvUhVHEEkBJr4w+xSQ9Owx
         ip7MPvaf7m3/CXMciTG04VG5tqDtn71BkfppRW+wXZsUReLQXDSx/6XXWr1ovn0KPkhV
         vbCNgV6SE5MMb/HmVg3yGhgTpy0XPzAGhbBo5VfsMLp/X4FXVxt2dJukIrwLrGsCvwZj
         6JgpHCw6wk3qSPewNdZ3sGZZj8j6jDjcQxJ/iX+r5Cq8F1jGywejSy9LZ18xnEhe89RP
         ZYOlJ2lSGykcCUyl9TDpt9Q6DWNlTNRdMI/w9Rs3CDmvvCkeP2yf5rhNo+lZqji7YgG4
         QgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975208; x=1795580008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkePjvOpaPecG7ke8vhhBjgtf3m0BUtYkuVDKrwRbuw=;
        b=RQelpVnJK7bPKwXpbEaSdcpaBDDdTstX+3thdZyY2iLjXuEnm7blaLSs6zdrJgPjBn
         v+MNaZRYKxSVnZBTdV0fSVtTrbpvpJgISOR+IQPqlHqLvM8LSJb0rKFBt5u1Aw28jjxm
         4YhOheBxah5VDazBd7a4dz5NFuhcrXaRbJmbmom0NIRs9HjnaaCv53/Rcnw+RGqWXhCh
         vLojBLt3rFLxKqJxPZ7W2IfPyn56Cz5I4gCzgmgOUF2tiukPexwb4v4DWTTlqGH5ewn9
         VegX1JtWUBxZzAbLvSRD6qEzyyCDogMdAsM86L9GW11nBNiVcpc798I9/tRIzmvcSU7z
         UpeA==
X-Gm-Message-State: APuU4Z+lA5h3x8esCDro9f1egiBW5ew1x29j7zyrdvSFsvbV2jKrRanL
	rIiea3v8YNXcynkKdhi1Gtju3VsatbpSX8+WiRmVBlV3tDzt2nhgUKJKtH0mjKZC
X-Gm-Gg: AYBFou07Ex9ygnHuJVzAPAJI0KfV6yq3urSSM4Pci/fPvb0DyNfYXG2pDMrKuAXmQNd
	38l00fQw17N88OEyvCQ9mZTVvTKA6UTPQIkQRcA+ojLFAbX110ZnaUeJXN3xFbaYvI0ZhN7jySb
	dQ1G4pnoUci9fqTFuo/uMjss9zh7ZgZsryFqU0dMxjsAldA3Qv/v9Cq6xVtu/WsQ5K1nhvTwoXG
	FkyZGNc4a3mPt8Sg5bcNln3Em4RRW/NX9rZVSJCChrBYQgVKh8mcW1djsqoNcnGoPw+DLTMrcGA
	j+MMt7CHK7CcOEOIw+2imZGuLmuvFqkF+E+Ltufwn3dC0oVoWdVpZGw5/ZQoZSL5rFJZhXCCIeE
	aA32XJOyikUvu6QRtZL4zW9EkSRNYkx7xWfiQEzCVtSi+I3cjc5whLVrreMhjy8NB1FngV3Fj9v
	ZG1LG37XGECNamzxXcRFA9u857zS4rKJndYsO5pUUNibMkXk/27OamBk302aeI62ZpmJt8GXjQ4
	DFBD6jqjycOvrAvpvLKPDp2hUHxQpJRkOFcMSFodQS5smHJFd7r58SV7w6Ac6X/3E7uATd/2jRQ
	+ywqIVQxNR72w9nqmYRbU/CC1PQAWyL7lflC80ikdypzK0FldwZQ8ln9GyzlOPIO+/kplLswktQ
	YQAcGfH5O2XH6fgqlvELxUMpW6OzkmCZSdC1iFiCVSBTfvekbNH9Se9/fmRpgkkajmnnq13TDTq
	AkrR8oaxEhYoFHGGk6PbaS7Dg7f4wIe8YFfc4GMTk9Q5ATaz08UuVyV6NBR3R0XiPPP5ixqMPaX
	WiXhdcRtlgYL8ElZGcsI4V1LLfTzIngFolBT0jQ74wYMQFLhCE6xRXZckYZPsLGVcacQffNI8Jn
	j2ZP
X-Received: by 2002:a05:7022:f516:b0:1a9:f97a:34d with SMTP id a92af1059eb24-1b543beb6edmr1463069c88.13.1794975207617;
        Tue, 17 Nov 2026 20:13:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 07/12] libmediaart-2.0: Fix LGPL version in LICENSE
Date: Tue, 17 Nov 2026 20:13:12 -0800
Message-ID: <20261118041317.2287415-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132629
Content-Type: text/plain; charset="utf-8"

The library sources are LGPL-2.1-or-later and COPYING.LESSER is the
LGPL-2.1 text.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
index 05f5135aec..73d72b6ccd 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Library tasked with managing, extracting and handling media art caches"

-LICENSE = "GPL-2.0-or-later AND LGPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
                     file://libmediaart/extract.c;endline=18;md5=dff2b6328ab067b5baadc135f9876c36 \
                     file://tests/mediaarttest.c;endline=18;md5=067106eaa1f7a9d918759a096667f18e"
