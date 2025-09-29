Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29840CCA46F
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:56 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.53218.1759151088665288956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/WHSrk8;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62fbfeb097eso6648450a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151087; x=1759755887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezD1g7Hx64APOj2E7IZtDjiqU1PPR+A+wiTBZx6d+3Y=;
        b=P/WHSrk8kejQgDehXUbQ3O9XHdX4e7TaT3IQsxEdHb39vnYLJvaHl7dVLKMagpbtvW
         UQHJjebhw8FgySGE7wTM1FAaDmv3m4VIibMJrONA513smFCMyA0c2CUJF0KOvWfeS/yo
         6RG6f63nqY2RM1cpK6c2gpPxQDPEEG5Si+KrtrpD7Ts2Dk6YcWiNoambS+c596ixrVFP
         UeCDgAJyv2vv3BoCVFzaPdjaGxrnp0PROlNott0K0MbOjGQsL0byz7JOAoptrXHR3m8X
         yfa2+P26EtDrtt4n+/36kgf8Xx2zNLNnWaYb0a2Na47ab8U2Mw6eRZz0St1d69ne0mU1
         MRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151087; x=1759755887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezD1g7Hx64APOj2E7IZtDjiqU1PPR+A+wiTBZx6d+3Y=;
        b=Cacki4GV3/1k+RIo4bIHnWchfUmlfm7jWvEvgECbS6WL27rDAE6ZwQwP+zDfJY3UMp
         5GZkL7Zrs+CZ5t1ZHEeqj/5PwSosXn3Q596xXJ29EdZnuNv0HLqOyoeVrnA8VBBTtPP4
         Zb6BVXZilm2KuznjuQvjpy4e4JWaTBBj++XB+M4vKa/N9g+Jqm6RY4XmqwwQ1DEVxkjO
         25WwkLq5P4K33hPHYnGiviCnCBDm8sbSJACduokH/7pmmi8myUtRPamdfbsUR2Sc1oYO
         ImIoGb9Q7feWAOtSh7fX5tpWQPYYztyn4JLlCIf64TAAQQixy2Qc2aicsm6gsJ4SFRDW
         r0ig==
X-Gm-Message-State: AOJu0YwzucEEueipW04qQtEv8vd+wqk0wg6cP8SQn4ZYe9xUgu631qGv
	aHYr6et8FpozHSER4G7KqZGH5z3yTAVOOC1A1WXzdowgcJVYqPMrOq44C7qfHg==
X-Gm-Gg: ASbGncv48owKdmysv22Oz80dGQfgZpkR75fFTsv/UphhurBSEO3H0//Ah15fLWcvk6O
	K8btT2YgZ+q3bEHX2MGy0wan/TAl8Ut7lSTkqrYB4K3ct95dTovS7z4b8hy49Wt29tq0SeLQwFN
	HcovBjm7yiPDTM5AwcK/R0Asc5Pg+KEn7cV3I5EN8SxE0zNThgA8Y1hkC6DbdW9TbhLHEVnutoF
	7fn8KhDqdbpvJnuCVifc6CPyEQBElt20fnsS7ZdIUzxtSsVf66W/+LajXDLMDnwF++JaECcioft
	dPA8zscDfR2cqygXTUcRHOcexaLVmdERny+Ys7zlpvkJgzzp8P0Ww15ZkX/O39q3xOwdcdcO91w
	lHzcgA/T3ZmCtNP2MzhkG/jYdu7V/BTwpGKx4CKVC1w==
X-Google-Smtp-Source: AGHT+IGxyK/fzohWNXDEZtbGfL40aTbNpfzTQDO7DYiV9K8hpeZi7JS15KcouoniweHLRoRtrhcU7Q==
X-Received: by 2002:a17:906:6a14:b0:b32:2b60:ee7 with SMTP id a640c23a62f3a-b34b77d9ed9mr1755251166b.24.1759151086926;
        Mon, 29 Sep 2025 06:04:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 22/22] paho-mqtt-c: upgrade 1.3.12 -> 1.3.13
Date: Mon, 29 Sep 2025 15:04:25 +0200
Message-ID: <20250929130425.2912077-23-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120035

From: Matthias Klein <matthias@extraklein.de>

Service release.
Issues resolved:
https://github.com/eclipse/paho.mqtt.c/milestone/20?closed=1

Signed-off-by: Matthias Klein <matthias@extraklein.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f70554e435b31490cbec4c660363a3dea72db92)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{paho-mqtt-c_1.3.12.bb => paho-mqtt-c_1.3.13.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.12.bb => paho-mqtt-c_1.3.13.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.13.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.13.bb
index 6578bcfeb7..4f142798d5 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.13.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master"
 
-SRCREV = "4157a27d39f1dd5b95750ecb6acd1481432785d8"
+SRCREV = "07a875788d8cc6f5833b12581d6e3e349b34d719"
 
 DEPENDS = "openssl"
 

