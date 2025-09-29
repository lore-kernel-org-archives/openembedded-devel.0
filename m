Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1770ACAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.53215.1759151086781693614
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ncnTJVdH;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so140369266b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151085; x=1759755885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8ysIHY53WLAVcqs7YI84jmT6VVzVH9bfnE5bPpDDUs=;
        b=ncnTJVdHnWIgw9CH2VcetEfkBK045z8SMVKqA8YdJkJudMArwem/9VPH2zoRgHiu1A
         lMcqLgKX2lGGFDx2tdI38Ek+a62JhWDypZsNuAWLtTNW4NJNhWrQ0EQEsapCmnGknmgV
         t1bsZYAKUAMeuEn0fPee1l4+1f3c2/ITBlZui1Q+43omaW54RHK/Je40dr1A2tcbHT+n
         jcBngNiaRqZslOZAKYxBnnlTyWUDVrJO/x8UsS3Ct4wdm/h6wu8Jg1cbZ2a5AaLhgKYe
         xOH5zb8rHme6gV12sC1LGsqud4FYNSshuYnsOwpOHlEjLcswbEQUX0lPvScqrh0JPxCt
         iNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151085; x=1759755885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8ysIHY53WLAVcqs7YI84jmT6VVzVH9bfnE5bPpDDUs=;
        b=aQdKErokKifigt9a3tV6FV8eYBOWHgJzqYV9bgNLQy7Bf1v9uOYx8BHF4O6cOZrRBy
         9Jk2hPvo0dsZx5U7y7uw3E8/531ElyAqftyDfAfPUX/ZlCHakLQZ9sH/ZqRT2YpvcgMc
         swHC9hSzeKqoVOAOXUI0wNSyI7AuMpWmHnEjdvDqJVMkB7Cow3LdWHnRraBDBuz2x4Wu
         +vmdFG6fqLpYTOvoU19an9MvoXsozHtPaXZYL8IbTgXIzuIcVkr1GRlO3MhnXtyCb7ZH
         j0G6QJFFwPkPfg+K5JqGcsTSM2D024VzwuJ9kWTCn4zPfUD22/Hzq+JFFGazMZjHdnxA
         rVXg==
X-Gm-Message-State: AOJu0YwOnYTm79L5wB/1lQ2vj5PzKPrfz6kBn8B1XY2xBnsg8NSyehT+
	U+srvk+Ow1gZ3i6sM7/MEAh9mu5MwAe6YLceeHwyxRVA93ISDXORTiKZNO8KZg==
X-Gm-Gg: ASbGncua9aEbZnFJ7SiOF74HXaSgmRZOnV702+QMfj1vP8Qtz3mueEY/byyFqWfMeg8
	jVcdHh5mt9K8FEN/H+xZ28qmh/8OB5+6TDWF29p/NfJAO7CmGxR2yToq2h1AlU/P5BvnQ+CKLIv
	SRclSTJfSexVAe0OkzFQ2vM84gR65/X+/saPuZjsqLTbA0N8ZFfliDXCmjtnvniMOSuy3SVoIlg
	PVZNxz723N8rX2WbgxvFkBit1g7klSASlXNUtzwYXnenZMQ1U2F+yOXd6omWf8d05E9pF7YWL/7
	/K65RzG667yZ5UsTnCflGgf0wLp7NGft9+UJU0QOKWfeF5jGkb+3RRc6uhkeJU2t/4TLxxDfqxE
	71U0f44nnTa5vEsNaOys/
X-Google-Smtp-Source: AGHT+IG+b2YJwaFNzrtuqjQoyiS+Z6FZu/RO3CEBcDrr8BOpEaoGp9pn+sjQufwipLKy5ScZp7bxhg==
X-Received: by 2002:a17:906:730d:b0:b04:3c93:21f9 with SMTP id a640c23a62f3a-b34bb320738mr1839876066b.24.1759151085034;
        Mon, 29 Sep 2025 06:04:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 20/22] paho-mqtt-c: Improve the license information
Date: Mon, 29 Sep 2025 15:04:23 +0200
Message-ID: <20250929130425.2912077-21-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120033

From: Peter Kjellerstedt <pkj@axis.com>

Replace the about.html and notice.html files in LIC_FILES_CHKSUM with
the LICENSE file. Including HTML files in LIC_FILES_CHKSUM complicates
things when the license files that OE collects are, e.g., later
processed and presented to a user where the expectation is that they are
plain text files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4decf7d0a71c4bc3056349d0c5f5a097d17b1cc0)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
index d006ae7636..7a65582dbe 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
@@ -5,10 +5,9 @@ SECTION = "console/network"
 LICENSE = "EPL-2.0 | EDL-1.0"
 
 LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=fd3b896dadaeec3410d753ffaeadcfac \
     file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
-    file://notice.html;md5=943f861069889acecebf51dfa24478e2 \
-    file://about.html;md5=e5662cbb5f8fd5c9faac526e4077898e \
 "
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http;branch=master;protocol=https"

