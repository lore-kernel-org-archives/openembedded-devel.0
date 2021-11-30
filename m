Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BF1C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 14:52:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.77777.1638283975678740105
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 06:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=JfnBNSZ7;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id l16so45013693wrp.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 06:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qiwmZ2cpbMvY5+svo/TBayu2xjDkFOQcS50SyQxlsEo=;
        b=JfnBNSZ7HaasZz3LUd3IaeHUj2bQ7YxkqQjBKPFbRN/bLmcyjfTIq5iNjSg1ecNPih
         p0/DG2wSUhjRVjw+4e9fvWdZy8gU2v3vbje6QYgQ8KnLrkLBaqaxcE32hBrJ3gFtxfiP
         WkyakRXyrvH2P6WHzxoOloLu0egJQJNZ2eG5kbMEQTyPW2uMpqVjQ+Hr6XAAhxMKmrfn
         4lwZU0IruDL3HoL63YUqPFXF573X5XXjPn4pB2Xrrnk7grR9VXIC8YxtKIutUUbrubiy
         5/c3Cekp53ZxvBsD5XCkgelQdSH+r52glBxV00auTZa2Lf3+R/ws7QCYD1ZGDM0Ovlcs
         g0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qiwmZ2cpbMvY5+svo/TBayu2xjDkFOQcS50SyQxlsEo=;
        b=pkISfaNO+w+bG/gdclGHRLFJhYlysYbW4F0bKMrZU7ksDJQil/Dh0+2vNoCoArZFy0
         Xt2go3gtgOXDCHJ6v3HixFgcRZHJ5POq3+T1ZFxEhbrqXP3/QZJAxdmvG6X7bFjFtchJ
         TJjRN2s8hs9pYmzzTk3j5waQOC1QXyfhoD8NI5OqTX5i6xhyZ4deu+r2u3oz0RpFxItQ
         RZIon3+hta39x88ioK9m8nz9mDWWJbeZeHEKbj7sU2M1qtQ+Lmq/Vz5+cs2KyfcXKuiG
         AA1LCEUTwuUEeyisGXcIEFFsWJGmXgKG9z7KgrXkoZZaP8B/XY90NgumKC+pgMmJMPL2
         1dag==
X-Gm-Message-State: AOAM531MOgvZzb+ENxAbwXo79r/m8U/8VBTCgLtz8OwlqpOWUQg0iytZ
	Cy8jZIGTNvkq4xs5XcyEa5U40g==
X-Google-Smtp-Source: 
 ABdhPJxXO/uodVPDTdkJqxZ49C5ZqXqCtzlO6EhW0awBl/USZVYAOhn67yb6MO978xOad2YOnhSzUQ==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr42763029wrd.362.1638283973697;
        Tue, 30 Nov 2021 06:52:53 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id
 j18sm2989870wmq.44.2021.11.30.06.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 06:52:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH] libgpiod: ptest: redirect stderr to stdout for test
 executables
Date: Tue, 30 Nov 2021 15:52:50 +0100
Message-Id: <20211130145250.6287-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 14:52:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94148

Catch2 (used by the C++ tests) prints its output to stderr instead of
stdout. Redirect stderr to stdout for all test executables.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/files/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/files/run-ptest b/meta-oe/recipes-support/libgpiod/files/run-ptest
index 60c661fc1..61b9b69fc 100644
--- a/meta-oe/recipes-support/libgpiod/files/run-ptest
+++ b/meta-oe/recipes-support/libgpiod/files/run-ptest
@@ -7,7 +7,7 @@ cd $ptestdir/tests
 
 for testbin in $testbins; do
 	if test -e ./$testbin; then
-		./$testbin > ./$testbin.out
+		./$testbin > ./$testbin.out 2>&1
 		if [ $? -ne 0 ]; then
 			echo "FAIL: $testbin"
 		else
-- 
2.25.1


