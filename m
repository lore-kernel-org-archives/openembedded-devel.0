Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C90D13C11
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:17 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18913.1769432710580517299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iFqLgGl9;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359228b7c6so2880645f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432709; x=1770037509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mszX4OX/4k204+zqhjgNjiuMx0fndDpRyvqpyExta/k=;
        b=iFqLgGl9mgKNcxfDuyPhURHrUqwWggMBeiXxsx6paeEm66vdb+2HT6Zf3/J3oj2ZPp
         0KgvQXg+/PnJ1PY/Pz6SXrW2Qi5XzvWE96fsVBhQ2x5a2pCh4ShbWbHif47I8hhLbZfo
         VLQwft10AVeWu181ecmEyODljwefD8Z5TmIr3z49NhvSuVdaiNhHDAkpRSU6ZIXgJxZs
         otQ4PL2yPQT9UnmHxxFTCxs8SK3ZfiW0B4hVOSHaltXCRnMv4i4VY13+ppVdjwzeb24F
         w2jiHRqUJsGWVsy2cH2nbivCwiOOv/OeLEoLi0CyG7CQJh29NLH22ItWdIFiU7ykiisX
         NlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432709; x=1770037509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mszX4OX/4k204+zqhjgNjiuMx0fndDpRyvqpyExta/k=;
        b=LrE9BUyEwX2JBI++h4unEmucQKnKza2w/Jvga98pw4gnyV8WJ0AhUVpDEycQukWGzV
         Rpz6ySrUVwfLsvDkdfdTnxipaZg50E2a5zRtA0eXKYvrnO7Y1dopu4GzjaBoZlCVe8Zc
         IuxDaPx4SqRL5cvX3zht6xncJQvru0SMt8x4UYxFyIurqmWMAAnF1A3XNna8pcqhiK2d
         M1xkGQ4jyL57MfBMZbusDYNsX/U9DjoksdkE6D7RWa1oREKzcsgH4wLUF6U81VnEbqCs
         RZyGDzQoHcqhjsd2u44lyCinBr5Ic9+tkjy1125WPz8RsTy05T4liimRWyNfzR2G9b38
         9c3g==
X-Gm-Message-State: AOJu0YxiiehUBVfqmq7v+HerT0RMNXiQLSqcjPXuzKEqA4RIzS5TafMw
	hNmpogkThAxYKTRXgaMbUJ/MJ4y5Erjx1VclbDNXNL/Z7S4dcASZzKIV74MVng==
X-Gm-Gg: AZuq6aIq2IToOJ7fRr0s01MjQMuTdiEq9uk3X9Rb29FU9/9KIO3JZ0TTMKPxLD8z8go
	fJvxvqF+Izr5qiFjrjGfIvVfMtlwaiTYTQNkqIIxgvQ3lyTewz6SglLtk6AnbLCbFA4SYHuhJtq
	v0x1JCiut7Uf4ome68Tk6xfpqDuuJG7HLVIqrreS3zG2f/jepnb105Ez2tgygWqhdg1jUVapM1/
	CvyFhZAG2sSpmgQogoCBvbGJKYzhExzkNoFO23XjmPGAQ6A0E7UMtsjDms6cbTcc0R4qoQQguQ5
	lrDdCB6K1VcoM3hEqC1cz5rUJg8PokZ0fppey3seImpmAhGjAdjNKBT9tlv9M8z3B5m42cDGj63
	KT9amGAOo2lLxeoRVnb0iXw5x3M7q69sGJ4tWB15yvEe1X9hd94+FeAwsTawuU7zEPaklaYa03V
	fAj/oswi3g333vNkXxw4Y=
X-Received: by 2002:a05:6000:2dc2:b0:435:aaba:b8e9 with SMTP id ffacd0b85a97d-435ca00a52cmr6101681f8f.0.1769432708682;
        Mon, 26 Jan 2026 05:05:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 02/11] sox: patch CVE-2017-11358
Date: Mon, 26 Jan 2026 14:04:56 +0100
Message-ID: <20260126130506.82699-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130506.82699-1-skandigraun@gmail.com>
References: <20260126130506.82699-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123879

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
index 38566735bc..8f6808b0f0 100644
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

