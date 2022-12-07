Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6E6C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 04:18:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.7323.1670386702539773024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 20:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iD01cbn7;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id 4so15975655pli.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 20:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SOH/Z8GG9a61ti8V87pLESv8gvGYuve5qs0lV7OR8vg=;
        b=iD01cbn7xEgCLrPuY8cLL5dfuNi3UPcW0D8gwM2MojbNXW2dpY1ebhFpM5BiYrnlB6
         jQyG0WLSEgpQN7WPzSUIeoA8HFIyNgZvhuz8Vepa0WzPW+TtJuMLTs6JrE7U+bAdBm5I
         YMyigexmJJwK5uhcb8JoA/KWyehYJLRbWVdSaZv0SBYyi4Qhv55H3eqiQEgiRWF4X/4i
         1/BUVTCmdDwpdA70YOKuWa144PkBUN86IJ+U5HCPD2dcvj5CAzu+7MpB1elQzoll4Nqw
         4eFsWdgJkVt+hw1miFT5frMvnejMynGuTquhcX/uvo0Wm9bjvsHKaMuqEOAF7a8541d4
         lCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOH/Z8GG9a61ti8V87pLESv8gvGYuve5qs0lV7OR8vg=;
        b=xtB6X/j2VHb7faQW60XT20qU3YyeLxIJsQrFXqblqZ/kjO0/xtZBWdeiNBbG06mAbW
         vHcTov6XsPu1JNKeDHi+p5nEiXosMQ1aCeXNNh5Wh91Xl78NHglkPjPq4i/R8/WP4p85
         DzuChBYHLqO31LvPB4FBP3bve0j6Y3bAg4MaCGQcuz7C3SuYTrK490YUColT9Ryx9pZc
         ei88xtpArb1DWSuxiiITZVvTZI4z3owdxZMU4AFHHNNV7bgfyuFn0Y5SsJtNflIYNL0i
         qHicd2yy4TOJlmtXE/KBc6JciieemoJVLN+RI/0exsTeZ3r1pXCgGu18iCEM2ZHJS7R1
         +Rqg==
X-Gm-Message-State: ANoB5pkTqDHTqNIFN4XhtQg5hbKJzu/5EuU4i6B3XWNDsl/ViMbNhPbv
	VxCDoA/o2lAWtwkzbHKlAxBNcLADqZw=
X-Google-Smtp-Source: AA0mqf55TkT4gPA5IsKLHpcfzjWQGNqwFhBbzA8Dpp4FEgQviODwf5nwT89dGPI5GO7+8ixUoWzKXw==
X-Received: by 2002:a17:902:b48f:b0:189:8b6:95f6 with SMTP id y15-20020a170902b48f00b0018908b695f6mr73841807plr.71.1670386701292;
        Tue, 06 Dec 2022 20:18:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id gq21-20020a17090b105500b00219220edf0dsm166262pjb.48.2022.12.06.20.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 20:18:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] imapfilter: Upgrade to 2.7.6
Date: Tue,  6 Dec 2022 20:18:18 -0800
Message-Id: <20221207041818.1799199-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 04:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99969

Use git fetcher to avoid src-uri-bad build QA error

Changes in this release [1]

License-Update: Update copyright years [2]

[1] https://github.com/lefcha/imapfilter/compare/v2.7.5...v2.7.6
[2] https://github.com/lefcha/imapfilter/commit/ce6b9050b284b9944ac52371a4a2254fc73bc219

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb}          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb} (60%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
similarity index 60%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
index 111a8208a9..eb23816e8a 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
@@ -1,11 +1,13 @@
 SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=db3b99f230f9758fd77e4a0654e2266d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c11d4fd926d3ce7aac13b0ed1e9b3a63"
 
-SRC_URI = "https://codeload.github.com/lefcha/${BPN}/tar.gz/v${PV};downloadfilename=${BP}.tar.gz \
+# v2.7.6
+SRCREV = "b39d0430f29d7c953581186955c11b461e6c824f"
+SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master \
            file://ldflags.patch \
 "
-SRC_URI[sha256sum] = "ab19f840712e6951e51c29e44c43b3b2fa42e93693f98f8969cc763a4fad56bf"
+S = "${WORKDIR}/git"
 
 DEPENDS= "openssl lua libpcre2"
 
-- 
2.38.1


