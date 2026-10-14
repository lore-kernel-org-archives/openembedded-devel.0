Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EAECC6B1F
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:48 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9259.1791969941130208456
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QcdnF7Uq;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2364007a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969940; x=1792574740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWe7qRJj3tWLM/FJf6dDpjyDH0alE6Opkqv6crHt7Q8=;
        b=QcdnF7UqtBwnxB+vLLTGAOJscSiRreQEvK02hEr5NMVkAEkPRajaHxpCabQ4iaUZHz
         1XxF9VANBQYLRybG1rzQaJxLMBA3XvHSvb13AmHaAr+ylDE3/XUue7Exjlm5fQs45bO5
         r5VgyHFTiDPyanF98HPPU+JFMl4MZ+BxppHlIRGM/BUW4nljruh4VyP5l4p/BTFhs0cx
         bcOAVQgqMYHxu3EV6I9fd2frGs9+hTgCm52YN+eFsp5yMZUjpsEINmZdNxIV2el8s9JA
         1gdyD5FpsPsbtyIxnMu9hMHPfuZcv+DbgcBrciO8iyxXpSzOYLf07e6j4QgJxRWrwiAZ
         2gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969940; x=1792574740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWe7qRJj3tWLM/FJf6dDpjyDH0alE6Opkqv6crHt7Q8=;
        b=lsFkxeNoLA40Namg7he42IEN36tIwbHNx4hF/DOpq+3IMlNdCtYBbUGUdGzy6arQbO
         CttDav0mDWOAsAW1EZk0YaQIcBDBt4866qsayH5Qoz+/lU7+RvDsuRyTFU9Y1neGCdxJ
         PMoRwHtr/t8sPvsLXgBgOCoczM4SbI/qj+qFH7OSspNMIGSQfo1P9x90jG1dQpT2vVAO
         A72pt0kxaIF8ZzEegvZA+9VJfUAqMF2rlb1Y3Ts0BxG6WA6AYoId1tOgnBWBg28gF4H6
         8/xDDPY+b/wnx9Qd8dNcI5gXszY07qzbaWuqhNwU2acHKTPxcSkWOlU5ielZAsBVmeop
         0mbA==
X-Gm-Message-State: AFq9FYJAx5ViqRHpmhcTjEe3RGyPN6DRSGE+idtJAYTSowIRrZWyfCWv
	mv/KZeA/9IxMgNly6pw2aaCI8Mhfv5BHWakdqWaAOmhQQe90iqOcAJKCh6qoVw==
X-Gm-Gg: AYBFou3LaMFKgNCu9t4PnDM/oiaYYszwlWsUziL5v+IQrsgqTyk+dbIABeS8l5ZYwcK
	il3E4mdoTRjQmELo8k0veqD6ykblgv5uv1UGu1I6xK/ZNZYrkwFhF61MO0RZcpnuzGZFL+EAE/G
	KMiqdPa7l5n+STkIVFwNYtu0i48HIKEse1j9f9HmstqGqldWGCEvX0ZbzLnUmGIHpAGXgkQZrew
	ZisxJ53MuLoyp3dmWEWksHG8UDU4K9kLDZcuc5jmF9D16sW5x+r0UBCPUCCmVj5F3Fm0RR6lCWG
	9vTRv36JP/OasLx6VhTnZioXcD8yJ0FFCgXC9lau/2q1l0ockpxLxRpKgArO5s/QBSeov4XAFvd
	0ZS0R5r+I87fvlEUnkdMjrwH0o/U5XzJsPrYisO1moU68XPTG/GDo5G2xtN8vziYi4ff8jOd1x1
	nLmbeoG79nYEBbZfbJVhylg5Zll5INwokVvy6HhMN/yUV0ghmllP1bSu7fD0Izp+ub7YUzDbTMX
	i68cZLcyf8d/BrG4IMLDbBdbZlaZd8hup3qyXM=
X-Received: by 2002:a05:6a20:c784:b0:3e1:c58d:aafa with SMTP id adf61e73a8af0-3e1c58db081mr3874926637.45.1791969940463;
        Wed, 14 Oct 2026 02:25:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 7/17] rrdtool: upgrade 1.10.3 -> 1.11.0
Date: Wed, 14 Oct 2026 22:25:03 +1300
Message-ID: <20261014092514.454505-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130875

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/oetiker/rrdtool-1.x/blob/v1.11.0/CHANGES

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../rrdtool/{rrdtool_1.10.3.bb => rrdtool_1.11.0.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.10.3.bb => rrdtool_1.11.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.11.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb
rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.11.0.bb
index 656cee7ffa..fff3cb2ebf 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.11.0.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39df84cfd8a5e18bf988f277f7946676"
 
 DEPENDS = "libpng zlib glib-2.0 libxml2 groff-native python3-setuptools-native"
 
-SRCREV = "f9a021cc9872d8f8fe8137353eabdd8819288791"
-PV = "1.10.3"
+SRCREV = "ddc7ca72314c3149abcafb90993ca9e7dc1287a4"
 
 SRC_URI = "\
-    git://github.com/oetiker/rrdtool-1.x.git;protocol=https;branch=master \
+    git://github.com/oetiker/rrdtool-1.x.git;protocol=https;branch=master;tag=v${PV} \
 "
 
 

