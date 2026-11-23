Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53675.1795440983841235652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oDvOwUFv;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a9be758734so1987633f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795440982; x=1796045782; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jBlHiJ6O1GdGmW1i/cB9eCB8QPrG7KxPbcsrCXj3Vtk=;
        b=oDvOwUFvJIvniWo62yvJOmgXtThTDNn1PwhPdCyO+LHjbk+RXJDMz9G2vqYw4Z3Fgq
         U/cR+trmnDQnr1doHXIGwlltqIfHKkG7kcoKFN1a8khBq83qRX3ugtMjzumoUY9IoxJ0
         BSn1MpmXpi2jCqKCv/sw+phJeC6LcOaLOMllE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440982; x=1796045782;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBlHiJ6O1GdGmW1i/cB9eCB8QPrG7KxPbcsrCXj3Vtk=;
        b=vYA6m5aw+FqdwAy31OGgTqeob5Yozqs9LL5ZaizKIrls/i+giroKm4G63y7BFQcYUv
         lijTzaFs0NarbwsuKCRh6uzxoTpy4i652rLZAGwmZ+pCzqQHvkGXU5QXc9XW/lFdpeV6
         BE4hal+ArIlgsXkKlswPtIHrNf8CQAWcvL43de7t38Ul0GP6anqle9Gb7Ur7cWnfO5Ff
         SSkt/gi4Q0n1GUxz/7kNyFkK5ftXKgoXKz1vEDcxcuQSk7GPPGNzaE/h7Excz0B6ZWO9
         ROeGmaBKI2Z+tP4q3kjN2EtLMfMGWbxujouoMfoNdXgn/Q2envTi9ul40yTG3MTuJfF3
         CVug==
X-Gm-Message-State: APuU4Z+Md5YhCA3lifdmoM06b+5UsaIoiniQ4OojPMmQj1qawSWflFtD
	whVxjVDqIpuv9oBL8GH9fLutDrZDZ2JeDGOsrXyMSWoxtvALOz4QcFSwwkXRljqb7JVlF9O5Y1z
	dyloT
X-Gm-Gg: AZFdTZcPhfGxl6f/9KAkmAJLNajDnBrXpWJN0ckPb1FSs3OglC+/5nQAJDZKTI9/YNb
	Y/f2vj7kgE5GTH/i7J/PPWw0JBYZQ1tbncp7byfUxzBmCoRw01gT747GNzifcR5YgOWXUSl0BUP
	N7pXJdAIaFc6/L5Pxo/IYfbtatjR+PgLY3XRSl7kBAFrbXrpDeNZAnJmL6/eWO08Y2AjBM8OHw6
	MOxB691/zrf98aJdQrgzP2wblOs6DIOZ0phg8HGYpqs1IFuPMyhqkp91nAn20Qk6m06PBcsCSW9
	3Mb4YDhgfSi7FPbue6CpZodEDT4IyKlX3NAc61/W+sSwu9FegDtw00If/pyk2Ue78Cdaj5EpbMz
	ZeRhqDken4QG1A6fEXTg8f6uF3svpf4E2/TJesqp8lLQkWZocZIsoyTeNzZBnv8QhkFiBSjOAAN
	w1VFT7frvpHu/ReO4xyZJ/qbPRJmsGiDWbqbTA0wYY1KED+c1wCuQK8qFXuFaXvr67ntz/VG8DX
	X6BXq/SBzEhkBvm1esTcWBPhPSrtdcxwmDvn4/b8PNrN71cajw5TeFwLd9Ak6gtfT6rD7FxGSip
	nF1MtBLm3+2odHy/uVM6LGk6btQqxRhyUfXc7U4EZ8NR9PWVhEDkMy00SuMRPdVwEBp3ke5FJFK
	PGOZIQko90kO0C732gueHYdsECBHAW4X6maHQ6l+BvTG021vrevlSvw==
X-Received: by 2002:a05:6000:470c:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-4abb04b0a94mr21113273f8f.23.1795440981952;
        Mon, 23 Nov 2026 05:36:21 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm25192365f8f.24.2026.11.23.05.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:36:21 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-ipython: Upgrade 9.18.1 -> 9.19.1
Date: Mon, 23 Nov 2026 15:36:14 +0200
Message-ID: <20261123133617.3614096-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123133617.3614096-1-leon.anavi@konsulko.com>
References: <20261123133617.3614096-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 13:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132891
Content-Type: text/plain; charset="utf-8"

Upgrade to release 9.19.1:

- release_helper: set versions automatically, show expanded commands￼
- release_helper: enforce X.Y.Z tags, skip docs and manual upload
  by default

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_9.18.1.bb => python3-ipython_9.19.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.18.1.bb => python3-ipython_9.19.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.18.1.bb b/meta-python/recipes-devtools/python/python3-ipython_9.19.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.18.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.19.1.bb
index 51f00db142..ba24b7c5d4 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.19.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=954609b5a3603364bc25989a92e38d67"
 
-SRC_URI[sha256sum] = "6319c0f5372c196397899479e6db1783dd7937abae06815d1317e8d5d51aaaaf"
+SRC_URI[sha256sum] = "8d717edbe293adcb1b9fdeaad7ccfb1573f62d91bc10f0ae62604dbf31e6acac"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.47.3

