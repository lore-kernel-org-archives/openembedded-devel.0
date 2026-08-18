Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F49BC5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2355.1787029366234016682
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QPukoaKf;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso44666945ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029365; x=1787634165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1GL383eXQCPSl1vaPN29+cWwNgt6r7xBBjhMYYOsPU=;
        b=QPukoaKfZh5JRHdlFXyxG31lR04Occvx7ukhMtpWMO/E+zhGgExdwM/F87Vd555z8L
         I9ka6esw4hzjUNPXKdVAmKcgnKAFG5VgV4uRF1CYMoQMiPy9rzgoC8nOzYOH5Eqi1Cuk
         dx8enJ2snEY7jkGUXAUdKAg8cDMy4hdvwkJJ+TEkJ6Xo8meJIHjRBqHF0rr6XXpIZQt3
         YvBTgNWHvUJYTHRevC+XGsFr+A85k0/rRH8rXBl4KCSaSKjWKeiFpYvgsRI+MH5EyKt/
         GLJ4qnaXQKkbO+Sav7qSYTUAn7vCDUaHFAq3IvRVZH7D9lvdUvQMJ7WKHaRw8XNyDKD1
         0C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029366; x=1787634166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1GL383eXQCPSl1vaPN29+cWwNgt6r7xBBjhMYYOsPU=;
        b=kGOBXryeH+2W9cEeomafnw7qto0NMse/M1sky/VNzZ0NrwWGGwcEZQk3L/4pD/ZKTD
         hBSgJh0kNDyMzCnLZ5OfVPZU78LODMUPDkn0TtpL3ZTZwQccyC1rZm1Wj3oJhEyq+Vhv
         nJ/hbfwMKKp7T+SjRVXxknLPs7n99pC8FHt2gUlQqPkECjV+5J5cYpfH4KFhv+v2NJeE
         pvQwsKoKi29xJWj/P21v4iaZttohChWIHYOlylGEhqOZJ3ixnwGiIbsSXVtJCQqMjSk8
         grU/FDZxTcMFxxnCM/yez5EKPmqLxhTa/8/7Kxf9B8M+KfqZi3EhxmReQklUsZKeuXAB
         GXlw==
X-Gm-Message-State: AOJu0YxoBxTGq/joa7cbGZzYeIYjFJ3v+9E4DAxt6fkta8tTPM8SswGf
	btVD0qUjPYf95Lv+Md8pBwgpPJajhUrgAFyNiJUgQ80L/HSyo0pPWk3fBdD8nijE
X-Gm-Gg: AR+sD11npv4hZUWacfLdorGxNjAGGBkIpcKGm97bNvVufNQIcTURvXF+hr20+hP/vSp
	Fuh5feJCbplbDyiIBRcd1RNcIC8h/dQ3zCa/d88rxcZJkCkUzCM6fxGNVQGXOxCO6kIwsFruJDU
	Q5GtHlzMcHCeM15qpwVjVlRjncpgn7Blu+j3gJVtw8baJ+sOVmTxBpAEeDhejy7oYf2KkTcBBDs
	bSDnoLIJPCMAYkRbZr4pIwNPvJ3sC2UdH8o4fWxD7bi/Fmp/pj8CCJ7ZAKhGfsI17jDoj8MaNQ6
	iKIvoSH/rjnbiMu1Lupv46+erE4P4GWijoW1fT/eetJ+p6dKv0E5ZiOlKudntl1V4OybaMfSshn
	S5d7ndPgUwXGzXSqY/koJROy4RiJWT1PAHyuHd0mzFUE3FP3gUZoE9vqS2G3kWyS80DcdZ2KMWe
	9rkS1mcRt+UAtJifcmiCUIpLm2DSdTpRUsY3ijOoXKTVpv/4wVJYgLdwoXhoLbQhbb71ukUpTV7
	w==
X-Received: by 2002:a17:90b:44:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-3933b717765mr31394553a91.3.1787029365640;
        Mon, 17 Aug 2026 22:02:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 24/27] geoipupdate: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:19 +1200
Message-ID: <20260818050123.2901739-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129223

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version geoipupdate
...
INFO: Current version: 3.1.1
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb b/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
index a16936400f..57441765c2 100644
--- a/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
+++ b/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
@@ -12,6 +12,9 @@ SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v3.1.1/geoip
           "
 SRC_URI[sha256sum] = "3de22e3fe3282024288a00807bbea9a1ffa2d1e8fe9c611f4b14a5b4d8ebe08a"
 
+UPSTREAM_CHECK_URI = "https://github.com/maxmind/geoipupdate/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
 LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "\

