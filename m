Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD4FC43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 09:42:32 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.4193.1657100535401952071
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 02:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WAj2U+/V;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id u12so26051000eja.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 02:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khl1qjDcSPHF5WhrDogc+ZbylQ6q7USnTn2RWDivNsY=;
        b=WAj2U+/V7HouL6uillMcYP8JWHMOwsPOn/lZAo7o9QLVMl/U/BufS96HEYsyKfLqZC
         9kVIhjeUXBEPi6h1LY+5cMo6x8G2LjAjSxpRSEycArBjgyddz4U9AtVXR8a73MtfETs8
         s7YD/3DyM2PGPtxiLlQF9Y7qHvx6yv6intsgXv9eM9BWhPgWOJfZxoCK8D07D8Yd3Smn
         RZ94WvQHvda6plKijbk/pLDHU3z5uCrgIr0XqImRamtUUw583xI+B/aaNfQxVijg/TBA
         nMecASELU7KafIKsTJ0kCTEyKgJqsaPicdmzeqi93TqSRnhVqMOrycgnkUHeBeVZS6JO
         0kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khl1qjDcSPHF5WhrDogc+ZbylQ6q7USnTn2RWDivNsY=;
        b=m0nZ3YAigdWZhMiWa8YWgBv2XGrTpBGlT1N0thi278IsIisWmLJS1imjq1c4ttr/pS
         HDNbgKPuhjkP1/+ZrIc9CYngJnc5KU4yWeHupRvG11Vh37HiCeeynhZFjQJ2hRFGTTDm
         qzBxv9T3kKGdEWuP0jaLy9SefRTGQrwJTjxz0drj8rwof+R0QScJjOH7J4Ib+72ctATA
         FR4ASznOm/lxF49VrH+jovRk5tTzll7AewagHo97Jw33OBpKwdO/e1GZeH9stt5xGrRI
         S+ybTGNSMFpecuPptFnUso43o4GIZHGJ4u7EPKzM+2130JvdQxsWUAivc6LbhpufJWO/
         dWfw==
X-Gm-Message-State: AJIora+BfasuRCXu1N8vR5DBclO+oLtZCBcD3lAQXCxlM/CUkuW6Iq4k
	aVE7Tt4Xs2g6gxcYJqs91XwBE77qnwc=
X-Google-Smtp-Source: 
 AGRyM1uDyByn4JFO0m6KrYE1uFW9qmACPP/UqFA4NI9zIumOk5i5+izCRW7FwJcNN2sGBLHyEXMPHg==
X-Received: by 2002:a17:906:5d0d:b0:726:be93:1118 with SMTP id
 g13-20020a1709065d0d00b00726be931118mr37244322ejt.503.1657100533653;
        Wed, 06 Jul 2022 02:42:13 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 ds12-20020a0564021ccc00b00437d3e6c4c7sm15286746edb.53.2022.07.06.02.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:42:13 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-networking][kirkstone][master][PATCH] spice: ignore patched
 CVEs
Date: Wed,  6 Jul 2022 11:42:07 +0200
Message-Id: <20220706094207.19551-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 09:42:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97728

The following CVEs are already patched so we can ignore them:
- CVE-2016-0749
- CVE-2016-2150
- CVE-2018-10893

This is caused by inaccurate CPE in the NVD database.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index d9083bcbe..1887a5582 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -30,6 +30,12 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2016-0749 \
+    CVE-2016-2150 \
+    CVE-2018-10893 \
+"
+
 inherit autotools gettext python3native python3-dir pkgconfig
 
 DEPENDS += "spice-protocol jpeg pixman alsa-lib glib-2.0 python3-pyparsing-native python3-six-native glib-2.0-native"
-- 
2.34.1


