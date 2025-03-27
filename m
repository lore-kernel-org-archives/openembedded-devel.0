Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B96C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 04:50:26 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.43038.1743051021253836515
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 21:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hDXXwQ88;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso2644757a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 21:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743051020; x=1743655820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERDnPmt5OvVw9c2nL4JGunr4rgvFhqGIBXXkQFMcCYI=;
        b=hDXXwQ88tv9NQy/2I3D5rupHKEZscdtADTdYym7xv7SG1Yyxk/bxnSDJsIGmm/QGzB
         6fi/WRAey+7YTt2N3js90yDWZep6/3BLrn3BmRw40drJ7mPtp5E4bVh7UdBXAORC98lA
         cJrELJK7Vpg8xA+KCQxdyiVlMPoriD2MgmK+g4fwL6ZgHp+GWaqtuPXcwa8KWVXHOBKH
         fuRWU6EsZfCh9Z32E20qLwmYusLn8zELuX7J9GSZEGMT/w3EeQSqsM9/TPC+aYg7C0ur
         lbYfAGWCVMFKWvbExehW+fqvmecrmdCFrktn0nWCW7x4C4Nr019+GCzEnrTZN3oEtXFl
         SdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743051020; x=1743655820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERDnPmt5OvVw9c2nL4JGunr4rgvFhqGIBXXkQFMcCYI=;
        b=Uu/1BUrpYXKVNgbh/yJufhiWIy4QPjQsgAmAhYXB5f70FM9OvuDEkSVO99BymnwynV
         915Wd7S8+93v8PICRKOonvCSkrEz+xr6BjXkWLTYYadxTozfmzPxgpbiZZowAiJCYbJI
         PowwHW+oM8E0qJqRQMe0qDb9XiR8UbatZ/puEzLgJItjVWJ7a72lIz/xCiqPTFq/wLjG
         sNJdhybCD7K46vxm90HB+8tKyel7AfoKT2COeJi1C+AE4G+rp924y2OFdzIw1bWoeYV2
         pDCWawnynDaaoidALJDKdYaXnutqbcF0aomH/8Jy8bajW2aBlmH00JAqx3DugBhp+Dh6
         9CqQ==
X-Gm-Message-State: AOJu0Yz8FeUko5ZvkQVug7B+WY9aLm6o/jjpEVD7zBKVK+9329bu1aea
	KcYDkHvl2dTa99yf8nnmIAgJn7czY9j3ZXp4M0FdR/o/PQ8+Ww0oejRb6FRq
X-Gm-Gg: ASbGncsWFkFDyu/X6bo1CpongaS5PO8FkxZI0NqFIUCKW2G7SDBzi5GjL0eWmDBHrMV
	rRCw4+KtE0vbDX8l8EjjBZePCNytujj+AoVK3kEIxkdoIcxF43ouXk36MKIx8GVgqBr+G5lYeEQ
	GG/pXWRj80mC70lT0OsT9ebjvC61rTiukzKBEu1H6ZlshPiMwb4UdX7wcVtnjisIra1H51cckwi
	qHisAeKUE/wwfo/MO4aQSC8TsgShgGM4bpZ78e0728K6BWNMflxFoCtxtkY0NjPFbuzXlUjCXAA
	dyIQZD40siJDMk6nP+dAXQyv/IH49c8NSeEZ
X-Google-Smtp-Source: AGHT+IH0226Ygb0NZq2wnkgUt0W4NRu9g/YBjmhyhQgcP2ZSXICww8HKQFKTmWYcf+mncLT94Jd1Iw==
X-Received: by 2002:a05:6a21:32a3:b0:1ee:ba29:d8fa with SMTP id adf61e73a8af0-1fe9380d489mr10228699637.6.1743051020165;
        Wed, 26 Mar 2025 21:50:20 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a233a8sm11829737a12.52.2025.03.26.21.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 21:50:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] jq: Stick to C17 until next release
Date: Wed, 26 Mar 2025 21:50:16 -0700
Message-ID: <20250327045016.3672121-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327045016.3672121-1-raj.khem@gmail.com>
References: <20250327045016.3672121-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 04:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116312

Patches are sprinkled in master branch of jq but the backports
regresses tests, so its better to keep it at C17 for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 6b12335513..a6a1d6a07a 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -26,6 +26,9 @@ PACKAGECONFIG[oniguruma] = "--with-oniguruma,--without-oniguruma,onig"
 # enable if you want ptest running under valgrind
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 
+# Gets going with gcc-15 but See if it can be removed with next upgrade
+CFLAGS += "-std=gnu17"
+
 do_configure:append() {
 	sed -i -e "/^ac_cs_config=/ s:${WORKDIR}::g" ${B}/config.status
 }

