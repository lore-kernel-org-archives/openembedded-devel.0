Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9.1794324458928814425
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tNkD2opA;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so23215525e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324457; x=1794929257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TX+A6mXT+t3pmXPg/zUiDdLamwOaJ62I/9VOK8enSWM=;
        b=tNkD2opAogl0yowm+9FisMNzsYudVU2jEd9kqD3s754YCw3E3p0btBYiPdDyrNEecw
         iVEnskt6AcLyBCUSaJrk4+PMVOj4jsfbKyGd8dW8pnKU8+r2B1u3nvvC3UBsNPghvGZq
         +VMd4vBZPobUIuamtkGJ1NdpJ6PYBR9ENxe+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324457; x=1794929257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TX+A6mXT+t3pmXPg/zUiDdLamwOaJ62I/9VOK8enSWM=;
        b=vSg8JdjKjMmnOYOhHMUScai8TCXVaH9P/FCZKWXOyOnH/lLvXuOYbVhuQWj9t2Bptm
         2O+iHth0KFn3autDrs9lS0CJ11xS894Hlig9mZRNx4DQIS8dgyXp+m7ALwfvMw++N41r
         lsxCqKQBk3acRffGt5Ku3nnKYPs9URiBQqbsnj+pFqawhybT849F5TO1/i4j/0PND9pU
         39vxnUPZUJ99vu8OLfoGTAVkzzeQQsbhbpXmVneGx4KLZGqKvFsux3b3fp3q0At2oA82
         muZUYiYjzORRnXlAIC++tJ41BSrywNqzyOYnMAZ9/RIS9glhssmjaHiJxqXeiHRQvEKr
         jUVg==
X-Gm-Message-State: APuU4Z+Ppzx/6S7U9ik2xdioSQRoeybMnAF4NezIPPHJQa1D7jfnSSFk
	9aPTNf/GbuYMRbJHr+3qwMQ44E/rhHmfZb/PtQMwO73nVHDi7ia8DSvmq8Bu8m8rY46X3UZ/swX
	1Chl6
X-Gm-Gg: AYBFou0Ak0WR2c9neI+5PiGteVKXVIgbaZINE0KDKCpDMyWAZ7nBTFc8CPlvualfP7P
	fI55jGNvdpizG+g8SmGKhdNz5e0Geg3hS32ZIv8sQbeog5LQxMn6rzp9DcJ6gpTzjfmRK8nID1m
	UNyAhD5Eyu0wcWNos/jxoHk8LPSGdvi0cFZG1IftmPClRp9ZY/OcDsYSamIUb/ZpA7U7YtKhCf/
	kQwbSd8ETgSWr0EULH3bH5yuZ5yf9LQbzernW9qrpgE1haTruLFeiv6S6ngadQkUeXq1/jMPz8e
	YQ9ZxrYOGwLGAD7EWADyBWWZrSooYLiahIKvPHrVboHeO9NFyXyPPnIaUM+NBxm0U1exl7TwAwO
	l1CXYNpDGkkDttzekSqID6Wwqirxk9jIoJS7Hq+Ue+skVasOBNv361nlUKPldHi9Ilc8f3CWUK2
	mPVIXTlPb/4KGJMV/B/CiJNzSBYzVqQyoE1FyIVJFQ5gS/9LDXs9HVL97HqXPHlFmbE3Vep3G0L
	+MzDM4plYRFHhZEEQYQZmUmPo8YCGyXe8Rz3/VahXpnTNo2cQohQVaeeGPijx45vDr4gHxmtCE/
	UCofc1N5GHAp/BdjoFkZtg0AOz/DurEdKB5jPGN+7kHLxg9/d0El79n3zFheQbl7i5SZ2vYVkoV
	OnBk431y3kMgZgB9AzNg255Y9L+6cKTUYOCObbkQx4wgH0wcPLAl1Wg==
X-Received: by 2002:a05:600c:4f86:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ba02340fefmr53207695e9.13.1794324456915;
        Tue, 10 Nov 2026 07:27:36 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:36 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/19] python3-jsonpatch: Upgrade 1.42 -> 1.44
Date: Tue, 10 Nov 2026 17:27:16 +0200
Message-ID: <20261110152729.1065911-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132080
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.44:

- Return concrete types in type stubs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.42.bb => python3-jsonpatch_1.44.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.42.bb => python3-jsonpatch_1.44.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.42.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.44.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.42.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.44.bb
index 486516dbc6..91991086ac 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.42.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.44.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8d553ab33cc1e5d3da60b8be5224355fb28cde863cc8935c40f011a8c0d72ad4"
+SRC_URI[sha256sum] = "88fc1d9728168b4a9be27bb00de469dfb3cd28e8e5b568b24efb2ac583cba7b9"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3

