Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26721D6EC1C
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:46:35 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.117147.1732891586834721675
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Nov 2024 06:46:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=p+y54xbD;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0bf6ac35aso163365a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 06:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732891585; x=1733496385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mC4+x53uoj9l5Tx1v8r2uSAy2Qz4j6sHNfwCJ4OZBLg=;
        b=p+y54xbDS9UIicIfg7a8jezifM94BIrWtXSxdMmCGX+1v2S2ph66vFOEkMelq75ZIq
         /GnnP8NCFXtkZ0Zzv0ziaZstJ/eECbpxrwWKEhr6awqrTysD4OxkwUVc1MMKUjCPu9wJ
         bhMAXsScHo7b6+clbly1aJEBRMsojt2GTxz1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732891585; x=1733496385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mC4+x53uoj9l5Tx1v8r2uSAy2Qz4j6sHNfwCJ4OZBLg=;
        b=CrgDiZiv7Hk1wvlPrPvexT+871vU6YF3vee0NhujhRAOXT69y+PdKXr9xfPVwQiaqz
         s5uINpon3XqpO/JgHMgFOVbkCoRt3HGjWpFqFigkRv43sWYhVl6CsA3E1iCj/JONMJo2
         yr6R7KrzFKRpjx4Wz7st6RKTc5lrLi++VKLm8/P1FD9iBnNGK2RtPMQpq2PQsOCtLb17
         I9yHPBOfuxqsZTCYbeaa9/Gg9iZRNm+oLXR15Mbu6JPhs5LkSSSrboQHInOKWIb9AdLh
         e2NI+iDMSiDGHBhD5YRsCFNtDdD8yvDUHjnPY70dg9vl3bXbHsAjRJiH/bdJ1yUq/uU6
         IaeA==
X-Gm-Message-State: AOJu0YwTz+vxblNoIai0vqAtQOyEYWdWEEAbP/LVJgKEYsu+OI3Mb3lh
	bjDJtfFvDnliwMCKOoFExiOn97QM3kTzvEXevW+br6kPVPDpGLpQzFrEy3xeUfj4+uYGKEhYjhF
	M
X-Gm-Gg: ASbGnct51XkmeAa92foDO5GxkIKhGFXBEAAUpuSP7EJU5WedB/q5/Gm1ousaKIPNuhU
	hxVPqUA+jAjXikI+ShrqX3mRg1xtQI0BRjjl0Pn7P3nt4o/yrBBZzMGPCmtU2fSvRupuQGO2P9q
	O7ilzVMPxV54LXOvEEFLq5g2E6keVjVIcVzXDskCEFF9XYO1o3gyckyT6AJKKGWo9cbqCHfBQWb
	XprDiFRJBxcCcmkLaULuBGEQ5czm7cZ7aGFHzCzJkwq4J+qEUKRXc/uPFTHHIVT
X-Google-Smtp-Source: AGHT+IGQ0QT+1Gg3IMRxRIi50eMNjKxGiP7zbo0rMYZzXgb/dWmhUMcqu/FDr1/S6pCYIGXmx4Cu5Q==
X-Received: by 2002:aa7:d889:0:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5d0c6971f0dmr445184a12.17.1732891584756;
        Fri, 29 Nov 2024 06:46:24 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0b87cb290sm622832a12.12.2024.11.29.06.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 06:46:24 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-waitress: Upgrade 3.0.0 -> 3.0.2
Date: Fri, 29 Nov 2024 16:46:18 +0200
Message-Id: <20241129144619.780319-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241129144619.780319-1-leon.anavi@konsulko.com>
References: <20241129144619.780319-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 14:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114117

Upgrade to version 3.0.2:

- When using Waitress to process trusted proxy headers, Waitress
  will now update the headers to drop any untrusted values, thereby
  making sure that WSGI apps only get trusted and validated values
  that Waitress itself used to update the environ.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-waitress_3.0.0.bb => python3-waitress_3.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_3.0.0.bb => python3-waitress_3.0.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_3.0.0.bb b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-waitress_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
index 7470fc02a0..b8e90807cf 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
@@ -10,6 +10,6 @@ RDEPENDS:${PN} += " \
         python3-logging \
 "
 
-SRC_URI[sha256sum] = "005da479b04134cdd9dd602d1ee7c49d79de0537610d653674cc6cbde222b8a1"
+SRC_URI[sha256sum] = "682aaaf2af0c44ada4abfb70ded36393f0e307f4ab9456a215ce0020baefc31f"
 
 inherit python_setuptools_build_meta pypi
-- 
2.39.5


