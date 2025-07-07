Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16BFC83F0A
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:33:58 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.56501.1751880833879060038
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=G1lTNof9;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso5605243a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751880832; x=1752485632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/F00niaaKQF2t1yV/iIPGRYKPbyS0TJaIQKB6CMI4K8=;
        b=G1lTNof9/WTd7nybsURhZbzE05C+aCywGIdg/LG2wnRXStkZ03MHjqaEW98dNFXpIv
         buBX9UtNI7/4hGfrRXOWp1Pu/+/7BYo7MIkfNfMheYFiJ/AmzMaNFd75L4kPe/I21Eh5
         UadDmrGSTcG+L3mfBj33XZ8tR+za0z4m6YtII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880832; x=1752485632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/F00niaaKQF2t1yV/iIPGRYKPbyS0TJaIQKB6CMI4K8=;
        b=jbBTpQuiuZBOqxCvkm6XVNmcUby60BZxSHf/EOxYIsEs0Kgzy3ns/Z5LZZ8l6fv3wr
         yhcJftmi7bZGwvvc0S8QbIiC0tEgOlsnnt37l7f+HHpuOuENGqP2n+QGpy1b2edhmYPw
         ev8AmFSFWga/PydKoKKrytN26+iAOR7NubglLtY/ohN+AdQp1bKWa7hx2OLoGLxO5yr6
         VMT692zfeggGEUNh641QXf4WrDTpiFamGdhWUL1WKOHnBtwlUSvzfrfmrIm1cVQC3ru+
         d9uujgdDLiqwOEfYdzBJDal2FiDtdjAQpUX9e8WqohKrofSXBD8spCcdOz1XhrxaPSZT
         mn7w==
X-Gm-Message-State: AOJu0YyGnnhI4mc35l2vZQNL51E+pmnv+84pAcMd5EodDEwU5WtOpp+Z
	xawbv/sESnUNW+tV0Qa+f79XWq+Es1UpLS+fzlB9vQnJWIdm/+r3cFo9mK8JnbZPylFglpQo+9c
	zOQfJ
X-Gm-Gg: ASbGncuASgRP+c/lPOZJte2bBkOdRqJmUEuWvVS2TRAHuEd+AfVI3e16tUxLFwjb0y1
	Y6xHbsAFihxblRVrDtx2OAh4tT08/2AugNbr3h8tJM+cYXEaQf8FSfQhd9O8UbWbkCET+BHzFxx
	EisZudnGZFeJ0SXgNNMcQhGt/9rUAR03nyfp4iAhnmbfiR0NycJ/Ooq+CKNVs9RdI3oT+YkP13z
	v8bnkpP/20GwAYqelrhJHyCWuV/dV7xGqjrU4GgWLY85SIhhztR43BIDnqsIPjDLkOfeFqaVN7K
	KzVKR0Keq55K1H9Ibt/2AklsMveicRdra1T4ttdPdWEqiWH01JjV7tB20BLrMkavnesPaIap5jS
	f
X-Google-Smtp-Source: AGHT+IH7CfbW94AA2YkJljzS5K/Mf4OdJ9UTnceaArtuPSxFBmTH21XiyibJm11oZV0ipDGm909RuQ==
X-Received: by 2002:aa7:d30a:0:b0:602:e002:9602 with SMTP id 4fb4d7f45d1cf-60ff3e2065fmr6160898a12.22.1751880831889;
        Mon, 07 Jul 2025 02:33:51 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca69657fsm5262179a12.26.2025.07.07.02.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:33:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-moteus: Upgrade 0.3.88 -> 0.3.89
Date: Mon,  7 Jul 2025 12:33:47 +0300
Message-Id: <20250707093349.2451474-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118281

Upgrade to release 0.3.89:

- Add --version options to moteus_tool and tview

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-moteus_0.3.88.bb => python3-moteus_0.3.89.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.88.bb => python3-moteus_0.3.89.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
index b81c53652f..5467293ff8 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.88.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e16387e5fe512a7580ef847e6b2e665d4b40549b064ab237e01fd7dec7c46232"
+SRC_URI[sha256sum] = "78ed04c213e20b44c81b73e2b66f5a7e45339014cc3fdaf94c4fcc875d35402a"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.39.5


