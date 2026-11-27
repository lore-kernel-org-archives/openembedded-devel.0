Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10361.1795753066224154449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Gx0H581T;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so11675348c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753066; x=1796357866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMGzQmvSy/vFPXVLBRB0KTbCyBcOTgLe4PHGF5nhGTg=;
        b=Gx0H581TrAIzjd8N64pssvCSOv+nLkPhNhCaw91pXOQQ9bP1gltb4KFOeehCGlFYYZ
         mFQ5sTJTYNxa64Xwk1J/xt/59rifGaMlBiCSlBPaXhEYLglOXsTccFQOMBzrQ0+KVFYh
         qeTRDhr5JM8NMq8YR5oSzfX82VDfuM7q8aJdCUN93vISBTA3ufALa9ninlEPG+bI/Lx7
         92JvqejRn1hsC00744OzJC2fCcuvX3szK0JhqXk9MoITPUdHt7w1qYTEl6aAjI+7+eYy
         E7zsYlIGPcmQ9t4q792/S/569K6gQqktJ/XLWg3tr5daZtIAP+bI3SWdr4G4an0EbQSE
         qsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753066; x=1796357866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMGzQmvSy/vFPXVLBRB0KTbCyBcOTgLe4PHGF5nhGTg=;
        b=iyCeC+4Ori0+sX5Xltvawyf8lCMGwR4sU6pR44g7LHuNy2Ya82OH/k14TJuT7fN49I
         juFc4iSFWIxnNEDrYbMVMLtzzyoiXQUcdK6S8/3smH1DGj8fX5QxWPRYG8LvhZ5D9QqX
         ZFz281/s6BjvRhcQ9OOBaanDOhT7jusXqW1K7o9MCErb/Jy9d4Kjn75NFfGyK22N++tt
         qs/Mtz56PYcm/tZiCsA87/GyHg7o0vitmgQ/UmdYGAVeipN3AUJ4A4YrpkBG91TJSPPN
         RaL+Wfz7napq/AFXs/MvNsZKdKGMYUG/LGNaALQ2wCAadaMd0jXfGcHA3/3ZKDcScqoa
         dFQQ==
X-Gm-Message-State: APuU4Z93AwKXPFGGh7fHtfSbO9XVBV6JuyTC6ZrR5arufSKyavHUAMjM
	+xaa8vdt+ovcYi04x/UldSQtMhKpNWbRffOAzp8OdxaFCNmaQrHXIiD/fDL144ja
X-Gm-Gg: AZFdTZeqYVSY6MUa5zVtsGWEo/wLw7KPo2K+c8YvjrcNePVk0JnNhMN46XBrhkAWhUA
	ORqTJ9sPyY7jnTTmPTAmS+O5z5c53r/m7Ot9s4mEHSfLfZSxrbJOcTOabXDDp20mHUuT0GMUjen
	tAd5teN2zKKf+hd2DYBLA0b/vZMHDvhVIA9k+wY9LEI/XxqFV+vzzxG08aVKUCkY0Zjc1zr8LH+
	iln72ZP3Qhm8VvPspmLozreNG8B/zPzlny5NdL2CaxZJNuYt6wfGVayalrFHPl009yM7EZAhV3T
	7uu2Oc6FYeVjfTtVdwJGq5yACevCVX1uWcuaA7UqqfZjuQpkgtx04vEHmBAiXGzOsN387F55o1r
	vQz/XTWI5rEnxPGZ1fEqgA1ihIu74xI5u2E6tfviCWAlclkP1myx+ZgjKAJsyBUeTt0q8paGUTd
	4pEqCyh939/McLpZ9atn3b7lNNY1LBhLcjp/Sev3rwkoijrk4PofTuWhS999S8U4f2WcLx2NBBX
	oBUOYvBzd0V6ZFpbCwOa4kVPWgqioEzRVy6i0EbnS778yKpac4jjFnQV22TwJjbxBb/619EHrL6
	nCrRPi1qsjS3uDWp6lfgLnabu5Hp+lsELTdI9SIyUXHJ2Rs5MxXJKdu/Yqe3FAZSgZoJEclc2UY
	W6yg54CjkF9wjBNloli012VCwMnNDJBuj1Xg9rlIDtK5G5VMYUaEPk23HWM3tseWQQ8CrgdKwlI
	rceacTigHJb1xJDarexvsRhVG8MD1yOmXDjv3Iedai1/Z18uUWp1ClXRqPkpREhW9pU7OOCXkae
	3bjIQ2uB24hTcM2m7UoadYqZ3mBJGYsADDd0NsPy4d55I1d7OKpAd7iZa55o0YebBT0nlLKc9h1
	wu33
X-Received: by 2002:a05:7022:f509:b0:1b2:41af:c21c with SMTP id a92af1059eb24-1b55694689amr20678709c88.39.1795753065538;
        Thu, 26 Nov 2026 20:17:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 25/35] esmtp: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:05 -0800
Message-ID: <20261127041715.1776485-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133277
Content-Type: text/plain; charset="utf-8"

The downloads.sourceforge.net directory is not a listing, so nothing was
found. Check the esmtp folder on SourceForge for version directories.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/esmtp/esmtp_1.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
index e60e1edd1f..07f2947ddb 100644
--- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
+++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
@@ -40,6 +40,9 @@ ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
 SRC_URI[md5sum] = "79a9c1f9023d53f35bb82bf446150a72"
 SRC_URI[sha256sum] = "a0d26931bf731f97514da266d079d8bc7d73c65b3499ed080576ab606b21c0ce"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/esmtp/files/esmtp/"
+UPSTREAM_CHECK_REGEX = "/esmtp/(?P<pver>\d+(\.\d+)+)/"
+
 do_install:append() {
     # only one file /usr/lib/sendmail in ${D}${libdir}
     rm -rf ${D}${libdir}
