Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FA6CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:26 +0000 (UTC)
Received: from mail-pj2-f31.google.com (mail-pj2-f31.google.com [74.125.227.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47661.1790553795767277874
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YFOP2mrC;
 spf=pass (domain: gmail.com, ip: 74.125.227.159, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f31.google.com with SMTP id d9443c01a7336-2dd53691be5so16441945ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553795; x=1791158595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqBz7+KPs3WvYwdQvqPvxnhIjxlOZdriXe6+OHfTV3Q=;
        b=YFOP2mrC/LVBnXHTiWedI1aqmEldf5n856h0pRQioTzVPC4Fvt4RNADKLMl1Rib6NQ
         wY6cJP3GqzPy0IhOkN7lOQHJ1WkMF3bu6gmMaXcCxXltCG+R4oaCv2LQy8uVyXbx56Sn
         Cak3QMFHxuJ548L5/8ciSuc5jC23gLRtrzSPUkJ7km7QkKnXozNxOYNwUIgW2njVSE1f
         Dr3jVHhlDrkxr39uJXssHXAKdD3eFoShh6hmdoLoU1o5CU2u8TQqyA77SEatCPPIU8sN
         bchuitJyIaykyyUNDG48zJyebIyJpLupnJI01QRo/+fV13AhOQ0qdYJGm3AxHOm4cl2j
         3RfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553795; x=1791158595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JqBz7+KPs3WvYwdQvqPvxnhIjxlOZdriXe6+OHfTV3Q=;
        b=BG31jGuUVTdAvvg4GgNXi1lgP3TWX7I2NwN1CpcFJKoFOGCXmSdnvfw4jYBurETQ/Y
         0qQBIrupiWPUaG8lHekrlQqyyhUh0ba0jIe+fpde20C4vcETzJ5jnUh4FHiOTqCjSOR5
         zUbJTuWhBOtlSDGN+lUiVMuf/urSrG+8VBkdY2MDQrKYW5ywQi239Dtlo9QsivXGnf5V
         W6XQqRAQwAVSpfjYdFYnt+wprMVwWxWUqEVzHzyVrcz/NmHPWq3TJ7EFFOX0MWjAEIwA
         1UJEN/MQlQKKzC9F3qrdnyFbvd8Fb2UimSlAk8cxw4m8i2P+oLBAzWD8KVeKK3iOYZbR
         Ad0A==
X-Gm-Message-State: AFq9FYIawUIRv4oPxjlzuFSgo2hyLVfTrdy85BkSN7OKH/lz+uiZtF8l
	8YBsj1pIr1tKOsNvKN1SRNcjlG+qEZRWvqTsBAD4sC51xkvUNeNjH83pOHoLmQ==
X-Gm-Gg: AYBFou0j7AxluXYxCAA5HFcqvYWws3bvEF5dZM0vfC4TPo3wKR19yNcSFMEXyS2lEj/
	Pde1IysDIbTGdatti2k2rp1B1ABbQiXGSrl29PqXdwUT3enly3dY4aXZ9c4RMPsI95CB2qM8+hm
	1bbVXX2N0y8bVP8+9AEokw98FTH7bdYWsbQQhp0WqwDU9H8GmBNoN2j9uoxZKRsOy6/IpRCuvc4
	OErcnGjPe1gXklu09I4eUckExCJGS/aZ7O7XyqPAcWdbC+OxEKr+1zv+21pi+DK/IUYUuqePi/t
	B010bsi/8zcuFFXFuLV86Z9IgwhRlYMwOmoLt3BqOcewdeBgwca2XkausbTy8/pa9qPn8eZr9CS
	Sn2Qu0qFaHgVGLyNih58O5TFeZU4mI4oCIH8Nt0TqCvw/B/2WXRSp4NkmAc5guSs3gkpShDJMcb
	KHvxWSmhByrkzbVS4wyWgMwf3qOXuNGOHl93bm/3XDoafp8gPNDCoqjgekDLlll4TrjLPg2OC6D
	o/GC1YCQJ+bN4U0i2dTNaI=
X-Received: by 2002:a17:903:2f87:b0:2dd:c100:943f with SMTP id d9443c01a7336-2df94c84dd2mr68276005ad.61.1790553794945;
        Sun, 27 Sep 2026 17:03:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 4/30] python3-ldap: upgrade 3.4.7-> 3.4.8
Date: Mon, 28 Sep 2026 13:02:36 +1300
Message-ID: <20260928000302.2528437-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130391

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python-ldap/python-ldap/releases/tag/python-ldap-3.4.8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-ldap_3.4.7.bb => python3-ldap_3.4.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-networking/python/{python3-ldap_3.4.7.bb => python3-ldap_3.4.8.bb} (91%)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.7.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.8.bb
similarity index 91%
rename from meta-python/recipes-networking/python/python3-ldap_3.4.7.bb
rename to meta-python/recipes-networking/python/python3-ldap_3.4.8.bb
index ef681455a5..d34a21ddba 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.7.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.8.bb
@@ -13,7 +13,7 @@ PYPI_PACKAGE = "python_ldap"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "bacd9fb680d20263d8570ade1cf234d90d281149a8beb4f079dd8f33f7613dc8"
+SRC_URI[sha256sum] = "18dc7460470c6ff64ed5c04ee21c56dbfee7ab433a53213ba91e407eea44c34c"
 
 do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' \

