Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60502EFCD78
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:00:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10638.1773050444697041158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AHR/qBTb;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439af7d77f0so7280300f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773050443; x=1773655243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXBjKrVVmLUP9RL9WdZ2uwG/Io9JPdmZgAiZHVl23TI=;
        b=AHR/qBTbU1N1uiCzYyuKmHtBQiw6aOp/auF9H9RJiPpLldaY4TYpjgehBlGcr6voew
         rVFpjkhEebtSDn01cR0S9FBkKWgD9Nu0dUi+ItaVYAbnjeBYr/CHnLEYTf8D50h5oy62
         gk5ZK85pcMQhYZ3auqGQ066MoZ+IN5XZTfx26S162v7gj3x3Z1aJwdnzudTcXrNfGd2K
         9yDUHJRf8QwPp/N0swQSL2vvDv3pArIzuN9SZoniHV2+pl+y4fNVUSlPTSyOsIEv/fXg
         U7F9W/lAyorckvJVRmipNWUjwaxU2TA+P/3vVI3PiyNNf6G/+x2HJhZ7FuWrWJCUQPRH
         9glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050443; x=1773655243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXBjKrVVmLUP9RL9WdZ2uwG/Io9JPdmZgAiZHVl23TI=;
        b=lTJrswEg4kvhgtZQlUDlIvfBBYbvO5OVlY5NreBK9l0cGU5sQbCcPwF6st1rc8b+9e
         Cqp/PRrbhX4D+J/D/LyN3liSW5T5EY3fYsG9YBRv4q8oD76p01ZwBJCqF4lM6z91dcDy
         OZcdrXcyMQHiUrAccFM5e3nLRY1IM1vdac42moSRMthfOk6noz2t1cUUurk/c1pproc+
         yFQEGHpFH2PxYJNmXOfuN+3RgnGlNkx41Zc8bajSttmA6F0V9k1LzOw5gDCdKyhLvXvn
         qmHeoSQh3jE3F9Svn55YzkjARqfAz43ng6rq3oaOwFD+3YNs/esmloK8H72SDZWUjbGj
         DPbg==
X-Gm-Message-State: AOJu0YzHf+FtK6uD4ukxFBaWyEPQIVz6RXN6Q4l5P9tZxqpr1vg/anih
	xiBpQRjoeofVstyzg8MUpbm9xEJ/4Kn7FjN47Vs4Z/R5rwJU/kkjjUM9ZBiNQA==
X-Gm-Gg: ATEYQzxLhNQVUZbYSrNvEab7tgH23saw0iW9zzqjekcIYwmgkKY3YiUmxNAcVEIr1fK
	1F/Nvd2v0Eqk8t5i6wkyg1kH4+KnfA0O4+ahwdY+4Jm3O0Mqag/i5pT999iIbC9gU6nqQp9A/HP
	k2QqbzJLoYcvXMpYdF/41QN2tmG2MCBsDHoTp3W15/AbHx9d0AWOcJnkuzqAGl1dZ4mLy67Flje
	ipQLqY7O0W1uzjHl8ctsTH5dl+h1Rlc83y56JZoQExl6zPDRc1riL63/dgA2PG5tcZr/f/ZtIru
	xjdYXIh7zeZ31Lr8g1aK4+PTl++8awWj7BeVT1c1WlYFnWZMTy88HrEc6Gyu7AOkl3Q7rSG+91W
	IVhs1qomfrYHVQR5elZ+UHptonduWt+8AeLgO97z6OaG/ouWeY+P4j5nLXZ3O7PZ2vH2beQAEtR
	XLrtw0SspBWe/DhqusQQlY
X-Received: by 2002:a5d:5f82:0:b0:439:b5f9:eeba with SMTP id ffacd0b85a97d-439da354a2emr18359410f8f.3.1773050441214;
        Mon, 09 Mar 2026 03:00:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadac2a7sm25387971f8f.15.2026.03.09.03.00.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:00:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH] vlc: ignore CVE-2026-26227 and CVE-2026-26228
Date: Mon,  9 Mar 2026 11:00:39 +0100
Message-ID: <20260309100039.277132-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124971

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-26227
https://nvd.nist.gov/vuln/detail/CVE-2026-26228

Both vulnerabilities affect only the Android version of VLC, not
the other ones. Because of this, ignore these CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
index bf34146e0a..79de6405f3 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
@@ -134,3 +134,6 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN} = "dev-so"
 
 EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
+
+CVE_STATUS[CVE-2026-26227] = "not-applicable-platform: the vulnerability is Android-specific"
+CVE_STATUS[CVE-2026-26228] = "not-applicable-platform: the vulnerability is Android-specific"

