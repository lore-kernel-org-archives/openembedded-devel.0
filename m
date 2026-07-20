Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4A1C44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:38:41 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11275.1784590718648146174
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AHQs6yuT;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so2816861a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590718; x=1785195518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfyRQcTTbRV+F+5Luj4joZ7TqMVmfSXr1UjDtGlJdu4=;
        b=AHQs6yuTCCjqTk+6+xMWhZPuy7pC+QL4qR8k2D4SQLly4URVU6CS+FWic6IcTeuPPb
         ILCQgysg2yEJ0AxvO0yUDL16aqcHf+wZiOxFtvnP4nfdOt8IxrRWR63HX30wWKDbxZfi
         942EO3aO0HDwp1KNmnBNXxTrrKSoWBuOLYlokv8H+FnQiBt6fMb2T6l1MfZDltkhfHNi
         hNktKgTWTPOXiVV23oF/8gUi1C58F7PQblRRsr870kV5KNhCSeMy6aqhn0hkEpvdqWTi
         JqFQN/n2SF6BUd+nB9N1VLfRim6UpFpPFlyLQCkAAOVw3ZggdzoENbrw7jjhx2DXn6x2
         +J5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590718; x=1785195518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfyRQcTTbRV+F+5Luj4joZ7TqMVmfSXr1UjDtGlJdu4=;
        b=AqLL1/+77tJCrRgjvBIVsB2xV6v94THg6YPUCCxt7KoqIpjYh6sw8og/Ga+CUlTEg9
         yRM1AcxFHQxwNBxe0oX1SzNH+LzRGqLLJ7Gm5xxlSJE1jpwCwJ1evtwPoB8VQgCDo+67
         mOuRr0sWkrmdCOck38hdSgnitiBqQyJowVfgNGPqYLV8oPkZ37jBGvZoZuyoct8zRmUy
         fqOtLiopStYPOOVFONseQKK9term6ZCNrqT8RqR0OzBeqnAupSpKk66yx1ltMdeGONg9
         KZxtX2OQYggwn6eQCgdkYAxDAyXwG0qUAxv5dLCJmPuVj7ruMsUJH2NYun4Ga6ohDhj0
         VbtA==
X-Gm-Message-State: AOJu0Yw1aKNO6Z6Nbdf6MHoa54+ipAHFPkFkK8REaxf+zxKm1dyO4e9z
	OAOvEaqqbOqg0RF53XpWKLDlthnHh7TVulxGWXmcGO271D9Ma0jiKHKcV0M4nQ==
X-Gm-Gg: AfdE7cn8xIDqol7esYVTjtUGrSOmBrXvQWtPIdvZ1vOBcFcSal2aB2Vw/DVKKUOKvwG
	dWiCtiOA4KFhUHnfedTku4jhfJr7lAqv7E2CoYMB3j+gJXNWcarsBaOQyemjGfO2KOwGTn+dsuF
	ue1uKFIjATK3UikWwRzsXwa8+P+2iOTezJS9E8NebUGkhcns/kiSQFhbO3PhxJgjjI6hzLsW7zd
	Pi7KAW4nnV4sLPx6rUFPUV4B5Me9LB5VwAUQ7aD7Na1wg3N5wekPEVIFIwQHEH7cfI77wmUdR3m
	Ld0jn7hc2WaGE4qOOeInRGUYK8Xz7JNuqMrkOiQi8xrfGB3R0v7cgcXI0g9XY7bPg15/rDJfnpV
	4aTK0WpJV3NKb42I3L9/+3PoR7OWAevE9yvtSSlqfPzCk8LWarI/CtZZ59v+ZC5LuVVKrABcWtI
	UvPb9zdGKh2HZ+ir86RdC9w/OO/Q==
X-Received: by 2002:a05:6a20:d043:b0:3b3:21f7:15e0 with SMTP id adf61e73a8af0-3c38dc6ac3emr21890125637.38.1784590717997;
        Mon, 20 Jul 2026 16:38:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 6/30] ldns: upgrade 1.9.0 -> 1.9.2
Date: Tue, 21 Jul 2026 11:37:47 +1200
Message-ID: <20260720233811.2324493-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128307

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix to set VERSION_INFO to create .so.3 instead of .so.11 which will
  be reserved for a future 1.10.0 release
* Bugfix: Insufficient verification that responses belong to a
  query (CVE-2026-10846). Thanks Pablo Ruiz from 'codecome.ai'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a5a18fe23f36178d7641ddc923419723e6ba2973)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/ldns/{ldns_1.9.0.bb => ldns_1.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ldns/{ldns_1.9.0.bb => ldns_1.9.2.bb} (89%)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb b/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
similarity index 89%
rename from meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb
rename to meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
index de75c73207..8b3b9bd9de 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 
 SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
-SRC_URI[sha256sum] = "abaeed2858fbea84a4eb9833e19e7d23380cc0f3d9b6548b962be42276ffdcb3"
+SRC_URI[sha256sum] = "b524fa21994b6e834200ceb8c27f1b84bda5982fe35706f058196c079db94d5d"
 
 DEPENDS = "openssl"
 

