Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7646C5DF9B
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:02:35 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.708.1787335350653575828
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CsLqMPBF;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce98cb8165so13181995ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 11:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787335350; x=1787940150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqbY4Alh9/ViJB+Uc1CulK6LKDLAz5nv29pkP7cqr8w=;
        b=CsLqMPBFrtq/t0B8m1/a2Y7g5ly6T1n1oYO9ew4utP/p6kyjXHmu9tf+zZpskTcCcE
         bPOHLu3xAX3zkmtyJf7yk6ow/9G1HC9Mdak4aEQEvexef5aTqzptvGTkRbyPiBTHAMYj
         c3ahGxFh0t2Q5HX7w6OdbIgmK0FFRGjp6BMY8t/NtQaSggHhOfaVlJKUVrsP1D9qTe/j
         vfdulBV3S4In4wI6s1kfGzsTBAYp7Oh0Sj+0YRrlXVGUHWHAWMA59hpi4LifjbIZBdVS
         z87tNGkPWWmT2ZDneW4XAmx+L06/Y1pCtVPZ04EwKEECoaLWkb9G59R5bO/vjOC/pch6
         /6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335350; x=1787940150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqbY4Alh9/ViJB+Uc1CulK6LKDLAz5nv29pkP7cqr8w=;
        b=Fvn8mS+Hjlo+CYp/nw1O9sH2cunBLIMKB5PwRUeLCXvmkbLdQ2Rkcf0AqGWF326hI+
         LFr7Lp//yn2KHVLe11d+J6r0ajVy6pxUludjCxghJPnar2/jpYrPcJ93XEcuFaJcLB3c
         ggulyxmv3ATSmYy6vyFizY8GtpqJ6M0COEGRxzzXdY/WwrjNb2cwNKOL1Mk/QN3lYe43
         PxDw/YeD33r+U61YiQNY0yFkgRfFrI0aWP9UrmKE6s9q5UBGLjIj7VB9vXQM7U7avV99
         VBMaTGkDLK8xYq1edwTcH8Xo6Thz66ihWEzHj0XhyVMTEBRMCxuuZnssZevZv2tElKDb
         z4hg==
X-Gm-Message-State: AFuF++lEUai9+2U3l9umvAcRHULjjHm1vejbY7mrQGKG0FDHY117RNIJ
	qc7GOnstMvlKwOGZaXC9HRgQsbPQwJpo2kdQdTVM2YhbmeR5oWJ9WtJhuM5bW2jC
X-Gm-Gg: AR+sD10dJOB/HPYJnqfdqpA4P5Gd1x0pDTlBAUtyB6T0LB0UryNWDHD5Yjim2J90fBd
	lWRCxAvm/BanDU8zd7Nm/w3cfhSXV354qxnEyxgL17Hslu8qc2Grz3F8a106Xddtuzqn35p3Bof
	QqL90uf5at4i6uItCZb9IQF4wThLxEXLznMImWbVlJzqi3KymtrGY4F+pH2No7pSaYleajc14cQ
	B6RvHYwhXA/IO6xC8UK4wjFbu6BhVwYDtfe0Vi0J03LuW1bfGAuUU2PpHhyDVTuKOrRLPhF+zQA
	on67Wt8lLED/6SL7qBrg5NcpF4MwcQq7yLg7s9UEwPsLh4twANAQRwB/0AzcptGwQZHJGAKbNAE
	lYjql1YhwC4NoNsXtqIA3Cyf//NMOhshkCLz4zVprHkdp3JbSzfwE4WX0oJn5itXPuz2dfcXxdJ
	LATOfixE+VAaen/nBleM3zc98B6Mnogk2wFXrHr1ZaWji0O+b/NVFAP7OcrNS3PG1cQEEq5DRIj
	7XhyqqWTG09s8MPVujAQzGG30y+q6fzj/U5MrF68NIEH4othoppXn9JNadzHCZgONWWFd4uUfAj
	XK5TQpYAbSHkSIwrjbnHHf1r/ML3wwIXwRSOUQZI2lSsIlLsuTYnDpVB/CZ/y+bwTcalSRoKUE5
	PMm2j0zpdzYjxH5V2Uv/XhdPKaJ2Mj0Ylp9HX102Liqd3ew0zb2G6evA6
X-Received: by 2002:a17:902:c944:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d61a1a54f5mr181197845ad.13.1787335349968;
        Fri, 21 Aug 2026 11:02:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm26102708eec.3.2026.08.21.11.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:02:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/9] hunspell: add missing gconv ptest RDEPENDS
Date: Fri, 21 Aug 2026 11:02:10 -0700
Message-ID: <20260821180211.423633-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
References: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 18:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129432

From: Khem Raj <raj.khem@gmail.com>

All 25 ptest failures are missing glibc character-set converters. With
run-ptest no longer discarding test.sh output, the cause is explicit:

  error - iconv_open: ISO8859-1 -> UTF-8
  error - iconv_open: UTF-8 -> ISO8859-1
  =============================================
  Fail in allcaps3.good. Good words recognised as wrong:

Aggregated over the run: 382 ISO8859-1 and 10 ISO8859-15 iconv_open
failures, and every one of the 25 failing tests reports them.

Only glibc-gconv-iso8859-2 was pulled in, but the test corpus needs more
than that. Dictionaries with no SET line in their .aff fall back to
ISO8859-1 in both consumers of the default:

  csutil.hxx:99      #define SPELL_ENCODING "ISO8859-1"
  affixmgr.cxx:3502  if (encoding.empty()) encoding = SPELL_ENCODING;
  hashmgr.cxx:97     if (!csconv) csconv = get_current_cs(SPELL_ENCODING);

and 92 of the 144 installed .aff files have no SET, which is why tests
with pure-ASCII data and no SET line still needed a converter. The
encodings actually referenced across the corpus are ISO8859-1,
ISO8859-15, ISO-8859-15, ISO8859-2 and UTF-8; UTF-8 is built into glibc,
so add the two missing ISO8859 modules.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
index 23f6ac87d8..7d0921c25f 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.3.bb
@@ -34,6 +34,11 @@ do_install_ptest() {
     sed -i 's|alias analyze=.*ANALYZE.*|alias analyze="$ANALYZE"|' ${D}${PTEST_PATH}/tests/test.sh
 }
 
-RDEPENDS:${PN}-ptest += "bash glibc-gconv-iso8859-2"
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    glibc-gconv-iso8859-1 \
+    glibc-gconv-iso8859-2 \
+    glibc-gconv-iso8859-15 \
+"
 
 BBCLASSEXTEND = "native"

