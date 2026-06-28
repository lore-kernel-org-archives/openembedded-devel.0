Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096CEC44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:55 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14721.1782634310293466104
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o9PkT0OB;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30c99ccb1afso2235903eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634310; x=1783239110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HMSCev1l/6vCF29zHksowb9yEhj+gKbCl2TmOBD5eM=;
        b=o9PkT0OB91BzbgXDiwDRnqQ31fqbJMauWKEFzrEf6X8cb/1x/i2toSjFs0xWgJPH1v
         qZdJgPVm3+9hHQZ3NVnnLk6CD8OPUqaT+WgswYvYRxzisWK60qLa2Ov0g3j/KA+/CSWr
         V+moMGMLtF1b7lZesqoUSSgn2d4oQP3fNUJykMQ/BYCU0arYhtmO+4yrG24GZVv2jW4K
         Hl54frwMYGLPibgioJRMGxwealx1MQpKcT4108diI6Trn7PzVQvkE7dKWYXa5MlIzfOG
         MCNrrvV9LnIki1DV7AeIu03c74PPQP1XW6e0Eh5h4aU2bgygqtJkkzMcJ5N0FG5P7bTX
         C4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634310; x=1783239110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6HMSCev1l/6vCF29zHksowb9yEhj+gKbCl2TmOBD5eM=;
        b=Z3AiTQ4McNT7avCrj6t7+8bJPJtCHFuw7XNpLF/Hcaof8RorkuoJ70+mJSwjDZ/Htp
         ALmG/+/56hMvddc2mURpmp0TXJLeyFImcCTr7F54RcPRpy2YSUiMDRi7K/ePy60xJPsD
         gsi/Z75aFOC9WZpbIgcWLwMYHvJNnS2b48B3ZzU3VdEv5ChcGV8DBuS8+wMuINslXwtE
         2wJr37MXKeqcV1rzn7tilABd1S/5ELpjHZEcdEppQzvvx3CWjS/D3jcenUvM50XScvAv
         2khw+HV2qhAug7hcRskDBHf0ARVxzqGUyeJEd5ASnbpflBDoX2WFYz9Zz9GiKbZ0m/Np
         hy4w==
X-Gm-Message-State: AOJu0YydMZ8dp0LzGxVlAdHrxHUQKU8gF9ek3X1lVhQilt0oRUmMZDy6
	QehiPKo0zBqducIJvOPavFx27lexuCkg/7F6uDvntpqo4hmuyDXsm2HYsgrt7aiPm/waFw==
X-Gm-Gg: AfdE7cm0HzNi2stOdTx0nGEm4SB3HTt86FCeV5qU2a+CVFzppvSayiikOSYzyZUSOuT
	geGBjSqMQttlrfywKCUNcaAT+K8ZCSnorQpNeVMsosQvF2+aUie0jjA6fPfTFUVhgPsD+7gBBbI
	Kkyac6PaQivH04G9Cvb6J6Id7lmyKL+Cflk16A07YDS34S0xJaUEz0t+eufI29I3ovWm73lgEXB
	xqM+pMsicYHiHtcHXEbkx855VR9f2gwnqKM72ZdDTS4uT5K+o094EsYVzZ/LS03mcih4MdkFQ7J
	g4EhNY1VffbN7zvWd5LxhEIlYkmoKDsn8r+w1XmRlSUHkejLSmEhd7PiLOQhjUVqNV0u8dNc4ew
	TS95sn0VM5PMY/xXehp8bwFKVdOYbG/ITkNqM6lkk41HeYcrr1oE27JgsXgFovy8P/o3ZJJqv0/
	oUoIufUK6ALystyJ/MVKFLpNc0nNTwMew2P8fi4KUWnumKLmLd7ecmEQ/UqYi7ezGeEHTa3MMoY
	3cFKqBJYN80v6TAQpQ5gjkuV9REiMUJAWiUPgopj3BM/bH3JJici/0FElU7FBshEMrKTo4YEyGD
	q7aEJ2I9/ZC1s659q7C7xTS2nfAKLw==
X-Received: by 2002:a05:7300:d08:b0:304:ccdd:594a with SMTP id 5a478bee46e88-30c84d12a7cmr13212435eec.5.1782634309637;
        Sun, 28 Jun 2026 01:11:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 026/128] drbd: upgrade 9.2.1 -> 9.3.2
Date: Sun, 28 Jun 2026 01:09:37 -0700
Message-ID: <20260628081122.178348-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127836

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/drbd/{drbd_9.2.1.bb => drbd_9.3.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/drbd/{drbd_9.2.1.bb => drbd_9.3.2.bb} (90%)

diff --git a/meta-networking/recipes-support/drbd/drbd_9.2.1.bb b/meta-networking/recipes-support/drbd/drbd_9.3.2.bb
similarity index 90%
rename from meta-networking/recipes-support/drbd/drbd_9.2.1.bb
rename to meta-networking/recipes-support/drbd/drbd_9.3.2.bb
index 48ce2abf09..dafda8ea04 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.2.1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.3.2.bb
@@ -11,7 +11,7 @@ DEPENDS = "virtual/kernel"
 SRC_URI = "https://pkg.linbit.com//downloads/drbd/9/${BP}.tar.gz \
            file://check_existence_of_modules_before_installing.patch \
            "
-SRC_URI[sha256sum] = "f59ee795188f21d4a62c5319c371ebad65ab3fb9b55e5212c3f1dd558978a843"
+SRC_URI[sha256sum] = "5ad57634d4b6c118e92080ab5b66e01969ebb251d9ca01562d23598bf3b166fe"
 
 inherit module
 

