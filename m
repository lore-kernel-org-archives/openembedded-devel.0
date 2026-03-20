Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13720109319C
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 09:21:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8863.1773998480712666420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 02:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A1KKqoan;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso3902785e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773998479; x=1774603279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=69i7sBX5U+FzE+EJAeQnRg+bg7U3jrazZnViggab5PI=;
        b=A1KKqoanq3inxrcJckm2WcOjIOvyadnYR0DoSeGsxq4eGsW9WAY0Mqf99Q5PQETzxv
         mW2gnY5l94iK5H/BAvxwuyopSNG5o7tDuggfZHRrZ10aQrLO03fKvInc4GKBX+LhTqAW
         p0EEwKLrunTVIlc18xJUCcr4OKPrqkDNI1iPboVHTKHTkxhQSaK7vBov8GzfO2yTcpHT
         keiNibiywCCH3Bn5bJaf9XvxJ4KQCFPQ2YAt+s0VIjDHDK4/9DRpxbnR4oJQl/XYg47p
         p+OSq3sZtLFwev1XLkUea3Zg7AlpfN5JLRtF/R3nIEilJSLfMqrDMJWyUZev6sp8XYRr
         yGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998479; x=1774603279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69i7sBX5U+FzE+EJAeQnRg+bg7U3jrazZnViggab5PI=;
        b=aDYjOW6nmiJC50iLTWR2A8cp7hF9uOJjIYjjcX02XU6eGdrPzGDTk1kDpI1znYWcWu
         Xfz4TSS25nFG0W2ySt0wFVnJfiSDE+5itvh8Yud4+CTXjDeLdgMQW7VyDxyL0bcl6X2J
         0adlPaCg51yP1deXSJ80XP4SltLVOoUbfbSrLVN7tMFOmksZL0mshvfbL2kt7kKxJ4kx
         X1gqg+cPpr8mZrSTmnTGsfsylLILDME/Z5s/WBTQF7WBmk6gO6cOBvPmIOmsNEssWLDW
         Nh+DDIPab90EV8rqk3HIQpPOgqcg3nDEN2jxIze/Tki6LaOiCqUUcxFtRrkbY+whWPt4
         ykKg==
X-Gm-Message-State: AOJu0Yx7G/cm51Ngwc471MLS88/vK2Exv/NHm00JVcsQqmMq2CCBQxrP
	9O8Hr3rzHLkUHYL9yt7hKCpDmB2uac2nHL1nFPxy0B59Kge5KYD5BvTSSidJ3Q==
X-Gm-Gg: ATEYQzwT17Jiy7SoUwb6G0ruLDtziLxVJTbIZTuxMZN+zzPyUfzJuWFfy6Gn5zcbNUe
	bvfI7y8JBzqg/nMy64MmrRa1luYGlv5ik0OrHpVpT1CNXm3FALL7Cf3LwyguHCF+AcqUQY7W7qJ
	f+pgJ0PF3hdmppFMRkVd2UOO8i7y465GmTK5EB8o7sOGl+twWlfKbrf9976cTr/vhOm3wmt/4E3
	KmqXVvZQV3t45tSV/YoUZ2zgyPUwGBCzROXCCXdw41Ri9q4Pwi0jAe7db7r+25DveZDKAJ9e0/i
	MxyETFo161xxpS1HKShtmkrNYHlDTx0tlGJxCOL5lG/hYXKLVAFJTLw0VEJ8l1uAXNo8ToH+3fR
	u0l4NjTRpV8onv3ay/9py9QvDIRSe06FFaKzhUTPVZJx+hQ39ztyUObGTk3Jsa2F1IW9zbCS4NE
	DldELwi9h1JOome/sssaVW
X-Received: by 2002:a05:600c:3483:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-487012ce938mr15321775e9.5.1773998478591;
        Fri, 20 Mar 2026 02:21:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff118bb4sm18497375e9.2.2026.03.20.02.21.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:21:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] wtmpdb: add DEBUG_PREFIX_MAP to LDFLAGS to fix qa error
Date: Fri, 20 Mar 2026 10:21:17 +0100
Message-ID: <20260320092117.2718445-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 09:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125427

Fixes qa error:
ERROR: wtmpdb-0.11.0-r0 do_package_qa: QA Issue: File /usr/bin/.debug/wtmpdb in package wtmpdb-dbg contains reference to TMPDIR [buildpaths]
ERROR: wtmpdb-0.11.0-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libwtmpdb.so.0.11.0 in package wtmpdb-dbg contains reference to TMPDIR [buildpaths]
ERROR: wtmpdb-0.11.0-r0 do_package_qa: QA Issue: File /usr/lib/security/.debug/pam_wtmpdb.so in package wtmpdb-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
index b901e8815a..45097624db 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
@@ -33,3 +33,5 @@ FILES:${PN} += " ${systemd_system_unitdir} "
 FILES:${PN} += " ${libdir} "
 FILES:${PN} += " ${nonarch_libdir}/tmpfiles.d/* "
 FILES:${PN} += " ${base_libdir}/security/*.so "
+
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"

