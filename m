Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263B410A1E6F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:41 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44804.1774523016029246409
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rZvv3xzt;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82418b0178cso432995b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523015; x=1775127815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sbZ3o7x2bpub+XUx9Y2qqiQPN35JqOu0pZYRENegbc=;
        b=rZvv3xztulWSWOhhoL0zOnSGNFw0WKWBbEgyNY8o5RKllCM5GAIsgQTVWXmTALOsIl
         QVblKbmQu9WDQtIgoUjUtSDPNH8IoPiJNrsOB67fPlhuPsKlEUdNIe41fIHyUdOc/yjM
         PsEyEICB/7AWcg1DIXfaOU9JrEp+0kgC2xrozRNUQrOoDbkTYHNQHKF4rbRbXm4HQ583
         dXQR6FTOKr3pvE0HjPwiUCvZPzoOMFfMw5ZGE/NoqpNObJ4lcDpGBeWWt3nrKn3b5ygr
         Ym9IVqmBMH94qHx7KAVfjVSnugECyfQWuXSE1p4fi8V1USrAqHjG36gum4SWNuFhOeSG
         M29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523015; x=1775127815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0sbZ3o7x2bpub+XUx9Y2qqiQPN35JqOu0pZYRENegbc=;
        b=M6bpw6312rvg5QZ0hJpy9Di28CyhqPuoS4eS4LCRmdVQG2PdjZp7F92aucSRhBsyNh
         hSdmAy6D7eF7cSsHwnYmYtVAprBzmlZ6QD8bAVuEFMFzKDhsxTYYsRXpGmk9vzJRCKac
         3ypTM7dtjqcDNFB5fc3EPrdZCaTokOY+CSLNkIvF7Hc0nM8R3Uzy8vTGRqol01Phtm7M
         kJ/2XBpBeQXIXIvXYOWzPaOq9KvDW26ErdWgatAudI2I7xznQhp1apNbKU02e9z8ZVBG
         wszIzPrDXm4WN9jRPITNnJi7nfm6S+H3cspJbyVCplaz8rRzo6EZAPG5/slCZgIwOSw8
         U5VA==
X-Gm-Message-State: AOJu0Yw4cDExCnJksLtIpcSRqUwyKw8vA0NU2vUF0ITXnYwwyTpM27Fo
	5pvC3nW4aiSmmriNgMC3H1UzeleLosr63n+of56b6usPS7pdsXBCLW/K1gVFyn/e
X-Gm-Gg: ATEYQzxWCvNeWruV7hVWA49zk2S4xdyI9sg+OL8ofFIpmR2EUGVox/6XBWO5SVb6TXk
	EhzfDDO6LFEPb+DjppIGIx/nbftyAJOazQZ97DHrYgaJizDxYGeFTnzyu+AHHUjN5O69kd5IAZM
	pEpg7mz0S4v4u+31RrbUoq9pA8SIRUc6Yn6/2ITBge9dIAjuddZKGFtIZxmUt3elP5zFV9piHRL
	4JhUGc4fyqJThH/s6/bp3HegTguo6viDBhbHXTLHEmRRx9laEfF6c0X6JK6eRNIzD6ppsZaHfzq
	J5crFjwnR8GtB3ErW1BHaCTCTiL/25+l1fJ7AMJ3lj82K9XJU+74ioU4rzMv/KVa/WE+vAGJRT0
	XMu4sw2n6ULwtSp/MAWU0TSHvMfwY5vG6PIcbfQzfo7N+BTpvqKDc0fMHEYV2EkKJxY9sU+fhyR
	CGSDBMhP3sqnzxZruLil0zPaDSyll7cu9hI8w=
X-Received: by 2002:a05:6a00:400d:b0:829:6cbb:fdac with SMTP id d2e1a72fcca58-82c6de97fd2mr6646142b3a.8.1774523015200;
        Thu, 26 Mar 2026 04:03:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 5/13] e2tools: include tag in SRC_URI
Date: Fri, 27 Mar 2026 00:03:02 +1300
Message-ID: <20260326110310.1809866-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125646

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index 06f0c28d6d..6581ac96d2 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS += "coreutils e2fsprogs"
 
 SRC_URI = " \
-           git://github.com/e2tools/e2tools;protocol=https;branch=master \
+           git://github.com/e2tools/e2tools;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest \
 "
 

