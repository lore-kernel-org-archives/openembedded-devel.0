Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E368C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 22:04:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.6982.1746050677644677277
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 15:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TdF09+jc;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so1230595e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 15:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746050675; x=1746655475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QF5xB0PXak3LXC7XOmyI3DKhDvAhLHUn527TOMf+1T4=;
        b=TdF09+jc32gz2h7nChSvLSQc/fKkk6k4gEuiZ/dKPDTRlgRnmVxadFesrIcldIMz5K
         3w4D/jndyDzesoFcJLWTQihQRZYfXhSTBjEQa5GErek4BjpagBgValsY9+711LqlVQnZ
         TRWX9nEOHwQTRN0ygD3cExnE0RlRBT+flc0sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746050675; x=1746655475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QF5xB0PXak3LXC7XOmyI3DKhDvAhLHUn527TOMf+1T4=;
        b=PEDln4yBWLV/2bcNNc/i4k0WQLermbalGcISZN4vX4Pvn5ZyqwX15l9sLvYuYrSjSU
         JAQAB2O9n2lxf98qN7QjBj6G7T/X208Rdw4Zvcwhh0jBbU5gRvhHVn8O2q4FSdFtrqkG
         HfVk7bndSm5es1BeKBQR13Kbh1OtZyewsd47mYnRGcqWHA3TcPSP6LneSSmemEDkb6sX
         fDuEqcxAJr5lc4IuQAGFAU6GLQd25HSMEPQ+vOBHfYZAk2JqLAiZBwYNAMYMpwGc5FS+
         dZ57CpTiJyAJd1nXIyePMz1az9rfpwkZkH3bPgJkEzMGWEpomBf7LUObQFu75XA/n0cb
         7auw==
X-Gm-Message-State: AOJu0YyuE4PITqXjEBc8IfZRwlOL6H+kEdRZBMJKJr2V6co3PNkvk59k
	VGx11OXBhdVGZx48b13g2BdV6FYHfZSSb52EVBTjjW7gFFe4VcOJ9nYyua8VZXDUmJTD1M4Dfd+
	8
X-Gm-Gg: ASbGncsRKa2Nssi05gJZbrin8pUzAKQMgrRv1YwBNJT+PKvyvL0eOl1pMX5DBtnH6pX
	RxWHEehGHzp0XvJ8csHE43ibrDBKklMyoDT2NOhL3yaJw38BkIBD188kmaBVsycSC1nbo2FR8Qm
	An1TM1ktW5co6FOTmkJGllAyL2UynLnce7EkFSlVo90CHKO1VMudYa/15g27q4ZdTPJQ7QPzcS1
	9qQN1H4X90E0XoEiskdJCmmhHjzA42jQxsIu//g4DreW4hHLozJhZEpW/fCRdhevUcJNJlQJm1J
	kP+j8DXCE4XykHBMxyFgR4sDZxZz8UVju4zmfyRXkYdEJWVovHoRs3yn3wSABBvd0JlaFMAqp+T
	1JJ46jIAVBNLcaOkZU3Pmko69kGEj0l9nojKZw+0vWXZnEHCs
X-Google-Smtp-Source: AGHT+IHzZwmsmGe4GY+Ltpv+Yai3TY7qizRujcVCA17s3DaiwZiLFKrh6BNXILRZ6qljHgxBOwq0+Q==
X-Received: by 2002:a05:600c:3d18:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-441b25dd103mr46819375e9.0.1746050675265;
        Wed, 30 Apr 2025 15:04:35 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b61c4db2sm6172175e9.36.2025.04.30.15.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:04:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 2/4] reproducibility: mark libsource-highlight as known non-reproducible
Date: Thu,  1 May 2025 00:03:59 +0200
Message-Id: <20250430220401.4149372-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430220401.4149372-1-yoann.congal@smile.fr>
References: <20250430220401.4149372-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 22:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117263

From: Yoann Congal <yoann.congal@smile.fr>

libsource-highlight packages are not reproducilble.

Relevant logs:
- https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/41/steps/32/logs/stdio
- https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20250419-ye3feamr/packages/diff-html/

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index b926b45b0a..5c8fc30052 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -71,6 +71,10 @@ KNOWN_NON_REPRO_META_OE = " \
     librelp-ptest \
     libsdl2-compat \
     libsdl2-compat-dbg \
+    libsource-highlight5 \
+    libsource-highlight-dbg \
+    libsource-highlight-dev \
+    libsource-highlight-src \
     libthrift-c-glib-zlib-src \
     libvncserver-dev \
     libwebsockets-testapps \

