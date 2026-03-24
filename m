Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC668FEC0FA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 19:26:07 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5491.1774380362952051650
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 12:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HEVVeVL0;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c76682834a3so88163a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774380362; x=1774985162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgrWCfFn+Dv/OMS7sJvg1ID+zimm+k58YZmH+gsvANs=;
        b=HEVVeVL0HjsRaLa3VenJjw5jfy3lyWWoSVez0GRQL8kemENrnHnWybkK8sR8S5/D1b
         iEMK1+4iEC4Mey7LpNBdeu+YwYfQF2GQ1dmSnQt7DpiR0154yMP5wqLlZnZQDIpBA32j
         xKy+0ysWr5qcMb0WD0xKdo46C2Fk4vaXnWC2ugaelZ8yO86j9AUB3vqwraRm8wUx+cx1
         DhAGdehiH/wuPDRr9i4X+TTG2uUxvm0MnDasdKto5PBYqw+IZAZxr3KsEh+rvQn2l6qU
         jOVq88Tj5kru5vuTyOwUOyGxEe/bLcb/cWIEXtpP+z4IJcyRMOjd0bIUCH3+PDk2ncMH
         5Eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774380362; x=1774985162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgrWCfFn+Dv/OMS7sJvg1ID+zimm+k58YZmH+gsvANs=;
        b=F3/6Wg5k6yMtlGCciszSpWk9Df3ySMcTXKuRCReQQ0vtK7uTAZjeSKC2eq+ePUkOVQ
         nfpEJcQXC3YZP29ZmzXFYEWWdcY9CfsfMlu0DGlld1UJK/tfpyzCm9yhxrnnmq6kZR2u
         QhsXmHVT14kKNd8gRmUx9kfz46Q/KMwyePtBguEIhsQjtxtXGS1kRzMRHnyxNOoUdaOc
         doe5uB/xlBD0mtPyj4ay4QGAAnampjpOKMvQ/NVEcDUv4B2dU9vQbED+sjoXBExydrJp
         b+mowmju9QUy4+giiETBM8bYnjPHBRBx7xJvt+9O6PuJpTsZfSiJvDlP+0v83+o2Q6TB
         nN/g==
X-Gm-Message-State: AOJu0YwNlW27wpu7QsiewJBmn9X9eWOnZkperU1auAEQ+quaw0Eda7Xk
	wkzrGVmWkVtpSVpnCCN/XZUv1kKlVTiFIIawHZ/tndCoAZDijT/zFLBQHEOxLIm4
X-Gm-Gg: ATEYQzwlK39btiU9dZtFR2ITn2Djn3Jhuf6B45tiQOV5RgEw14/yDqiH/kSa+4jJcJQ
	oqFexTfUK7L2ginM7ewk3G568sT7Ads5D77JyFbXeC7/Rf0SjzwXV6SXaZA+0ckZ34H5sh5sEUp
	RBy6ZzIbCp7Vt+55sTrOTUDglGarJuioxbDBS+iIjZ8v/ejSeNTGZNyML9XZ2ERsyCCC+JQGBV5
	QG1YJlPKdhc3UbuHVSScrtqF+HGuEjv0B8Pfm86QiNdoyoaNzD1TEFO2PcoxSg+2DH95IagkOB+
	S9kfX9zwMsuLfk6ndY4Lx/kFmDFswR9rlxbnhPty+4JMy51YAvk/2WWZvVfGb24h8588y0mwTeA
	ZqOlEjbLT9APU7c2/tWh6KgVQebZ9XEVlfmjdB7/EpDxXL6FydreYJV/ujRYVOwkmwZw0bcgD58
	aG83lFPanIXWFttHzeXNgfnTWicTVCetvy88o=
X-Received: by 2002:a17:902:d48c:b0:2ae:6829:d560 with SMTP id d9443c01a7336-2b0b099c760mr8244075ad.8.1774380361899;
        Tue, 24 Mar 2026 12:26:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ae1sm143752935ad.13.2026.03.24.12.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:26:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/2] freerdp3: upgrade 3.24.0 -> 3.24.1
Date: Wed, 25 Mar 2026 08:25:52 +1300
Message-ID: <20260324192553.2628357-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 19:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125585

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/FreeRDP/FreeRDP/releases/tag/3.24.1

Ptests passed:

START: ptest-runner
2026-03-24T19:10
BEGIN: /usr/lib/freerdp3/ptest
PASS: TestSynchInit
...
PASS: TestClientCmdLine
DURATION: 114
END: /usr/lib/freerdp3/ptest
2026-03-24T19:11
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/{freerdp3_3.24.0.bb => freerdp3_3.24.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.24.0.bb => freerdp3_3.24.1.bb} (99%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.1.bb
similarity index 99%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.24.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.24.1.bb
index 3c0fed5dc4..22b2c4859e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.1.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "b00402d3258402c868224b6ffed04182cbed78d9"
+SRCREV = "b6e770ccba87c58ffd0a55366fef33361798e39c"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV} \
            file://run-ptest"
 

