Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34891C44502
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 09:02:50 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7916.1768986169289922457
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 01:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ABHEmMR8;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3802099f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 01:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768986167; x=1769590967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/c7kFYFPNALTC+Ixty4PExFTECngKtXG7L80fk9uST8=;
        b=ABHEmMR8JNfT2KTmPVB7dg1bGceNwTNiKdUUigceXXTIvUXrLyHqhF6ZVF+9MeNCcs
         XQBde6zNMR56fMuuGuvcvlPB7YePoN5Gnk6m3H229gyzHIeyj2A4hESo0rr38F6vZQk3
         gQlcG9hsrh7CzJP08voqZ2fOKPFMOobglN5T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986167; x=1769590967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/c7kFYFPNALTC+Ixty4PExFTECngKtXG7L80fk9uST8=;
        b=DLZQArl5eUjEG4G5/GqihDf0nblsVvAhJQ3dTYlIGVKJGTKdNqjEG8WMaREFtDoBmB
         Yc0G5KQnVdD7DiXac2D22kftYwK6Wavs4oVkbZ6QUwl0PVUbaHwMjYAW1qHqxnHGD1FB
         hxDvf6uNQ1vtKs6maPeSyt9aerbTsWelZs/vAnf6sgoaAGw4midhhpfgtQXDJeGISsCl
         rrkX2LuCHLZqYDOrMA5C0rvbj8u/1efYxBdAXNi9QZPN7Xjn7UVyz2ugxKq2TF4k+Wqh
         qJVo7IUn7cXLw6AVq4zNZZOu7k10cee5qPyF7lXZ4U3qRcLsCUaTKaPYJ0E8J1xLbXvz
         XT0A==
X-Gm-Message-State: AOJu0YyiIlg0yZXunb0V1vfEcvU8gXVxjrDHCvKJj+2ByTYHZMJJaMvm
	5HMQcAWjISAuTwmQ2TGOlw8gwn4EJwkIEVzOPgpd3lPbFjO8QnORlDkdE7BtmcQ4CJD+4W3CVqg
	Fv3NE
X-Gm-Gg: AZuq6aKGS94y95DPz021ErohTmzIk30vFzczgDw+PEs4cdhhDvBPmlQH61pi9NOHcRY
	ZJaVdgoh1KOBM6QOmgM7eOSKAgchUQ/8s32T0KdvKoXOTUWioJMVuBl2HEAQiQugVdZTCN6c02W
	HWXTVb4BK+GGaK3b7BWrekLE2dO5oTbp9ZGdzuHK9R+/78zyqjiRhwZvk1AcdEWClFYkhvqH+ap
	PHL7MJzF7l2N+p1VmUbuL3uWIE4yfKMxmVtAB4Ou3jKSbnpk7DHwhQSfsKb8CMLGihxFFBotGT/
	wXwAMg5EylUst7Ld8nH/U/xxrWdhcTu19KyenCeBtBvqxp+7Nbl7SA1ODRspEeWZZKhka204fI8
	UO+YYbPuEkzrz9BcRU8Tcng5oJQ+Nx5LQwRc4zDYSLSERPONe93OpIMTMHGodz4RLNDsplP8b+m
	1KAdCT/UQvCkzeTaW5yNZ3Dx1KFHMB/2jTOiY=
X-Received: by 2002:a05:600c:4e50:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-4801e34dfdamr226186915e9.33.1768986166734;
        Wed, 21 Jan 2026 01:02:46 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8caceesm295050815e9.13.2026.01.21.01.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:02:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-wsproto: Upgrade 1.2.0 -> 1.3.2
Date: Wed, 21 Jan 2026 11:02:41 +0200
Message-ID: <20260121090241.2437885-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121090241.2437885-1-leon.anavi@konsulko.com>
References: <20260121090241.2437885-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 09:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123691

Upgrade to release 1.3.2:

- Fix type hints to allow BytesMessage to accept bytes again, as
  well as bytearray.

Release 1.3.1:

- Add additional license identifier to pyproject.toml.
- Use Python 3.13 to build the docs to match ReadTheDocs build
  environment.

Release 1.3.0:

- Require h11>=0.16 dependency.
- Fix "Upgrade" header value to match RFC.
- Add reason "Switching Protocols" to handshake response.
- Add docs for wsproto.Connection
- Add support for Python 3.12, 3.13, and 3.14.
- Drop support for Python 3.7, 3.8, and 3.9.
- Improve Python typing, specifically bytes vs. bytearray.
- Various linting, styling, and packaging improvements.

Fixes:

WARNING: python3-wsproto-1.3.2-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wsproto_1.2.0.bb => python3-wsproto_1.3.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wsproto_1.2.0.bb => python3-wsproto_1.3.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb b/meta-python/recipes-devtools/python/python3-wsproto_1.3.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-wsproto_1.3.2.bb
index 4aac092fbe..3a9b18b7af 100644
--- a/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wsproto_1.3.2.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "https://github.com/python-hyper/wsproto/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=69fabf732409f4ac61875827b258caaf"
 
-inherit pypi setuptools3 ptest-python-pytest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
 
-SRC_URI[sha256sum] = "ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065"
+SRC_URI[sha256sum] = "b86885dcf294e15204919950f666e06ffc6c7c114ca900b060d6e16293528294"
 
 RDEPENDS:${PN} += " \
         python3-h11 \
-- 
2.47.3


