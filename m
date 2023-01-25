Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FDAC61DA2
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:56 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.44860.1674653505939803256
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B1nY+h68;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id h3-20020a4ac443000000b004fb2954e7c3so3133106ooq.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyQdizyn0b423QEMu6CR7w/5ivK/fC3FMdy04zfEKqI=;
        b=B1nY+h68QOOrhyLCxwJ6drsgIGmDCDQDPEwfl+ksNDlqQDB4eDVTk4LV8l0mgXWeQG
         YUqBBMqnDZRnqrerb0j/p1fE2WpqoeO7wMb0Egfs5ZJioUf1BWvDRQqrJsEtt08ao3fN
         2n40s8X0KMALk8+ifp9lM/c27ng5BOeMjwqDEajwYXtW2Abrd8Ib4dyQNd13Tudnxz/8
         1ZLRCF2zKzH6B0BOXA6guWQKlKLioPuDQx/8cDJ/kXGBpGDkRTFg4CMq1D6oGhHGeUlX
         JbkGCnRU1My+Eu6vYAzlNT997poHr3xURGMqI35kXKdvjvAOnI+zye8wMFUbegHOVKIP
         w2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyQdizyn0b423QEMu6CR7w/5ivK/fC3FMdy04zfEKqI=;
        b=sKtmJw6ID3DVnbQXag1pDTUVArtWFYG7wLEkOlwKT6kA53wMeZUSLw610Cs40KCWbz
         Fn1qP3KTuuHI9eOnfDBoW9DjkGiLMjlY5citznCImYxLzPMO2GOUjdKEVzvyuwDHvn/8
         4koNGISFhPxtFLYCm2sRkAV6qZwchxpA82rnZF6jbGPrBSbE4DwgfgsXzeQeFwJxkgFN
         mUvzAMGxslJ4Vdxl+zu0jX62GKFp/VGvvidz2JpnwMDZr5Ein9MvYacSWG+Pe73Tty14
         VsGPtD+Hk+0QweSnTCu9Sg4MaMaLHgMw11F4l8nN6O4XAYOwqr+31P87ShwsfUHkVLaI
         En5Q==
X-Gm-Message-State: AFqh2kqynmMn8OdK6FirfmWchLsRCYE+83VZUsZxgCgyWJNtEo6VVvkN
	6coKJcPi4yLIxz3w+sLm8Zry5saiv0w=
X-Google-Smtp-Source: AMrXdXv7YxM7M+1BLo+ID+CZQ+/yBBJKZDK1ztWfA8LZ0ZBpPkDXTx/NXmSepzy5RVoYRq7qL4izug==
X-Received: by 2002:a4a:a509:0:b0:4f2:2208:46a2 with SMTP id v9-20020a4aa509000000b004f2220846a2mr15398052ook.8.1674653512897;
        Wed, 25 Jan 2023 05:31:52 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 26/41] nss: Whitelist CVEs related to libnssdbm
Date: Wed, 25 Jan 2023 08:31:08 -0500
Message-Id: <309fde5ae782a7961aa0c0cec9d477374eff62f4.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100761

From: Mathieu Dubois-Briand <mbriand@witekio.com>

These CVEs only affect libnssdbm, compiled when --enable-legacy-db is
used.

https://bugzilla.mozilla.org/show_bug.cgi?id=1360782#c6
https://bugzilla.mozilla.org/show_bug.cgi?id=1360778#c8
https://bugzilla.mozilla.org/show_bug.cgi?id=1360900#c6
https://bugzilla.mozilla.org/show_bug.cgi?id=1360779#c9
Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 90645db2fa078b50ec6807c75acea913b49ea669)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.74.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index 73701393e6..4a9482fca4 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -284,3 +284,7 @@ CVE_PRODUCT += "network_security_services"
 
 # CVE-2006-5201 affects only Sun Solaris
 CVE_CHECK_IGNORE += "CVE-2006-5201"
+
+# CVES CVE-2017-11695 CVE-2017-11696 CVE-2017-11697 CVE-2017-11698 only affect
+# the legacy db (libnssdbm), only compiled with --enable-legacy-db.
+CVE_CHECK_IGNORE += "CVE-2017-11695 CVE-2017-11696 CVE-2017-11697 CVE-2017-11698"
-- 
2.25.1


