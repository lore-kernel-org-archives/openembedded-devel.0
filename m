Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D307CCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 12:35:35 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.4658.1761395728955429225
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 05:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dMVF4zU8;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7849c889ac8so61346657b3.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761395728; x=1762000528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pf4g3Hn0hsXAF6YNgNQVOpp0bsTogjg6lTJ9CJU+G2c=;
        b=dMVF4zU880oiolvdoODQVev8MWN53jXYmsP2z3m6R6OROVqI9GIcWwno0FRRrzNtMH
         dSHyQoOc3wceFhEFvAnad6G7FOUc0hQSx4aKdRKNlkWzBGMF0t/NCrEsyyzpCnslJ+ii
         k25FBp0ohCCvhEnlJ3eJV3TbjdjmlerZTeI+DCPbu/e4ipgIITnhHHgczS+ULt0lgzoR
         P02mwIB8G69aytpVFagZUUsNaEw6nrcja1omU68+MkHzl4naPDsAcGu48l1SqSF28cnk
         Y61YpyUzWebiLcEvURZejFSSBQ7nTVbQkHBN5VhuA33RWPRJnGjCa/1fWjPkMMq33MKo
         69UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761395728; x=1762000528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pf4g3Hn0hsXAF6YNgNQVOpp0bsTogjg6lTJ9CJU+G2c=;
        b=ACl+dpY0+iP+yOTu6BgJzdysYhs6cbNHcrz3sY/a/xHmr6I2GB0/ml9lpg8mfM8NPB
         byCbqzlcdDC6bqLyN/m+TyavjW+7SyEkj6r65ejczcU8w4LVMJT5NlS1jIZgULoUivdf
         zPIEoFOV8NycHdBUq5QBpdgWnkedZD6XtsUiE8mAMtxJxVTPLE55dQizek815Gy+g2fL
         a+6MqYgXHIlTKTYV2gUeRauR/xrYO/6gRR1qQE+/OtUsMf8zHHyKwQyBIDgqft2WbXul
         U+GJSfzQha1hFES//IU5lWC+IRtTGNkjYxrbHc3M1N44GCfFC1gs2TpGa1I0tA/zhQ+K
         5s9g==
X-Gm-Message-State: AOJu0YyJHiAI2FKHxQ3mzzrC/b9wkms9XLLQZ45e+gHzLClp86jORi3/
	60Bw5AjyErCt5SAKQ6YgIA3RZOhOUxYl6YnDMznCYmdQ7Fd/5GAQgb6wMteszE7x
X-Gm-Gg: ASbGncs/HVD+g4GqwtWiWKX/z9TZCaZF9dVocjkkmsGqn9Oxbbe3dZx9YzNCEcr708A
	88pc00WZsMb6OSDABL4WPI//FCQG/Xku06blPT/nFeS+peefEe1Ik0NPBzG/U1lb/h5Q7gZgAxQ
	G+t1r/12a6ApevoWHSeDRLQtuKzSt2AzmeSTPH+HPO6sm7lZ3evE5p6MAwsVeIeyvFegGpT4U0I
	791+QAkPmc1tFA3IU1hJitCHD9puA9tOC5E2UFBABldLsC30uHFvXS9yP8yFJ0rAaY1JgbRiRze
	G9He6A/bf5TULC41quPj+rWn/AO6nkF+1TeOYgexykyEEDzPyQlT8gLyDZ3U0WkfsmdBG9FnWCV
	Wyv3+IUNBpHgfCCTPcyip2dkZziPWfzx7cE5xZWnxW0XiaIHHVae9P/rZSRJI6xDZdTi+mXxJDx
	sTw2/ls5bbuwE1ArQ/KR8t/9BQ9SM+8lb/KY56270qq73RNRjubkUl
X-Google-Smtp-Source: AGHT+IHl/HCOtC3vh1RH8kPJNyuJ7wNltNqb2ZsZrqeP+O36NbEpED1WHD3H1hTDmi3viKTQZbO0Nw==
X-Received: by 2002:a05:690e:d04:b0:63e:9e2:7c7c with SMTP id 956f58d0204a3-63f42b2e48amr3996887d50.7.1761395727460;
        Sat, 25 Oct 2025 05:35:27 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-785ed1ebdefsm4937277b3.56.2025.10.25.05.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 05:35:27 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH 1/2] xdebug: upgrade 3.4.5 -> 3.4.6
Date: Sat, 25 Oct 2025 08:35:12 -0400
Message-ID: <20251025123513.154475-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 12:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120999

[2025-10-06] — Xdebug 3.4.6
    Fixed bugs
    Fixed bug #2328: Stream resource references in stored stack traces don't hold, and can cause crashes
    Fixed bug #2360: Debugging DateInterval (and other internal objects) causes a crash

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_3.4.5.bb => xdebug_3.4.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.4.5.bb => xdebug_3.4.6.bb} (91%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.4.5.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
similarity index 91%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.4.5.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
index fdde88e44f..5314074fbf 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.4.5.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
@@ -6,7 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "f58442306ce55fe3b811c31759a247242989164f2a7933f05c8d59b06665b9c9"
+SRC_URI[sha256sum] = "4cd6a2523d9c1576c818eb4d15fe0c1650a25dde4d31d1d20a616e9d9435cc20"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-- 
2.43.0


