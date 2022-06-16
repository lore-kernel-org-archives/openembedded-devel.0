Return-Path: <mafl@kvaser.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16801C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 14:34:14 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.18535.1655390050830595374
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 07:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kvaser.com header.s=google header.b=oj/1L+gl;
 spf=pass (domain: kvaser.com, ip: 209.85.208.193, mailfrom: mafl@kvaser.com)
Received: by mail-lj1-f193.google.com with SMTP id b7so1707720ljr.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kvaser.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qoC067UFO5pTVSpCxROBE8/SnT77/mNBYm/91y9iOL4=;
        b=oj/1L+glCiTe28K2XdaErMsjKFJkCCUO4ghFJGtn2Fk7QmWVsFEsfJDvzjoNqqYjca
         Dk1SFMFhHj6cEWHHdetX4pJpOfzpMnyJrMz3EzF7Hg8sDPgrv2/6rTZpeO6J3QtO+Xa7
         HkJoJBlc1mogk62SmdxurUSQKAhsVdaG2EiHE2ebKqrBQ6J2zSl/iUxrBTPYKF8rQz0w
         sPfTQxBxDViJou9HoPvDh9+0OO6XIep28ONubeKt6OPUA6B+q7ZCbUd2Hgn7iq961hLN
         +dXpbqwjdnhKDHoJ/4YZSwrIqW+0gAOh3qulfEHwz881ZAkV2pXay295pjvfu88mjFva
         lOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qoC067UFO5pTVSpCxROBE8/SnT77/mNBYm/91y9iOL4=;
        b=55nqW7rvLs2CtDXMuiRK5px7VyHURpT9NKtk2PNV+Ix3ShYdqOgg5cPgFmUjHKJL/6
         +Nwvm9klyRdS3lcplMANAGJmylIoby9VmSoYe6xZh/pWe2CKfmQOHykyywqR83HJp8bp
         W3wVFgbBwntZwU3WewqnVrbUR/mKzMhT4nToZ1Lw6fA2YWbJCkC5IWhdJCuWcnaYYRwu
         zOFxgWoXB+OuAd90IEABh7x+OA4FUTB0H98hVo7bfK2VYJ8Nk+/h9CgTeKxEvtTf1OdW
         RO2NhtTt9x7AeJCN931EmG0tTIp6uaWC6YgPVnWOIqMCB79ewxNJll9U3gyBEisbpluY
         0jiw==
X-Gm-Message-State: AJIora9cB+EwWLDVytZwC9v9SYHTNI/tnGbSe/CUnNcKU9E28xTclmVz
	TpGJcHYIgriw/k60NjNv8B8Z75GjfGCAMm9tg08=
X-Google-Smtp-Source: 
 AGRyM1s0p6kYojQjud497scBTmGW3RBgD6vKQXGZW7SnTq7nMhotquHPYqQaAHL6Uv230J+8gx9SEQ==
X-Received: by 2002:a2e:9ec5:0:b0:24b:536b:7e28 with SMTP id
 h5-20020a2e9ec5000000b0024b536b7e28mr2793500ljk.120.1655390048752;
        Thu, 16 Jun 2022 07:34:08 -0700 (PDT)
Received: from dextergordon.kvaser.se (rota.kvaser.com. [195.22.86.90])
        by smtp.gmail.com with ESMTPSA id
 m17-20020a056512359100b00478ec0936desm258569lfr.159.2022.06.16.07.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 07:34:08 -0700 (PDT)
From: Marcus Flyckt <mafl@kvaser.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marcus Flyckt <mafl@kvaser.com>
Subject: [meta-python][PATCH] python3-pyconnman: Add 'future' runtime
 dependency
Date: Thu, 16 Jun 2022 16:32:01 +0200
Message-Id: <20220616143201.347832-1-mafl@kvaser.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jun 2022 14:34:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97524

pyconnman has an install_requires on 'future', but the corresponding
'python3-future' is missing from the recipes RDEPENDS.
---
 .../python-pyconnman/python3-pyconnman_0.2.0.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
index e0f3fdd75..64441065d 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
+++ b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
@@ -2,4 +2,4 @@ require python-pyconnman.inc
 
 inherit setuptools3
 
-RDEPENDS_${PN} += "python3-dbus python3-pprint"
+RDEPENDS_${PN} += "python3-dbus python3-pprint python3-future"
-- 
2.34.1


