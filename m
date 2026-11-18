Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2573.1794961616452588807
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=01Ysh4mF;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a8cc11ac42so624364c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961616; x=1795566416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S1F/V85nU2RO7lU7Zgzsasfu3Il0IOKzbiGiS0PHv8=;
        b=01Ysh4mFVpTpLiLdT6gIlKBPo0SmIy2F5dZyOlTuYbFwON+GSdPe67t6YCCoo+PqrD
         +TnzHhPDPvq10I8H5yTTzkstHFU/1DAWBamvS1+gHgFq9q9+zBSpDLaC5BIn654DKlRU
         SMaobWvosGQV8uahMYWQi45Ag//MICbsy+KCltq0rL/g5pIr4Hh02WxqJpgpGjklpT9Y
         DzgU8Z7sqCLzEB1Mt1JQJpBw31fEuZ9xk6OuJsoREOKglHXKt/BanOWqAKGgkddJhN6p
         ughMSCBubNPO8f/VxGGJEn/QKYwgmazitUsrWJYoTHuroclheS0mligTZEzw91YAyS2q
         l04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961616; x=1795566416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S1F/V85nU2RO7lU7Zgzsasfu3Il0IOKzbiGiS0PHv8=;
        b=otNr97SWs9ZQ6zaqoMNpcq1Mp4tMANCKZ8lA2Asgs8z5/nbc9Ga9d6BmJ3GVA0f12f
         jaKOWpXk+SRELE4dwh79RSGbTRP+j9jq/zTcB48zy3dqn0QlULuqjf72ZOZduRpw69eT
         8+gOq4vyVeh0aJU1g3bLCCvevWj+xiutEYdt3r4yUhIJrmNuOVzj/axADqUZRbPwxL37
         2bKyQRvoX0fX+3VkpmRopnWjOCE1aCwLcMup1cWwwf9vtQvcTSc6G3Ur9Eclk4xLnGz4
         N+vsE/7Gz8YTo+fkOp4N7zFs9A3EacfX0fDgTq6zbZyjqKGNxl6Ldj4pyOUMfuuiKhPG
         ONrg==
X-Gm-Message-State: APuU4Z/fIIudZ3BCE9IXR750AGXL4E4L2gT+vKF4AOipSq7E2w2QvsK5
	G6dGsj+w24D+bo976Hi13Z8b6QVxCNhf5JRKzOWkMENp4FvHpsg+k4yyWnm+aVkz
X-Gm-Gg: AYBFou3hJ3sJNcMpNnYdZSAaVdlGKLV0ah6QPnG2MhNWRKOYKsE9ipi4zRc9UHX7TL0
	rsS3VayS+0nm8A9rkUuBaFVC0eU1FNTTbzmnjsA4KnKEgQkqphNycRd9IGZJLiLk5AKQQPihkQ2
	c6m8M4X0OQdJDDvxQ0yKH6MiFbqZ39fslwuxxodOFt2OA5UQ86SacgsTHjz505o/K/THaMLowcz
	h9nGc7FwVcTEo1Ax6LXcfmmvxXRfypDIcdktD6Z2PEfo28QHOou1PrN8MaBbaDNPlHNGCzyQo+Y
	ab8CgxGQAKv+R9FlHO0vMyOXFa3jxT9zVlLahPjxFAkku23mb70x7wctfsLWytxy3nwg0cJ3zYg
	spTgplZe3kNp0jjjWYyUyxhiwyVB9MY0EGjYxrtkq9DbCGvr9or/sdV7vgWWqcSBtUeFcmOcWli
	mzQlR/fiAXrb1TKAxoCRTWQCBXb1+UubYtE5ww+sz49rBXLSP6TIcZ0Wr2UlMKN9injgnGzRMh2
	f1deDUVkNzHaS6EVOKCJbYM9pCHTnXtgkEyFEJormV6X+RmekKXLBPW7oHWsqMl8jixcmfXFVYA
	oPQQTqBqdei97ZBHhIS8diAyzy8gK23CtHC+v3z2vf/oenDZibrGeukWRCT7+IIURpBIhRm32Ls
	maAtX06o1yIKxVeGtvBT5AWrYNhsvIFQJaj9tEu7usmpM3GoM7zniK1MhAP+YF2r1lha9OTQq6w
	pvqyfNDHQDJYKcV+3yIbz2eOZod990VnaIAM0Ev/1281CLMiJewbfK0gahWXuFdjpeT+rGfnx7g
	e8vZRTLC2gunGHiPXvxDaSrVgzuTau+9Zr2OahADuSVByVwzKkpVF6fAdeZUZ6YdlXblUrka+tE
	u0U/
X-Received: by 2002:a05:7022:29c:20b0:1b5:1f62:7b68 with SMTP id a92af1059eb24-1b543d2f1b3mr1038622c88.44.1794961615605;
        Tue, 17 Nov 2026 16:26:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/14] cxxtest: Fix LICENSE to LGPL-3.0-only
Date: Tue, 17 Nov 2026 16:26:37 -0800
Message-ID: <20261118002643.29829-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132610
Content-Type: text/plain; charset="utf-8"

CxxTest 4.x sources state 'distributed under the LGPL License v3' and
COPYING is the LGPL-3.0 text.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
index 4eb4e8ecbf..bd4cc62486 100644
--- a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
+++ b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "CxxTest is a unit testing framework for C++ that is similar in spirit to JUnit, CppUnit, and xUnit."
 HOMEPAGE = "http://cxxtest.com/"
 SECTION = "devel"
-LICENSE = "LGPL-2.0-only"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "http://downloads.sourceforge.net/project/cxxtest/cxxtest/${PV}/${BP}.tar.gz"
