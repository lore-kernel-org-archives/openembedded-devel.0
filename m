Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94EEC47080
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.14270.1650769809247807235
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FR/6Ju0R;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id j17so11727131pfi.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1iZTeCrHE9SocaQ61F7S0u3gTxC6HxMZ2UxL9wziKDo=;
        b=FR/6Ju0RPRuAixBcgabZTs0Et7T0BA5BKADpkZ66c8nuiDVgiYeD7hFrPoybbLM+8P
         50Ygn8qS361k1otHgDUelAuvCygun7xJNPypaMGea2ZmOSposkQdaaugrpVhjLkWFlcM
         0twi1SuFuFMv6z5Y3Unydb94YcE1/+l1C5ccd4MNYZ2fyQhixQdWoIKBh163JjJFC020
         dwORYhk2td3OjTQ8nxa5iYGoy7U4QfncM2Zn4QilQjIAGxSPaxTB7LxeZO8MwqdyUCHf
         FBT9YstUFVmpSRzjp/81qlkImjBbsBGiL6D8gzjF0augr+VxFxSDUP5OqB/H3P1tZkAe
         C9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1iZTeCrHE9SocaQ61F7S0u3gTxC6HxMZ2UxL9wziKDo=;
        b=79rvB4CP+Qyi5I9SxMZLiN0sy4iteiBntlyvPuK5xiAPZTpBBpdGjXQbqxfrDqEkab
         H1K8DgfDFyIRiAYrQV/PfdeKtIsUjTGM8KebfCYCplO9Ir6JyCdwz/hlwygjz46dU2Re
         XSOigJzuMBBhWmnKXYZxVjlXVt9PLc2Y7ciWn6aimv+bmys4dwJZ0hIReQKgOjKLU9I1
         aWIMY80OFwqE4u6gD5EL9r3Iur5K3bKR0GxSRuiR6eGKhQ9C7l/4cKMAgT2o1Oaa0z3N
         fF2zutxePi706ZImt+qtTfKIaHK6z+eJVrk7P7C/me6kx1/wCH7QYzRNlxnZeoOSVQzq
         caWQ==
X-Gm-Message-State: AOAM533ynydrPLc5y7yStuvOWhENz0cEIiRedrKmHLMUxQmTaIDVMrXO
	7bLQn3JfsRp4AzWhmagKA8/wqkBNyz1BOQ==
X-Google-Smtp-Source: 
 ABdhPJxtwxUPSNsEgLY5POHlao5YAuGWWtZnIOC4mO5xr2KaUSzdVavOS5O0VlcKknh0GbmRGDn1Ug==
X-Received: by 2002:a63:101:0:b0:3aa:b7e9:6708 with SMTP id
 1-20020a630101000000b003aab7e96708mr9992310pgb.111.1650769808528;
        Sat, 23 Apr 2022 20:10:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/12] boinc-client: Do not overwrite same file when
 using usrmerge
Date: Sat, 23 Apr 2022 20:09:55 -0700
Message-Id: <20220424031004.3209576-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96740

in case usrmerge is enabled, unit file is already in expected location

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
index 5e991d3099..abcb304d30 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
@@ -76,7 +76,8 @@ do_compile:prepend () {
 }
 
 do_install:append() {
-	if [ -e ${D}${nonarch_libdir}/systemd/system/boinc-client.service ]; then
+	if ! ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)} -a \
+            -e ${D}${nonarch_libdir}/systemd/system/boinc-client.service; then
 		install -d ${D}${systemd_system_unitdir}
 		mv \
 		${D}${nonarch_libdir}/systemd/system/boinc-client.service \
-- 
2.36.0


