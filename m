Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48526.1795411852975751891
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iKz9l2bc;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3712b6d9843so2375079eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411852; x=1796016652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOkX1sSpBcTEptWpg556LGN4QsSwo3NOEm9uNpNtOzU=;
        b=iKz9l2bcEURUakXrn/otEJx1x5PhsQDfF254GJWU7j4Y3n0Dqf1cYgtPTnLIq1q+Iv
         ZF2K5KB1zotF+xB/JAlvi2Wg4MrrBTyt1nv1okIl6IrXSUYSVNPBLEkjKm5TNHKh5Sjl
         JNqbhpDGZXGkid6wHOTCKaehxyE6j/UCem/7J430Xp64j6s2FxSAuHnu3ljL4tSLm9G2
         7DyAHs8WiUMUQeicblvBqltKdN9koc6bJHcx+fjW2okmhDm6YoMvvJ2wIfwYLHZJu2ft
         4CvE6+Vld21mYatPdZM5NezzIHGodR1dnOdkKlaOO7PON1kNh/jSr0tTQMQe1V2nLk+z
         i0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411852; x=1796016652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dOkX1sSpBcTEptWpg556LGN4QsSwo3NOEm9uNpNtOzU=;
        b=uNxZ1Q8PpE1ymfueBuys+yM0IXrUaaVKwi+NKzaBYuncwCIzhYjIQ2R5T+X3fae872
         j2rjY6Mdcx/IDzqIGhfi4+KTpy2JmqphuHccpPtbCgDk9Ll2DN/29YOk6Koy49xqGgYw
         3YNNIZu7rivS2GK6u4TumrXkMuber/auJsTtpzyOv+QBQ9oHiSHSmEstDxOay2Ix/9y5
         KS2IdTTCKxEnuh4pcAu1uLcJe1K8sykJNtN+ElDHFvPPyZTIM3/Rqjjup9C1aQ2xzI2B
         BXOrBbGue2I6kgc5oa/4ySlsGUJOVSwXZ5NYcoI1o/3b+WQ29colvDDg6uRNsIDbUWxR
         RU9Q==
X-Gm-Message-State: APuU4Z91qRHSiwhZsFCx5HMJGu94qZ64YfPvi6hXTziBfbfJMFBDm1j0
	1McY/EzqglvTZ05fHo4g07ODdWd4dl8BYHGGP4ytOZ+xvfRmLSvqAK2QuOtX6i5SICk=
X-Gm-Gg: AZFdTZdYNKGHRvkTY8EWcjvftq0qjJwZt/pZ5idLxozVFnJD/BdR7HAnj+87kjco3Fm
	Lwy/I1M2YzVPaKXLQclEheY2R3CRl4ae/t0ah/QFXdoN8Ce/MLj1cQ61ZUrAeldohB/CANZalwc
	kp4LWz2JqW1kDylxfelEfuO/jmJCOHeO5skJapaZlTCd09ty4sd75oiNGuHKzMbL7MwSoEGXamN
	hlBBR1t4hj1NUNHBS8V5FAjHisC0HBWDJ8fAiegnOWJtT/T3j7CJ62UmOA71sgVWOdXfIG4aLe7
	NKn97q72GHmDU9t/2CUi0szlRi5hPDn3UUBdT6ILis0q+syVy0wqn2zLRwt2HjGhKEStGZZc4/U
	2oNJEO6FGYh2782YUUizDZJYccAgRughLQR+Cr2i+Lq8wgmsZ/4pvYiDjDlWHUSQlUXRV0QSk1g
	G1mH0+Sfy0WC95c0WdsYSvr17YGL5O10vc9FiaKOTCWXK8ZrFDWJBu2aEoVHPcqBMB+CfhNOxfn
	hoGOWuolxvMC99nPbRzL0VO8Qd5HeP71yneFcDjiQ3A3FHOE6SAX6IfLg4YvIl6HLNaP/OvdQv/
	TdzwigpyvW0HakNdt38g5ARJ/zPZELB0QUDwz7GFMFxXumxXVSWDGvbis+MAvJCmNydqCEfmOl3
	35TO6p1beyJk1+qgGx/TFEbknMwtP0S5RwCDk5MCF1gIE+T/Biu1jqFzz6/I0GzCvIRgsW6f683
	C8ZdtB3L9whBXI2MMBZ0SfzZ7Ugkh+I/AmBegWKLBYkpzMhYkFcfQQPChjaK9yhsh24Jpka8FHX
	CIM2SDq1buJ7AjJkvm5YX70GrkSuAkMHE3v/APYaI48yMTF/+wK/mGuiq8Qn7brT3YatEjXrg/I
	V+F1
X-Received: by 2002:a05:7301:3d19:b0:384:e31e:3c39 with SMTP id 5a478bee46e88-38571411024mr14115536eec.37.1795411852321;
        Sun, 22 Nov 2026 21:30:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 18/42] iperf3: upgrade 3.22 -> 3.22.1
Date: Sun, 22 Nov 2026 21:29:02 -0800
Message-ID: <20261123052953.3658549-46-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132833
Content-Type: text/plain; charset="utf-8"

Bug fix release: iperf3 builds with OpenSSL 1 again, fixing a
regression in 3.22; the 3.22 release notes gain an erratum about the
swapped CVE IDs CVE-2026-101283 and CVE-2026-101276.

3.22.1 is tagged on the 3.22.x branch, not on master.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../iperf3/{iperf3_3.22.bb => iperf3_3.22.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.22.bb => iperf3_3.22.1.bb} (90%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.22.1.bb
similarity index 90%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.22.1.bb
index e6d60f611b..84a1bbcc09 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.22.1.bb
@@ -12,12 +12,12 @@ BUGTRACKER = "https://github.com/esnet/iperf/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f2eb355b6d3b9d63b6b7a861cdc62440"
 
-SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/esnet/iperf.git;branch=3.22.x;protocol=https;tag=${PV} \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
           "
 
-SRCREV = "926bd905501b792bd082d2200d1d1a84aa543e3a"
+SRCREV = "acc0ed500fb2c421999948a72bb6a9e05af528d8"
 
 RDEPENDS:${PN} = "libgcc"
 
