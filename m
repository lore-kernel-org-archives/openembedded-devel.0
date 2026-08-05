Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDF4C56201
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:56:40 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37820.1785927392430773124
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KNDJCrVM;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so953786a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 03:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927392; x=1786532192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvKUcdk25LHq3uumXj4GfR9+Q+HR1/JMznB75WYMPcU=;
        b=KNDJCrVMEG2PDzwgWSNwaGyZ/fOITmcycFz0VfFoyZ0rf6FS2yuJmqQ/pcETjxA1tu
         oxxgZAyrHQyzlOwu0xoTP1p8UIzJcrDTuvHvbuwfBHiR0PG6Ds7sEIgbxnJWr33G3qoY
         dZ6T1YLNq8LEGn3hFraHUwj9OeD0wAZQcg7cAYALnfRDwduToDnFOfmoo3/tw1Cs7yVu
         VJp3Nf/AS/aMmDYmMIkWpUTnaa3mQ5L+r70qnBkKIOwyKHBIJdx9Bn01VRs695T+uFFw
         SwOdDeAcI5Hf0ECA1KvhUuvYwUlPJ6T9zwsWUdVm19lu9zk1S9uhclueNY/NJKTCgktO
         t9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927392; x=1786532192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NvKUcdk25LHq3uumXj4GfR9+Q+HR1/JMznB75WYMPcU=;
        b=m47sNQgw0Q7Q4bvalEeUISHFlxtQm3FaloNyrOQHXbCM7xtbb5eeKsibVfaIbw+xUD
         T5ggc8kdKNOFdKO9htnTXMQDFRn0fTIBSWVbKrhWn4dKIUT1RQj7+28AcAuhY/mdR4cf
         ynZ3sReVonPJDmLFhNa7MZImuByHaGO4DvcfvGnJltcjQsY8wl7kkOTim0E0Rp9hi5ct
         0LCOJTsgpbV9nSdnvMk4oRD+t+MdbQ6df9BOauUIQzuznaAb8UyIlePqu0mjGNM/NiUD
         SJHyTk+QkgVCsKMOgKKhVtJqxU0ZcfcKT4MAmkHXofH7h9goqBERmihfrA+pFKh+Zstn
         xNmQ==
X-Gm-Message-State: AOJu0YzcIKQMBPWcwfeR7kfjLdSwfDpudz/TsPnvttjQ7gm6aMWQhcWi
	ruTWwqRliot+cKAQXt7CPyPpOABn85Vn7V8LOps4iX/bv8wK4FKBi662RsriAg==
X-Gm-Gg: AR+sD12egYWzhPLj2K0t5ZppqdZTBgDo+S7zJeaUp/T3Q42rWuOnamGRh+FhaaIOlpE
	FbnlpWOWv0AZYFD6xrbxHdO0GTAxh8ijfmL8NTPsa3C4ReVYaOgatG4nTD4GEJS+wekMWL6VVXC
	OvQuO16rCKh4hwV2riEXs3zBsCQE8ydGVePzP6VPVM2kx4wUFJ1ascJUwOvdj2Mh2Iq3NI/qXgO
	Gd4aA8K+GhQPRATHLQiuTHrIX+p0b+v5u4Ya+zxVxkDMEuXAxhzl1t9jeZB+kh578o32shlZCX4
	o+6Wphi+/pfNkAuhxumzoaFstq+0WcB1pZondOcD9sLa1Hrizo759HxXL7Womkdua9bMoEXhIhV
	mCpWaxFmnuL3/rMWOtvYcsMcChKaxMNXBpgZNk5MD2BumobLSigQB3dCxb0cfcHdYMSkkezpKY1
	7Nnkiy8Bkjn4IQNYLINstuM6+2WaTGWt2noJVXe944Uid7b/YXMw4JFgYhq40iw0wKd37BszjjB
	w==
X-Received: by 2002:a17:90b:1809:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3903c583c08mr5309774a91.9.1785927391683;
        Wed, 05 Aug 2026 03:56:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm16407166eec.24.2026.08.05.03.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:56:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 6/8] ngtcp2: upgrade 1.22.1 -> 1.25.0
Date: Wed,  5 Aug 2026 22:56:09 +1200
Message-ID: <20260805105612.1648951-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
References: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128815

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ngtcp2/ngtcp2/releases/tag/v1.23.0
https://github.com/ngtcp2/ngtcp2/releases/tag/v1.24.0
https://github.com/ngtcp2/ngtcp2/releases/tag/v1.25.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ngtcp2/{ngtcp2_1.22.1.bb => ngtcp2_1.25.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/ngtcp2/{ngtcp2_1.22.1.bb => ngtcp2_1.25.0.bb} (91%)

diff --git a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.1.bb b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb
similarity index 91%
rename from meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.1.bb
rename to meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb
index acff7b548b..2f91ec9318 100644
--- a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.1.bb
+++ b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb
@@ -4,8 +4,8 @@ BUGTRACKER = "https://github.com/ngtcp2/ngtcp2/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de0966c8ff4f62661a3da92967a75434"
 
-SRC_URI = "gitsm://github.com/ngtcp2/ngtcp2;protocol=https;branch=release-1.22;tag=v${PV}"
-SRCREV = "716e64b05f4a3709dfc0b0522cf9fd4456d055e5"
+SRC_URI = "gitsm://github.com/ngtcp2/ngtcp2;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "f9e9ff01ad2c8116bc09de4f644b0028a61486a6"
 
 DEPENDS = "brotli libev nghttp3"
 

