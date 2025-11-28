Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8939D116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 19:56:10 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2914.1764359764257974564
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 11:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DsA5eImO;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37b999d0c81so18153751fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764359762; x=1764964562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iAPbqvFCPQkP1ewjpaZ3OANYxL1Yf2QHXjc/KRT19xQ=;
        b=DsA5eImOx0T2Y+uKUxCDlook8r5sNQ95AZk4YmOTEd+bBfJse2/kQOJW/ALS4ULkgo
         ZYIXro5tcz1VVm5eHqT5RsOABnEtyJCYWm+lzlKLL1f4Fs32UFpWuxVT3RjMZ0dC4MlG
         8FkmwQJ30H4u8e/SuRm9OpKXurA5jM//TfPt1j2uF9iRUq/8Sswk5k1swjKNfGlndOV8
         j/nP7eLHBPJ7zAtlHk6Xsn0Jykz4rWXSnTypvQZmvAV53VtDffdgViIZHFObfSIuK6lL
         yVGNoRV3FYF7SgsTDNx8eQeyI9U1yOU77OuhqnfpXpAiHubuVdU+/le6KNYJ+2gkLT6g
         57YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764359762; x=1764964562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAPbqvFCPQkP1ewjpaZ3OANYxL1Yf2QHXjc/KRT19xQ=;
        b=v8RN1HEtyq0jYZnK9IXzq2VX+E/kzxirRRKOCXHCdTcqEAY1TOs7qpPwqHMaAqRPzp
         ZFvOpyD6iUDa4TyZWXBjSLS3EPciOjpJPFfmkht8LYLn86fnxai3/k9yOGdEBIexjaGj
         C4aamtMFQzEjJX6cCKGyLq1NEJgk07x6dHMxyce0796Qa1E/dIGNWnZmMlbpmP86JsoT
         CP9PkDFWhrbSKHb6AQfp/pM++WKUiXNujPuCvKHqZv0gAtk2YEGT8UPeLzbZzrt99XhS
         FG2v0JLrZYOK8dMAxHf2G/BeAfrmQoXwWLHuWrHteKie9lIFZ/QKwChpYu+bo6cqnJ/P
         PF1w==
X-Gm-Message-State: AOJu0YzAlgsAD/Y0hBtYXg6GryLMqoNXiWd7iszGxmXDk6cXqvtiq/TK
	i9VZPbdPeEhvDi2qKtNTAe3X/7azgW2ig9RfQZT+GJE3YL927Xm2NjuYipgvng==
X-Gm-Gg: ASbGncu/ElPikFAOjnnw/y/qCidqua3JdT5xJkfn78KO/9RoBj4dhJXQ8M0lwMnmRXS
	SVgYrsJ362uVFMB2/79d/aOpq9PxWI1zOPP8cWf5yox7vou0ElHGxLQ1htpU7gWhQWgb0eN5VGs
	eufO14akkHM1rjFXgERAJx/8yQYi9PEUImNZVWStRGRqVBBvVHDwS+Tl7UoDlkLz1CQpqq7FETJ
	KpaZ04cU8w6/u+1EMtTkIxUQMzjbwSQWZSJAvaIET0EwjgqGOvxIqMXO8IJOVdtuxnb981s4Z+V
	bBK9kYspgiyg8EbyeM9odivjbEu6o5OlZsKpx+DWisOeuIO/fkuaydpujlG4PfuJ80MI4s25dpc
	xWU1grZURRRayW7AoVikF3ZEvINtOE5pUEYiSZjJjatRn22daOZS5TXs/0vY9px1IHbao6zqU0k
	G2zhWz4tOIhwqj9f6V88ZKHqOfRdU=
X-Google-Smtp-Source: AGHT+IG2ChDvlMvoZetPYZ2ELiXopEM+XnGG2ZfmhwWm83IIYMRm/TiVqHQdpyQibLz5QBF0K1/E1A==
X-Received: by 2002:a05:651c:400d:b0:37a:95c9:4745 with SMTP id 38308e7fff4ca-37d0798f96cmr38285751fa.40.1764359761676;
        Fri, 28 Nov 2025 11:56:01 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d24103d77sm11465871fa.42.2025.11.28.11.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 11:56:00 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-wxgtk4: Switch to PEP-517 build backend
Date: Fri, 28 Nov 2025 22:55:53 +0300
Message-ID: <20251128195553.1313662-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 19:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122126

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-wxgtk4-4.2.4-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb
index 2899f6909e..81bf69f468 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb
@@ -18,7 +18,7 @@ SRC_URI += "file://add-back-option-build-base.patch \
            "
 SRC_URI[sha256sum] = "2eb123979c87bcb329e8a2452269d60ff8f9f651e9bf25c67579e53c4ebbae3c"
 
-inherit pypi setuptools3 cython pkgconfig features_check
+inherit pypi python_setuptools_build_meta cython pkgconfig features_check
 
 S = "${UNPACKDIR}/wxPython-${PV}"
 
-- 
2.43.0


