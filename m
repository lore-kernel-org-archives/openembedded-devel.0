Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C48D35E5D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.30988.1730840473671505019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e2EELGGE;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e29327636f3so5180793276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840473; x=1731445273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mq8/f91HEppf0CxOLCij5d7IdnBIVtWFA3t/nQrmxIs=;
        b=e2EELGGELeVRhaaY/zEhf2A7eK43VmB/MbTEtzT1bn3yMA0Rg2bhwS7zaj/RmkPNCn
         WRumotcJOIYyFQcJtUHFThih47bwEbFzVdtlv7q4wz0zPBHT6qDyQZrX1UPBS0IxhKXO
         Oa7xvS5XrBfMIuU2S9NSH2YjsEtKB2JLLuS5xGg8O27iBsxl3T91x1j3pK6zDhRa538h
         tQRr+iZKD4eu0uqP4VTyY0gXgZzFVe8dXXv+FWwrJwN0o4qQxGKf94GM4dnEZQ5SDopx
         Lm72Id/+g7nnWg/A8Dnx2ChtxTbO4gK4doJ2nba8WrEqTrQasozRh9w7XE2asJjscCJ4
         sjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840473; x=1731445273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mq8/f91HEppf0CxOLCij5d7IdnBIVtWFA3t/nQrmxIs=;
        b=toiIWJsiW+gfkfMSDfTnzPJ5wWwUfVvGc3Z9lOkVgFfFxWlK6OFQl0fZg0z3bJw27q
         8U/8fBB4ZR6bDHshgqfLtO2ftgFc4tgBc+Smckq9kBzDrEXIdCv3aCgCWDNKeJPRBPD2
         jGcQtxMCHiLjnUo6GxZcd3ZbMNjcDomnVXKKVWRgLwSqMfAosxb2qr+QEeC52jSyr7GP
         VQ9hGCzOpOyPuawGzg+qhYj/zgeul6eabzIl5zEyXJWELkIiPAXU5SM4T/AbEnusZ536
         wVZJUefePYBb2Ii9jyKWnfNe0ng4iQ4SUWmwcn1lYMr+oEg0H8mZ4emY4duSAqd+3Noi
         JmVA==
X-Gm-Message-State: AOJu0YybMfZyg+k5c2sg/Rr5G4zbNFF2H7mnnPWtRComnbfoPKycl3Fk
	3QmayFakbcouyMHJGNigJ+v3YRQQYxVhIlkXLhW+7GQFwFQzf4j5JYVX7i6X
X-Google-Smtp-Source: AGHT+IH5tyOaLdVbBAB3fmxQqwqYzW6bgNqybcIg+kIlguepX/AXjPTyS2Z1TEBnkwwFRN7okhFYDA==
X-Received: by 2002:a05:690c:6c93:b0:6e3:153a:ff62 with SMTP id 00721157ae682-6ea64b36578mr195429957b3.23.1730840472240;
        Tue, 05 Nov 2024 13:01:12 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.13.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 13:01:11 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 155/161] tokyocabinet: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:47:01 -0500
Message-ID: <20241105204707.4155-155-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113671

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index ae00ff4e5..75f68ab5f 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -20,7 +20,6 @@ SRC_URI = "http://fallabs.com/tokyocabinet/${BP}.tar.gz \
            file://0001-configure-Fix-check-functions-for-AC_CHECK_LIB-test.patch \
 "
 
-SRC_URI[md5sum] = "fd03df6965f8f56dd5b8518ca43b4f5e"
 SRC_URI[sha256sum] = "a003f47c39a91e22d76bc4fe68b9b3de0f38851b160bbb1ca07a4f6441de1f90"
 
 DEPENDS = "bzip2 zlib"
-- 
2.43.0


