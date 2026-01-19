Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426ECCA6010
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:29 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31270.1768811306572094710
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YCNX4hPt;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso1927874a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811306; x=1769416106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hgftt7y5PWtzUwsunUOl1JiJEu4sCDth2zfUqbmbwUM=;
        b=YCNX4hPtORublq64DneSTiF/arYCXbJQZRyxQYAaBDiOlS90RKLVvOi0wB4l+f+GjE
         d0gHIDhzEWsQFakgjyp2j2JSFS1h8JhlligNqHfydULZkFcSDXZw+RV0UUG94W9WgKcn
         iLl0ABTk2T1Q4i7gfj/wZpt0g2jzxqAX+71+qlCGjsZAmeLsgS56mMT3hYdFJvUXiPks
         grCPPhaH5bX8T1c6xHpTJnJp8LkbgV3OsZWt6vhaPMwYHi3CbMTLhN65vREu0uJq8Dve
         H7iecye29WRxRV6kqGGZ0Z1njcf6gUPJGeo3TXtnj8+rrky1XUf77WAzXyJqbFBDa13U
         1OSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811306; x=1769416106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hgftt7y5PWtzUwsunUOl1JiJEu4sCDth2zfUqbmbwUM=;
        b=ods/5FscHAZA9FUE69wfOe5YA/t4KWsQlN3sq5jnycVjHI2RjgoPvXaRld9ktYt/Ob
         yvuknUBTa5vGwQRTWJ6WcjVwySUgO7ACu5IvH4IQHFRJTwYdGvCScTzGeZ74wDohuNLC
         +JMbvp+eEN8QZcyr/QPjn1/fbUwx3uOc79zr7t6VmbCfGNjPInKjQ63kUFUlLwddxoRH
         3fE/aj9iNTqOgJJt/mTY7b50mFXn+E9N9JBxNKCV/5SvkHZFJMjnvcvxAOu7gBdjxLBl
         AsspTpyitlSoXzi7ZtcX1y1Zj9jWXzH582THns13EHc5+AQSLO2lHwt8pKBt7Xw0dAF+
         ktqw==
X-Gm-Message-State: AOJu0YyLsNSRssuQy9QIoJSrR3S3i8AoQqN/SIQVBtv9tEzIblRVWSz3
	APjzAi4dhGWM1V1g4oocjyH5sJXpYGiiSdre284J3g4NpoQYUf2J9mxc9hv+XQ==
X-Gm-Gg: AZuq6aIMXk0FiggWbOWRB1VjiJvJtI6PMTgRIHSSE9x613av+7E0d/mC0Gbjf5QywTz
	7LTlTUcxaHSZFpP3kUbTU0IqDOpWmtcnJDpKJU8tAtUBr2iztRNlgKgQlHrdg6BpEV8Yt+lTs+d
	sdjmr83cYUyF9oV80p+Xf3jH3VfujM8SM51FFyeSp3KI+5+qGBbyA98T2DW8BYN5uQ+UmM/EwUL
	vuzPT1NF1vC1RUHRpXhLQeWvUF15p452kA0KAlYmdBQh4tF2ODcGi8MweO3ARQwRydN3CejFeV+
	dm55upIKJDT1aw9BYPSob4ait7h50CC/J32tLzYKOuxukZhn20Orz2Grtl7ASKiqzKsYM8DqiQS
	P8woxIGs2Lso8fMzIOg3v72/5T7sihoYh2HLIUv/pXQwMMELCLYQW0ovIfnicq+0EJ7j4VSNOhh
	M+ZQZjpFDD6caFMiOX8oNUebE=
X-Received: by 2002:a17:903:1ca:b0:295:592f:9496 with SMTP id d9443c01a7336-2a717809c6emr83074265ad.20.1768811305640;
        Mon, 19 Jan 2026 00:28:25 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:25 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 10/28] php: upgrade 8.4.16 -> 8.4.17
Date: Mon, 19 Jan 2026 21:27:32 +1300
Message-ID: <20260119082752.4120991-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123604

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog: https://www.php.net/ChangeLog-8.php#8.4.17

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.16.bb => php_8.4.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.16.bb => php_8.4.17.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.16.bb b/meta-oe/recipes-devtools/php/php_8.4.17.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.16.bb
rename to meta-oe/recipes-devtools/php/php_8.4.17.bb
index 870cb663e6..72901f2a34 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.16.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.17.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "6c48c65eba6a2f7a102925d08772239b1f45110aed2187fdd81b933ed439c692"
+SRC_URI[sha256sum] = "ea67d83d72dd6f3abaaeae7f532f78fd12192861d96aba8e9eca3b2ddade42d2"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

