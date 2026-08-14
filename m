Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FC9C5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:11 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24396.1786747620876953676
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iCqPwDnx;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc11a30a259so591586a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747620; x=1787352420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMxvcMvA/VLhcq8ykeHUDLvoFcHJTWnPyNwq9ABicsI=;
        b=iCqPwDnxGkf3L03MqzzMjHnUUcQG81OSpx3QWN2cIY25VyteEFPo5xReVvZh9u4GvQ
         QrpkNR+emtZNFDWzetXfnHLi3ocSEAhT9pRCpMeGVUk01xoczbUs/w7Y4Hh7W5TUqzpX
         KQh4/6vEe8vNG+YYG+hjPFGkyQ02+KSfGgUY3DtY4IHy0XJcOq3DlKX5NbdUkPAtorgA
         MWuzguEFyPEk64NDFtkXPC9VqrycuW0jaLKvsFkxzdg4L1tdd2XXU+P8jC9/3CMtjhjx
         HLy/+ereVhy36GOnHZJNT93mq9G3aRCKICFlUaZxKTVAYAePyXGwiMOnMX8g8kfDJLKu
         6NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747620; x=1787352420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMxvcMvA/VLhcq8ykeHUDLvoFcHJTWnPyNwq9ABicsI=;
        b=oWi0Z1mJqsX47e1ziaNLVIR9t1Uhj0PmEvaKJz9CzKJsWmoJm+trW1YcvrxTlA/rG7
         wPkuN3SsT6kc6dmL05rEiAhKqmw2sAsABCpa+MTVoONQgT3IJe0g229hkgsPFrR0xFMw
         5mKzmwRffLsRqvopbYyDho2lKOyFiS+iI60EJLkTIR18aezPNnU/r8lUZhJHSHv76/Nr
         20OU7tfmTYHP7vtptE3wHe2REYdY6gEpEjM8gK+UyAgZ0ZBsgchb87Uh9K92oYvGS1Sv
         tchFhQiYX5Lp1PIUVdVH/a7lRr7OgD3HB1dZ4lPRc8gO0HYFmqa6NiJtF6JHo44ElKR9
         vWqA==
X-Gm-Message-State: AOJu0YyBi7P/6UioLcPijeczqOsKYJdye/A3aZF1zJgWAogsbutyzCve
	PSavKoM9wePkvgWDot98zai3WIzrR4z2ajRiwzQ7okf/EU2/hXGC+Q81PeN5gPyZ
X-Gm-Gg: AR+sD11tcTWiqCfn6sthW6KqfFFfKoNgg32+/ReZatugPJrK85xfWsUgYnFaq+/qbF0
	LVFpPocKem221eaILv0I0Iq47DZ3Pevtpghe91HCwo9RQa2WOBBwVyD8ZmAKdetlDVaHOmYv2Xg
	nU/uuFawj1E1xFmbfXA1UegzOzH8dCKRGgXbtSGrwtCghnut0VWT4O0o3pg/GBuYGFxLWB5XMTJ
	XZChuJ2qynDudhzE0et3cFSKIhG8Q4G/vo/ap1sQ9P6fBwj/s2nrQc0sP8TMKK+ZGKAsQ/bFBVE
	DQm3f8J0spRrOscpnQHTJ0WnrIJErll0uDTa6XNO8yuZJQsuITz4CxpIGa99TWUGlKLd+8yq9MH
	JbN78X86AmYGnkqydPxMD5Fkg0HBjg50ezjQl7zfYNC0AcH8abkrvJhGOVg2GZJTbdmp1Vz8toI
	axYi1oQZO0NbdL7ND+Dnc1O007CVQnboeTijhpTkomWjK7/Ke5hskyHcKBjXosFCgdRQIVfmJnP
	ymN5Xv3ccffSlSnslK6QZNp3NAYS6Z2O6zXp3mJdlrGuLv3FfJcQJCrU7SxrOl6pekYGBukUtRa
	iwKenB6NjnM7GH4qUyd+EQYzWxXO/9+d/Xapv9tZwQTOzOkqR11BVytzmEG6XXdijCDWmJ4E8Lp
	5GtPdETrO0i2rdjhOFtEgzaNDHnOdprChFLeryu/c8uCubg==
X-Received: by 2002:a05:6a20:3c89:b0:3c3:791e:5e0c with SMTP id adf61e73a8af0-3cc71d5cc30mr10066579637.19.1786747620151;
        Fri, 14 Aug 2026 15:47:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 070/109] leancrypto: upgrade 1.7.2 -> 1.8.0
Date: Fri, 14 Aug 2026 15:44:56 -0700
Message-ID: <20260814224539.1523174-70-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129134

Point release. LIC_FILES_CHKSUM md5 updated for LICENSE (copyright year bumped, license text unchanged).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../leancrypto/{leancrypto_1.7.2.bb => leancrypto_1.8.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/leancrypto/{leancrypto_1.7.2.bb => leancrypto_1.8.0.bb} (95%)

diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.2.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.8.0.bb
similarity index 95%
rename from meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.2.bb
rename to meta-oe/recipes-crypto/leancrypto/leancrypto_1.8.0.bb
index 5be6ba1945..775a824f7d 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.2.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.8.0.bb
@@ -6,7 +6,7 @@ ML-KEM (Kyber), ML-DSA (Dilithium), SLH-DSA (Sphincs+) and many more"
 HOMEPAGE = "https://leancrypto.org"
 LICENSE = "BSD-3-Clause OR GPL-2.0-only"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE;md5=4cc9ea7ae2518fb4fb0bbd9d1a60cbf4 \
+    file://LICENSE;md5=b00845406d87e919d7995d9b51e06861 \
     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
     "
@@ -14,7 +14,7 @@ SECTION = "libs"
 SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=https;tag=v${PV} \
            file://leancrypto-tests.sh \
            "
-SRCREV = "8a3e942baa3388ec9597c35005264ef9aefbf97c"
+SRCREV = "9bb22cb06aa1733969efdb81155838145405dd81"
 
 inherit pkgconfig meson
 

