Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74422C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:03 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.2698.1633977722005947999
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VFtVNXMA;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id m22so59254257wrb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JcVG6RIJMarHpbc1BIYLXR8/yyi+IBPizSueotJHSrc=;
        b=VFtVNXMA4o37da8KC/3r5PsXbM0z7Ex+D+jxygKZIQvBs5ikJDtr7yB6EXZNpx1LzH
         YPpNmymFiE6FUkzPkHs3vT3Xlz5qFBhPbvxKJl1/F4KSSEsstqExdIqcwOrgk1TG/A1s
         pltXnYzYuq7gwVKgluZdkNq7EQmaS5HyQpzyDfxr3pb98CcZbvTjG5+0XGXkNXe+ODyG
         sLaTggznOPc6k6fpItkiItQGVTXCo4b5Zjsgc1E4TaQ00f1H1KuTwt+1nhFWhLxcG+W6
         AY0IOaHSwUmYRlXTwfw13iqHqyyZsFnAq+VTahqTpxfEmMUOLXnsLG97AReKCnN4kH7g
         Fnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JcVG6RIJMarHpbc1BIYLXR8/yyi+IBPizSueotJHSrc=;
        b=mPG8EwGfjtf6LjuRAXeREfI7j9iRd8h0HG372kYu3PMfEDcsuByzoR9UyoN9C9uGOT
         vK64MDOw3VwWW04wqt8nbvpfNW3MZA0aSkFFHGsueJ6t7cOFEG/tklfluR/p/yk46XAt
         hlD7S9BURZqqEAaeLT8t8D9qEMmQGMK29KExd0mVjlzNifIaj9T8gICPlo3wCHXDhPSi
         QQ2IPoPlPrP8Pl5kF5xmfFQpwqKzwZrMI1p+R7zYxcjYGApTPyEhRVx28KK+CyVnVvH5
         5VrvnhjGulvJfpXHS8mWJon6Mejz0s8Nfebbrv0p4U3tBbTMURSa3n1kLp/MObZ2NGld
         6cRQ==
X-Gm-Message-State: AOAM531I1crRxYUrf7Vlr6RdIMWJa3dY4loBjKGC3XgNMknOBfkTLMcm
	cFvE3/eJjFUoS6jz1cIKCUASmU31md/zTg==
X-Google-Smtp-Source: 
 ABdhPJy5TWqpyKxWJjHRK5P/C4L7H/fufb0xOMhoDj9XdAJQxNC6pveZg613Sg8Ps9BxW07LNtlrpA==
X-Received: by 2002:a5d:4b85:: with SMTP id b5mr27418388wrt.362.1633977720621;
        Mon, 11 Oct 2021 11:42:00 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:42:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/24] libsigrokdecode: add a python 3.10 compatibility patch
Date: Mon, 11 Oct 2021 20:41:35 +0200
Message-Id: <20211011184140.653609-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:42:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93233

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-configure.ac-add-py-3.10-support.patch | 24 +++++++++++++++++++
 .../sigrok/libsigrokdecode_0.5.3.bb           |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
new file mode 100644
index 000000000..85e49cca2
--- /dev/null
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
@@ -0,0 +1,24 @@
+From a5835dfe126bfe6ed0b8197c6578960835bf1fe8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 3 Oct 2021 22:08:50 +0200
+Subject: [PATCH] configure.ac: add py 3.10 support
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4802f35..e0e468f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -93,7 +93,7 @@ SR_PKG_CHECK_SUMMARY([srd_pkglibs_summary])
+ # first, since usually only that variant will add "-lpython3.8".
+ # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
+ SR_PKG_CHECK([python3], [SRD_PKGLIBS],
+-	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
+ AS_IF([test "x$sr_have_python3" = xno],
+ 	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
+ 
diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
index d78d2770c..86b894090 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.3.bb
@@ -9,7 +9,9 @@ DEPENDS = "glib-2.0 python3"
 inherit autotools pkgconfig
 
 SRC_URI = "http://sigrok.org/download/source/libsigrokdecode/libsigrokdecode-${PV}.tar.gz \
-           file://python39.patch"
+           file://python39.patch \
+           file://0001-configure.ac-add-py-3.10-support.patch \
+           "
 
 SRC_URI[md5sum] = "7ba4ed4ef1f06ae96979751e096c2821"
 SRC_URI[sha256sum] = "c50814aa6743cd8c4e88c84a0cdd8889d883c3be122289be90c63d7d67883fc0"
-- 
2.20.1


