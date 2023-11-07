Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02082C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 05:42:21 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.4271.1699335733096312458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 21:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VoVtvpTx;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6c396ef9a3dso2484688b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 21:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699335732; x=1699940532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpDLfRwa0FFQD5tmfq/+7xeJ7aMzHEHkofDm7YHJcdQ=;
        b=VoVtvpTxgcJmtP30Nm4SoSKeo+JHJ5Bgmstg87KZf84fpGeVDvB3U4NcQq2YEVs24U
         wFTziRSi/JguamtXdP6CvIIAwMboAfc5JQinWqGm3oVZ/gsEa/UnGqLSPQ8iLvHaOvqj
         lcJBg80S2kcKMoDnqB4y8hGImaWo0+4euJTbvcEHwQXOOb/gn6mZ+jvmzGYQBpLRYbMU
         xlpiBZOB0eoEk+hjMShbi9MSEgCDxGWLHHXtfQTwHhtuauKRtiD5D5T9GW5FLPVu4LZF
         5YhAQJgeF8feSzvMNUCxawm+ChSBkTXnW+lz/gbpEo4EdW2fK6qXv6UuAw76NsH5rXBu
         SViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699335732; x=1699940532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpDLfRwa0FFQD5tmfq/+7xeJ7aMzHEHkofDm7YHJcdQ=;
        b=JouEA3ey0NP6Kc/yyr2BPCcL95VLIv2N03PCC2BWG6hVd66B+g4dNCHOll1QnMDdPj
         kpCl3iX/dgPJCGHOLQwpbVEcYK4HwzB3BpHzXWGIZnRtnE5Gdo8fPPtBrWNZiVBCOAy6
         qq+GmDvcbMfP/yEpiNrKZxZTwOnq3nFuyqZnkJLAQ0ccftMzaamTvgGLkE62Z8JpZ4zs
         jdShsyBl4orZ3s2sSg1XgKxqhar63mzHVb2vkFIOCwullkD1GhqZgWrtzhiYmEgcZDaw
         1HM1rj6DHjKzz0gZqE2kh/UMew+zaAikwtX5BQB21rytkqZf8KJyPtQvQyOh167zITWR
         LnfQ==
X-Gm-Message-State: AOJu0YxsPstSVzP4DAPVZEh6O/ZKDGAPk4GW86HjYMDiPWQqwZNxYs9F
	+mvqk9mvqDA4VtabFmTXjO7YXGGyPgYT4w==
X-Google-Smtp-Source: AGHT+IHqCw2WxsRSI3KM280h7WIZTD6Y09mTX1cGHJBldulh5WrasPMeEW8kcTDI6PL+1lIeLyW/Jg==
X-Received: by 2002:a05:6a00:2d1e:b0:6b2:7a88:7128 with SMTP id fa30-20020a056a002d1e00b006b27a887128mr28538204pfb.22.1699335731394;
        Mon, 06 Nov 2023 21:42:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::38be])
        by smtp.gmail.com with ESMTPSA id l21-20020a635b55000000b0058c1383fa8bsm641927pgm.0.2023.11.06.21.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 21:42:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	"Theodore A . Roth" <troth@openavr.org>
Subject: [meta-oe][PATCH] modemmanager: inherit upstream-version-is-even
Date: Mon,  6 Nov 2023 21:42:08 -0800
Message-ID: <20231107054208.1653920-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 05:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106420

Odd release numbers are for dev/unstable releases

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Theodore A. Roth <troth@openavr.org>
---
 .../recipes-connectivity/modemmanager/modemmanager_1.22.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
index 95884f44c3..af1b98cad4 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[qmi] = "-Dqmi=true,-Dqmi=false,libqmi"
 PACKAGECONFIG[qrtr] = "-Dqrtr=true,-Dqrtr=false,libqrtr-glib"
 PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
+inherit upstream-version-is-even ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
 
 EXTRA_OEMESON = " \
     -Dudevdir=${nonarch_base_libdir}/udev \
-- 
2.42.1


