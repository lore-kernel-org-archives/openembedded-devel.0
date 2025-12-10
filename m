Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7880D3C916
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:17:03 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16397.1765376218215893914
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iqW8uvRw;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-343ea89896eso6290704a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 06:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765376217; x=1765981017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s+O8MTA5D2Va7GHCmvu7Kr8IwDhvRSt+rrWrMLLvxw=;
        b=iqW8uvRw80urm47FiUxcZMdeZW3KDDfHvwqAYK+nd6xwyeO6nkqZlytek+PZwAQbN1
         MLZwLQdw/+n7cby37uLZirdWaPaYV6Vd7HOLpGOJO8UC7yXAjc2IRlG2vbt63r/MOjA4
         EL6WMGJdob8JYLLDJvz3PaHWj6dHXtCo2x8PBIFa+6ujVQ0OdWGqXVoi1WVrTk89Xt+i
         jwUC4UV/hjbdZ1Iiiwq+IE5hZFzmldFU8/4szU6Q9hIxywUwqOOBgSIP9CU3QfqgrB3h
         JDnOI6NZZdS1u2Ia7pS4DH2deH6QJ8URIaLSh0Esm/cCeYhNhAd3kHhByAfl8HNsSvnS
         odyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376217; x=1765981017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2s+O8MTA5D2Va7GHCmvu7Kr8IwDhvRSt+rrWrMLLvxw=;
        b=wsNIVL6ZheBnwFrmg4XnmSd/FBqROVBNE168LOQEgJ4l7LIwH8ysr9VJFg2vdgp+Ld
         Ol8kro9jyJmkS8FAJmMI0HwiY2q0b3ow23DlQRN9QBd5jhEBir0OScU+sC3/lNmBkz8N
         XDf9i7cHZXPKy1UDhSddLlzQ2N1GrwpR/VK1NcCLWD5KDcpNcElulbQ6bAMVPrvEuInW
         9NE+1uBRFhv7kl16TIlLAH+slJr3ecswMFo429Fe4+jkDY7QB2XQPbJpNbEoTXc3HMa8
         mromeicb4sdz0hSMG0QHt+MJdIvXsx4HrztIMKqVTSW55fPXqHTpf+cXiRh7GKT926Gk
         ID9Q==
X-Gm-Message-State: AOJu0Yz047nAdjlwJOw81mtnIqfOPH+yoburcXQ23kg0AsxEAiLVb8PR
	kbayDPi0rJ+/gvtsRcRF8kRXww3TLpP9LkAQk7f8G+C7TGQxvwO2+nqhN0WYxg==
X-Gm-Gg: AY/fxX4w9viPV1LvIbXluB735rnCnYuSmt8WKZz3ycccxwXKVGFfj6BJqg8on/OsHL/
	3V0okQnBiQ4RVE/Dlx0DZgY3XELE76fq94h7bGOwYdGqRhIxACnniJf5jeu2PqcBx/r3QDrpyYO
	llmqAWUbXTxhLZZbV4e4NjToTReWajU3XGO3bBT5I7D3p5h/68LsgiGK4fuda+ibz5VHQN4CFMo
	eekbYtmPQdvn4IulJOGLLL1Hx6p2wRlhVnE7E6uBbFuMieFYl3hVK737z57U0+LjfKTohGJ0gsa
	zdK7Pf51cg+R0GgD/SQE8soQeOXU+uEWvRTBCzKFeX9Z3oa0+jzcuhgzvgpFF3zumT+ROyNSq4i
	hUYO5HV3o50996BdgavsB3akRleLoYcr2tVyrRYfZ789Xnciq7YFazTuFMLZx4ghnwpXndbHpsG
	+aJvZxsKYZSfJyyje7Qqf+631D4F+9D1SV+g==
X-Google-Smtp-Source: AGHT+IFhSi5VtJxSsQdztkuTAvMZyphx9LSOX5BZVprcDtqARrSLrd4Yx/OcN6k64qrkW/EB3YTpaQ==
X-Received: by 2002:a17:90b:2808:b0:343:6611:f21 with SMTP id 98e67ed59e1d1-34a7285c257mr2339941a91.1.1765376217395;
        Wed, 10 Dec 2025 06:16:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bfa0ad20207sm15955166a12.11.2025.12.10.06.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:16:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 5/7] xdebug: upgrade 3.4.6 -> 3.4.7
Date: Wed, 10 Dec 2025 19:46:37 +0530
Message-ID: <20251210141639.1397030-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
References: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122553

From: Jason Schonberg <schonm@gmail.com>

[2025-10-26] — Xdebug 3.4.7
    Fixed bug #2359: PHP 8.4 Lazy Ghost Object inoperable/defunct when Xdebug is enabled
    Fixed bug #2371: Step debugging initialize lazy objects
    Fixed bug #2375: Xdebug's exception trace conversion initialises lazy objects

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8a04d45a4e32ee29a12db23e1359729d16549b12)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_3.4.6.bb => xdebug_3.4.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.4.6.bb => xdebug_3.4.7.bb} (91%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
similarity index 91%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
index 6f8540c0cf..a3947a8801 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
@@ -6,7 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "4cd6a2523d9c1576c818eb4d15fe0c1650a25dde4d31d1d20a616e9d9435cc20"
+SRC_URI[sha256sum] = "7592923501e3fdb9741ad35b90e08fc6b3c5dd31eadc4c83b7b3c9dda0627b24"
 
 UPSTREAM_CHECK_URI = "https://github.com/xdebug/xdebug/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"

