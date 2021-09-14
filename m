Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.330.1631661489140925721
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 16:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IfkTH9Ri;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id m21-20020a17090a859500b00197688449c4so870255pjn.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 16:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gYU9jo3CmVKblb8sghJP2T4fJIGXI8n8IucwPgSA/5Q=;
        b=IfkTH9RiffuRtZ56ZZzSgjRvQ00mXDX7y5SFZWRt3q9kTSpEe+7sMelCQWf4dt4kW9
         rIFayjUwDNzLjonPs6YeINpj+P8FUA05KHuien8ZXzqM9cfJTsC6jEbSuERCPoXqj0BS
         Ymj2z6xnVaOrSA8zk7Oc32CjN5f5fTh6XTmU/xEvLtUxcmPqzqM4pbP463fk6e7OzUbf
         6OwGnlmMWZive0vbiFWudG+4SbaN/fuTmSGZNmgacMmnCUwJhzWFLubRizF22RVCzojg
         nWS7MzReYJMoVdGKnrjuUKxuOoMbZRO9sYRzNuMwjxO9HuRUugqwdq8w8mTwkcipOcJm
         UmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gYU9jo3CmVKblb8sghJP2T4fJIGXI8n8IucwPgSA/5Q=;
        b=jD17gPkkiT9M/IzWjFz4IjAaxzqYKdchJK9W/9PMEUWwHmcDDIic2SqtYSKsHYDHmI
         /F4r1DzG/kSdHnq0vfdnwgFCT60kao1VQI+2PZZb0Olpo8paUxIaNg4XrZrj2FKFZ0Lo
         xbKd5BUneLNhE62iiI603Wj3HSSF7IAcuFfL1xmvxbuBO8ZtKIPSSzTuflQEx/N0npQX
         2eCvBZOTuGfU99IQYhRoII+AELLPtUS+VOfdzPbGbxhWJvoQ3Z6zqeDqI8IUIXd/n2Yt
         LPgk9nlI3RUD68fZEJeofSwi5u7tYA8ErwBfaDfrZYCuYPVfEOUKsuc/Wt9ITJp9Xkxa
         i2sg==
X-Gm-Message-State: AOAM531RZEzyRgA72omJ9SHPi0n+lPEleNhOIwF04dqNPE9I0NGZ3VFi
	nxgHbu6DevoGv8qs6MKuCuLnSRPruW9idQ==
X-Google-Smtp-Source: ABdhPJz7oAh7TO2CaaqpACdcZ9JUY0iyEleaNMZRNIthR7KspejIW11pR8ZZ6ZLSBn8rK/OQ0s1BEA==
X-Received: by 2002:a17:90a:e547:: with SMTP id ei7mr4943474pjb.177.1631661488224;
        Tue, 14 Sep 2021 16:18:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id g12sm2557427pja.28.2021.09.14.16.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 16:18:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	"William A . Kennington III" <wak@google.com>
Subject: [meta-networking][PATCH] ndisc6: Correct the SRCREV
Date: Tue, 14 Sep 2021 16:18:05 -0700
Message-Id: <20210914231805.2790909-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since its point release, no need to use +git${SRCPV} in PV it can be
absolute

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: William A. Kennington III <wak@google.com>
---
 meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
index fdacd41438..037d929b66 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PV = "1.0.5+git${SRCPV}"
-SRCREV = "b706f5f01aa82aa0db678fffd15a1527f330c50"
+PV = "1.0.5"
+SRCREV = "b706f5f01aa82aa0db678fffd15a1527f330c507"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
            "
-- 
2.33.0

