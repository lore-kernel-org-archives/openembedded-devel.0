Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5188D690F8
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 10:39:06 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.92152.1732790345800209603
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Nov 2024 02:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ERNQ0Tn4;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so125090666b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 02:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732790344; x=1733395144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBwh75UAb1eEsKA95Z02OVIziCqfemh+BbPoxMKBwlU=;
        b=ERNQ0Tn41adWdgMvr20WLn1gUkHQBYVXVwBTLyL2AFiGgTEkx38HCT4z5hiLOg6e/f
         VTara5OUXy9tr8cmS7kNEThpqwcw9e9Kh0Honbc6okLxHo6Fe5Sq4idf4DxO2pqO/7GN
         AsMJCEC6ygRCgvJKdGEQEFIjW3wPw1aZviVaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790344; x=1733395144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBwh75UAb1eEsKA95Z02OVIziCqfemh+BbPoxMKBwlU=;
        b=IFx3MJdGb4AfcEn+H4GSK0EnV2o+R4Grpz0l/8PSoMZWNvJ+UqZGhJNliaLrUuudEd
         xdXAInBy2nHp9o3dsSv8CL4g7HgkJGg5b9Q0hAj6EMlGZrTrGpiF/qrFMdk6mEF211cu
         xvmdjFnukV3G4yDaW3wTKbgbZFEhZLgjdV6bqRC/Z9ICF+os8y2w9cmAJSAGEFTlQuWu
         hyfu5CM53Ks6VFx9QTAeqk612wJ2PJFiNXNZr7vwRtZiCnsqwGpCRJpT9f++LauEyvYS
         aLEmSHHrCphwvZK5J98pDCRb5Ao3S/K15G9kys1V3QjKePTcLEJv0V0FZa042FV9+L0j
         +UkQ==
X-Gm-Message-State: AOJu0YyaqcVWLkr6JjV9x4YGsFjq9LBzMz2vLPSt2UA3A+uAbIg+Dis8
	JKMc66sWg/BqoQwQGAJaxIdaiXv4UEkAzY4YDmYD+hgXsKiDySzueYekCDNlv8cOBqH2lxotodM
	6
X-Gm-Gg: ASbGncvc88YNtQRcPBGHAANrRZKKHrKp9gyb3gThlvYCA4bbs0IiAIqbe7+F3tdgYoy
	Z1A63K5SVdMFx2pKlBguuHZH1g1z1jZQRvb0Z+aVCkR9ghBROmGFCvvFKuiDvTAShqbQYwsQpl7
	jf+opVHVwkgCnwlvP2w+df8UtvZLKuak7eFGt/EvfI+k9lLsgjYWPt/V1CJ+FeG0GXpwwiKFo76
	T8ApKe50t2UZMECWLfytMQv94KNvUZbALmjD71EgYqRdDA3R99wJvalMWhcbuo9
X-Google-Smtp-Source: AGHT+IHxIo3KjfgjWtGZSG0bqZOsERqyaRaLF5yycW4DzJ2487E6d7usqEeVvz0SBOQa+TfLieejcw==
X-Received: by 2002:a17:906:846f:b0:aa5:ac9:ce5e with SMTP id a640c23a62f3a-aa580f569e5mr612629866b.31.1732790343980;
        Thu, 28 Nov 2024 02:39:03 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c11fcsm52227666b.39.2024.11.28.02.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:39:03 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-charset-normalizer: Upgrade 3.3.2 -> 3.4.0
Date: Thu, 28 Nov 2024 12:38:58 +0200
Message-Id: <20241128103858.4052195-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241128103858.4052195-1-leon.anavi@konsulko.com>
References: <20241128103858.4052195-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Nov 2024 10:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114108

Upgrade to version 3.4.0:

- Argument --no-preemptive in the CLI to prevent the detector to
  search for hints
- Support for Python 3.13
- Relax the TypeError exception thrown when trying to compare a
  CharsetMatch with anything else than a CharsetMatch
- Improved the general reliability of the detector based on user
  feedbacks
- Declared charset in content (preemptive detection) not changed
  when converting to utf-8 bytes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ormalizer_3.3.2.bb => python3-charset-normalizer_3.4.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.3.2.bb => python3-charset-normalizer_3.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.0.bb
index ca9a88ccfb..10f199db49 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.0.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
+SRC_URI[sha256sum] = "223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079dae93e"
 
 inherit pypi setuptools3
 
+PYPI_PACKAGE = "charset_normalizer"
+
 RDEPENDS:${PN} += " \
 	python3-core \
 	python3-logging \
-- 
2.39.5


