Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E92C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 12:30:40 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.36092.1653913828675242381
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 05:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MT001q/O;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id s6so557834lfo.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 05:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UNdcnDRWedw0lH1RN0NYuyu7ZooCnRSJk9z5C5IfBfI=;
        b=MT001q/ONwSN/b5d8Y/s0V0A0m3OfnbwsqbbdlfbhadxNATXftdco8cWKQ0tS50v9d
         e7KgeuXf3fEBmIwIQyjnlYVPQli4KZZLDFZZ2bN4dLD4bSx9BVqlxiw9mVOkPoDaJskR
         Z6a4FxVviy+zvJHOqzaSEdJpqr+BovwlcuYPctYMB5WgeK3lAk07jBOlvF8ZQtxAuokm
         1bG6LfgESkLjySx1Rw4fhQUN5tHTzJkxvvshReam+c7EPf7DQVOPTuDDbi+sFsiKx+0l
         A7eQXgnI/gnrHIjxXNrmjMWVRljSUuiozwpj0dbPJmn/k4sL+hyZSnE0SNl4OXmKa76l
         a6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UNdcnDRWedw0lH1RN0NYuyu7ZooCnRSJk9z5C5IfBfI=;
        b=6jChtNw7pdH0aQkQDpyFfJbhq/8tYvjQ3/xQiVQRdX00Uvo9BnPEc6hi4Pv3O7cua8
         /2L7B7+NG+XFY1ZDOKIG+tHE3FUW3tqjLCK9dkuZvzyB/WrtcpuvWYvGf1GmBrRQdMcb
         GVPrAFnakFwSTPqu2/5ngFPK7pjD69VcZVq61k7WXfGN5TWwWfhRYOataEQQxQWToQYg
         T01l3A+hHdzjcHngE4jF6fFuuWcYutCjfSK344KTNW2rCZ3dqY59wSoNScSn7DY9+3F0
         Ti5R/iqg/fFlAur1d0CmgJlhx0MspYCjvyNITzDOksLHGH+fQ07J2xygtZvliGMhKBh0
         5hMA==
X-Gm-Message-State: AOAM53095ky8XBToQJIpabbPc+E/W3PkOpevZuqtGhU52rT7IL57aI7u
	IJ4Bq9KTFCaPSn/vViYOWP+OLHOAdqw=
X-Google-Smtp-Source: 
 ABdhPJy7YuIgpZaBoMHGBrC55lWrLnhJ1Nwg26ingIlFLZ1lbRg1LK6n8S0yQbnoZe2iHnl3Vj0jHg==
X-Received: by 2002:ac2:53a5:0:b0:477:b080:f59f with SMTP id
 j5-20020ac253a5000000b00477b080f59fmr40245830lfh.241.1653913826465;
        Mon, 30 May 2022 05:30:26 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 x28-20020a056512131c00b0047255d21197sm2281521lfu.198.2022.05.30.05.30.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 05:30:26 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] flite: add recipe
Date: Mon, 30 May 2022 12:29:52 +0000
Message-Id: <20220530122952.2715776-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 May 2022 12:30:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97328

CMU Flite (festival-lite) is a small, fast run-time open source
text to speech synthesis engine developed at CMU and primarily
designed for small embedded machines.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../recipes-multimedia/flite/flite_2.2.bb     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/flite/flite_2.2.bb

diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
new file mode 100644
index 000000000..9ab9c0208
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Flite: a small run-time speech synthesis engine"
+HOMEPAGE = "http://cmuflite.org"
+SECTION = "libs/multimedia"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b3b732d1349633a53e69356607fd2d6c"
+
+inherit autotools-brokensep
+
+SRC_URI = "git://github.com/festvox/flite.git;protocol=https;branch=master"
+
+SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--enable-shared"
+
+do_install:append() {
+    chown -R root:root ${D}${libdir}/*
+}
-- 
2.25.1


