Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F57C5DF8C
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:02:25 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.703.1787335344094977490
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MNTg/Lia;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so1063260a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787335343; x=1787940143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vQXCbuklQ5bi7SKS3Bqd2dw5fSunYuZCvJolc8tZhA=;
        b=MNTg/LiajS983im1q5wc7fG/hImcNDXKEwi/e/2KIf9ft2/pWV77BaItt/rqvu/uCy
         kTsY1qUDpOQxPZi3TNH80VQ37yPlJb+Gy7KiTWeJzvekQFVzPOyEJ7NyVsqtWFJDOJXd
         mPEVrJTw4zd1KyBRoE4idonMuHtemM9ovoiVwMSWLHuugqmuxKSxyBW0NJfetKYKklPR
         M38jD6JCdidsm8zxeO+mYDDDy8YOSykmQhAvA+69UlypVQ1i+y4Ga6WmdvXZnde5Vx2E
         m4HE1qkmB4cMHIDDbDc+CpsvrlIH6H7lRvHxwhrHOpqxKUEMfEfj4i6ARU57FnZXbFT1
         Ws5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335343; x=1787940143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vQXCbuklQ5bi7SKS3Bqd2dw5fSunYuZCvJolc8tZhA=;
        b=F3TM7Qnb0bpLBlWjoZMGU4RKLmVpBn8WbdwIdZdIbYGiLHVoqBEzv6Ag25zlit/gGN
         1QL1OeB2OfmoYnCpJnHfHgQJpOadNS9ISePaxqGiWYyctE7Lnhzj+BXIw6HoTVcwRo3G
         ykvQKmiL9Z3w+nyEMPA/pj6QSC2COOIAhmKJi+ZMJLtna5vTQFUE9jqiMTk90Zj3VVUF
         jmehc3ZhMECAHASBbJ9WRT2BJNZ70vwyeZaWjSpB4xn+HrowPe6wFrVcV6rLrJgWaE6Z
         9hGfZf7OiAapbJKOzX3bM70EzHIp+GF8sIXeAMF1Sw8u2gT6xdHlZBDPl0djo2JAvDoV
         gbTw==
X-Gm-Message-State: AFuF++kQyQTFjXHxbEMncSLUqNC5jghEc1qYYSJ/51A2SGwUZD0PUfTU
	AZygUoCewv+w1OPx70u1Qed1vspryLFM6BlD7P8W/hSZpp/Oon4pTfotoAeuh049
X-Gm-Gg: AR+sD12npDgKB8zQo1GXMtbZzoLX2M8eizGB/greyZZ+TFpTN9Z2pmXoEX/TGG/u9Xd
	YbNLiIqOqkaY2HaGkfnPqm5rW1uWRZMhxPXnKnmSaP5D8rfxiFkm5wKuHYDg4u03gbc3jLMmZUJ
	439Uhgd6dSNaNYuE2FT0xdz5XMW9iL7eeL70jnSabUBOW1IUWQC4soHIv4jQRT9riYuhPTUNK0G
	a0da+PiH7PAIZkUDKP+RcvbDj4QgWeamPo4DGkDsxG3JS2+3h4n7++ucvPbSCQKQe5YNQE+e8xw
	59WCpREdcJc0IxIYBqyrQ5curI5wAzu8Yn1b1x28KCYyCkIeg1zFIAHx6oRi0CgjVqo07znFdQ3
	57JT0MtBwiyxsCziklLTAy8Mu/+FbMCZvDC4YfEKdkaOaG1aOj2fivkxAVpPJF6vGnSv/opQUCE
	PaWz1aHAkPBbQedjPbHU3Nq2huewi42JHbOlSkm5JZ2d9XGrNf9nTc55TV7e0c9vcOJmZ9p80mu
	A7NySqgmJ0fBvH1EAdwmNE6KgZl6xyuL/CoPV0xhpdBUkpg8sl/7zJvRrWdeFSxVi8syk7EEjcf
	u42cddvvHKd/ns5WmFA8U557vQWztA/Ds+zIN6ZquuXRut2y/kPQQwvLZzZWG0o79nDeotH1G89
	NXEmTh6VdpGgXd2wsHBMS9BMFee2Os6Yf6HaCnI0d9OXguA==
X-Received: by 2002:a17:90b:4fc4:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-395dee88d49mr673562a91.4.1787335343123;
        Fri, 21 Aug 2026 11:02:23 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm26102708eec.3.2026.08.21.11.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:02:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/9] pegtl: install ptest data files where the tests look for them
Date: Fri, 21 Aug 2026 11:02:06 -0700
Message-ID: <20260821180211.423633-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
References: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 18:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129428

From: Khem Raj <raj.khem@gmail.com>

14 of the 257 pegtl tests failed - every test that reads a data file
(input_file_input, input_mmap_input, internal_file_mapper,
internal_read_file_stdio, stream_*_input, example_json, ...) while the
243 tests that parse in-memory strings passed.

Upstream runs its tests from the source root:

  src/test/CMakeLists.txt:299
  add_test(NAME ${exename} WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} ...)

so the tests open their data with CWD-relative literals - grepping the
test sources shows src/test/data/duseltronik.txt (7 references),
src/test/data/test_data.txt (4) and src/test/data/{blns,pass1-3,
fail1-39}.json. run-ptest executes the binaries from ${PTEST_PATH}, so
the data has to be at ${PTEST_PATH}/src/test/data/.

The recipe instead installed it to src/test/pegtl/data - one directory
too deep - and copied only *.json, so test_data.txt and
duseltronik.txt were missing entirely. Install all of src/test/data
to the path the tests actually use. The binaries stay in
src/test/pegtl, which is where run-ptest globs for them.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb b/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
index 2676231dca..afaf8f997b 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
@@ -12,8 +12,9 @@ SRCREV = "9ec6da187f840d8e804d42b9b7867f79d5d6adc2"
 inherit cmake ptest

 do_install_ptest () {
-    install -d ${D}${PTEST_PATH}/src/test/pegtl/data
+    install -d ${D}${PTEST_PATH}/src/test/pegtl
+    install -d ${D}${PTEST_PATH}/src/test/data
     install -m 0755 ${B}/src/test/pegtl-test-* ${D}${PTEST_PATH}/src/test/pegtl
-    install ${S}/src/test/file_*.txt ${D}${PTEST_PATH}/src/test/pegtl
-    install ${S}/src/test/data/*.json ${D}${PTEST_PATH}/src/test/pegtl/data
+    install -m 0644 ${S}/src/test/file_*.txt ${D}${PTEST_PATH}/src/test/
+    install -m 0644 ${S}/src/test/data/* ${D}${PTEST_PATH}/src/test/data/
 }

