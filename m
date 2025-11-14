Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3243CEACC5
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 19:45:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6980.1763149528612997794
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 11:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NteLjvRO;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so1595379f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 11:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763149527; x=1763754327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDBpGsskI/yEN0PT7LKhL/VGP0Uz2bhyvL6vpuRs8GI=;
        b=NteLjvRO0ScgX0xn1hHX0s6GViiVH2Ktzd8LDMoOAfnpRfzMI9SqXReOpiFDce/EHy
         f07QbI6wsW8d4Ic/aW0G2FeQBA0Z/oOtyDzlBQQ67w7SLPgEbnSeIlyvOrVCAOThSJCV
         qptVb9upHvn0bDFG/QSIkFb7F8K4GWLmL1SeegpTyLGKsLWKiIVdIpjK+PI/Gsfm/2s2
         7ZnFP/FYTQYEArScY7P1qX8L+8tDygQhFXnDiLebLIC9WyE9TulPc57MiwbdnrOMCt38
         SFJfN9dkqZyxvM1ov8auwwVzUqvGpoT8caYNAPWEgrhuwwH6L1NnlcNsbijCHw2dY2L3
         4x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763149527; x=1763754327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nDBpGsskI/yEN0PT7LKhL/VGP0Uz2bhyvL6vpuRs8GI=;
        b=Wm9dw4zOQEoqnZazb767/JGZ3cDkEntpOxN97yLGwhYBuQ0Pqtlm8P7QPvZgry4CVo
         yVZbhTwG5JeZW9v0NObKLBA2eHDGrQw0gjXQltKz0wRVzhrgeZVDRv0Ybh1+5W8qpotv
         vyrtYoILPfWuKVVCRFpj6v9tYyAXt14QZC1hB/ENX6TdH5DKPrzEOTht9wJ91AfTrCz7
         IMWOCm/3OUVFFDjW1QjLWp8w3Enjyd5Rhz5HaYRFBBvoeMgKQQefCDmWIMdefTSnVzzG
         59CcvsaZSF3cGeh0eOlbQWDHniiQIsROK5M8mxARphscmqnk9aCUy84zGFCoc3u92+Ag
         720Q==
X-Gm-Message-State: AOJu0YxYbSDchYnbao7+M2cBX+n0TholPjIAkjPw5wzBhNYqXQxYYjdE
	nqc9Yui6My7eWoqJKoneIxMhVZruhksXnUc4AHR7hq3uHi2Yv7OvhROFRDlX2XJR
X-Gm-Gg: ASbGncsL59m0Ge9V20TaK678zN5fQkpeIA3MusnkCIuFexfQvlQx9btt3HLowKm9xhL
	2znbIkt7Cf7xHw3k/UqTWvZDTSAhlKzz8NoOG7ZlsB+uTZFThT33hg95I8jPpecWbdPoCmmGqG1
	Yxp+BaUGzHjsQPsSxDsyN2qIglL6kswOzrSe/ocO82Wt9QbHcTyrko9KV03o08VP71UmuRDsTZG
	tyQqH8SLQPxgg2lWqp5nXKgtBvfterh430peMcLWS2FHTfvAZqWmCqS2z254+aS+kHBf4eu1HcE
	qYnE1tWOJRsUZFE6cWhKOa986F7TBLRyjrRLbPyg05IRy+WRbDyX5Juvjyng6PFQ3inVh29cPNw
	xYHOZqCYpMl2hqwI1nMRPtlm+1oVgrHfWnTsTcS3zaWCtA44L/l3bs91L5+MsZt+SUGhIZ7wHTg
	==
X-Google-Smtp-Source: AGHT+IGtHjryB98eMOBz1m3w89A/l9d+5wLvDKd9r03ywN9yeRmmpFQGWo0x5ZAueFRtwn69GJAaxg==
X-Received: by 2002:a05:6000:2901:b0:429:c4bb:fbc7 with SMTP id ffacd0b85a97d-42b59349bb0mr3851277f8f.16.1763149526931;
        Fri, 14 Nov 2025 11:45:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm11561514f8f.35.2025.11.14.11.45.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 11:45:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] tmux: ignore CVE-2020-27347
Date: Fri, 14 Nov 2025 20:45:22 +0100
Message-ID: <20251114194522.643069-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114194522.643069-1-skandigraun@gmail.com>
References: <20251114194522.643069-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 19:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121715

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-27347

The fix for this vulnerability was backported to the recipe's version,
and it is included already.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/tmux/tmux_3.1c.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.1c.bb b/meta-oe/recipes-extended/tmux/tmux_3.1c.bb
index ec9fe34cf1..f983ed7a86 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.1c.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.1c.bb
@@ -23,3 +23,7 @@ do_configure:prepend() {
     # not automatically created when building outside the source directory.
     mkdir -p ${B}/compat
 }
+
+# The fix was backported to the user version:
+# https://github.com/tmux/tmux/commit/d0ad34e94d63def5178f02281637d2d15cb42c88
+CVE_CHECK_IGNORE += "CVE-2020-27347"

