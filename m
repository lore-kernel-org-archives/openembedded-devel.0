Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D39C98321
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 11:48:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6904.1768650499763334440
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 03:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jRnUR5Sb;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so16793845e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 03:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768650498; x=1769255298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TCFAcwodrYPJLbQjflTJRNJek7RsHZRJsmfsjQPU3E=;
        b=jRnUR5SbAxbZhTGxiL3Gy8N0s2yhwZ3D9FcC+y8NujK8Mb+6ppY9JglR7QXH9CXSVZ
         uhKmfgOiEHTGucSnnt90lwH4mZseF8MotbhcE5ElQq7225Qo9rtuhdbA8R8xfC4VDfIp
         MKCldjYVd4zJm1j+KnmLvQs1DFG3ZDJTODEK/K3gBLrdoZUbc69Z0W6pamycKq3peZg8
         cbwZ2Hc1cWGdRki4dnhV0yAIEugN8NrDKyHXooVFVRCfH1IsxuLiZLqEcj6BUNDFLl8d
         UU9bUCJB0aT4fkGZnRYAv6El23EAB5rphx5D5YCZfrOBWTV9pIZmA5L3KLPQLHxg5cB3
         X27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768650498; x=1769255298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7TCFAcwodrYPJLbQjflTJRNJek7RsHZRJsmfsjQPU3E=;
        b=VFWLviH3YH3ZyQze437S+uf8CJ3Nt+1tYAf5EYh3SjCUzGyYZ74s6JqC5oqCjG9FZa
         T4W9E6PSos1j27XaHHhUs2adt1rnBPmvfu2altoDyP4ESVghP36CnAe4aoG5DX24Ssto
         lBmAywo13eRCO57FcIV2j0b+aTsPBXUBypU+VIz1Jyzcvr/mlVVAeIs1BpnRoRRfYsOc
         Dr+YWG+HRj7JmdFu3GQMA0ykKptKygsFTm1IEpQSGdPBVjg9c0m7bPtrQZkJVGhd5rUe
         T9gWO6O4JsPFG/P+WsOK9GPt8Cc6osLSbDXCavUgFjJhuyad/EAINSDd+11CNp6rZYz4
         Pt6w==
X-Gm-Message-State: AOJu0YxAkSlhmLfbRyDAVzy0RjfOiCb64NdJmY+EZqpJAn27Y9XNSx7U
	KmBFNFdslJGxx73d5HqF8p93hq2pBeL5vfP4MHVJkcZ6Hnl9bVIHhPg14Ogfhg==
X-Gm-Gg: AY/fxX4E3zG1vCDkL5gXuu/cCdsYdKtAMd7f4171YK5P89peNOXNRvi7HqOwNeNjlON
	rNdSLM+hT1n83TLY4QBJ27dP9+2yDnI0zULAdovGDnwOgJfOkxwe/5gBwbvnnxcdAJvKAgjwRTL
	fLcFWoRkTzdFiy2XthAmR4Iv96YinbI+4abaTQhDocxYA5KbJ/UXkfpiHJ06x0gaHD94iblELvi
	ymRB8NgnUSGc+YoUSa9w7AdgaVQHMG2TNkz65X6TGka6jwUEhqQP/ADSODDqs1p4bevEgeUbGsF
	GVRfSNsZegH0vS8kk97opgYqNDmmi2nASmo6GWP/PXaZpHpYKuhNWQU0/YjmGU6YF4t9yCsjV8l
	ZjKQkIGWEppGebSpizvNp/ZZ+QAwoKxtxGMKorjRn3w8fqYSlbVJQTKatgwjtr0tgrf6/Zgwh8v
	1T1YpVmXup
X-Received: by 2002:a05:600c:8189:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-4801e333f07mr66999755e9.22.1768650498113;
        Sat, 17 Jan 2026 03:48:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e886829sm89717245e9.8.2026.01.17.03.48.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 03:48:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/4] python3-blivet: upgrade 3.4.3 -> 3.4.4
Date: Sat, 17 Jan 2026 12:48:14 +0100
Message-ID: <20260117114815.782230-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117114815.782230-1-skandigraun@gmail.com>
References: <20260117114815.782230-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 11:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123555

Bugfix release.

Changelog:
 - Use LVM PV format current_size in LVMVolumeGroupDevice._remove
 - Correctly set vg_name after adding/removing a PV from a VG
 - Do not crash when changing disklabel on disks with active devices
 - ActionDestroyDevice should not obsolete ActionRemoveMember
 - Correctly set compression and deduplication for existing VDO pools
 - Correctly cancel configure actions in cancel()
 - Set partition flags after setting parted filesystem

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-blivet_3.4.3.bb => python3-blivet_3.4.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.4.3.bb => python3-blivet_3.4.4.bb} (93%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.4.bb
similarity index 93%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.4.4.bb
index bd57604f26..4491a53126 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.4.bb
@@ -17,7 +17,7 @@ SRC_URI += "\
            file://0010-invoking-mkfs-with-infinite-timeout.patch \
            file://0011-invoking-dd-with-infinite-timeout.patch \
 "
-SRC_URI[sha256sum] = "1b05b77f3ee35d82c7a577a168c9ba0204d3e9a87eb1975e5f9af47700eeff48"
+SRC_URI[sha256sum] = "835a63f0939d460298cf73ee9167d4e7de2bd076b2b3e82c432f2c01c85d81b2"
 
 inherit pypi features_check systemd setuptools3_legacy
 

