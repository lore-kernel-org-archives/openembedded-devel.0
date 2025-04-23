Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB82C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 10:13:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.4968.1745403182538787412
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 03:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d5yXjHN4;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso4498730f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 03:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745403181; x=1746007981; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTd//SSxnyWQhPReDNoCkH88A+w0wOidNtaxWVi/RGI=;
        b=d5yXjHN4AjpJMw+B+dyLInj627AcxE+9yNQk71x2YrzZLnBYjM7htwQli2IAIpLK4n
         Zvl6cU7VCp8Nhxc/3l0O7xHu0auNmx+dkiK5bHg29HZnix6KFMgGUFeUW97m8hWaZYx7
         wRMFzLdduEUb6MzdPeUJier8IO+c/ioa/sp8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745403181; x=1746007981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTd//SSxnyWQhPReDNoCkH88A+w0wOidNtaxWVi/RGI=;
        b=k9OQxhJ0TU8s+9/PvE4QZQQJjzZOlJWOaBUgklTbOuodHqx67iiOt487MI2dXuY6wZ
         cq4xzW/E0eJ862x1qbCSZJltfzvvdahj512ZEPW2qQQCHKLlT53wkX8ZM66pKG5uYxRi
         QCTCoJJVODh8wrk3OGmQCGs57QcoFWnXXvCgGvd5pU1kM30ypO1qQrXHYaK0L2aO9s35
         hy7j0hENbxtfOZTLOExP0WJscmYyDi8Hy0eV/vYIiID4oIgaHHV57EY+Bw8sscxgwmNn
         hrX+aPo4QPbF+pygxb/qneAJbSHj95hjxqS3PdTkHDSnrJqmhuL09Rk0wtuCw+0HIsTi
         QW0A==
X-Gm-Message-State: AOJu0YyPwPj6vDpO/VsNImDrsXf9w2Ah/ym9ICH78f/1lg6NcObrqQnw
	CQ33htJizqpOCU1VVYpA/ndfYsYLkfWePWPbhkP3gkmMJVQBZekRev+HN3PYRVwEQOkn4FnB6JT
	e
X-Gm-Gg: ASbGncsSqbdYuAiY5cP7e5nTrJBGFn7Ap1zN8pfenwDsyAt/bDoUtwQ2qvjBl+KSelH
	xpeuyij1CJsVEz1SGgt7pvHMNdBq7iGEsTn1LNBuCmBcCzgkww3XSHhzweivKVxmJ5xLskyKduC
	vHijZLIk5wAnhbA+g/NZWITL5GuMwsDFEM1aDBxiaZq2qwF2gio87t0vTpEeGvFrHbjsBtj0qsN
	A3pRAr5SenUHq4p3iloV4yYlN/jEllwB/c+LjEmjTIl1iWXGNBFXX1bDXlahaBUY2YKMuokYcn5
	JFmpNQqQhfoL6c+mJXewglh2PuntvOdT98NRN9Q3NwM6cI6cholqUW8=
X-Google-Smtp-Source: AGHT+IE53RAUJHpFT+WkH/Q7yeuazabkcac2D6UE0PMPShOThSWGqZqMpb7RqPCumDyvteCjNBJJKQ==
X-Received: by 2002:a5d:6d87:0:b0:39c:1257:c96e with SMTP id ffacd0b85a97d-39efbb02224mr14057683f8f.58.1745403180819;
        Wed, 23 Apr 2025 03:13:00 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43beb4sm17896704f8f.42.2025.04.23.03.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:13:00 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-automat: Upgrade 24.8.1 -> 25.4.16
Date: Wed, 23 Apr 2025 13:12:57 +0300
Message-Id: <20250423101257.3244224-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423101257.3244224-1-leon.anavi@konsulko.com>
References: <20250423101257.3244224-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 10:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117076

Upgrade to release 25.4.16:

- Metadata updates
- Allow 'hatch version' to work
- Allow return type annotations

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-automat_24.8.1.bb => python3-automat_25.4.16.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-automat_24.8.1.bb => python3-automat_25.4.16.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-automat_24.8.1.bb b/meta-python/recipes-devtools/python/python3-automat_25.4.16.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-automat_24.8.1.bb
rename to meta-python/recipes-devtools/python/python3-automat_25.4.16.bb
index e2a31bea1e..c5ba16fc0d 100644
--- a/meta-python/recipes-devtools/python/python3-automat_24.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-automat_25.4.16.bb
@@ -3,9 +3,11 @@ HOMEPAGE = "https://github.com/glyph/Automat"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
 
-SRC_URI[sha256sum] = "b34227cf63f6325b8ad2399ede780675083e439b20c323d376373d8ee6306d88"
+SRC_URI[sha256sum] = "0017591a5477066e90d26b0e696ddc143baafd87b588cfac8100bc6be9634de0"
 
-DEPENDS += "python3-setuptools-scm-native"
+inherit pypi python_hatchling
 
-inherit pypi python_setuptools_build_meta
+DEPENDS += "\
+    python3-hatch-vcs-native \
+"
 
-- 
2.39.5


