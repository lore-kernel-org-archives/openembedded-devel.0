Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10.1794851762940559146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ghs7jtPc;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4583291eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851762; x=1795456562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLBStac2bsver9LQt2541uT60mhOp1mO9fHjjnj8AiE=;
        b=Ghs7jtPcohfU8/35irzOyB7L9hJ3Ohm+x42P4TNYG5F1Uw9WltcDHIjTkrSu+hYFCg
         F+DpsO6+0iOeL2OQr8cnX46TnkLkjKJsHtPjTr/UJWhvPuPU2pYXGgjFu/JkbggZbIi1
         mqMjMJcMw0nh3tyb8YAhaEsIDRaihPWAs76/bm/heR2/WUMWTgpiv3tUtTR0CkaRuLWa
         CwwM8QzP3CJZb90GjkGjDeQ4lAdLAa6vGAAU7pbbc/QJHXYfuxUJBK17ApYrcaY3zX+K
         aB8rN/WcY81WM2yMyfQgO+IsXNv/A9++/QF0u1HmoBqqMuTYqMaqIIBDlmEWzj+npCj4
         SGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851762; x=1795456562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLBStac2bsver9LQt2541uT60mhOp1mO9fHjjnj8AiE=;
        b=pwdU3yaYceufexamSFeG/aF//HUAwQlqxRifCuxbDf2LeI0uVG3HcKNGBm12hdO7Qu
         dXfPfTTMVkN4vi1DAVVtSl1j/aG3t/+MEhTVVQ+Bw41jwwJY6imFCcEIrMDSPn/queE+
         fkQ4UHx3/NkLQdKsGg/Y2QBvgwvdP97hGQcsfDh/La1KMdPjSAhehYu44bHTv8wbUcQa
         YYgs2QPZAt0FE9YZ7e3+PcUQZyNV+Jx8aA3tIJzmYrb920W3J+E1ZS7OetQ1x+RCsQpr
         Rc7UMxYEBAYud0Iy0xnqc6oGrl0X0cGht+gwGM6ZCCEVg55gfl+vnZmweNQoU4arZNk8
         b0wQ==
X-Gm-Message-State: APuU4Z9ZxRBJcKSJEYH9tFkiHwDLTGi1gzA5fKcVBMt/jbU038xqpk5d
	89iw/SRuIRmDwoPjNefqyyZr8P68NH4dZ2X3zeM1t3nkfqtT0GR7af/PhA25kFJF
X-Gm-Gg: AZFdTZcSfW8Tf7WUIYQU0ys/i3iVKA26ve6YAE7MoQaghqsmKuhYcsiAMtg4EVbjU1x
	16LPsJfln12l7yMEjIwJ7mm2ewPg6qo4Hymbip4VJVkBZPDOrBp/BPnmmIfHyu9XSnkybf0MxIy
	5VxWgFrL6P9Kybf/j6B9rTMNGLyq0qJGTN2qSDqBDg/NwSaKCa6JY2OXQnrRe0QL8s8YxyujRRF
	C6US3GyBckBkxl+XtZ1lQ7AphZFSDQeXwVfc2TPn2J7Od+pIhi+DubUTH+/uyxNRE4QWWgOYQvI
	spF+oxAoU/PZk5dsvOdhgY4MkQWSZQJ/hdG5IvQu8wNxqNTEtyUIf8JB9kABjVqbTiwmIvdR6wc
	u5Y0x/bTFg27cb5eC80IGVX6SUlcReX/VMoCqI64mzMobGtjnb8dWIUkGgOgmLFriuqgPR5B47Q
	XApBK8IucObQ9Jtvx/cV41Xzx4a71Fuw7P7P629JTbT7jyQ3fyseRs2oGWA2k80Bv/n2oPrxjMw
	3QqrHpl33c6gJPuLodcZkhAGpit6uPE5U28mtkI2ywwYvG2//KgCyuqJfLr1Sr5wKUV1IxKM1TM
	lF565ZDwD+NVVbbHZPwlMO8erIjJudI4yLYfrG/bfHGUdoHv5IGxxWqNO6VMNqRCQrHbGk2BEMW
	wP0W63a4Xj8GQguIZCeqCCsB5GWyeu5Voc4JgsxRtJ5ZhnJOWcTFxV9DOFRROwIaKXMLnmcV8ma
	d62wySIcdRW2ZiQYQQ+oeW8HQmfracpdr9K62Shpdi1rKc6imbk9UXagLLGrJDnkYYLMKZU8iN3
	03Qj+Zp5DhV5Eh7p2nZd9qsYrmwNJ2rD3AWrXpELqAq8NATsdzq5MNlXHnwy1PT/ecFJVhZfKyv
	broW
X-Received: by 2002:a05:7300:b187:b0:37a:7dfc:7d17 with SMTP id 5a478bee46e88-37a7e0bc1c6mr7959310eec.13.1794851762145;
        Mon, 16 Nov 2026 09:56:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 089/105] python3-sqlparse: upgrade 0.6.0 -> 0.6.1
Date: Mon, 16 Nov 2026 09:53:41 -0800
Message-ID: <20261116175359.342679-89-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132544
Content-Type: text/plain; charset="utf-8"

Changes:
- 0.6.1 is the final release: the project is no longer maintained,
  no further security fixes are planned.
- Security: dollar signs are escaped in the "php" output format to
  prevent PHP code injection (CVE-2026-112307).
- Security: fixed quadratic CPU use in format() on statements with
  many unclosed quotes (DoS).
- Fixed IndexError/ValueError in format() on some malformed input;
  sqlformat no longer empties --in-place/--outfile on failure.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-sqlparse_0.6.0.bb => python3-sqlparse_0.6.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.6.0.bb => python3-sqlparse_0.6.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.6.0.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.6.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.6.1.bb
index df196dfa36..9308684d99 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.6.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI[sha256sum] = "113c35c75365ab9cc9c7231d68c6428fb11c085fc8e9eb1ad659b7ddbf6cd2b9"
+SRC_URI[sha256sum] = "ca722573f848ff2d30e40ea30f53a104b7dea7635ea9285891263eb2c58fb6e7"
 
 CVE_PRODUCT = "sqlparse"
 
