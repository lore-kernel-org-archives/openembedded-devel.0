Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750CEC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 14:01:07 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.5992.1645884066303851917
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 06:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XaoeIXCg;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so7334505pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 06:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c6YLqV4HL2HA24yuyp44Vffi4+dOT5HjP5L5yz58B2g=;
        b=XaoeIXCgeuAXKoZVRi3zOhuVfjJTSOPppJy6TyjOYnhyx1q5ts8t8K9jSlErV+sytE
         A6JvXatu5xxJmO3RL55Xy0oWtLWBraDeEH3NZC4j5k8tR/LkpX8peBLwwiRJs4bM4rsV
         CT2LAztEcqhkQyWrWjySbDjLggvo1XubvGS61nHLst1xspVXckX6982muzAYgoYuLEGH
         Mr83xV8PuXDrTIM75dA1bFzgtlZl7HTaA/XXkMkwR7edyLOG4j2wGoGDOlOxlpCS66Zk
         PqNg/wQYNIsnMXPGu64MwGRiL4nom7hFt/x4CfwedWoCxD/5Gv2KvStorbPz0IjWU+q0
         N9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c6YLqV4HL2HA24yuyp44Vffi4+dOT5HjP5L5yz58B2g=;
        b=T+aZ46V39bula/+YC7I0ZSGlB5Q139unodMVob5ngXz/SgdUH0eSyhvbggXTHCj9vT
         DWT4z0uONE2VLh6LM52N5zCUJy+fZKdINyarZ0TmaPMStCt+rqq35jjMACEm9n5qpSA9
         umidQaOEwSqyCih369jlY40Xvu2XW5zaeFYelUIKEbhsfs2U2jg6DtxeVnKDPgBwpiG4
         g8VYmd4bvr2tVzlIaSAkm21jIKqhOp6yL9xMtbYkHwGKczmfQqm91MZi+ZP1A3YV6y9P
         7wnPPx6ktSG5ZfBur80hoY7i/D8+j/Wg+079iCw2/hkexmc7R6PY6T52CUu7Sxt6S0Yi
         2i6Q==
X-Gm-Message-State: AOAM532isFeaddOUtIP/zadh8LmhIeR8STwkQeKAPLTLa+PNLQP7/gs6
	knHeu5drVblj0zAKp94o88TL4LCpc+U=
X-Google-Smtp-Source: 
 ABdhPJx4lMwNJxQA2+n9Q1rmbp3rPqZYMVs3hRG4ELuKhw2f4q+Fzg4XlXxkmh8kuXK+S6S/d0RdeA==
X-Received: by 2002:a17:90b:3c01:b0:1bc:b160:7811 with SMTP id
 pb1-20020a17090b3c0100b001bcb1607811mr8007914pjb.164.1645884065366;
        Sat, 26 Feb 2022 06:01:05 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:5954:439:c7aa:7238])
        by smtp.gmail.com with ESMTPSA id
 o17-20020a056a0015d100b004e1c11d833fsm7660026pfu.90.2022.02.26.06.01.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 06:01:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pw-am.sh: update to new patcwork system
Date: Sat, 26 Feb 2022 06:01:02 -0800
Message-Id: <20220226140102.2024217-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 14:01:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95542

Point to patchwork.yoctoproject.org

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/pw-am.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/pw-am.sh b/contrib/pw-am.sh
index 8987eee8e..d9d1187b0 100755
--- a/contrib/pw-am.sh
+++ b/contrib/pw-am.sh
@@ -9,7 +9,7 @@
 
 for patchnumber in $@;
 do
-	wget -nv http://patches.openembedded.org/patch/$patchnumber/mbox/ -O pw-am-$patchnumber.patch
+	wget -nv http://patchwork.yoctoproject.org/patch/$patchnumber/mbox/ -O pw-am-$patchnumber.patch
 	git am -s pw-am-$patchnumber.patch
 	rm pw-am-$patchnumber.patch
 done
-- 
2.25.1


