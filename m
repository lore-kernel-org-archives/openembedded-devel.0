Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C20C47077
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:15:04 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.1395.1705454103462348419
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BGGgpxyz;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5ff63b12340so2960907b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454102; x=1706058902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MTQkrpYWPTuDdUuNewIlLZuB+ZKx7PfyTO8YFPnORbM=;
        b=BGGgpxyzWxy9WHsN2I7fSsuZGv8fUPe0JLKq9JJ0SO9Zv5OrPpmW2ZuigR7XjTPt0v
         x2zM/cGwcMgAMCKmw8zo83sbReKKgGrvEnWgtaoevoHGwUXSBeRaAdN6WE5j7Yz4hDNE
         hOUvS7B79HGQiDvU50uCxM9iUnOSHK0NaoV2dSsNrabM3quXDvlhysVlu2OAerpLWPS7
         qp0gi6JIWS3d70RMtpwDyO8Pvx5c/vXenf8TcE645VUyVfZzbho5RQP9Ck9h5MG39nIV
         bVgUG3KRVRfK5tAQY2V5v6TX4JWb1L7lbITHMmwwcAiTVXJpCFecjaFIbMuWNpWGSXJJ
         c2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454102; x=1706058902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTQkrpYWPTuDdUuNewIlLZuB+ZKx7PfyTO8YFPnORbM=;
        b=rizb0sfxWH5BVLjodJsD/HbK+6+ENwcArBnW/adL0WKpQUz0CMjMQ5xXIMtgxpqsJY
         qd6JEiGupZ62K3k30LCcyOhVK+hkOT5DngjQNifAhK8GRNUzdThaCDp4iVPvwM8Ld116
         vCln14baYNjQs7tLqWY2Gh94cPBXLZhIiLQWeF4TGDZhJei0HhyC+HaQFLQrSrhJGDb0
         mmjCY5GxKWrBVn+N+ktki4M42mrECOeWMzxeBt9Jf3eRRbXMJ/0lon+TArcadcOG7fNS
         Bo8RIJZ9OZ8fzRtSOGd5VLI08MC7gCzv5V+QPP6feFzHDWWMi46u3xtNntcTlERlsDKd
         kl1g==
X-Gm-Message-State: AOJu0YwA35JQ+eAVP54lsQLxi8SinkVbkyGcAmKMfEpelytR+pul377t
	iqsImkgDd8DwLWbUh5vOYdINl+F9wOzMCQ==
X-Google-Smtp-Source: AGHT+IFfdQ6W8DrAFfMmwBvvkZPZSlNqYH1Cx6AqgmNr/yZ2PnU3nphf//hbdG/MRTcGbIrjxFLKiQ==
X-Received: by 2002:a81:f80b:0:b0:5f7:c08:5c66 with SMTP id z11-20020a81f80b000000b005f70c085c66mr5500122ywm.81.1705454102383;
        Tue, 16 Jan 2024 17:15:02 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05690c030500b005f576de678bsm5334681ywb.54.2024.01.16.17.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:15:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] strongswan: upgrade 5.9.12 -> 5.9.13
Date: Tue, 16 Jan 2024 20:15:01 -0500
Message-Id: <20240117011501.1856510-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108322

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fixes a regression with handling OCSP error responses and adds a new
  option to specify the length of nonces in OCSP requests.  Also adds some
  other improvements for OCSP handling and fuzzers for OCSP
  requests/responses.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5be2e20157f3025f9e2370933267a56fd526c58e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit b135007c8ff43c18dd0593b5115d46dc6362675f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strongswan/{strongswan_5.9.12.bb => strongswan_5.9.13.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.12.bb => strongswan_5.9.13.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
index c734b43b64..afa1a684b1 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            "
 
-SRC_URI[sha256sum] = "5e6018b07cbe9f72c044c129955a13be3e2f799ceb53f53a4459da6a922b95e5"
+SRC_URI[sha256sum] = "56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


