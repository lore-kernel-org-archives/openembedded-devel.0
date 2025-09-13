Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A64DCAC587
	for <webhook@archiver.kernel.org>; Sat, 13 Sep 2025 11:36:38 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.3351.1757763390230998737
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Sep 2025 04:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+3IwTLn;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b0787fdb137so413702766b.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757763388; x=1758368188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8b7uNpPxbB1fRBWurft3prptO6QhNORc4A8k+nV6f7c=;
        b=m+3IwTLnaEZyrnjlyJMV8APF6yeljOFXvmX8bfGYNdPI5ZNqxo2Hl5ONryLeDcPtkR
         H6sU79GFwVYpWeVVKd1Q1t7EIMsLIcMYyLcM7eot65jHrrJHy2qf/mxlsVLkVWrSAudJ
         KB5ITOXMMH4djR8VajsWcnk1TGqeh3vt9uSUhVFrzo7eJ1WPcRuXwGc+tkNZs4iK1UUB
         Rd1fzUt6l2gK/0qWje40phqKaBF9iDgFWGdwfxR9EE6scUD87aLBZLkqv4VaahvxhuJx
         cK7R23yNzE+QS0RR7QjXfwj6sswHaxDczDRjNxJXiAkWp8BUZTUqAd/PqPuR8DwsEZ+r
         Eq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757763388; x=1758368188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8b7uNpPxbB1fRBWurft3prptO6QhNORc4A8k+nV6f7c=;
        b=NSWfTZViBPHaBwhd+b4uuiOQcHYnGU7JRLggfnOuMi6eWKatgCkcZqfRmyCMHCQC/H
         rgzThdXhA31pVs6XjnXLucm/PiQ/sKeL7y8Yd8UJH/YwdYe3kH2/LxyBLXSpQCX54Q2I
         9sSfDSd96u5NsVarDO+GdM9waxwEvUeBeGGMJhoOjxe1UzzIgUqD+cSYyU5Iq+jNLm4D
         q8g3DnnC691VHx+96+gQ/RM4m/S10z7qLizUf1OTBWIcOg7Mg1nJAmHFbaiM9wGVzFgz
         KdBbX7r4MuYKl4s636ocLY4YBsTdiU+dQzjbXBVZQI9sRJ9uPKM2DOPwnkEo0c/1AUi6
         qkjA==
X-Gm-Message-State: AOJu0YwQeeQP9jnHqNVQJfe94hrBKkxVqLiJ/+zut/Ud5zo9VnLp61rT
	OiJAu2sBC7qoKUtCD9H+2DzK+kQlo1/E0pQLSM5QaUHAd4modcWIgsP7qQQlVQ==
X-Gm-Gg: ASbGncvDy7AaZAn0tYGq2PZMsHlTblX0X5QujBeLhs0nHJk32ahCatvVPlhmAJ3DnK9
	YfqjlckSUFabOPOlIMI5DrAMsHcmAf83H2uTVpdgfuVrTc626b9Td5Xe37gwF55odfWVpLwT0yc
	JOCeQWcki5rJl1X00O3AZOWh8WXb9OveISLH13/avDaAYiujFCKQCieCIKjHeRp0yaLSxmKC6hR
	SKDErduQtjLjy2jyG2IPQQN4TpttshXz9AFoZmQP217O82zzSuo5CYsgT6PNr0VQLoWHcngC6ZW
	0mVw1nd7qMQjtbVXRqRuxZ6t/pEWcttoqOhBce2es5ei2l8wPGpK8I9ZldUQ6dVC7RJe9Rb0c1V
	cW/1eVQXRvlgpXqe7I/pX
X-Google-Smtp-Source: AGHT+IG2sc6drvmscw/fyf/zYLPgy7nUS8f6M5L22nNow1gAI4YcpJRHJhAPYVpmTcpPW+fgJoq0bw==
X-Received: by 2002:a17:907:1c25:b0:b04:626e:f435 with SMTP id a640c23a62f3a-b07c357a185mr574127666b.22.1757763388263;
        Sat, 13 Sep 2025 04:36:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f1e54sm554382866b.75.2025.09.13.04.36.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:36:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][walnascar][PATCH v2] libchamplain: don't compile for 32-bit targets
Date: Sat, 13 Sep 2025 13:36:27 +0200
Message-ID: <20250913113627.3196354-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 11:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119385

The recipe can't be compiled for 32-bit targets currently, due to
GTimeVal usage - see bug report in the project[1].

Remove the 32-bit targets from the compatibility list until it is
fixed.

[1]: https://gitlab.gnome.org/GNOME/libchamplain/-/issues/61

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: Corrected machine override armv7e -> armv7ve (the former is not an
    existing override, so it was a no-op)

 .../libchamplain/libchamplain_0.12.21.bb              | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index a89ab8cc74..3a27dee704 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -12,3 +12,14 @@ SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
+# Compilation fails on 32-bit targets, due to GTimeVal usage, which assumes that
+# time_t is always long, which is not always the case.
+# See bugreport:
+# https://gitlab.gnome.org/GNOME/libchamplain/-/issues/61
+COMPATIBLE_HOST:armv4 = "null"
+COMPATIBLE_HOST:armv5 = "null"
+COMPATIBLE_HOST:armv7 = "null"
+COMPATIBLE_HOST:armv7a = "null"
+COMPATIBLE_HOST:armv7ve = "null"
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:x86 = "null"

