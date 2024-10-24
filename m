Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8AFD1038F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:25 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.6088.1729801155331602096
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G8eZU01m;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e28e4451e0bso1485196276.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801154; x=1730405954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re6KsNPRWwewi0K04pJQewJcY5V6kXAH4dRU6hiyi94=;
        b=G8eZU01mMp6z9E8bednCLI2Oj//DYzmJ5CHgcwZu0xAKUwO+5UHIKpEEI29c0CQqef
         VJJg7YORXch3+6jUP+QZwV82fgzvPapTr7Zc1MTiI8/jqWCzsKrkSTm1ciOSUKMKMn1B
         726pVhR6ktEYrMSNq/fCtKyv8WCyqXfV3KnN6nleLFAxy66p6FCTOATklIuPsyATPVQE
         37lWw5Tyr/0E1LT++zC+YCh8J334kzMkkONy5hn7NPGu0kkJRsIgpnNRQttK/9FnjMjS
         WXk8ZQEqZba7/XbU64xJQtxAGV147/xzv0szVpdaywbCXHj+VwStlRlgnSdVDYTDAVTb
         0NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801154; x=1730405954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=re6KsNPRWwewi0K04pJQewJcY5V6kXAH4dRU6hiyi94=;
        b=dHiIKzEPk+Vq0emwoBsnCrpQAnaAJ19niu45xHh4BDzMyDYGMeneX8fRiiWf6SC9rL
         bngadWgmUVdr4/Bnq7Q2AHoShcfAnMqvtVhVxYayI5hJxlUOgbW6DjyHlvIN7rMpCiJu
         wc/L79b5gvuwZqFpEj9h3AhmyObVyyRr8cBXNYVheFofImhC9lbr5gc4yQayG9HoxEh7
         A/aNq8UA/Q62cLRv400y41iGcd1gf9Ptc8TAWhMdUfuWoLmPj06yQs97TChm1N5CVH3T
         YomAhX8a2WdlAmGVC6HDyx9tNidK77sNxBnNa+EcyfUpQCMgAAjWv0RqKvS0xWaieDjn
         mwTg==
X-Gm-Message-State: AOJu0Yxg2Q6LE1CdWkFuE8hqpaHG216utWU8HjrKniSZJ2shHTzvnMvi
	aUVPAPIIMc22xdbJX+8eQsEvOeKTMlPF5jFtGPixJSbv2cB8KJpCIs0Azg==
X-Google-Smtp-Source: AGHT+IGQJNmbtG7gUgzAu9YMCUXZjFvq2xFffX9aN/jfBaHr1HA4nB1hArkcTVWY9YskPWqkKCwSCg==
X-Received: by 2002:a05:690c:4093:b0:6e2:aa89:9d0 with SMTP id 00721157ae682-6e858166a13mr28082037b3.10.1729801153863;
        Thu, 24 Oct 2024 13:19:13 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:13 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 32/42] libproc-waitstat-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:51 -0400
Message-ID: <20241024201806.440273-33-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113210

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
index 5e4c71b70..db7ca17ad 100644
--- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
@@ -2,7 +2,7 @@ SUMMARY = "Interpret and act on wait() status values"
 DESCRIPTION = "This module contains functions for interpreting and acting \
 on wait status values."
 
-HOMEPAGE = "http://search.cpan.org/~rosch/Proc-WaitStat/"
+HOMEPAGE = "https://metacpan.org/dist/Proc-WaitStat"
 SECTION = "libraries"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
@@ -12,7 +12,7 @@ RDEPENDS:${PN} += "perl libipc-signal-perl"
 
 S = "${WORKDIR}/Proc-WaitStat-${PV}"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/R/RO/ROSCH/Proc-WaitStat-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "d07563f5e787909d16e7390241e877f49ab739b1de9d0e2ea1a41bd0bf4474bc"
 
-- 
2.43.0


