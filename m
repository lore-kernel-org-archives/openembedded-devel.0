Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785F7CCD18D
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:17:39 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.43248.1760361450614063785
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LY+GfIvI;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b4736e043f9so670614466b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1760361448; x=1760966248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vapPyaYPypWtStwhtBhJlv4UGSdXpwJvBvHMngDJAT4=;
        b=LY+GfIvIJTCW7f1qTmM0aHKaYn6pP7Vh6c8R7zdyCDiwKikcZ/A+OKyHCewbmypg7I
         fNwRWfU1Z7bhTXg/V4y5ekknshzUkReDmuS0Wt7y5lojEXd/u85vRgoVzTS/2QV6kqvZ
         bmy4yzjpAKl7cfCtgDXCyxHmZd0eJ1xFuMwyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361448; x=1760966248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vapPyaYPypWtStwhtBhJlv4UGSdXpwJvBvHMngDJAT4=;
        b=WYKHxqWGGjfA2GCFFqf4TrP+3ISutHhR615KNSFXykyVSqX2BS/9j35vE+0bD1OBlP
         A1gjxiB/G5gm6IHTFKSjvofjr9JgFtET/4/JAMb0XiHJtq/GXximYbvJ/nKzlYuqVMn9
         O7ueY/wWmvmk+Kt2nb5KZQRX9n3zdbkFvs2XEqj5Y1SB4kreCqtLRabRlPeKoD/PW7La
         xaVI4mv2MyhgCeg78Ux19JPIwZSP/zAPzu9McrIUHsWs9cSe8EXnwyJX9tfM9ugBH+JN
         AmuW7F7mURKv5Yxq/mNCPLuW+dNp4NcVoH+U2tAafxNFemvBTng4kaC4itw0s2m0I7j0
         2oHQ==
X-Gm-Message-State: AOJu0YzJUDJNFsnD09VYmf2Lris83DkewAONN6UqG4/lMv2aBDG6QrOJ
	RyjkPC9bHeY2el8nBHYOj4zOTekUbie5ycFJl1QketMn6k8+2AqR2UBNkLDgS8dKlu63fK26mQJ
	Ydhhb
X-Gm-Gg: ASbGncvtIR0qOisVUaidJY0AtjWArc0C22RIVi/65JeUVxK0XoPZeIxjylUE21tdsLa
	0zQnwDivzwQC+0bPEtS+IEgWcl47nZ5wtmvh+Sfr7HCWaBVQEPQgluQA31HyZ331xZlGl6Knwv3
	20D1nQ/Z/YnTOFwuLd5Vu2zK4ir6fBauVTnM4vFU2r+7owqCUtFORZTJcvK0BhPLeqOupWWr+OQ
	GGg3bsHt7DeLxmuhziWXwx8yancSIKd03RUVmiPYfUkTLEqrpDGPREeMzkuULz/gJ0fNB5SrQo9
	uvB00xkWi3ATfxZu35+xEbxok1aqwGNvpUVr3GkExP2WuhBjH5l3GmjtT45gPdKcwgloNObW4Aa
	zYXJQ/9bkZL079pnPTSduUL7W/F1VyySilO3vqcY0oAH5U77qjpBQv5A=
X-Google-Smtp-Source: AGHT+IEbNBCz+Obb7/4BqiFSlSsk7N0eceVua9GspqxgI0DMo8lX9iBvVa1jr081E7Z1bFzm+ZtYPQ==
X-Received: by 2002:a17:906:c153:b0:b46:35c3:83fd with SMTP id a640c23a62f3a-b50aae96556mr1918069566b.29.1760361448402;
        Mon, 13 Oct 2025 06:17:28 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d952a273sm948768366b.83.2025.10.13.06.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:17:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-bitarray: Upgrade 3.7.1 -> 3.7.2
Date: Mon, 13 Oct 2025 16:17:22 +0300
Message-ID: <20251013131725.2583786-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 13:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120528

Upgrade to release 3.7.2:

- enable `util.random_k()` for all supported Python versions,
  previously this functions required Python 3.9 or higher
- add official Python 3.14 support
- update cibuildwheel to 3.2.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_3.7.1.bb => python3-bitarray_3.7.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.7.1.bb => python3-bitarray_3.7.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.7.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.7.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.7.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.7.2.bb
index a197414962..0ded3c3bd2 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.7.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "795b1760418ab750826420ae24f06f392c08e21dc234f0a369a69cc00444f8ec"
+SRC_URI[sha256sum] = "27a59bb7c64c0d094057a3536e15fdd693f8520771ee75d9344b82d0a5ade2d0"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.47.3


