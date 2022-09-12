Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0427ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 03:41:36 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.3702.1662954092107677556
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NE7QvBWe;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so11039062pjq.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rx4wx+nTk3Uz4/kmt6F9c93k1rwfrDWMUgaXQwzmkTw=;
        b=NE7QvBWeDkCkHS0TZi3fxM2EhRCDO/dICtzZEvlXZ8eUY8yQDzI/aM/dLzE6O+u/PN
         b/sSZOVtPyigzH2ByfieQ95OV0aAGMRsIm39gp9oz07T4BBWnGccf8i/b3Tk9Kb6933t
         rOzAQEablE337P/DFHYFIndVMmtSyj/WRA7cDgi1cjd2d8LL+2vyhCfsII9lziQB6Rhm
         3pKWJu9EI1ILAVATk+zru7MD18tX0Hvp4P+syEhv8Bc2b6l2/T9YLkCv2B6a58iMXMh0
         5M5h+BbHnjuflAhNJ4DUS3F+7qA7bh4Y67FmxLtCN3vxBtHTbOefK4bICBQZVMBx3VMQ
         F1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rx4wx+nTk3Uz4/kmt6F9c93k1rwfrDWMUgaXQwzmkTw=;
        b=yQgCNDKlNcYtCqFQd8fN1jt/mHaeLd6+C38KKZtblmLQUjZqb5h5kApaVbjXL3GbXM
         qalZq+nB0RJ3BwSwXUp778Q5myPzU97B56nMzGEuoZbPUrGImBa3NwUAAPkYrpY8vcs9
         6oKKOKKJoXY6CcpHyJgeHIOBsl1hoLDc9n2cwKxLbaBDycSYratMfaSDaq2/pCkX1uTf
         tzQ5L8OtmVzoJYPnNkvmEKV7dzg4C1cox9lbT7sizpTMct/pLnjNwjKb5QPRz9qzHm0i
         4uVhoLjq5T3/LvpVdVccUwqzPb1mGM3KeaY2BRzFrbV2rrmiRLzd1rA2ZmBBfPn2zYbu
         3Cqw==
X-Gm-Message-State: ACgBeo3Fr3ZdQA4PlihjyVIDN5HBr4Ozvnt/uDZ9m/TBRlEeKX0O6sU9
	LwcEIGKLi8IeudP79PHhLV3DWQoPUCa6pA==
X-Google-Smtp-Source: 
 AA6agR6Hvwebq9Io8zwBi+DeB7aRlZVNczoTaXTWUkWV1XGryaslWjYxUeccdi/Ba+G43TcB0rcHyQ==
X-Received: by 2002:a17:902:8307:b0:172:e611:491f with SMTP id
 bd7-20020a170902830700b00172e611491fmr24531508plb.111.1662954091357;
        Sun, 11 Sep 2022 20:41:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a170902cec700b00176ea6ce0efsm4664940plg.109.2022.09.11.20.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 20:41:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/7] minifi-cpp: Fix build on musl
Date: Sun, 11 Sep 2022 20:41:22 -0700
Message-Id: <20220912034123.1885229-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912034123.1885229-1-raj.khem@gmail.com>
References: <20220912034123.1885229-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 03:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98746

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 3b57ceace6..3d40bf8578 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -81,8 +81,8 @@ do_install[cleandirs] += "${WORKDIR}/minifi-install"
 PSEUDO_CONSIDER_PATHS .= ",${WORKDIR}/minifi-install"
 
 do_configure:prepend:libc-musl() {
-    sed -i -e 's/-DHAVE_GLIBC_STRERROR_R=?/-DHAVE_GLIBC_STRERROR_R=0/' ${S}/CMakeLists.txt
-    sed -i -e 's/-DHAVE_POSIX_STRERROR_R=?/-DHAVE_POSIX_STRERROR_R=1/' ${S}/CMakeLists.txt
+    sed -i -e 's/-DHAVE_GLIBC_STRERROR_R=1/-DHAVE_GLIBC_STRERROR_R=0/' ${S}/CMakeLists.txt
+    sed -i -e 's/-DHAVE_POSIX_STRERROR_R=0/-DHAVE_POSIX_STRERROR_R=1/' ${S}/CMakeLists.txt
 }
 
 CFLAGS:append:libc-glibc = " -D_GNU_SOURCE"
-- 
2.37.3


