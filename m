Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F12CC7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 18:53:23 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.2875.1750618399125560668
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 11:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gsLd/A03;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e5e6ab7b8so31851827b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 11:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750618398; x=1751223198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pzvx0c1dNiloUcj0DL+DU+TpT5J8Zr8u/GAf0d5A5gA=;
        b=gsLd/A03x3omI7e3AI7LgAIZ8k5etek6wCgb00fjouce8meKYSBJCGRYXHYNKnB6bk
         icUOZv/DU3aLcJJZ9n2xVFHDYrcQzJGKc1sQQUym4ZWIBdYVpgJ3SfyxMp6pdwBHyCnE
         AzaNNEDqsX7GrlvnSm/Hb8mjcjEauzEezQa6jmLEHbbcSd8uKSr24jFp11KhrgZ8u0GY
         +BwlyVFdQ0G40v6DndawdQYLjkfnEXdw1utiwNz3E2M6CoiaCr8QgtyPVYpTD9mcOJfx
         pC6XmI+eDx6f7aLwzdQpOyx9l0PpirM3Es0LlKS1k6WDijmw4oRNcOIxHnU+xhWIlv0b
         wFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750618398; x=1751223198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pzvx0c1dNiloUcj0DL+DU+TpT5J8Zr8u/GAf0d5A5gA=;
        b=D8bY3ZS0j1k2p6xj+UwNaUHKha8YhCKJQirZU28FKS5Flms4oq0xaveKD8sF6ExvTW
         2l48EsjjX9cn463alpgUvM1hERo5tac5/iwWGH2q9VmnvJs0Ok1ars9jvK3poVzrjZcK
         HB9hdfhtxw9oXTVQ8Krn7+Mji6wdJt4EtyAgEGCNjjtBh5xd11lzrWqeazpnIPdqqDqt
         jTTTqpfIXYqgB0TR3G90VdTbsvTJNMdzI/tuouNeO8LDxKrgIdYv6zyb1/7Ec13RY2Qu
         NA8W4hh7uDsSnG7+J6ndbReCaHBAksIjX938xcASE+Lzn3tzgnuK6nqhoMKnj1L9pqr+
         z4tA==
X-Gm-Message-State: AOJu0YxmaLoMn+X4RGfhrGCtuskaOUpnp0KcwklJIE/sJqOds7jfkVyY
	N2DAJzCl272pXcTz/6BxQxfoumqb4PYKjktW1iBcaDax0RuODZWxHCNenGXPnPPw
X-Gm-Gg: ASbGncukVUpGw7lDJiNLgIpOyMPSo4LzrTbN63OEe7VZdJWO6Z7lQlTgrFTfbp9eEdE
	1KZBgObFEVlNqkv/xxTeo80m7EXyqqYy9Y0EccidnzL3t3muvsnae4cEHClvKeuT0p8TaQOTc9s
	TPbuP3Fe0BW3nhbrls1K6sjWbaN4+3zAk9WmpdPt6HKZXqiDu63fTQ4y1UpXtJPgCWBV0nZ2qFa
	zvM86x7X6Y+QGys6q7Cwpbgq1PQA0ApCAr4q9JsYMG7bioeDRb7hp7X69mxoD89IycNSRmBcqL7
	reE7nPb6wx+8C3mtcEl0/SQCY+ZaKrcjt//1joy44Eyk5YIMKKQQsg0tZHws9IJyxzZvoDTemZi
	SuYizU25VSj/nPFcQBPl0
X-Google-Smtp-Source: AGHT+IEg6rrLolmFvlFPKZmduchxI3XDIMeynQx+lXppmBeqEZYtKy5Oz8VpjoPUFa0smfWKdYsBHA==
X-Received: by 2002:a05:690c:3341:b0:710:f025:4077 with SMTP id 00721157ae682-712c63b2533mr158181077b3.2.1750618397664;
        Sun, 22 Jun 2025 11:53:17 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4be2452sm12608717b3.89.2025.06.22.11.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 11:53:17 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.4.6 -> 8.4.8
Date: Sun, 22 Jun 2025 14:53:03 -0400
Message-ID: <20250622185303.354794-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 18:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118025

Changelog: https://www.php.net/ChangeLog-8.php#8.4.8

Changelog: https://www.php.net/ChangeLog-8.php#8.4.7

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.6.bb => php_8.4.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.6.bb => php_8.4.8.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.6.bb b/meta-oe/recipes-devtools/php/php_8.4.8.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.6.bb
rename to meta-oe/recipes-devtools/php/php_8.4.8.bb
index 5118ddd6ab..f38a407968 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.8.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A server-side, HTML-embedded scripting language"
-HOMEPAGE = "http://www.php.net"
+HOMEPAGE = "https://www.php.net"
 SECTION = "console/network"
 
 LICENSE = "PHP-3.0"
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "9cf2734509b603f6589617ab52a9712a03e0fe059951cddd2d4623df4bf7c6c6"
+SRC_URI[sha256sum] = "36569c64dd1499e570c436603b641eee7cde4af576af786597d0ee711b3a3a8a"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


