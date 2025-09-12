Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15353CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 11:08:45 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.13939.1757675322835310493
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Sep 2025 04:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XrRjySgi;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0787fdb137so262398766b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757675321; x=1758280121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARqCCBc72pxl8QCB1TKL9s7Nko0BKdJzAk5IIGNtqEc=;
        b=XrRjySginjjANO7UeITu06Bx7ZFXKhTDk0JbMswNoM8IoJv0jYTZGYjoWEfoBIP7GC
         9P5+lQuC6i/rV4jpy+cpfDeE4HPOXZB3HE8WlERSaw7zFtd4B91MpiPbWPli7VCBk+LE
         A5nmprmHdoxZiys0K5N8QS+KBDKLhDNCS2/3L9Prv6xzRgJtiWdZF3CVqejBx+a2tP0q
         crbZJzRiLkPdVHKrArRUHBVSzGdk4q8tRUXuGzpk7sP6MZQQvZdOoGNhYhk+qyknFz+f
         ow6dXEaWVrr2gkVDRAlwbP5GCkbTYjVB50Tq4ZvMFwCA5aPnhQ5THmalZeDrxttEDFkH
         MJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675321; x=1758280121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARqCCBc72pxl8QCB1TKL9s7Nko0BKdJzAk5IIGNtqEc=;
        b=Vp5en+ABmwWwoN4ZRFJfcTSmMrL4p/8JFhH6VAvMvU15zdH9w4SF4sFw0DvS/fqhAE
         Pra2Qyy+lKL12OimLLnr5psJntdv+5mZIqNQQlVObJElBYd85+aTSDN2hKnRS/3NOsJW
         mM2Vez+qyTID71b3ZPQCaCXrn7ZeobD6c+XO6BbxgoTkBqrY9ZIQeN8ELjGXGMs2dIx2
         HYjW7ivA3+qYoXNWu8rjbCn5jC8t5GmOTCmLSUUpJyiXumtTX9JPzIABHhFwmnZaQ9re
         WMvrG9scIblcGrqgjkBHy4/waF+hq7+GqUXcb5kIxAQ0c/Ka8kxp2nknZje/4HRnsLtY
         jnig==
X-Gm-Message-State: AOJu0Yx/lI4EJkWrGZOE/GJsaEFOfFGKS84FU9delErw48ZCQebdb3pw
	podYZzFzcYpm8b9KamuC3SyYXVtxViNjDHvsK/BhtumNUiud0hMh8DsUV1zloA==
X-Gm-Gg: ASbGnct+OaCvk7QU+wujJQFOiAMjxQy28ndPl8v920X7HoXF9fSCMjdLLGopMUjdSKj
	P+4U2csRutYEZCqN7JKXTNBtbSHP8iGug2HEX7y1t2+RSeVMFimIlbVkN3mh5EbTOchfXfP6PKV
	9hzE598kulvuwS+luR8TNJZvmvdLZG6Ic0mqBeWO2eccrwbd56jm3wE3ag7SzbK97z5J6syb7Qg
	yU4RKnCnQ/rMBF+2e8KT3InJ/zVKs3C9hGv7iAjVg5XDGRIRHD5FhW+mf88U8OYKVTkF6qUTWoX
	v2h+n3bw0stObSfttmVfKNXl4WkTN/97Lq0aZ5xCZDtzYBb6SpdvPVHwGn37AQU6xth3kUg37t/
	qtyQShdNH0AvMxIkVIjd+
X-Google-Smtp-Source: AGHT+IEkRx9fkh3xbI5rloccuShGeTcEfRt/4w5hsO0fBHF/Qh7KCpxQNBsz89O8/tBNBGfQyC77mQ==
X-Received: by 2002:a17:907:60d0:b0:afe:a6d3:b4a2 with SMTP id a640c23a62f3a-b07c353ecfdmr261899866b.11.1757675321012;
        Fri, 12 Sep 2025 04:08:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c4043ec2sm174129666b.82.2025.09.12.04.08.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:08:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][walnascar][PATCH] libchamplain: don't compile for 32-bit targets
Date: Fri, 12 Sep 2025 13:08:39 +0200
Message-ID: <20250912110839.260087-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 11:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119378

The recipe can't be compiled for 32-bit targets currently, due to
GTimeVal usage - see bug report in the project[1].

Remove the 32-bit targets from the compatibility list until it is
fixed.

[1]: https://gitlab.gnome.org/GNOME/libchamplain/-/issues/61

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/libchamplain/libchamplain_0.12.21.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index a89ab8cc74..3be9e8057d 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -12,3 +12,13 @@ SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
+# Compilation fails on 32-bit targets, due to GTimeVal usage, which assumes that
+# time_t is always long, which is not always the case.
+# See bugreport:
+# https://gitlab.gnome.org/GNOME/libchamplain/-/issues/61
+COMPATIBLE_HOST:armv4 = "null"
+COMPATIBLE_HOST:armv5 = "null"
+COMPATIBLE_HOST:armv7 = "null"
+COMPATIBLE_HOST:armv7e = "null"
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:x86 = "null"

