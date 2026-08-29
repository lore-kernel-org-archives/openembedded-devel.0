Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2854C61DDD
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.253.1787962282804754124
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c82Gr0tF;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so1585563a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962282; x=1788567082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+eP8jHqPkUFttr1BhBoj081b5wcI3d6tdVsg7SsiOw=;
        b=c82Gr0tFfULMyuKVr1SMAAJb/fwbAv9eG8joJiGykLnludX9rg9vjAAdVXg5WPrEos
         GaTO0PJ+liYPVpFAWRtlxw92HtOw+RXoyxj0AUZV27PJO4fHY7e+NLBLU6qyLBgo1paV
         DKFvM1uu59yyV78SipxNma4QHZGRw6nWEhu/bn6W1Hcfff2RGqz8eg/aKox8desqLypu
         I/P29jLty+Z+Q5OUNPKphOIvXqqglNKdjsgXeCaGrnlh6ypCp1eULmnLxdR4j1DdT6iu
         BjfIHSUE37f+AgHu5LGBU3WnKF0eS//yUBNTsGyETeQlA+vgVno3KIVVKp9gu+Ows4a/
         RzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962282; x=1788567082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+eP8jHqPkUFttr1BhBoj081b5wcI3d6tdVsg7SsiOw=;
        b=hidgteR689JhN7vjsgtvN91VWFujuJ8msjYvRfWhYZsYzyY1u9bBEfhC28rdZFBE8D
         W2w2k+9/sg47t96PsVY6YBPOVv6vs6qUGEzZuHebzpqjFyhqzEv7jSn+eol32NX5h5QY
         SuKpbZiQiGAbRHon3UCblrlCQYxK9X5wuFfDcn6xOh1bJcogFCntHmDnGrsmmJJKwLux
         OveGd6cCUMI2YLRxArlQU56fMRoS2eYiTGhf+iTsFMhmSkQgCaWxPwjtkh5eb2XpjewY
         GKzfeKo4TcTxUIiZ9OmSGglMJZSaw4FQDBQRL+vGyApMbxkPjgU0aPIDw3go32f/qULx
         BJtA==
X-Gm-Message-State: AFuF++mBTlwYQhFv8mqsAiDtsVvEonvtLDmsoR1L08VHmjeC7RzYsbl0
	aaTl+deg2Qsy0MkVYCDH3gn61k/fNmPqsrMmQLS/yXQwvvpQzbvq760Jefesjw==
X-Gm-Gg: AYBFou07owM8XlYzXmVu3YkHjEgD4p/H1sazdsoV+WU/tBGpETjpU3JUnVsMFJxbwf+
	eE8D2O+/vCbWd/8pXjzPXEB7Pyohq90uuThJoH3GUDUdk5AqgDu61xw1/Fv1ltEUo8wao+m223b
	mdyUdHhKp20CX1VS29f6y4qbQhwb6ebu3sTCZnqDDeCwMB3JA9HhpxN7pIg570ePpuz/bsM7/14
	lCQpk+mcCIV10AEsbOg+waiIA/vXyEuwo1PQN7vMJZdcoWjyJWrqYptVDzD9rxRpPmEOIdMDD1r
	FCUqzGxuGC5Aikf3jzxO/1IUxAvkIh6qojhHYOWHjl0BBSX1vb+GmjBRJ2woW2NcbtOuVLRj9u7
	o7c6LhpWmievyM1c3l6/YObvHW0UKwbKAeyG89UpYD5IetmYofV7dalbneUavZwwvLBoDh2hM/K
	aTphyCouJOS8xpBnQD/LH0JCkJ61Y1fd0XtVrZSF+58qi2spvcQsUBxi+tkdbPkMgQJ7RrBi0uL
	VryWc/FDnvv0n1z53Ik+0p59noNFpAioTfpbXjbbaoJofylYFeQFaSdK2RAdEF0VYUMJR9wadFr
	jJqM4cYDx+fIU1nJvnj6QbRMVqfsZ6PbT2yd5NE+roJBOLZtnSp41/l2LTqQqTHZPeXpTdxtIha
	GqeL5TXx4U+opRgXwfNlBLi0N/ARaypMK+mwqQlrkgVW8iA==
X-Received: by 2002:a17:90b:1a90:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-396d0f8e80cmr18475793a91.10.1787962282096;
        Fri, 28 Aug 2026 17:11:22 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 09/16] python3-rapidjson: deselect test broken by modern CPython refcounting
Date: Fri, 28 Aug 2026 17:11:00 -0700
Message-ID: <20260829001108.559544-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129568

From: Khem Raj <raj.khem@gmail.com>

test_endarray_leak asserts sys.getrefcount(j1['v']) == 3, but modern
CPython's specialized dict/subscript bytecode holds one fewer
temporary reference during the call, so the real count is 2 regardless
of environment (reproduces on plain upstream CPython 3.13, unrelated
to this target). Upstream test-authoring assumption broken by CPython
internals, not a packaging issue.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-rapidjson_1.19.bb  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
index 5c47e06918..761676d2ce 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
@@ -26,3 +26,13 @@ RDEPENDS:${PN} += " \
     python3-core \
 "
 
+do_install_ptest:append() {
+	# test_endarray_leak asserts sys.getrefcount(j1['v']) == 3, but modern
+	# CPython's specialized dict/subscript bytecode holds one fewer temporary
+	# reference during the call, so the real count is 2 regardless of
+	# environment (reproduces on plain upstream CPython 3.13, unrelated to
+	# this target). Upstream test-authoring assumption broken by CPython
+	# internals, not a packaging issue.
+	sed -i -e "/--automake/ s/$/ -k 'not test_endarray_leak'/" \
+		${D}${PTEST_PATH}/run-ptest
+}

