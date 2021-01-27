Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.12800.1611774457431593236
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 11:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LNLDEojA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id b21so2222713pgk.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 11:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YUqwFaQcCxzTkNcwuVfvU2EhrxUdVoo7jq9rzeCGDFY=;
        b=LNLDEojAAEzxCyKTTYsT2tEqsBmDZ9rpLeocuNhAg7Yhl+POgxAfNPv13MDhUdXDr5
         RG0VMSYroI3tMQ68wINEP3W9GOcOcbdtK1clR8CFjddEl9zT8Qki1gl5opQ8xuOMI0CT
         PrIE9GS4ps9yAiu3dLO14UZP/Y/b43MmVHV8jKoAZZyhB3RDPteUcbUbzahrNkKfjn/3
         eOSQm5beOWdkkGU1t26/jEQ6eoCjM0y8Ava0n2OTSAUT1fDRPTZD2Q/g3MrHGM2On3rC
         ChyfmGZAy0bmCtOBnmWu2zg/gS5Y0ldiNdorlpCVA/l5dXkzDidqQjhBeVPCU/B4HKCe
         rCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YUqwFaQcCxzTkNcwuVfvU2EhrxUdVoo7jq9rzeCGDFY=;
        b=mKrQAb1fYHpKZlshYgVgSApu/PxrqK5RM5lML+Mj6g32mBkfMJP3863fb0MURldoIo
         RWIzxIvpFL66iVKiYOq/qeDbwLvOdOsP2OJPpw4Lvc9E06gtpEczDNNT1Ui/RSuivJ7Q
         Ql47uGdMz7mkV2fWmU3n3flYVPj48Q08z/+CoR4QNPgQPGR4TnCNgym4lU18HITu5sxu
         ppIyIsZlsqsG9LFVLllRokMECJQej58Fsoz0Y23Fs5tERbZnvOUwhv+H3B/0YlGzpRGs
         F4+M6YntnvKpzMyUYtpvpHzuLL+eELwaiEMg+ZySiLdBGa3wkJIMZ7pvszN45J2bOl9c
         hYeA==
X-Gm-Message-State: AOAM5332uqeQ7KBZdAMgGYv8rSSp7LgSKTGff8nIN9cVdxi4LS1kkLtb
	o5JYkbult2NoAK5bvr0Xj8i3DCGTlm1Z7vCUMOQ=
X-Google-Smtp-Source: ABdhPJymeVzB2jSKyRXo+XfQ8ecHumzdQxFlOO3DQW/JMSuN/OcvOXLAmaTKvocaQcREnmBiwHFc2Q==
X-Received: by 2002:a63:1c12:: with SMTP id c18mr12741357pgc.356.1611774456540;
        Wed, 27 Jan 2021 11:07:36 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id gg6sm6095055pjb.2.2021.01.27.11.07.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 11:07:35 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] sip3: Upgrade 4.19.19 -> 4.19.23
Date: Wed, 27 Jan 2021 09:07:11 -1000
Message-Id: <20210127190712.818807-3-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 4.19.23:

- Added some missing quotes to configure.py
- Fixed a race condition when calling the PyQt5-specific meta-call
  helper.
- Fixed the wrapping of methods that return a Py_Ssize_t.
- The code generator now distinguishes between the copy/assignment
  helper and the array helper when determining which helpers can
  be generated.
- Fixed the code generation when making a copy of C++ object on
  the stack to the heap when the class has no suitable ctor.
- Check there is a public copy ctor when we can't using an
  assigment operator as a workaround.
- Preserve any current exception in the implementation of the
  wrapper dealloc functions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 358b3982583c93fdc0a4cebdab31f923d77b7f8b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-devtools/sip/{sip3_4.19.19.bb => sip3_4.19.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip3_4.19.19.bb => sip3_4.19.23.bb} (92%)

diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
similarity index 92%
rename from meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
rename to meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
index e6a4653b59..320755b844 100644
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
+++ b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 
 SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "98111479309dc472410f26080d6d4a88"
-SRC_URI[sha256sum] = "5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44"
+SRC_URI[md5sum] = "70adc0c9734e2d9dcd241d3f931dfc74"
+SRC_URI[sha256sum] = "22ca9bcec5388114e40d4aafd7ccd0c4fe072297b628d0c5cdfa2f010c0bc7e7"
 
 inherit python3-dir python3native
 
-- 
2.25.1

