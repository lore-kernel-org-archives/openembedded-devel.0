Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48787CCF9EF
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:10:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.1239.1761595820995951097
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jA0mVsBm;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so11235395e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 13:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761595819; x=1762200619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtYSpR4PtiMGj1W1XaUA1Or/zghlgtJRk0enJG1XwdE=;
        b=jA0mVsBmD92Bb+DcYKV1ZWiTbGlq62AERubAz4iDwSJanYQxip6rbqvp1e0aaIVUZv
         RJSo+O4JDKa5T1AaIAqQgTz8YGsF45vHi8Uc1s+mlOIJHds7cDVfPXeWUvS30+aiXFmJ
         ZCa2xQLxt6vCoodE9t+T29PkTTYZ4KlFM6qjkwuqFhxCTxIz0iVTMOqsn917buJDNHAL
         5YKQJAOlsGI6Ue0zzHgfs7RKuDVorX2hATpccckFe6dC2JIdyCtr7hmMLpxgciT53Gq0
         O5tf+RSfRzjpf83GzUNRNZjDOl3r1eJQtP7wwnWRVbYKDkFK0DrbYHtKzffQ48N/Tsg/
         VvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761595819; x=1762200619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtYSpR4PtiMGj1W1XaUA1Or/zghlgtJRk0enJG1XwdE=;
        b=sigrdQgBytr1W5hxmDEB6df9knm81CLax/V52UYy6QF8czTbHnhUOJXczvVBNj02cl
         FOBPgdUkVU5VvEmcYnmoEc5HMbBjrib/dnZqb7/OuqtHOTmnEwzDk+OoD0kgjKhb9uy4
         9Q2jgW4HXlwATgbAhktdTK/eCC9tZ/OlJ6kWjfxZDHUDsez7U60SPp+d1w2/+UTskBha
         3gC1cm3THV05jbVmIgK9O4HGBBODsNOVlVQX8aBqWnp5nvf+PuEjHfHCYPkrPxDD6Rrb
         J84ywGWFmVSmcW/gVTBKUZruyYb/z0DJdd+sL0D+P/GSYL9kUchS9N5mOu5+e2NxSPal
         6txw==
X-Gm-Message-State: AOJu0YwjazOg6T4iIAb2sDvbPsI4XQ6B8texOYmz2s/DSFBtaTfOCP12
	vgukzH+urvRSADRvJB3pw4m+Cr4RsJbfnLB5AQ/cLgB9kIl9YmrYC8O/Xq9oYQ==
X-Gm-Gg: ASbGncunq491+M0l2FKo9IPq6Y9alqdyF8BQcNwt6eC1NWx1/Vo646HKvXB4G7bRG1j
	8dgy10x45ph39YDOnIYLSkpy+Cqgr8SUrvFPEk71a/7+U4qrabQ0tA4OOBHxUDwwRP0N2caT450
	ffhoKDzW+gdlWqKDsi3oG5gre6NPFHWvtex/e/xs0Ou+NRIRSm98pPgf5gRb4W6fKoG3sHAOwzL
	o2Ysk8NNiECPRBWFWIQq/2YGxHY3DDOexwbO4XB/W3WO1n5h83Ac4DvxLfeHh8H+hj7rn+7DaCM
	eqofrKR2WfsKzqFsMJMaq5ZK3kKFTOg+ZE9WTBIgqwtrB2eWSs2baJ5QRlLC3pJho6AKarY6uXO
	ZkLqOoWIyOh7AwmPulVJ/hsADgp1NBKdznPjHXthvZSShOG9ia6y80G5HZYvFFANRtLUS75XyQf
	+e69Jvf1ph
X-Google-Smtp-Source: AGHT+IHywFhsj9wCOTvag6g8I/Anrn5k5OOlFa6k9kuuc3nzR7x+Y734i5nQkm2SPEEHU3QYFev9qA==
X-Received: by 2002:a05:600c:620f:b0:471:b5d:2db9 with SMTP id 5b1f17b1804b1-47717e40da6mr7311135e9.21.1761595819253;
        Mon, 27 Oct 2025 13:10:19 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47853csm155508975e9.13.2025.10.27.13.10.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:10:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 5/5] freediameter: fix run-ptest reporting
Date: Mon, 27 Oct 2025 21:10:15 +0100
Message-ID: <20251027201015.4098472-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027201015.4098472-1-skandigraun@gmail.com>
References: <20251027201015.4098472-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 20:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121060

Add PASS/FAIL printout at the end of the execution.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-protocols/freediameter/files/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/freediameter/files/run-ptest b/meta-networking/recipes-protocols/freediameter/files/run-ptest
index d0ca8d9621..926a6869cf 100644
--- a/meta-networking/recipes-protocols/freediameter/files/run-ptest
+++ b/meta-networking/recipes-protocols/freediameter/files/run-ptest
@@ -8,4 +8,4 @@ fi
 
 export EXTENSIONS_DIR=$EXTENSIONS_DIR
 cmake  -E cmake_echo_color --cyan "Running tests..."
-ctest --force-new-ctest-process
+ctest --force-new-ctest-process && echo PASS: freediameter || echo FAIL: freediameter

