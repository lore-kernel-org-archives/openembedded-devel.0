Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C92ECD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:49:08 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81469.1781016538369599808
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kEUkXy/T;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1363fe80fe8so8061055c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781016538; x=1781621338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIKDFPvlI33XCTaQunWcbB+BCy3yXuBCmuiKohR8nY0=;
        b=kEUkXy/T9BtMBXfmzuB5QGPsxfLE/MDUGGmW6R9Ore6V867qUIp9RDKtZzb7ysWygS
         bKVGg2qiKiQjn9hXWMsfiCotT/GQrc0gJw8PxkVKljmwFeNRSBiZ1NXYQa/qjBwGRhPN
         MPxWXAdUPp8CnwLfMSUD0WeJdkKsfXXHnm4hG/cOAzPo18HKnjYkoVT3XRjMO3lNZ6f9
         bcqQsuyDUMXFKAOe6foFpzHScJyYQ2/qflmTTG+3Wuau5/Nkztus/fosHxcGXTqgtKJX
         4YKlFJNzVMpxuV87+Z+OcfZ1bCpBSJfKBeKK2frPaa0WDUbz/+2y03XUyfRHYEziwjdQ
         p0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016538; x=1781621338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIKDFPvlI33XCTaQunWcbB+BCy3yXuBCmuiKohR8nY0=;
        b=OxnNXV/QUlQgaQ03zMFr8yX3tOAHdAlqflM2z46sPeannGPRdsdM2y1MsnvRXhEw8A
         IpdXzYeNI5ex96iNuhcot1QFcPoMvgFxwyk3EzsDd5FImk+ZPy/SHox4qRHSklBp3MQa
         HlMUnTGiipoCI9ik+m9sSlTyxQY34FFvOu0ANSR/JV2Nh6d1aKVQHjr7oZt9kQJLii68
         bWoMIZfmWsHxXyHTgpmf4lWtttgKWv58In9yLAlMkMbrLGYiaiN9mQsjiJmUM9QaQExo
         4SCIcwTZ1Nrm+mKZDbIOVqrEarkLyRpvnmfeL8fbIGOK7U5MAt6QrTdPwrL6WUY8/WKu
         BwnQ==
X-Gm-Message-State: AOJu0YzTwGhp6TnBRVIAqg5TuwgN4VOFOteFcoS6mMQChnUQo51AN3LR
	KBhxK2lpXqatGo4H6qJ6T01mV6uz/dGZ7zXVOegE5RhXgNqHYxfsuEUZALoZY66qVA/v6Q==
X-Gm-Gg: Acq92OEuECvg1ZWEZrR1TUFd0hhTYGjWBqg9sA5DI+jp7ky+P+JVvJWOjogxtnObdj4
	SqwfU3EpxGoiDsrBHsrwdOjw9HtEYpnoPmh76z2ekA3kLHXTfIZMryl8d9Qs1Pt0I771PWY0qrM
	EinkIlnpDw5a5SMU4J9OU5k+nJqQ1L/WVkvm65iOyP4GSvkX6m0W1UWYsT1YwKFC5QG7URoX754
	kZO6IlYxJC9zLBDF0g7ynjf1gVbSNmbkyzS6py0XVTFtnEyw7Z0rnmfAxqzw41X30I72tLLCSc3
	Et3Lc9x2IYTCnfPDU1DXgf9ccKN46/74yNn1fLY519wIFIi7HuYGHq6JSdczSyO7kl4G1BSwKcJ
	kW4hTnPEyH12PgvF1O0knCMR1vtECt8tO7Qe+Nm9wgwJF7xPiGx5b7ofwXfC5bNBWXTtzxSoThN
	RXyyQ0Jhikc0sn5yhv17p7wP5asMn7xA9jkvQ48ypewbIlbSR8oLOg+LD6Ul3GTAJ2rNvHppGRq
	Jo+vtTj8NVRkpHL5QFR2CXZCJ7QnCg/wwhDijunFG18AVPDVPXkWAxqnWESKq+1A/II1vibR1qK
	kB/n+k8vZ8mRjyV5tdEApeJyCxs/HpxB3Qi6SSLK5pw36ezNziY=
X-Received: by 2002:a05:7022:419:b0:138:177c:b971 with SMTP id a92af1059eb24-138177cbdccmr7470148c88.29.1781016537643;
        Tue, 09 Jun 2026 07:48:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f548ade9sm14899314c88.2.2026.06.09.07.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:48:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] python3-scapy: Replace oe.utils.all_distro_featuresc with bb.utils.contains
Date: Tue,  9 Jun 2026 07:48:55 -0700
Message-ID: <20260609144855.1473568-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127499

oe.utils.all_distro_features is being removed.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
index 678aec0135..fac14221c5 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
@@ -42,7 +42,7 @@ do_install_ptest() {
     # note1: if ipv6 isn't enabled, skip the related test (add '-K ipv6' argument)
     # note2: to make this test work, your ISP also must support ipv6 - the test is trying
     #        to ping google.com through ipv6.
-    if [ "${@oe.utils.all_distro_features(d, 'ipv6', 'true', 'false')}" = "false" ]; then
+    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d)}" = "false" ]; then
         sed -i 's/UTscapy.py/UTscapy.py -K ipv6/g' ${D}${PTEST_PATH}/run-ptest
     fi
 }

