Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C331C982D8
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 22:21:02 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20626.1789856456223059382
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 15:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C0MXVbH5;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a856865so1783976b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856455; x=1790461255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DOgUPe7F3cTXNxXbD1urzPg0AS/2lzTjjQeBHmrwD8=;
        b=C0MXVbH5zBY4FDtTwqwUIXCM4PMTt6+9BlhLIjm6kxGlRxuqg83ks03MA9KuAPURvv
         hrHXUmVlQcfeLZWkJC98bvnovS0x97kdzt6Oh36idON+uxeo4P2yg6CDsY7wMyPTIgIZ
         3DWy3WdAvsAAm2pa9qEHutP086qjmqviODnNEaTCghaBigKzaFYJsKMhchVaity6bTLh
         gdVUKlPUn/Cw/FrPYpCKsjxNMb8+ccvI0EjGCrq9GX+gv4Vp2oGScni1gzRBe81Oyv1m
         8rVgQE4R4yhmD0pPqSxlLCH2zjA3RigH2f87bQXH62QE1lO5yqafdjoDhOogEPuMoUMi
         eCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856455; x=1790461255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DOgUPe7F3cTXNxXbD1urzPg0AS/2lzTjjQeBHmrwD8=;
        b=0oR5s1j2p2kPZxCTiGtqN0K6g0KyC5K6/7BOe/H9ZedVXfEnCtLpvMXR5v19r+VooB
         EpzEq+w5TlLH6ZnRpm0cB4H0mOn6Znw1ZwE7sTx5ZT8vuukDktyElQbkeXoslqwgBLtO
         lG6a8klw5Y6Lwwe2OHD4bXNctmN2jFzhHOlTeyNRczVdd5IkMmEhwZd0gkit6GW/EVtT
         B8CDJmSFuKm+ZDMmpxQc6uma3iFuesB6kEifGsmjyOQ3warPhhiX4CjNfVELCmc6MbT2
         h3XzyqAJcfAti64FqwtdeSV3TONSBVewEuef0zWyA4ztinamVvA/s/jkg+ORzgWJVQqN
         PItw==
X-Gm-Message-State: AFuF++nYNEtg4I/YrZXbi6xdgHGqEnH2M0BAxeI/RbOGkJQ7+eH3GTI+
	0DMiq2gH7/vlbeuy3lFZEnf+QAO1Y3rl+vy6zM7DgQtETzO6XmK9l2lfxM6+cQ==
X-Gm-Gg: AYBFou3Jr9Xxpr3VV14DG/hAKSWZGr0OaDCGWv56mdXl7K8V2Imui85zNaPOEBDhPke
	qBv4ca2C50x2A5uhHWAJkC3aqDWLo0iNRMJGaOxAJjngvz6DZ3xXW2RHSpau8kBjWV8Vem/c4Ap
	gbDDxccdC6+QUziai2s/XjenMtSx76mp2j6J6XJvabPFqLxeTTo0ACkzL2HdD0kT7PBYXfV/EyY
	ThVc7+Z/ZmC3EMl8BBkW5gE38DvcEwUCQJF4B1JmusCArxkThP3FNf8FTLjgoiTrzwuG9xSb5L0
	ldsgi+An/FJ0I4WfAujh8uEyvh1z3/jkedfyQUtEHMzJU9usuJuYht8IPnjgMr7cAI3dWbtsTLf
	QaF4Lbg2sTYSGy1UpXQB1q7FFl1nTKbpa0azodMDp4+NrWnwe143idIAqPSA3Jwljv2ZOrKSqrh
	1uDGo2KiFXVHVsLa8i7DmdG9Mh18ykudRRVKVy4jRCUO1Pgg4/Wq3gMBRH3p4kf4hnLsNQX49Wv
	DJTfU1YxyLGMOs4AABDEFoxdjZwUutmz2q2JtzUfdEawh43hxH4i8YjZcIJAZiwZ1kPE7PlzBtn
	vkC87UVCWTeUrkyCXI+9viRu/OvYxS39hpQNKpLZN6EzUNlOtdl4qt+AFfCnpHZ1qzZlJZIVeG2
	uXe1EhB8h4Fl144b9OWgUzUE+t6GdzFEsY6YQjVQnZqJfS44TwQZAgZ1b
X-Received: by 2002:a05:6a21:e0a7:b0:3dd:85a8:4c5c with SMTP id adf61e73a8af0-3dd8c5958a4mr10576685637.35.1789856455501;
        Sat, 19 Sep 2026 15:20:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm10494651eec.30.2026.09.19.15.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:20:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 5/7] libmodule-build-tiny-perl: add perl-module-perlio-encoding to RDEPENDS
Date: Sat, 19 Sep 2026 15:20:42 -0700
Message-ID: <20260919222044.2143524-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
References: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 22:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130122

Build.PL writes MYMETA.json through CPAN::Meta, which opens it with an
:encoding() layer. Without PerlIO::encoding installed this fails:

  Unknown PerlIO layer "encoding" at .../CPAN/Meta.pm line 412.
  Error opening 'MYMETA.json' for writing: No such file or directory

and t/simple fails.

meta-perl-image-ptest-libmodule-build-tiny-perl on qemux86-64 now passes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
index 9fc32f3c95..3bdf9e5393 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
@@ -46,6 +46,7 @@ RDEPENDS:${PN} += " \
     perl-module-metadata \
     perl-module-parse-cpan-meta \
     perl-module-perl-ostype \
+    perl-module-perlio-encoding \
     perl-module-pod-man \
     perl-module-tap-harness-env \
     perl-module-test-more \

