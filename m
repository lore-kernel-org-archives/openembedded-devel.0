Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4B0C61CE0
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:02:36 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.750.1787335348159684588
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qLxf8B65;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso14750775ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 11:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787335347; x=1787940147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLgBYj4+M6gZd6X7Oh/Jyob4Fr9RxKgysnPhgS4ZLLA=;
        b=qLxf8B65hLp183GeE7kSc77KDQoc3Xxup4bGENq3gZaNwXk2cb+uxOPtmPy1BVUjUx
         /IHM6bkRmUrTGtoA+T/GMtYnR8YIGh+nkyyVBzmON4zNSRcbn8rQs2+0nXvYMTT/R/lI
         BsU7ENJfpG2Rs3BEz+ngjd1Z/UZH1S/oP0ZYUtDHJlCTEWGsOxXccnifhuvxULSupIrU
         c3zn3vacu0INRdw5AAOypI5pSLSXwMw2KyQfkiekvJMO24hZatBier1AAEszo70S1w/f
         +pk+xekXuwuY/Zkzs2OsN0+L9m7wL3Miidgjs5ANOh+XyicxmccOXLdz2UtaLW+9ROmv
         hFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335347; x=1787940147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BLgBYj4+M6gZd6X7Oh/Jyob4Fr9RxKgysnPhgS4ZLLA=;
        b=CLTplQK4pJTWL+ABFCAabFFMF1NbcMl+CAAig2dRPFy+EhG2hu2rRb4KzlurcSXtYs
         7DlY0P3wTErMgMQOyE3G2cKJ7IS9+xr7KaMYZ3Fn7L8EiBmtQSxoi6o1yYKThQByCdWA
         loM8uRcEAcsZSQOdqZMdsdsELBuMfh6qgAH15hbAE6yFGH6NFVgj/fuZ5Aarb18fqW+r
         Xvmvaz9fQ+Wr+ppwm7yfNOWDD++k6Qf6qQ9eDz2cpPSX/h1TwDK1vjtVsi2yqzQBvQiJ
         xz8VHJehAuMCmOT1Ap8HcEPNaYk65q2gk46n8A3JpdTYD07uPEP43o+HWs3ooNP2vE0C
         4lmQ==
X-Gm-Message-State: AFuF++l94wPn1tk4eWcC8x0DjLoK40pWtf3fL/Zy4Px1cBpJG0ix9Kxc
	DjkUxgIku/mQUeWM9v5TGxohbch/zx6OQcTbqGRrCM15IKHUyVtyQd8RbWx5n4f3
X-Gm-Gg: AR+sD11CnEXaJAzomETfq96rVliOSeFKtA2yoCsyciwEnMnmOnbqmEYS4edCZcE6sJR
	lH8ch6YJXjtRAf4nwGz179TE/HpwMIAyCMXy2IowJfd2Gtv0NNLA3r/WIbVqwFSfxty8pi0QvIC
	XdsI3GxsWmdi+4YP5AnVYrT8iq3cNmrOQKihC2lSbHOvfnvI0mac0am31p1MZEenus0pE72XyA3
	hzWFK20zpZGxhEXbi+RYFMTIxIU6BTpsMLLwoGfpmxEbTdLAG9oDBGxxtWoX1lG73ZYib+GpvjH
	UAl9Zw7ZP7OOupTtD6Fpzg38eUyWh/0ppiyPVv4iRazmKmzaiyeZCnHpd40NWMXwMqZRhnGC0Or
	l98W2ervDANPsGS2gUuYHgnW01lexOzljSCLU+0QXD4FmofyzL3NGF/wddPfTx3iGyc26e0i7kF
	vt1QxiQlzmRPKMt5m/xqDeUM0ZxcGVA86osJq36k2GGP8QtYEVmc2JewLNm5E3d/gQGu7Yzw8Np
	HJZKOSRlGJ5lRLpt8pscQllDtzLebcCmuUUZpFSk5+3baw1cKrI+Vqha9usD+S1rpaMCZ4HI39X
	y5gNPbWtP8qAOEFt4NIQfM5M6D2ZwYa/bXk83GC8qyVPvNijNMGoetjGD7M4cmQk5Ebmu67tGpE
	PKhWfJd4nlM798QVarrNit+82GRTbwt6QMlU+UjHIrpln/g==
X-Received: by 2002:a17:902:ef01:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d64b036c96mr168680865ad.9.1787335347352;
        Fri, 21 Aug 2026 11:02:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm26102708eec.3.2026.08.21.11.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:02:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/9] freerdp3: install cmdline-tests data for ptest
Date: Fri, 21 Aug 2026 11:02:08 -0700
Message-ID: <20260821180211.423633-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
References: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 18:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129430

From: Khem Raj <raj.khem@gmail.com>

TestCommandLineToCommaSeparatedValues fails because its JSON test cases
are never installed.

With no arguments the test runs runJsonTests(), which globs
TEST_SOURCE_DIR/cmdline-tests/*.json via FindFirstFileA and returns -1
when the directory cannot be opened. do_configure:prepend already
rewrites TEST_SOURCE_DIR for this CMakeLists to ${PTEST_PATH}/test, and
the built driver confirms it:

  $ strings Testing/TestWinPRUtils | grep -e cmdline-tests -e ptest/test
  cmdline-tests
  cmdline-tests%c*.json
  /usr/lib/freerdp3/ptest/test

but do_install_ptest only copies *bmp out of
winpr/libwinpr/utils/test, so /usr/lib/freerdp3/ptest/test/cmdline-tests
does not exist on target and the glob always fails. Copy the directory
alongside the other test data.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
index 7d78f770f7..c839f7b7a1 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.30.0.bb
@@ -86,6 +86,7 @@ do_install_ptest() {
     cp -r ${B}/Testing ${D}${PTEST_PATH}
     # test data
     cp ${S}/winpr/libwinpr/utils/test/*bmp ${D}${PTEST_PATH}/test/
+    cp -r ${S}/winpr/libwinpr/utils/test/cmdline-tests ${D}${PTEST_PATH}/test/
     cp ${S}/libfreerdp/codec/test/*bmp ${D}${PTEST_PATH}/test/
     cp -r ${S}/client/common/test/* ${D}${PTEST_PATH}/test/
     cp -r ${S}/resources ${D}${PTEST_PATH}

