Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2522.1794961610744005176
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bdWHgJ0t;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1234351eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961610; x=1795566410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tu8EMG2GfHTG+YE7UTGd2RhueVUwr/Cg4Bk64yBur6k=;
        b=bdWHgJ0tCtKuxKhB1DY+UBUOdfRp/8KoOIjy34vuigZnqyf/AUw4egWb1DEadu5u+l
         pOEAmpFMvpd0Osv74pu0UKMKzruo/RcOdpKJ4r+adxgExibMywyCS7hk0CpN9M0eq34s
         XnxOfso6EPPkz/iphYxbv7x4jXiAUsFP3riFwyK7hbOL+4N9/usHaQc/SlwAnyuqomwb
         wo974JPLmkFgucjLVvchVj+ihT4k6ChKeqKx/GN2T/4+LY4Fruq+FGkts+cIKT3NOqST
         o0a8tAFL5Hxo0VycYW+3GWzUcdnBQVZzw+KQIei1KXz7EZXnxEKUg4UjASYa4/eehq1o
         EHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961610; x=1795566410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tu8EMG2GfHTG+YE7UTGd2RhueVUwr/Cg4Bk64yBur6k=;
        b=BNFhBFld6hsrwV2qcbhyHYH0j7MTowdMg/6uy1iEA2cKjSaKSMKRXTMJJk0LcZTq8W
         ISZakXrObWx9ca5jSWf+/Kl88MjU0quPBLCBQU8CWsWNaqeWPJntFUvcSUeXifDCeE8d
         LyDMfEiNFFpjvUaktM1WHAvEKOXzoIMpB99UeUo/rmm6ufKQ1qTIAmCVpSZzIt8mTHcd
         Jhh/lx4KZ11X0V+XdDRbjlDqK4/mMXz2w3PC0m+ucjEbw8tvnqah683NoYzCTsAReD9P
         5k8JqsLdgaZGDqJ3ds6+Tm2LO0v6aOGHrKn/FVFPeSmKuIJesL0RZSgZYbl3rWeO3Ji3
         t8bg==
X-Gm-Message-State: APuU4Z+l7DCp5fNr5YmCknhH0X/q1GjmnqUuaerYW7IYo31j18BWqhv5
	pG2QF7Pp6nP2oKVWGmITq6htFWV67jK0gzkZG2VJNbJ5tNuaZOWwYiydNOuFNknp
X-Gm-Gg: AZFdTZeE23xTYLYt16E/BHTV4MSMdALCac1qcXu7vQsqgpgLAArbLPSIhEUTUk0jSiT
	pa1nhSnVyq/h+l5x8z2juZUr35F/uBo24e5wH7owVNmvY8oYvAYW48I1Arg7e/ARWwM2as1kpXM
	OQH0SnYAHvglzbNUz8fNOj5/UIDjNdajhYzeDdanazgmBKMt5yTacBhb+TAi0tCzvPg4Pj0M+Bk
	wtG4jWfVZayraJpf5gLYkEKJwLCJEno9VQgnZ6LT9dYgMYLGj1VpMOy1YbyDSvIaeUg9QyDeE9O
	6jYdBHm3kzmILPvxjj8VrVWLzcPeytUefb08zVGcMqgf6rpy4BYyImR7TglKxi7I4n9s6M9qUyx
	Z/JVzB26z4pkpDs8bGFlXbtx+v+kODWH+pZcFtwGXE5DlLKc5kPdK6aqaDpoH13DbtkTHoMMmai
	GAep+uFQctItDSeE8osFCKr0gmrqL2DHRhfdrq9NwAZmG80/Il5M3dqdE1dyFJ+ZmwIbE9iTfqW
	op23O6L++tm+W6y+A6J5e+T711Ao3jZ3NYRP82WjpnbarWPSmRVu1qeGD41A0pHo7ySuCqtJdMl
	FOQswbcnKGZYODvsaHk/GgoOXd0HmtU4mMeP1987ho0R72f+TlWFnpjs28YUvRETBXm3Eludg4H
	ERkdHE3Ofj5tc2Ar0ba7t2xuPrMoK0tTX8h7/oCwqacGTaoCvB6L4mEVR8biNF3B3X4FVGj8CzR
	jShLi8oBQAwvOUsHudjExo5+bNFWVAdYfbndpSJobGC8C+U4iD9SEzeUsKecXbBeYoZnfSmLcaq
	TSeTAyrYlsJr+pVsuOm1oMjCRQ92qaba181lx5n9AlaxDoUtyIk/1AKEoNoVVsvpWTFbjPejMoW
	HriM
X-Received: by 2002:a05:7300:cd90:b0:381:1eb7:938e with SMTP id 5a478bee46e88-3827da107a8mr1472713eec.4.1794961610041;
        Tue, 17 Nov 2026 16:26:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/14] gtkperf: Fix LICENSE to GPL-2.0-only
Date: Tue, 17 Nov 2026 16:26:32 -0800
Message-ID: <20261118002643.29829-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132605
Content-Type: text/plain; charset="utf-8"

COPYING is the GPL-2.0 text and the sources carry no other licensing
notice; only the bundled gettext intl/ code is LGPL.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
index ef9b194f9a..815c7985fa 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GTK Performance tool"
 SECTION = "libs"
-LICENSE = "LGPL-2.1-only"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://prdownloads.sourceforge.net/${BPN}/${BPN}_${PV}.tar.gz \
