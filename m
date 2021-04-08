Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web08.253.1617899800504374924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eIjH42/H;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id c24-20020a9d6c980000b02902662e210895so2870517otr.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FJyUXOEi+tZKfiVSr4jRwbQX02ghl7R5EQvhIyXXkdI=;
        b=eIjH42/H/DnrTxCbk/mvZbsPSaGkcBFFaS42jhJHntHAHgx2XtK8gQqvTQQZDszccf
         CfmHa2rATErrjV28skOMqAgHYKEY0xgd3DbhT2mKG+Ydt/lmHo4axkgEu34Jnoz3hUlH
         ymtGIKUkS4MlE0hdYi19KRCuMyMnU2JB9RItFylttvZl1Tu2ZF8Uzu9fbv1kiE3o691D
         EAvw2NxnbEf6altDHtd8o5sTgbmmt0QjDvnwVLLNWUCtfKzCo9XO7T5l4icFRWKbfXdr
         0R2NJzBXoBZBFLCaEqdKV0d6jUDkA3VsWFzcp8cxPgwolqXmbwylHJA63gQJuaPXYrfY
         qX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FJyUXOEi+tZKfiVSr4jRwbQX02ghl7R5EQvhIyXXkdI=;
        b=r9Kd7F5v0SHBLv2skCYaS5xHrwOT0uClBt+Rkk9NytibjpTA8IwJfquRvpOPAJtH3p
         fPpTG7xnXz3tFkiVs8GE3yuTIJIN41pqzEROzyPgwD1B2wOYB5jDSlN3xjTV0QJ/L359
         swCzKjcl100fCYMfjPOYVkJmwrxZGgiiQdBc2l6DfGOjr/ldegPkaJHHCBxSGrPR5WzN
         RaU+4GKH3+v+tOLWn6IxxkyDDM93B0naowd90ZANQ9hebJhTX5S9yHC5kzf0neRC2y2t
         5l2UQXaxonqscs8JKw75syaO+WUxdQOxrDvOM/XJTYRLtgxmM9P6AFoK3GbUmHTXDtna
         6gPg==
X-Gm-Message-State: AOAM533JutI2SnvyD5CdzvoEG1uXqKbKM7T6HsCBRx9ybt1uIeZEmxw9
	rtnZU93T9H4AMHDMCL6cM9wyNamKsA0=
X-Google-Smtp-Source: ABdhPJygamiSsrfodD5FIGst3I2hSACYfSKkzaAnAY47hyyaREgkkMZL5a7qjdxR52GIIsk0dz4Mkw==
X-Received: by 2002:a05:6830:148c:: with SMTP id s12mr8661038otq.251.1617899799737;
        Thu, 08 Apr 2021 09:36:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:39 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 29/64] snort: upgrade 2.9.17 -> 2.9.17.1
Date: Thu,  8 Apr 2021 09:35:36 -0700
Message-Id: <bc7c6022c711884a31c565021a15cff413fd672f.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 66dcc24cd7bf9d0a9b0a7718d9db2a58a2f8545d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../snort/{snort_2.9.17.bb => snort_2.9.17.1.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.17.bb => snort_2.9.17.1.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.17.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.17.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
index 324114f63d8..9c20be537c8 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.17.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
 "
-SRC_URI[sha256sum] = "c3b234c3922a09b0368b847ddb8d1fa371b741f032f42aa9ab53d67b428dc648"
+SRC_URI[sha256sum] = "303d3d5dc5affecfeaad3a331d3163f901d48d960fdd6598cb55c6d1591eed82"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.17.1

