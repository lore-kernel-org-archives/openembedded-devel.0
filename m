Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975A2C61D85
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 03:51:44 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.84251.1700711498582402146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 19:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hHHURqDe;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-58a42c3cbb8so258564eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 19:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700711497; x=1701316297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4WG3q0yaUj3I8ylqRktYowVCfnmUFmqwG5QWNkzloY=;
        b=hHHURqDephqlyCj9QUDiMydgGr6ZQs6OuvZe6SlPJiIcvpv3833pBUb+WTrwjEFTZQ
         TWrCzibzLBNXZAFlquaEEe3n6kbqe8eP8SqhGKg3rCeKEExDhyPpTnazv+HD5/eQWvET
         qIYQOAd4co0de7ET1mKtQLTKL0/4++FFnqedmht+K5BZ+jTTeO7B1lnwk3vJ66+S0dUb
         4ytF6pX8VjUHAzXOJ95CM6fKPcALhR7M6TSFlgzmN2/DWQ5uN2Ab3b9bhFAkFTthQ8wO
         +gnZzddpotU+XHj+3seP7ckenqp87hhGbxnCa6b2ZQz5LRFSbyEuMQlhNZkI4ZUJRp94
         7rKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700711497; x=1701316297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4WG3q0yaUj3I8ylqRktYowVCfnmUFmqwG5QWNkzloY=;
        b=fYIg2es1teBEsW+vw3brOw9F/bG3Hs4lsOsv2hFndiRR6QszcdZdzovFcUSTXv0gWW
         /2t+KxvAm6KHHUBVRY5t2RLi/xQGc7iTIfV8u+Yq4j64F31AgOCstYatvA9KGZpNUOh0
         hwysqVS4dojGg22am4mVe8D4ERmTFBT9BdLR58TANDohhCGSoWrPyvDCi+l/MaIP6UFf
         7lWFiEkWm/hWu0VQi6RreKxXSQ90v4hWSzPmzks/azbufwRJJqC/Alzi1DXGgOKmvE21
         DTVRAncAYVenjZG3B2is94HkJZx07oKsulrjg6o+AI50wpKu49ulDhv+4R9VJ33/+U6O
         CmVg==
X-Gm-Message-State: AOJu0YwSePR2+Y+mIyhzS1O9Z3hivUQkKPNliXqhPQhgoAv9xjWZQbpW
	A8WJ6BHie7LAl1x8Pg5QKe8WGcn4LmplYg==
X-Google-Smtp-Source: AGHT+IHbg1Ojj/Z9v8QT357RJuX+GD7npVVdPID4M7l3xYrShQ3pVS1OyJh8dBZKNhV0rQGKl4E+PA==
X-Received: by 2002:a05:6358:99a8:b0:169:845b:3420 with SMTP id j40-20020a05635899a800b00169845b3420mr4537590rwb.25.1700711497406;
        Wed, 22 Nov 2023 19:51:37 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0::b328])
        by smtp.gmail.com with ESMTPSA id q4-20020a631f44000000b005acd5d7e11bsm286005pgm.35.2023.11.22.19.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 19:51:37 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-java][PATCH] commons-collections3: update SRC_URI
Date: Wed, 22 Nov 2023 19:51:04 -0800
Message-Id: <20231123035103.914301-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 03:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107018

Older tarballs have been moved to archive:
https://archive.apache.org/dist/commons/collections/source/

Also drop obsolete SRC_URI[md5sum]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-core/jakarta-commons/commons-collections3_3.2.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-core/jakarta-commons/commons-collections3_3.2.2.bb b/recipes-core/jakarta-commons/commons-collections3_3.2.2.bb
index 0a53d09..135b995 100644
--- a/recipes-core/jakarta-commons/commons-collections3_3.2.2.bb
+++ b/recipes-core/jakarta-commons/commons-collections3_3.2.2.bb
@@ -5,10 +5,9 @@ PR = "${INC_PR}.1"
 
 DESCRIPTION = "A set of abstract data type interfaces and implementations that offer a wealth of useful functionality and a solid foundation for extending that functionality"
 
-SRC_URI = "http://www.apache.org/dist/commons/collections/source/commons-collections-${PV}-src.tar.gz"
+SRC_URI = "https://archive.apache.org/dist/commons/collections/source/commons-collections-${PV}-src.tar.gz
 
 S = "${WORKDIR}/commons-collections-${PV}-src"
 
 
-SRC_URI[md5sum] = "776b51a51312c1854ad8f6d344a47cda"
 SRC_URI[sha256sum] = "070d94fe77969d8949bd129a618e6a7bee6b83b5b5db3ef3f983395a5428b914"
-- 
2.34.1


