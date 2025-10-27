Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36404CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:01:44 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.30510.1761566493835727302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 05:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HHhX+Dvg;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b6d402422c2so1085889766b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1761566492; x=1762171292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QpELf9wJNpoME1VPh/SmZ8K91r4isJW2s7GkDVYDDI=;
        b=HHhX+DvgfcdoR3Nd342IZYK+dRezFGqZbE7sL9dR+pHo51+Gl04Lqulv3UykMzheOm
         VTInOqOTEG+wKT0PiDl/0XR6RANZdsnL8/KGI+jp31NjQQLxDNQOWF+kXaVSf6vWyE15
         cA4bfSB7xWtq5rLYfwMPnVm4H0uDuCAa+qJjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761566492; x=1762171292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QpELf9wJNpoME1VPh/SmZ8K91r4isJW2s7GkDVYDDI=;
        b=gQ5e0CdwWzbzOQPTm5e5hw8/GrMDfP74x73xCCOCxUjEoI/e0eEMge7pzzeYZtbA1f
         HYYQleYQ1G4qb8qH7hoca/7NDoyGN92Is876gbRIs07F77U6TXQmVIzch00tevbKQly4
         H6X3lZCx+9oK4xmr25FMuzXVeurpIXCjhk0PGnF109rXKS+yCZfRfOtz8HSOb0tru9UK
         FTMg/KY786984uk9U7KJuzF+Ai98Io33ERX2yGwyMF1drlFmPqy93qqb7ndh2/Rv2GI2
         ogjzhYqzuz83hhTINsov47iFlU0mlzXrOq3Y3QIJeHokbCH2Wk6MU/NtcWRBQs2Tpo2P
         M9qA==
X-Gm-Message-State: AOJu0YxFlkkY+uVUBkwJ4EAgmhu8Z0q44xGSPyZuEYgbXh6yRJBSNHS8
	5Z/zrOUj88PMSpwfMpNuZuD8Gdn2J56pbtXK2wgnunY3hCrotZu0sPZ0LltLzxEkP1FbEIGjtsk
	3b3k5
X-Gm-Gg: ASbGncuZJJTSfA+mW11Fca3GR1kzebcekXvSBJHdelE8TPMhyOj34oNZGChECEory7x
	QxQAYZ/S2T3wc8FmKDTmVoVFHRCUz3DvA1Kmhbjd97JfCjTcDjadWmXS5CMAsWkdLAWx9lRQdUJ
	Jcd3TdDqGdvG9uaVpzeII7qPzSFe9PN0tObDgWokw+3IbMxRS9zwffLiSysybpqGeB5UKPAsYjM
	VaQ0BQbmM8lSkxNQ8MVrMa/NJWNAqv2aMgw2Jmayi7jo8+caU3kazw+D56ZOCsPIMgaQTBj9eHy
	IvYTSNzqA/Q3vImje0mCd49jaG9t7fSg+dkTqcrImr4mWprGOOU/qjxYC1uSiTmQWhm56ItgMUj
	0C9Elo5f8W8t4Ye60763sli/BYHBQbYjhJ0VR73+wc1Hd/5czzxEtHWPxIvaYR1HFMNs1tkhO5V
	lmL3jHm/idMWPC25qyIYLwRHDS
X-Google-Smtp-Source: AGHT+IHhxWZk42eyewWyKVKflPH8SdPtKz1Qk7g88ae9ZkKCKIstx5nhPYhasblHQ2bnMoGU0E0WVQ==
X-Received: by 2002:a17:906:4fc4:b0:b3a:b22e:dd35 with SMTP id a640c23a62f3a-b6471d45a69mr4266967466b.2.1761566491639;
        Mon, 27 Oct 2025 05:01:31 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85338663sm740833066b.17.2025.10.27.05.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:01:31 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-argcomplete: Upgrade 3.6.2 -> 3.6.3
Date: Mon, 27 Oct 2025 14:01:27 +0200
Message-ID: <20251027120127.1536673-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027120127.1536673-1-leon.anavi@konsulko.com>
References: <20251027120127.1536673-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 12:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121040

Upgrade to release 3.6.3:

- Make RE PCRE compatible
- Only execute Python interpreters
- fish: set variable scope to local to avoid clobbering global or
  universal variables
- Documentation and help improvements

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-argcomplete_3.6.2.bb => python3-argcomplete_3.6.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.6.2.bb => python3-argcomplete_3.6.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb
index abad776d8c..f73ecf4523 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "d0519b1bc867f5f4f4713c41ad0aba73a4a5f007449716b16f385f2166dc6adf"
-
-PYPI_PACKAGE = "argcomplete"
+SRC_URI[sha256sum] = "62e8ed4fd6a45864acc8235409461b72c9a28ee785a2011cc5eb78318786c89c"
 
 inherit pypi python_hatchling
 
-- 
2.47.3


