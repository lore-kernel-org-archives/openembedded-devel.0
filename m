Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1894C3ABAA
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 20:47:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.4805.1746132448992405278
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 May 2025 13:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V+hyA6Av;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ede096d73so7921985e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746132447; x=1746737247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrNk/DFD6yYg3G217DJ96mURH7qxzR2GQPiVrwW2cxQ=;
        b=V+hyA6AvFxXBtewQTK4TsNhynqFZ0+2MbscBUxo6bpZphCnBvfBdLlLka7W7WvcAr1
         JMKsZlpVQnKjV50k/CxEDLAGP/s29duz8geaxltSPSs4YcuTYSN12OshN7PiQ9EbW9Mj
         2uq37dd4VOuqRp7RZ+suBRtHJX+O8yDKM3yxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746132447; x=1746737247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrNk/DFD6yYg3G217DJ96mURH7qxzR2GQPiVrwW2cxQ=;
        b=LrODFJthOcjQ1smrewES9o5VpoSSCvS4vxtadw4lXSHKeT9NE6oW0UVL2RLdANqEMp
         bqTyuV08QWPpi02nhhPvYvE/0RH8RW28TreHyQ50v7mN6ChthRudCXKJnSaf1GcbM+iV
         gvgMY7bfEUAbDhkZCGV8Tw3Lv2jqC92zFIls+vq7Aw1d+fBHXnsTaYda2fouhSZiF1T0
         GY5Gkh4sK4/OELxqTbbT4f/trvU8fQA588SzofDmr41V1562BjEv43zFy9hbGGxloswk
         xY66l6LMUPqhtvlxX5m3fysBnLXMTu9gJz0k6qI0AXhgnFZU2RQ1Cfd7z4fKUgSXP98P
         gG2g==
X-Gm-Message-State: AOJu0YyrUTllLZwW9HYra11gFoeQd1HBUM3T3FbViIPjpBI+yDwWZKqr
	lY+1IoophviuvDOgmoOYHQzY6OIs+AdXoU3FeVh60ef2zNfhYgP6W0/tZ5hQVRQpKUms3VGes2R
	6
X-Gm-Gg: ASbGnctHK+l2UWfTFKWIROD9lx1UFVtHfyyQM6Gauzc97zU5vT3dCuMLQgCCWJLy6YM
	n5lAfSxDCIK4tZf3ZGgMI5Re5pzF7MdiDp3SsARqD8ZsJCc0g0YO1MRSkbCTR21v9S0n8O8BZgR
	uf2yuEw4b/9okrTsBKzJoL1gqIesnMoKKrSw6gN8eAfeNdsM+ac7v09HQ0uKkw59naLVKqajYXk
	BSPiklJ2w/+3HK92a3RqMP+bkyPOL0iezT5XS0BeWPWESnMKQ+/B6jlcMvVcJcXP1cUV+ODoDeA
	CZ2tNSoM1NU0o1XXBuBx3rDLxsZ2lN4AJvOhbE9XTFZUYUj5kqIOUoXU6+UtS7K0AOIaAvR5SfU
	SKPG+9S55/7gPwRFTy/Wj1aCiXhLKfcIUS1QmsxfIItygcDO6
X-Google-Smtp-Source: AGHT+IEiNGXyo1oC1rqlHkJuTBq/AWRT2E7mGgp22fkKjnM1gqXy5hrQI/8v9v8w4s2JepxvekxN1w==
X-Received: by 2002:a05:600c:4e93:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-441bbedac54mr1920905e9.18.1746132447283;
        Thu, 01 May 2025 13:47:27 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ed4f5sm22990385e9.18.2025.05.01.13.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 13:47:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2 3/4] reproducibility: mark apitrace as known non-reproducible
Date: Thu,  1 May 2025 22:47:07 +0200
Message-Id: <20250501204708.10398-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250501204708.10398-1-yoann.congal@smile.fr>
References: <20250501204708.10398-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 20:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117271

From: Yoann Congal <yoann.congal@smile.fr>

apitrace packages are not reproducible.

Quick analysis: A string changes in /usr/bin/apitrace
-/srv/pokybuild/yocto-worker/meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3
+/srv/pokybuild/buildbot-venv/bin/python3
Looks like the full path of the python3 interpreter which changes from
hosts to hosts.

Relevant logs:
- https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/42/steps/32/logs/stdio
- https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20250426-pazz3nt5/packages/diff-html/#reproducibleA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-deb-core-------reproducibleA-tmp-deploy-deb-core-----apitrace_--.----.--git------fc--bb-r-_amd--.deb

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: Added quick analysis
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index 5c8fc30052..ff93db3a21 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -1,6 +1,8 @@
 # List of known non-reproducible package of the meta-oe layer
 # Please keep this list sorted
 KNOWN_NON_REPRO_META_OE = " \
+    apitrace \
+    apitrace-dbg \
     asio-dbg \
     asio-ptest \
     asio-src \

