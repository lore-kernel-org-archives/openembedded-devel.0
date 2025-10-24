Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F28CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 02:40:06 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.909.1761273600389091962
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 19:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X8dy36Y9;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-783fa3aa35cso18650217b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 19:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761273599; x=1761878399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sSroNjzczdJ7JKd8emw4yCSqB4QuWCfBwZ2+aehtuv8=;
        b=X8dy36Y9LulCjCAebUAQa4+b2HVRgGAa8wmmpguK3dL1xRsrmVgcXa2HwFyYG0JTJ0
         HvsVI80KxGR2SCwOYC1T2Ap5bM2RrlId/J3Pa7m/SE/eUzTIMyFkyUK1+mE1M0TsHnMO
         kKe0yxd8B7QRWBd1oB1wvSzeFXfjwnd+IFRZz9RiJn5AykcQ21vDFsJ+dCXYNCNHOYl/
         9ehalQybCSMQ9yRg2pmaN1vxXFnr0rJRqwr9ofrsuEBr9YEiGOLiPUxyFd2qa5Pu++b8
         vIUOUoJ+KmB4oBQKGDc3RpIpK3pPeafWtDuL16Z3yOy0PYO0efGYuSinlYcbNOKJXl1l
         cK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761273599; x=1761878399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSroNjzczdJ7JKd8emw4yCSqB4QuWCfBwZ2+aehtuv8=;
        b=pCJH/cKO0Ao1DQySsIuNSNl+Jubrvsn8WU+SFBQmQ7AQAn3HuHKs7h0RNGotYnH2lk
         uR9AVLbJG6R3Mql7RAIgs8e0wyeKYxm6eFVBzJrUFukiobkg7g6LDMq4LeA/Mq1I4C9V
         lAHWYMLGISftzvjf0U3HpOBsRsuShonZMmaX9WmEU3ebuR4v0agHBsjLkeELdDJuUHMc
         3qp0Qys31rD8vUExtqwD8RmdxXchNYMZ40YeJjJsQApWf9IMdkNpxgqBIMMVF5+9rg6F
         VLn+hmdpfm6bDZP7NylCRYqZ0sLtYJklSKcRkKZ4N4+KUw9IBQrPES+42BQjIVk2geKJ
         ztew==
X-Gm-Message-State: AOJu0Yy+UarmfTacUd0vchtqEQCTz33xXXt7JvThJOt79lOyJ00ucHl/
	WZuGo/k9a8uJeHv73goSHfOMiYwh7MUZZTlKq/lHMRHReXV+pZ4RDxPqgFG4Q7mw
X-Gm-Gg: ASbGncuojB2gBPHnCTuf2F5XINa8/FZHWkrhgJBWOiM2phOc8mQPZBl5PoS6L6MVeHn
	X3NckM2weJYRy3fTuXttk6mxTIxNW0kXW9vve2wc6/yYt3jc0eUDzXyWaSlf1qk7rszd8uJtpK3
	kilaIfHZ4uifQN1py59Wtbpe/vMGfl14FlqlY4aHMOd+/xugI3DQu1B9kV/8kTuRXorr+gqEudd
	XYhi29SKw7LBOAIuQ8jc5UoxM15+7fm3nS4PRMfLBPvU5Q16thAsvUPOv7CpXK++jcVYwFqwF+l
	db1IY+V0zaXpkZVfvkiyrwJhwpUEQejp00lCGD1GNFNukKrLkFUzuh5aZac0kYREegCy4FVk3lZ
	YJekfgzKzO+8AKMw7J0P/m8wV15KfWzpKEQgj9WMTC2uY2eFkN7RLCd8KNRYs9zSWSZqSgoxLT1
	UO6rDo0U3/ADA33lI6UJyv+XYkD/rims0=
X-Google-Smtp-Source: AGHT+IGznZKuGY2MTOTU6LvkEgKJp2v4/ccugsu1cBWGLoDpF+ihpgSqWmfrVCz/IiiyFOmPFNSmhQ==
X-Received: by 2002:a05:690c:905:b0:784:883c:a868 with SMTP id 00721157ae682-785cda7e3admr45152677b3.30.1761273599087;
        Thu, 23 Oct 2025 19:39:59 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-785cd70a1c9sm10328377b3.61.2025.10.23.19.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 19:39:58 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.4.13 -> 8.4.14
Date: Thu, 23 Oct 2025 22:39:27 -0400
Message-ID: <20251024023927.259213-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 02:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120942

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.4.14

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.13.bb => php_8.4.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.13.bb => php_8.4.14.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.13.bb b/meta-oe/recipes-devtools/php/php_8.4.14.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.13.bb
rename to meta-oe/recipes-devtools/php/php_8.4.14.bb
index 527d825189..483ba19ddd 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.13.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.14.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "85181ddca7b3e03f148521b043bd62411950d468c667db6400479f1b10812194"
+SRC_URI[sha256sum] = "f2139ce4cb7a6c5643ee98caa34e5c32ba841c2ba293e34a3d0357faa84bb3e7"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


