Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68EAC5DF79
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:23 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19828.1786922656312443502
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QgC9U3AM;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2071401b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922656; x=1787527456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RA61DMjcyGr2WUhYiPrexcdqyNOj50gPQglqKykyGfk=;
        b=QgC9U3AMaVO7meIm92xXFuU/zpjY0RKJlwKk+Dxm7QInoc69Gd8zEkbZWuADbmrLVe
         ACOu1w2cy/BtFtxHfS3QbCJ9WLA/PO0/1FttDhM7uLPQt2i20DepeLVCs0Wn773tdxc+
         kx0pEM7QSi/YrNWVa8MYerLjBevpIC4hPbMezPdw6ak4zvD9yEXKnoxMISeavaTeLmRp
         CYbg/ikwIi3SJg+ioR1QbAhCJtGopArpoA9Uz5E4yu7NLTG5wsrhLZ/PFh95LwaGMVKy
         +3is5DV8uqcHHT4pSaejwSZNFAo5JYklHQRdXNHwCCNMiKLD7QHlsLO3HCJ5jLcD/ndQ
         WXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922656; x=1787527456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RA61DMjcyGr2WUhYiPrexcdqyNOj50gPQglqKykyGfk=;
        b=NS9T8oBHWcPBP3fZATitfb4SdZA+jTuSFx7idN1xS4XgwqxQgIGLQ75AA7ecU02jnP
         SnPGG6H4kYtbBugjJgDSFHQli5kwuaztx8k3QAuLTTscL6piB2k5XgbUyb5lF0YAsYv3
         vIq0u8H1Jur25BpHp/cDkpg5a1aV8E1AaoDMZlE40yN5e5K9R9nEEL8NhCmqotmNznf9
         abpnWe6gzEpXjjkevn87ugeaGDDpFHDBIuciL5PB1sK55q7eRZ6zFev9ZWkHUuT0Aiif
         UriGVX32rCz1Wxakn1ZaQkF2Hq6tDQDP28l7aqhnk8uX/QPTq51W8cPzOcZnn15g9cRe
         SabQ==
X-Gm-Message-State: AOJu0Yy2vziRCg3H7cw97Bqi+/Z0F4aUL3Uko6q9vUDBPyOQcJEQZlgJ
	mPNy6Fn68IR+KTd94q05sr6+uTapzS7Dt5TVEdeOniRL2paU8cGYxMkQ8oPtMJrm
X-Gm-Gg: AR+sD10y+lUWqhrkddb+sp+ZMg3d0em0s39hkgJuzY8we4crX9BBLuqwKkU3z7Go1RO
	xuAu3FhiM/FCwjBXeAfMAGyyJj9DN4piu+fM1Subvd1uUdl5f+La6S20aHdMpnbMADqnhNfCRX5
	AGbr/nin1jfQutv1YmKIpjuunbj7K5Z4eOJ50DUoHhKYSOrz5psalh2vRgsKmnfxWKiHH68UX0h
	7M3CXKVVfBiiksUZ2WsfZrUHGjUjSY1ameezNpsqsdhmdCE+8xIYKk2CZRczht3x6KFB4vltM5G
	TPIDj+bG0w3LwJ+fHOIGaT4mTO4zYTCg4UEGtqNeuN2Ls7cETgqf2X2IjDun01fLF56JOJbPrNV
	mNTkIeqUzuB/lyB/VZZJ7D0ecMhneYEbD8ng8qzRlh50SvORGF4QSDTJUxkHOcO2ob9ae5z/Yfe
	O2ZjY6hQ5PHL2kBsZVKaGYu8Kl/SF6HXqGa0eN3CxnoevJEaSyFGcZMJ+QukwAAEtdRrvjKS2IH
	Zgl9tFK2lt8XvvLqJdu+coAHpNwqJ41GJ01jmdNHmnQ/40r47q4ccYfDcEESYs6ZDVv7SNfND8e
	ctkEVOffH/+AVhRDXEG31FdHkh9yr7aEIXd714u1oxaWJ8a9E788mc1F3pF50gAea/5IJjNKEoG
	GhCSlgnhTsot5wFF5kfJ55m7dazvDICqx8/VR38gzdKUF2Q==
X-Received: by 2002:a05:6a20:7343:b0:3c3:a722:59cc with SMTP id adf61e73a8af0-3cc71cc65camr22222231637.22.1786922655381;
        Sun, 16 Aug 2026 16:24:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 09/12] python3-pytest-env: add python3-python-dotenv to ptest RDEPENDS
Date: Sun, 16 Aug 2026 16:23:55 -0700
Message-ID: <20260816232358.1947922-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129186

From: Khem Raj <raj.khem@gmail.com>

Needed by the ptest suite.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
index 0930573448..3ffe73b864 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-env_1.7.0.bb
@@ -18,4 +18,5 @@ RDEPENDS:${PN}-ptest += " \
     python3-covdefaults \
     python3-coverage \
     python3-pytest-mock \
+    python3-python-dotenv \
 "

