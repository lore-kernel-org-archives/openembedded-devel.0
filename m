Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DC4E7E0D0
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45581.1770637148469583735
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F9Qnb1Dl;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4362507f0feso1950950f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637147; x=1771241947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mj0+gkN1u6gSc/nAzjY4nNqtAnzrxXQIMXr+RF6VLoc=;
        b=F9Qnb1DleU/AyzTGO3Fed5qCEnRwjRqljCFJPumczpq2m5g8i5VEq9Ki4w2oYMjuX4
         9WbxHQcxOv0SteNmyeQYceYgtUFEKlwKKSOHzV1++wJt/vpCxyi9OEG4hVm7OE5c2rmF
         mfhRcDJ3cjMmVSqxmY4XIrNDYvuDCbCbX3gxbWLrjwDbeWxDqC27WcY9YL/PWk6fra3t
         szoH6+X64a07zgkAr6HTyNvL6I26xesIiKmnqay66wN/par6RFUkcjOSx77vr8oR/bWV
         R25GSMSUb/+GSXrDhW7HfBh7iP4uzQxGSf17zgLrdOCFrjtgxJE86Y7t9oow93hk5TOq
         NTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637147; x=1771241947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mj0+gkN1u6gSc/nAzjY4nNqtAnzrxXQIMXr+RF6VLoc=;
        b=W1lp13DeP07+Kb7CLTtBX+JWhgkIytSi59b1V68qhjw/kkL0gbHnjoOdgxY8AamD1S
         dmuM1GGLfAIZASqXA5OTL+mHRcjUygDyZMOaUqHedHDq+SXslglQ4D8g5sCeLNZaAUhH
         Pc/lMp890cMv8yIdh9n2Ye02xcF4xwAZr25xaqInb4WvYwcMAn4IsFzTdTDsIUkgu+ih
         KTM5fZTwlqPdGtf/D6rjHgRkflBkf7uALnMh7V/z98t85FnJP4t41j1nbZbojgTqALpj
         4WSr5DVIK4a/zeX8y38NAvYVP8XqFv3muMz3Qermt5CJ6t1r5FluJmq79uhJN7DzveE1
         sx+A==
X-Gm-Message-State: AOJu0YyNorNVmfeHWhO8ajnL395VDKu4C6m1l+Druz25PrfXMbh+2PT8
	+crJ4unwPxPA2FxscQOnjweyQXtR3HvwTCs01QbMbUmQtu9tbDFJxsz9+Ki8yA==
X-Gm-Gg: AZuq6aLgbkFUpQShBk5CmCL9J0nQI/39Lm5AcHm9LFZwhpk/YLOcw+1MQwh76upBnuD
	zdDMA2bdLFnnZu64w0JjDwZteDw1XrnTC8RMwGQQ99hcLB1lWX/jOjjL+U0RBUIuK07hlRWEDeY
	K1zFm31G018jigxTadi+ub5LUzqZQPc4+yOgxS0ty/ZzPl6Pl2ocqima+uz6guoRuUrGfHA/+Cu
	S8VXsQv3cMadSD9HM3RtlqzUBQlC+Wgp9s8uHspDa7U4U9e4mRJjw5KoHidNyK98tC2IX8AJcjM
	bACW3XhuEj8M9NFN8i2nCu+NFZQYJrULLI1Z/tGLtaIqyg194r+f+bBwBNuIrodFDLXaU2I1J+T
	Rmq+RcQr7B0fyLPwV0U0qvBMR9p4rjNbvbF4i8RQyqsBDG9OXYpvcZ4F+GXZfUK+Q0NXBU2ugOZ
	hZMfEkkuOXrjIXXfvT1v8=
X-Received: by 2002:a05:600c:5488:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-483201d5fa2mr144440535e9.2.1770637146079;
        Mon, 09 Feb 2026 03:39:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 02/16] sox: patch CVE-2017-11358
Date: Mon,  9 Feb 2026 12:38:49 +0100
Message-ID: <20260209113904.3442496-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124297

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-11358

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-11358

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-11358.patch              | 29 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11358.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11358.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11358.patch
new file mode 100644
index 0000000000..9e797c0e7b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11358.patch
@@ -0,0 +1,29 @@
+From 0e3909288d38487d7c86b11c7509cca01296fdc8 Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Sun, 5 Nov 2017 16:43:35 +0000
+Subject: [PATCH] hcom: fix crash on input with corrupt dictionary
+ (CVE-2017-11358)
+
+CVE: CVE-2017-11358
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/6cb44a44b9eda6b321ccdbf6483348d4a9798b00]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/hcom.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/hcom.c b/src/hcom.c
+index e76820e..ee28cba 100644
+--- a/src/hcom.c
++++ b/src/hcom.c
+@@ -150,6 +150,11 @@ static int startread(sox_format_t * ft)
+                 lsx_debug("%d %d",
+                        p->dictionary[i].dict_leftson,
+                        p->dictionary[i].dict_rightson);
++                if ((unsigned) p->dictionary[i].dict_leftson >= dictsize ||
++                    (unsigned) p->dictionary[i].dict_rightson >= dictsize) {
++                        lsx_fail_errno(ft, SOX_EHDR, "Invalid dictionary");
++                        return SOX_EOF;
++                }
+         }
+         rc = lsx_skipbytes(ft, (size_t) 1); /* skip pad byte */
+         if (rc)
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index c8a7a1829d..b1cf516f62 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
            file://0001-Update-exported-symbol-list.patch \
            file://CVE-2017-11332.patch \
+           file://CVE-2017-11358.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

