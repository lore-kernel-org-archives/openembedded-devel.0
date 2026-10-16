Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9977CCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 04:07:55 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14624.1792123668600623881
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EYtkQ3AJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e5fb79ce82so34564805ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123668; x=1792728468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlLnhhOamGPffzI4bukAwaZ83fZr2iQWdwLK0EHHf04=;
        b=EYtkQ3AJ8EpcbylAGNFDn/IicTTh5yEqq8fN0dST0szXg/aSp3vbFwP+0ORI5mjCtw
         6ulpdIESLtySBOZQSBMuq926GkoUsGpr8SJKSWa2iD8Xqd6e803TRgLsGLMmEEVMf5tH
         uGNqbyQMr5pL1NRBDnPkQCcqSsmnyx8OPAQW1c3OiZlR7hBLfPT6j74Ki3sbgEX2tgTQ
         wCB/1fez3EinhO623pEKDNXe3CUwFAzLUGtXx7xY9dwWIUGgnCUnKx6rY5QbxaameRxF
         RqQy8DJcQFspow4ZuH824lp7SNEAEyJcrHOJcRcwL71hTdxoawitiiuuvn/1sVamj0vA
         XSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123668; x=1792728468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WlLnhhOamGPffzI4bukAwaZ83fZr2iQWdwLK0EHHf04=;
        b=A3jeMhokMYtqPLkDYUo2SmbB55u8vg+KP07MU1FIqaptVWKl+ConThzhXxMGiU3ZtE
         ClQbc+YHigaB7twOlrSJEanddwfRHxuin14Gk+ajXy0a5mTGKTtyVacHYsBEqEeyV60F
         wsqPqtseBsJ4nhRIokO6vHglF+RWGnjcdgIzS/Ficlok3sDeW/lh3S7mpML+fnnHHQMz
         kZHvKgGbFAEi+9NmVOCUvu4SHlSH46Skx4A3iKN7iQ6ZTxUOOWaDHakXf+XJZaHatQzw
         PnGvITs6AtmllqcAEgspiqC1qHIp2p8u7Ezeh144LW4z1O9F/+2vi0J3DyUAj05CVJFJ
         OYdQ==
X-Gm-Message-State: AFq9FYIapR/g8GvJZuD0DUB7J4M7oA2RydbRqf9muXyyaEIDstZydCc+
	cXTKiGccC0JvhIDNwjwj1FsPON+mdihMa6c9wwUXBGoxP3cSHyXRGsmVi66odg==
X-Gm-Gg: AYBFou3lJSpOcC6CltI79McqhxTnSjTxh3wzLw5nx0iplR9zkpEw2oq8IYjsIrJ2EtH
	4DbohElrdSB1wprmND8jYdEG6joqpiZzvAGiVyzRpvchQ/hnLYY4DPbnLe6KhjFqbTjN9lHLr8O
	MWu6b1fTfshhg24II2Z/ScJyZf8MgVI2swjpkHPC1BlyHcpUUxiSAo4rGd3wBytfxNOUhGedsB0
	gZM+AV6CcPhoJT9lReSgPWv4NU82vAvGQyKGfCyuZUDWnSlcTPk87MMBoM2FOp+EhvUq38XtU0a
	XK1I9xoBtLNsCl2IHVpTVs7MDnd0/8PxW9PUVB9OjCl90EY/LPdECLjb1LvpZsQ3lVo9RPg/TVq
	Qtj0wgerQ+o/AMWh2URqXkegB1wprr3Hj6S//S+waio/jhmA29TkgaKuutcB0WqyMZqTbkNaeWS
	sKh6xcJSaLXNXpESQS9KKYTlJVGrW+q7PehC3kjiK8JqXZsLigdwweCuC5g5Wd1rKxE3w7sCD5u
	KoNMytRjzwMD6TN/6Sic/flMLS/85p47nM+uLg=
X-Received: by 2002:a17:902:f688:b0:2e9:8bd4:577d with SMTP id d9443c01a7336-2e98bd4588amr5795555ad.37.1792123667771;
        Thu, 15 Oct 2026 21:07:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm3796335ad.35.2026.10.15.21.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:07:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 3/10] python3-bitarray: upgrade 3.11.0 -> 3.12.2
Date: Fri, 16 Oct 2026 17:07:27 +1300
Message-ID: <20261016040734.1499287-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
References: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 04:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131039

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ilanschnell/bitarray/blob/3.12.2/CHANGE_LOG

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-bitarray_3.11.0.bb => python3-bitarray_3.12.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.11.0.bb => python3-bitarray_3.12.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.11.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.12.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.12.2.bb
index c3c1bb6d68..93be8393f1 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.12.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "bf19437ec00ec3d40aef82eaeedc14cf4000be9b635c4f5049796506e6630dd8"
+SRC_URI[sha256sum] = "940b64a0701cea18c0698ef23ec2d9a038e47103b0402b19cfb298d71817d27b"
 
 inherit python_setuptools_build_meta pypi
 

