Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC66D40CE5
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.30574.1730838764864219528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e2VlHNQ7;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea50585bf2so62721627b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838764; x=1731443564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgQOJDWIqZqkCeBzDPsxuCeBPLukGZFttp5kpgdlN7s=;
        b=e2VlHNQ7lI1Jf1VDsvpYNhg+GlRQ8yWOqiGP+Puy36Xja0b9ZcGToxWrqRg1n0NrF2
         A1b8Mb3WtqRSMX6vmzxNTdU5drWYjDQPXScs5EsUdIui81y6WknppZZucvZcsPrGYzKG
         TXVzgM0vLj7qxyuvZxooaXQnu7V88zlz0a5wafwSQX3a7wh5ZOvh6OUHjkYufXiYFXz0
         IQMm00N/O6VUhtIOdg/asvFKZ6aYyTiRlN1fV0junofYT0WjMv0abOThGu4u8sM4qbcm
         MQdRDDP0GYKO8Ig3Mn8ch30YAz+a0080fDvJ7QRFSTbkY7d0XEH7Dsczpnu+DzJWn9ho
         0Sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838764; x=1731443564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgQOJDWIqZqkCeBzDPsxuCeBPLukGZFttp5kpgdlN7s=;
        b=ZeqG/8eO+xaljPZs3XvI788IKZTMHs4Eho7SqQDee07q95nD/8B3crRU6cuPyoi+FH
         poNCTBDXTO4qkhr/iHXd2l0TqgEQCE7WnKU2nE6pC12CBWtYt/oog1wfpKbwJgNfB6nk
         MjdsmSC1fsVXZ8fcVfRKJc+OvxM0hDZ61g8wIISRvIYc7/d9vK5iwDaw4oI5kGM/+oih
         D0uehSY62b2gYqQZ4kjzdbhCieEOZFcJyyYNvqraagLTA88a3REe+henoaiGSRIcqrg7
         BNkXPvPqy/roP5uzBbmLGLRT3SRkcoAVRwWd0RZw7yXRuT3jYL7uEQzykRbTAHoIAEsi
         a8qA==
X-Gm-Message-State: AOJu0Yx2llHtjLfd6I5e1rsW8U2j00BkkrL3NWoKeeYor306lPfbl+ej
	VR7w9FForCe/SRBujhk6qd61fIF09HsvaFCqlrAuX0Pw5ebxJmVN4f9xdurn
X-Google-Smtp-Source: AGHT+IF/ibZI+j+NXxQ2UuzDIZhHvrsv27jH+DCgX/xRy4rO3SAkRxJ3BNC10Fg9W8GoZ/vEh9Ds/A==
X-Received: by 2002:a05:690c:9a8a:b0:6e2:313a:a01e with SMTP id 00721157ae682-6ea64bf4935mr177143077b3.32.1730838763456;
        Tue, 05 Nov 2024 12:32:43 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:32:43 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 113/161] anthy: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:38 -0500
Message-ID: <20241105202827.3104-113-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113630

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/anthy/anthy_9100h.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index ed87b3de4..e9f8464e0 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://osdn.dl.sourceforge.jp/anthy/37536/anthy-9100h.tar.gz \
 SRC_URI:append:class-target = " file://target-helpers.patch"
 SRC_URI:append:class-native = " file://native-helpers.patch"
 
-SRC_URI[md5sum] = "1f558ff7ed296787b55bb1c6cf131108"
 SRC_URI[sha256sum] = "d256f075f018b4a3cb0d165ed6151fda4ba7db1621727e0eb54569b6e2275547"
 
 UPSTREAM_CHECK_URI = "https://osdn.net/projects/anthy/releases/"
-- 
2.43.0


