Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE95CAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:33:06 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.6905.1758954779462661718
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bi71TzVC;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-42791510fe3so7068695ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954778; x=1759559578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+DVcmSVWRpyWTLqmHGDkgyYQwQkcZbWxgL6s3kkpgg=;
        b=bi71TzVC5PkixhxvZsYgWDYBwHIZmrikc+TYzsuQ1CuxlyCiqpWOaOcMxt0LqBv/3r
         JzpCpDny+DD7EWeKAIyn38vOIOIgcwbfNApgVPhydOQO5op2NstdEb6t7IBux7YhSuVv
         E71JGW/cn1JQOwb0w7PWCO8YhTj6wIE8ln68CE1vvTZf5kram8QdiIRxWC/NnS27XAC6
         c4TUwi8yixS/HRkBVojbXCiSn35JUjKwXsrjApIx9eGeAwyaW9ipJqOsFDrR1lz1ozlZ
         yCbmgtGb7TdiTiTFobgmC1Dw6MbUtSrWSNQTj9IeeP94ohuNVphURP8REvRzkZrPT+du
         3T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954778; x=1759559578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+DVcmSVWRpyWTLqmHGDkgyYQwQkcZbWxgL6s3kkpgg=;
        b=uRiz2u6E8Qae8ZH75gQWBkFJWYkTx8BpUdtXkA0FJxzborxMkNsdRXGUlOGjsz7lP4
         hTSc8J2viVp3HdV6DMlb2bo0IFGVlfCqA1YKLHcw9srCQFMYIvLAcMHZKoJVw1ZXGQAz
         9+av1xVlvli817LlVUbrP3xRNXQdd6+OkxT0FYr518KhX4ftiW39g6hgTfzAVjNAvphS
         aC8y0wMqjAH/bMbe1b0A1HXfCRlYxx7pQLeyZXSVcRCr0naKlm8H+wC6WAxBdvbi1CPw
         oNhJjgK1T2xOF5n8cu1C0oGMvzY4YeSmnCd+eIsHhB7wMCzNoNi6VbDp2jkMl9irsBm7
         oNqg==
X-Gm-Message-State: AOJu0Yxz5BnZM3fdGXG73E9wPaYWxeAIQZrbZbfgw8sq2Frbf1zVFmXN
	A7mjPwzDIkwbcz4KvRslHdCjgWL2i9ZPzVLrU2zQbrXnecHYWa5rdbPTccDpRg==
X-Gm-Gg: ASbGncudlsvcOxtTQ7h9wADWpuEx4QD1a5W0XGpTKFMg8Cc9U/YFd1g+6zZ6u4ruker
	T9othWN1a/8Apkz75YwS+DAcsitjAYkK0jkD4pFbFdzfMeUHhYjWv5mQfa6Xy/CG68uyEPp0wY/
	RpR41vKsvnmazZrn6jgwRNLySq6ZIp0JOYwNATwuY+tAcWIylB6SRG7mqi4RBsfmtf6Bqg+iAaC
	RlOnK6s8kMJdWW+mD2LrXZ6MAOJqZrxpbGqUIPlnLxDAN5LKNjFYdgsw4FdRL9yhHsc7nVICGGW
	uKjlzMo6oDgeVg6bPlOKqQDoNfi32CSEWDhNSoWOhePy0Kp7vplZ3BgpzGsdZrcA/LF2xJlOkul
	IbjazddliGoEGvw/5N+EqwOjgrQ5SDWJN0j8cOobRyQ84qO1dftMUaXRhDT+Jhw==
X-Google-Smtp-Source: AGHT+IFSX1HYHFwwCKamKhiuMpAo0kGORkzTZHcWs52M564l3U3Jkm7ZVE8YWb1XA1T/ejgVfxlicA==
X-Received: by 2002:a05:6e02:1566:b0:424:36a:7b00 with SMTP id e9e14a558f8ab-4287579525emr26365795ab.13.1758954778413;
        Fri, 26 Sep 2025 23:32:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:32:58 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 13/21] sexpect: upgrade 2.3.14 -> 2.3.15
Date: Sat, 27 Sep 2025 18:32:08 +1200
Message-ID: <20250927063216.1865627-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119967

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 04ac3e66ecca412a1fdb263026a700d1d12a8ffa)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../sexpect/{sexpect_2.3.14.bb => sexpect_2.3.15.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/sexpect/{sexpect_2.3.14.bb => sexpect_2.3.15.bb} (82%)

diff --git a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.14.bb b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
similarity index 82%
rename from meta-oe/recipes-devtools/sexpect/sexpect_2.3.14.bb
rename to meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
index 1b064faf16..b97700e53d 100644
--- a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.14.bb
+++ b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
@@ -4,8 +4,8 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/clarkwang/sexpect;branch=${BRANCH};protocol=https"
-SRCREV = "532a52d36aae442b7fe1ce20a59effd1dbc6e6fe"
+SRC_URI = "git://github.com/clarkwang/sexpect;branch=${BRANCH};protocol=https;tag=v${PV}"
+SRCREV = "d3645392424d47532be90fcbc0abf3148324785b"
 
 S = "${WORKDIR}/git"
 

