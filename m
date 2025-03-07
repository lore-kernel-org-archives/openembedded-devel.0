Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBC8C28B25
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:24:20 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.15332.1741364652603162394
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jihufq/R;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac25520a289so159327966b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 08:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741364651; x=1741969451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EzIUlwwlKRXSpSch0cY3dp8HT33IS2E4qNAwSV2cRRs=;
        b=jihufq/R0gbIJwHGEdXvoCXqedClRyAQDjNwzqDnoLM9ZxB40at67xGRmb3FtffaKO
         ufvlUob1yD4Q9VBAK1Fl0JRIj1i4SvKpaUAIYTlncQrvengLc5hnvUTKBFmxFDnbBlYv
         00/qpkYodcS15RdR3ovzDLQ6JoOyPJvcztQtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364651; x=1741969451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzIUlwwlKRXSpSch0cY3dp8HT33IS2E4qNAwSV2cRRs=;
        b=mY/wBWie2FicBRB5ssogSeLEsIbsLcrylA5j0QMGkDgU6rYxH7JAn4NNkK+n/oWzKD
         FCEdnEsejI/CeNF9WOWaSPxnU2wUT7dZn/9YxKbKvKxrRaokIzWQC7asUG0Ygi2gmMJo
         q9KXSyb86EIXhZoTAs55rpGbAzT26GOZkb7DEEOMuUhPLkxmmgIhhZMrNI20Sl2SchNC
         OMLPHyoncjAGbWyZwFjuNrV+1d0iYI07yjYfRJ3F+reqzqePIAReLkCirlHjqjTnnNtH
         JwuHy1izdKCYZAPLmLeWGQZLh/FG8Fsn3wpggSKlJfudYHZNCcsNPc8ASzQT5BCjFXJV
         GhNA==
X-Gm-Message-State: AOJu0YzWdB4XXUnCPCoj56qzFlbJiDhIeIB6UC+O5HqRaDO1NlrHCI85
	MIXVTWCPJbmIHhxzqlmqPtCBntZWyi5I7IfO8pyMQ0K7jgwfdpC7M9n8lbuyVUbTLcxOeL9lL0M
	2
X-Gm-Gg: ASbGncsYM7VvXEvmcK+zYxslmC53M/hApIa25yNv0LUIH6GOKHfqnaKSOALSgGbgjuo
	7d+ksch1WN3Sg1DRiV/wPeCRORslTpRWCo1o86rPeV/2/IWtFcPhRwn0TWfyOXZAO0vZePo9KUi
	uP654TzgxpscFTdTrY3g06pG+jg8ev09dyaA90PWPQUWOBxvSymeHg5SPLc046bNmP2oJWLgxbp
	54XopMJDVD2UfV4gsGft4qcPatjs/qeEm7sVqCbcBOrB+HQP4P1cJjJXgk/OxAnF8L74eiw4J20
	FX0NmO22JP0Uaiof2fGFqA74NBRD3vSigeRrxU80frNEtRkxanU46JRWFVY=
X-Google-Smtp-Source: AGHT+IG9Su4FT/CkwSB/qEROuPYatLudVGym5ndo6X3FQ1mDLiVYE3t9SAmm7D3sg5SybpnnoKGI/Q==
X-Received: by 2002:a17:907:7d8f:b0:ac1:fe23:7d43 with SMTP id a640c23a62f3a-ac2530200d3mr379712466b.51.1741364650603;
        Fri, 07 Mar 2025 08:24:10 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438f9bsm300831966b.11.2025.03.07.08.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:24:10 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pdm: Upgrade 2.22.3 -> 2.22.4
Date: Fri,  7 Mar 2025 18:24:06 +0200
Message-Id: <20250307162408.966423-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 16:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115790

Upgrade to release 2.22.4:

- Ensure dev-dependencies are added to the correct group when the
  tool.pdm.dev-dependencies table has groups.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pdm_2.22.3.bb => python3-pdm_2.22.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.22.3.bb => python3-pdm_2.22.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.22.3.bb b/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pdm_2.22.3.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb
index 0cf9b7d5c3..e6f35b3c7a 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.22.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "f409d37b44f6b9938e4eed0bd0ca8016d15cd4514337640d6f962a74d022b412"
+SRC_URI[sha256sum] = "8483f3d2285039cea7e07c5ba6ac7e1fcba358129f8831fb75065a797d27b923"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


