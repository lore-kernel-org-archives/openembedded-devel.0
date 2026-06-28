Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46963C44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:55 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69119.1782634307509979481
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NvPgIQhd;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30e9eefa268so1601670eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634307; x=1783239107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcQPEVzCGZNogBcDh3fREKh6/1YdIoqoAnIHpyb4DQ0=;
        b=NvPgIQhdA3HLi7cER8QAxF3HAJA/klR4n7DLT/frlW70ntxr6nBZIT0Li2TxH1rCFW
         overNFz32RmKFfRWsGgo9FFbrW2AYHeSq2URg9LOwNw9LQZDrzIAvsl9tPtuzVdj/omr
         YyNC6QmolrXU37oBbLyILaOSkmrCG1rET+Z8rMfbCOolveG5dUgwZa9mXo1rH4dwPxL2
         9ijHoLsKPYdeGG+s/bLuHWlIo5LQ7BjEnUB0t1icKn8FvvDlmNf31qkLWEZy7e83dpcp
         SU/IaNCyBzYJQYkAR+igKuS31lvlCQJ8o+eOqKY6Pg3X/bdW60CAcBDQXUAQ6hYJOqHf
         FZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634307; x=1783239107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CcQPEVzCGZNogBcDh3fREKh6/1YdIoqoAnIHpyb4DQ0=;
        b=Ub545QF7KpLH4IX4AhbxHEYBvwW0VJiyZWosKWGIq5bpUqCO/Mab+9fsBYdnhzy2/q
         vfsqoVde4upJma39Uuc5jP+PIwbymIME2uA/f+l5qg8ge0hI6X23EYRwd00i+hLzFFWK
         PjtrLXfDaWcY7tDyx/quv8sXzkIrwmgZAWkPYeO2s6nv4q3oEuaBQbh46RF3k8KAQeTT
         Burd9ONCmCMieY7KJp0i31bX0jrG2zABsyhbZQFjbb+p7nCyQ6CTqSU3lTk1b/6VVAFP
         fRrmWu+LOLH3JEvBi17uTHCUIad2nIg2i4YsJHDZR0d8mi2L6yXRva/ydSBVWWE2Xeh7
         g/8w==
X-Gm-Message-State: AOJu0YxMRV3RJ0f+B2DzNVqEPiyh0nM+sauR0WS8CvRvo62t7a5NVUyr
	PJZ408ULRh0ib3y6evY37KOx54bYqYD4JyIf08T4QpfuFOquFCVZsSrE52eqaTngN/aAnQ==
X-Gm-Gg: AfdE7cn/IYHEsmV0nYn+uFxwwRhull7YqV25CPCKQzQVnTxqM+u3NKZgurRYiLsF0uH
	P5UEfeF490eKCTfTHA+6626R56ki5ZClfG72CxpawF9DhQyAHbGzanga1W2WGQFl8wl+L7Cgt6E
	J72tGpgJWUB9WVHeHBDWNj7kdfuudzm4YC4dOsHWtBh4eJV/8kexJoL2KwUrtmpv/tUNVA3zPka
	XTyH/jd8AFP3YUHP8skYcSuo+D5PMUWvMxV0xsxdPIATxRkJj86LkM+xe3tVMCyRnrByBkeiDkn
	6+CjGgsjEhlUkIM3Vx1yzypUzgPV+vtF8mq2mR6GGz6T4yLzB2UODDWhIixteTUh4drqKUWPkXi
	BMdrHQMU5TaAGoRQCibDLpzz/ihVKg9VL8/8mofCEfKTfdoxKAXYS9PpVhU4ufgCjVCQOq1J0g3
	TCJLCDNWXt7po5bPBd9cjY5zKH/bBC4TpX5Ee8PIrjn4IJw8nDAMyT7iOxis/vajq857h/RXG/b
	b43rwwkHSjByPmGzqYHkELaiKSOqcQ21vvxSA7rD9Gm4UQWq4zue6nphgX6OAV0wJdFmFIvVSl6
	7627sBwsxBmu6pOHIp6csmk70CXwxQ==
X-Received: by 2002:a05:7300:80ce:b0:30c:b2:eceb with SMTP id 5a478bee46e88-30c84d6c33amr13857816eec.23.1782634306761;
        Sun, 28 Jun 2026 01:11:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 023/128] strongswan: upgrade 6.0.6 -> 6.0.7
Date: Sun, 28 Jun 2026 01:09:34 -0700
Message-ID: <20260628081122.178348-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127833

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../strongswan/{strongswan_6.0.6.bb => strongswan_6.0.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_6.0.6.bb => strongswan_6.0.7.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
rename to meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index daa6552899..9283815705 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -10,7 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
+SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 

