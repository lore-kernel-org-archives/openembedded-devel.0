Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0E5CDD0E2
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.21958.1729612101203569908
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzkiBV4s;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e34fa656a2so54367767b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612100; x=1730216900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1Hje3uSJL2vdrQmDqNR6wIpA9PO2xOgxt6yjuf0j48=;
        b=XzkiBV4sYJ8bc9e0uoLR4iyJTV/UHoEU7BxYQC1pkpwNm22HSP2/Q+WFXowk5RcAe+
         0EhyHs48fdzfqVpaxdKBeBW49wWd06VuHgbdTavmbIRbsVRaS8RT5WI039Gh4F2EhzCe
         6DJFLtyyqr8w1ngX93QQxsBcS7iGO9ilR8wBqF4Lrppza6f2CXkQVqTpCE9UrzjASYGg
         ujdBkhRSkflVIKC02sTOLPf/ldpkfBA1dAymKgorzMJuHio9dCNQW7mMQFaGCcmij2Fv
         7a5febkJ6Rp2irJUHk8JiDyUpEJyDhalhI+vr77VBs6FSDrlKVZA8nIiL+Yz8fsZlb5f
         z7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612100; x=1730216900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1Hje3uSJL2vdrQmDqNR6wIpA9PO2xOgxt6yjuf0j48=;
        b=LSMNz1p+qdcPNy2Ld3MCKM4so553Cl5TX+YMvOosqGD/qoBdAPRAiIMTrRnERTONzE
         fxRcwtCOfEpo/lPkODb2dek4WFQpFyrncHu1QwHrET1WElX0R67yPAAIST18VFNf6yup
         4fcnTify9tbxv4mTTFukFDx7v1VW7AlHedFIRe5FrjxA8XEe2oXP/rAdpCQhIrJfOC7O
         /+dk54B+JalvouVppp1l964YFOhwKaJtnOmkkj0DS8gWnVSzWYIdJMI4w3LN1sgXfOzz
         doLUG+aj4CGnANFSYnjVbUhTjMlJaVWZUvMfh9rzFwQhVqx5bOVNA4csprKEmnwb5fp0
         ztdg==
X-Gm-Message-State: AOJu0Ywl7z12btxeP00RBGFVFU5HG2hzgHV0Dwdb3oPnWWR1wWn+lSTl
	EspcOSP2LqK41aaTcWsrE6Uxn1qMcCa5m8GZ4R/TJU502RWu8b7KQdMDeg==
X-Google-Smtp-Source: AGHT+IEo4w3TUXm4a7vVFCTDN4L1mTrNOkIpTYvsp9DPi6xgo4RxeGz7NFojI3Q5ApikxI+O1pyr3w==
X-Received: by 2002:a05:690c:dd4:b0:643:92a8:ba00 with SMTP id 00721157ae682-6e5bf3e0daamr145439707b3.0.1729612099976;
        Tue, 22 Oct 2024 08:48:19 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:19 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 39/46] libtest-nowarnings-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:57 -0400
Message-ID: <20241022154729.20331-40-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113130

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
index d74a34729..aea0e7e0f 100644
--- a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
@@ -25,7 +25,6 @@ CPAN_AUTHOR = "ADAMK"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/A/AD/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "682ed043f7d3e38f3dfd8745fd21c49a"
 SRC_URI[sha256sum] = "638a57658cb119af1fe5b15e73d47c2544dcfef84af0c6b1b2e97f08202b686c"
 
 RDEPENDS:${PN} += "perl-module-test-builder perl-module-test-more perl-module-test-tester"
-- 
2.43.0


