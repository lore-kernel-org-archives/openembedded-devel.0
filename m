Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C7DC5478C
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 00:48:09 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.10631.1708735684938205245
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 16:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TMTglASG;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e2df04c812so741153a34.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 16:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708735684; x=1709340484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UULotlsU8tkvYNhQmIVT6mVpwcKgc4AqHmsvlOR+J/c=;
        b=TMTglASGuo/fDWhC5Qs4X0K1pF0dVTQdfSkCLiUhYlWFt3tYRw8Ri/05lDsgse+yBU
         3Mhc4FpjQGd87z/LnO6UjPc+ZzNPhjUdkMX70n1YHvXJ9dDBEhv+valk4GDBm0hUQmiJ
         bZceIHFH1Pl0IPMwUYDBK+VECM5+aIjZOrlx2hKLuU38DssntQo04dzGhnYolV85lzDr
         mfYhTx+sQzfnqzC26qu8E0qNlnwUQ6Kg3ySURpLb58eVq9hHbVPTqaXV4okqnhrrBvsN
         9AdqBYQIbyVEnek4lLmVKrK01pQsf6GgDfUh5MbsgfwPduS8WFa2swfFNc1emSU/QMjm
         UOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708735684; x=1709340484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UULotlsU8tkvYNhQmIVT6mVpwcKgc4AqHmsvlOR+J/c=;
        b=MiwKsLjELESsmUzmygCJkZW8x0FUI8kaFBP9wG5nRIYWyKFfzGNNvXLfkdAOC2+AKx
         HSW4k+n9tM1782VQw+ue9jhK4yuJlS7TI+edTaSEWZCD0vPB/Ms8DfTpTkRf+viAqIR7
         7bb22xVnq/jDSH0pquCThTvnwWAQQJiqGaQUP2K2XvPDkQyyabhJAqIu999tjINJCCk7
         RVh5AErZtMwSHDYLhV9+qzlBxKVqA+p01q2xmHmzOZFhVxVuIBU3SRMLUZNqR2mE6aTv
         tOHVCX9/qLIXtVTtcqTxSCNk900XBrxC4CsuCqSsi7bSId3hTZWxPIXjry9JEKzj3Gn6
         kaCQ==
X-Gm-Message-State: AOJu0Yw0OiFbbSdwT9guzI/lwW0ftPEcReAEtbw5MBoxwWwQfHMI5TMg
	RPczyAgeeyT5DHnf9F1Bl5o9o0SQZnD2QbRXg7DQ++sjxSPX4dk1rDEglc34dVE=
X-Google-Smtp-Source: AGHT+IHH15P3H35tYXZbryUxnYJS2Jawt4Nsp2zgfLlbvDtWzC61inr2MZqXazlz7xPyhsEA1jDjGA==
X-Received: by 2002:a05:6358:d0f:b0:17b:8706:fd39 with SMTP id v15-20020a0563580d0f00b0017b8706fd39mr1823914rwj.10.1708735683710;
        Fri, 23 Feb 2024 16:48:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1220])
        by smtp.gmail.com with ESMTPSA id ka31-20020a056a00939f00b006e47e3e139esm79047pfb.26.2024.02.23.16.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 16:48:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH] ptest-packagelists-meta-perl.inc: Move couple of test to PTESTS_FAST_META_PERL
Date: Fri, 23 Feb 2024 16:48:01 -0800
Message-ID: <20240224004801.3462755-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 00:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109020

libdigest-hmac-perl and libextutils-installpaths-perl are passing fine
under 20s on qemux86-64, therefore remove them out of PTESTS_PROBLEMS_META_PERL

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 717fde29d3..29a2b2e660 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -10,7 +10,9 @@ PTESTS_FAST_META_PERL = "\
     libcapture-tiny-perl \
     libcgi-perl \
     libcrypt-openssl-random-perl \
+    libdigest-hmac-perl \
     libextutils-config-perl \
+    libextutils-installpaths-perl \
     libhtml-tagset-perl \
     libmozilla-ca-perl \
     libmodule-build-tiny-perl \
@@ -31,12 +33,10 @@ PTESTS_PROBLEMS_META_PERL ="\
     libcrypt-openssl-rsa-perl \
     libdata-hexdump-perl \
     libdbd-sqlite-perl \
-    libdigest-hmac-perl \
     libdigest-sha1-perl \
     libnet-dns-perl \
     libnet-dns-sec-perl \
     libnet-ldap-perl \
-    libextutils-installpaths-perl \
     libfile-slurper-perl \
     libhtml-parser-perl \
     libmime-types-perl \
-- 
2.44.0


