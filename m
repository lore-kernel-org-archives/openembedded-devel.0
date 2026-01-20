Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89F8D2ECE9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:32:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5394.1768912347050436042
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G52pn5Wg;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so29980765e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 04:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768912345; x=1769517145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xAUee/YzVat6TpwlZaam9VTJedRdgbZhapZ5oKv2ap4=;
        b=G52pn5WgG6g1yrJxaZ30nu/YALwd4qn/P22ad5jipHj0rQJIyPg2qpVTMuxZoWdjPe
         bpD6pUTNR5E3zHy2ToxAq3u88pwpRYrdWis24OlJ2E4hj0B3Kf2K5rBm191w0AxwktpY
         ccIySD63IkjkFtkfNI+oYWD++R4lBxQB9ojN8FnL7Omu4vEsEz4mv+hwFZKvYxEXIni4
         hUQieZbMCidqkQnf+EuEeVpdi0Emy0izgdrtpo5AjSVvPEFOlRZtAqQVfImQwsyr8eK/
         47rth08anem7Pf4feL9DIBEZjAKTY5NmaWLpGNtGUWxE0CklYlmNX7BGAZgtjoMhmINK
         PNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912345; x=1769517145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAUee/YzVat6TpwlZaam9VTJedRdgbZhapZ5oKv2ap4=;
        b=fW6uAG+CKvb84cVYfAjB4ORdD55glxX4FKgmlLgn1JKBUYSL2CWNl+q6wOhc+gdfcD
         T9XJsQIjKo65uiFtu3iMz/kVFGzDhtjRhSNTTYB9l2U5at6xPtuA001GA3p/uzfycBpn
         79WCxFjmseZYeb0dN2vdLM2MsrY/tM1I0HYhUMItpf6RsdGisw3KUIioISHgE2eHOBsM
         66XCJvUhZckcgHNAAJIb6VczQX2zYUIhh1knqazRWhI1XWET/BhZDYFpKbCP9uPSXIZa
         +3cZYm/6bZARknZAJHWvE9GdCXTZOQgugQU/R0KXPkk8YkiCQTm+YjBVdUZt0g2n9JEI
         Lwcw==
X-Gm-Message-State: AOJu0YwvyVPGZLBygQYkzxdXCGTHhSgwrh2SNn0TZJ8NLRaRgXs4pipK
	5IjwzM7ya9BjOwfK319K1OaBjFiUa8Yg/f+eVV7JnkgyVnzwLeG9hOT1lQJ3dg==
X-Gm-Gg: AY/fxX6VvvKc65OKn0ZEz6wKfUcfhb1XJKCeiAlZs4lLExi3NyIotksQyVyR9g8CTCR
	2xK/NRc0wKw9ETLS1rkhzxx2CpEXbTY63RutaluIe0JGkaog452V4qIJ0EHwB3a9KaI2TIjk0Rv
	JZ4zeGfTTL+BUKdJ9deHWT8njJ8UN5aZR2Q1jLEoGFI4ZYPjWELkKg4EtMuBDDXQAqJNAaC9U3s
	sipQC+d90mNQ8f/muNbAjq+5W4PzJKrWDKNL8cACZiEKmCg3qh8lWAiPUKKusUsUniHlb9yp4OA
	Jkgy9c6A2p7vfxj+NrFB5DdH1MvMJwcIj7PbU5NdpH9vZIzssONK0eD6tHEsLBaUJAtbwPB3r7L
	0D2GL4sCsa5IzqOrrkqK/ND0kUviWzqD2GTd73n01wee5nBs0lwzyhf34qMavmxkWcoQVOF+PqX
	UvFlxkxpic0L74w8r5fdE=
X-Received: by 2002:a05:600c:5299:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-4803e7e859dmr24990605e9.22.1768912344829;
        Tue, 20 Jan 2026 04:32:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm101154145e9.12.2026.01.20.04.32.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:32:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH v2] freerdp: patch CVE-2023-39350
Date: Tue, 20 Jan 2026 13:32:23 +0100
Message-ID: <20260120123223.1003063-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 12:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123669

From: Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-39350

Pick the patch that was identified[1] by Debian as the solution.
Note that the NVD report also references a commit as a patch - however
that seems to be incorrect. Although the NVD patch also solves a
vulnerability, it solves a different CVE (CVE-2023-39353), not this.

[1]: https://security-tracker.debian.org/tracker/CVE-2023-39350

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v1: https://lists.openembedded.org/g/openembedded-devel/message/123658
v2: In v1, the patch was included that was identified by NVD as the solution.
    Looking at it closer, it doesn't look correct, it solves a different
    vulnerability. This patch picks the commit that was identified by
    Debian as the solution, which fits the vulnerability description
    also better.

 .../freerdp/freerdp/CVE-2023-39350.patch      | 42 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39350.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39350.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39350.patch
new file mode 100644
index 0000000000..9f4590d90e
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39350.patch
@@ -0,0 +1,42 @@
+From 31ede2c7f721cb32a4a4c7ec843e9ddafb69ba53 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Fri, 4 Aug 2023 13:55:40 +0200
+Subject: [PATCH] fix possible out of bound read
+
+Allows malicious servers to crash FreeRDP based clients
+reported by pwn2carr
+
+(cherry picked from commit a51952882f2eb3bbce6b69a7a4f9a54bf1dbb672)
+
+CVE: CVE-2023-39350
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/7ece410ce5b5660b9191e1ccb6835158afa11822]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/rfx.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/libfreerdp/codec/rfx.c b/libfreerdp/codec/rfx.c
+index 38eb1b9a4..bbd7aafa3 100644
+--- a/libfreerdp/codec/rfx.c
++++ b/libfreerdp/codec/rfx.c
+@@ -1129,8 +1129,18 @@ BOOL rfx_process_message(RFX_CONTEXT* context, const BYTE* data, UINT32 length,
+ 			}
+ 		}
+ 
+-		Stream_StaticInit(&subStream, Stream_Pointer(s), blockLen - (6 + extraBlockLen));
+-		Stream_Seek(s, blockLen - (6 + extraBlockLen));
++		const size_t blockLenNoHeader = blockLen - 6;
++		if (blockLenNoHeader < extraBlockLen)
++		{
++			WLog_Print(context->priv->log, WLOG_ERROR,
++			           "blockLen too small(%" PRIu32 "), must be >= 6 + %" PRIu16, blockLen,
++			           extraBlockLen);
++			return FALSE;
++		}
++
++		const size_t subStreamLen = blockLenNoHeader - extraBlockLen;
++		Stream_StaticInit(&subStream, Stream_Pointer(s), subStreamLen);
++		Stream_Seek(s, subStreamLen);
+ 
+ 		switch (blockType)
+ 		{
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 7cadae3d45..a104f33e52 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2022-24883.patch \
            file://CVE-2022-39282.patch \
            file://CVE-2022-39320.patch \
+           file://CVE-2023-39350.patch \
            "
 
 S = "${WORKDIR}/git"

