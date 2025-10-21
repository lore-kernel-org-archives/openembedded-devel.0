Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3274DCCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 02:35:51 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.2340.1761014141268320488
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 19:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PlUdoe3V;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-784a5f53e60so15375327b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 19:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761014140; x=1761618940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2JfsRrA94MIxYuptpt0tatkhC8sO1lkpzRv3efxZNkk=;
        b=PlUdoe3V1rolaGI4KyBCyu8ZYe8a9xnE8wl46NWOWfboC15iZzc2tuO8QMEd+jbFZe
         5MmnuIAXJZ68o+hjYev5YYIqh4aqoNMl2fZYw900K0IqO5WLsSt6b2NorU63qYEuNVP5
         NhRHHYXQP3ljlcvZBWHu0NicxtQjRB06cfADn5VcWBV+fjfoU1Ung1y933Q9fIBSuGvK
         s+VBWvoo8B+6t08iaMSMyPfEP8olGQBxCeYAH3MZB7DNsCnBDYM03F0mlAJkglxfZd6j
         1YQ9YPHeW6PkkEdhBP8Rixrtu2Gg8DwNJ4u0J3iKCrUMCiIuQNSYB42AkM2lBP2yTOHx
         l+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761014140; x=1761618940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JfsRrA94MIxYuptpt0tatkhC8sO1lkpzRv3efxZNkk=;
        b=RHg5/S4xm9KQdlhS/BK9uldb9bCVKp+LmXF+zlYmuqeaxz8kW4BEyKgTggjpwZaI2O
         BeQczi5XwtsnKK720OLRf+iZSPqTAHkHFIfOBg7XUZMpHw7p0LVEzdiPqDOky24Od+ib
         NmQd8aLJmHrPEnIaNfhVCcG5tm4u170F1hjRxavsfYDOmR+OFaWcBLB00xuEPLaaXGWG
         KX7jkBSu7ntkBYd2HO4aqzcUEmF+51tX4erpbwPmhMI/IMDTATXcN/W5qSAB9aHHDn3/
         qIOJD8z6fnlAjvoKuhm71C0LhS3TuF0YoxYfAfxqQ+PdDPVBIfoFQdp+P3d7RcytTPDD
         JXJA==
X-Gm-Message-State: AOJu0YzUtYsR7IkzCT0JRE7zRI6FtUJsQgTLNtXgpzauPF5VBxqz+Dd2
	HbSRy6sCdl2iWG058TM6oktKF9pmUCLInfO10OZI9sjFPrAW2+wzpSuTiIYcbhsA
X-Gm-Gg: ASbGncvuf+UIKZBRZ2zivkmg/+mfXKtl2vjKsT9WaLz6sHgp2TkZFsPcu6h9gzbx8Jf
	xrSKXT015+2Rbr6yBALo8oEm12Wta2Xgl0SDHBaazzFndHTNaWJDMhsNfFF1YLOn3aPUmvTPKrp
	FiwMsxVzmhC5DoTscpsEnpt9NPQMU+/3XB4wK84fowTXA2c96oaB/C0Y9Y53DZBZGuxeLz23ovG
	mTODtx9LK+2qqlw9VRnP4PqT05nHZmVdM64sf5eIfJzT6Z1oHoApQON7NLGqZ2LFKC4+9pAWdwa
	9lhDI4a0kTaR0DHJlCKfY2I2fHEAyhvq6v1ulh93VE/mVxYqKXibCiBGup+ZHGZa0NazKjUHntv
	JeC//0B5RNM0dOJ+LLJ+AdysIWmrBm9LaJNfDQ+62yET0FcIuI2VptHye0F9L83df/8KQZktc09
	KmAskYhT3GxH7pPYcekFJRqlVCm2hRSZvAFIFRrH4a0A==
X-Google-Smtp-Source: AGHT+IEM5H+aB1jj0zJD+SheawLPhIkRqHXCOfpolVLfAeQV10EUZ+vvVLqekY93KwFC+Dn8JLdvcA==
X-Received: by 2002:a05:690c:708c:b0:783:796c:c19a with SMTP id 00721157ae682-783796cc2damr113013847b3.41.1761014139931;
        Mon, 20 Oct 2025 19:35:39 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7846a6c9be9sm25577737b3.62.2025.10.20.19.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 19:35:39 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.20.0 -> 22.21.0
Date: Mon, 20 Oct 2025 22:35:35 -0400
Message-ID: <20251021023535.127177-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 02:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120825

Changelog: https://github.com/nodejs/node/releases/tag/v22.21.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                                | 0
 ...oe-cache-native_22.20.bb => nodejs-oe-cache-native_22.21.bb} | 0
 .../nodejs/{nodejs_22.20.0.bb => nodejs_22.21.0.bb}             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.20 => nodejs-oe-cache-22.21}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.20.bb => nodejs-oe-cache-native_22.21.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.20.0.bb => nodejs_22.21.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.20/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.20/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.20.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.21.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.20.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.21.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.20.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.20.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
index acbe9442da..6d1a364be0 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.20.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "ff7a6a6e8a1312af5875e40058351c4f890d28ab64c32f12b2cc199afa22002d"
+SRC_URI[sha256sum] = "791b18e969ea22cc952108ee8eaafbb12cddfd973bbbb0b7fc116395c0d9a81c"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


