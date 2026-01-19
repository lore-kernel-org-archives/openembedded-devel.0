Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF7FD29C4F
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 17:55:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40590.1768845310479249932
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 09:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sx7xuDs2;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so34155925e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768845309; x=1769450109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7RXd8SF0HVuESCTqVhhoE6ZmOq08/RgaQLuLVfcZPg=;
        b=Sx7xuDs2YRLoGiTzE64Ofiel9GD2XXR8BB33fPU/qYdxJ8mavFe/Re/yPDdP7EPEXb
         FEL/zRzpbrz02rbTlPzplhgoszaglmTob85svR70/Muw66ty0yi8UmABtu8G6H0qDKYY
         kFqpyZ3fQ0y35e86Ab+LqEnZV/N38WMPigk0i1bAlctis8SOqeN0zuHAOmIcnwfTU64W
         h9bqh9AzHHLA6fOmwYvEZ12W3UrK/f9pTOvjrWjAy1+qsiNzvvAvH925xG6VSuJAxjsv
         7zIZfm68iKAHACEo4yUM0cuQE2ba+Cx/turBQt6P+veF6RZQ3HxH6BRSK15OjrMMebP9
         cYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845309; x=1769450109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w7RXd8SF0HVuESCTqVhhoE6ZmOq08/RgaQLuLVfcZPg=;
        b=N/j9SwvwTYBnyynjWHNVU/ioWlRJz/wX8+/CBGL4k4ov2bp/OIRbgFulX7HnC+YEfn
         Zur5UsealGfv0xmJa72DU7DW8ZJwQ0wfzsrDbfW+LTknLnyLr93Pc1KVAGyTTmC6WJJU
         mGCz064RSSePBRwZ4FKKQa+ZVvaYIAj1mh4ntU7ilc1VYpprf9uB4pV80PvDzLi/Bfnj
         HWtWZ/x1n3VEIqCpow6MvY5ezt6rdQ3S1zPhCnyrEcsy+28htWWylDDzuzgXQqWyxaLo
         HvC6C8PCrFIg33CpzfvoPtnC8uatnCSdDsFqYxXJt8Kls2Fcbm1SS7EGM49sYn2HRnEz
         OR3A==
X-Gm-Message-State: AOJu0YzYEwa3wbtUexTMI/4cyLYDVsU2C6k4bRcGgVjVU9XMevi8TGec
	vFImxlSgIElYzALWZqAlt4NCOeqNg27bWAWOJ2EEg76NHPJw5mm/nQF3cWCnbQ==
X-Gm-Gg: AY/fxX5HnRiecvQfMlGbxI7rF7BDK7IR5FelP7W/pIUUV1dtUr+XAdBgurDCXXuKJ9n
	GP84IpMz6rm3fMzzq50x1s0YPL8HztMvGb9xFKdzS1sjrXENWtpvr6o3eWggdcj+YRRRkBXvN/q
	6ivFfvNI22iqWpOgr3fQLMt9A/JdglEZqIWBEdQ8ggj9SjEGYB36iAx9Ej7xg5SYaUbOfKtQEfP
	fwXv7nrZ4cqTfhJFR18p8pU0QcX2kv4zVLVO3yaotgfOb4drtFusiTVkvqGZ0dYTPP0p0WGL8QA
	5Nlh9E4mCZ02KOoD34GtKETG31PxgSmtLUIiMJMpAQeWb3JgL5VSk1URGtjuXxJAFSCTaNlQv9A
	ZWnixaCQQQ7DMEStJ9Ajt5wJ1fHhX3PGOxNA/qC3q2M0Cg88pqbq2WYxkl+iAwwc7/P1bmclyCn
	QjSYyUiwo1
X-Received: by 2002:a05:600c:6215:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-4801e2fe16amr133897885e9.2.1768845308801;
        Mon, 19 Jan 2026 09:55:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8795f1sm204201785e9.6.2026.01.19.09.55.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:55:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/4] python3-lief: mark CVE-2025-15504 patched
Date: Mon, 19 Jan 2026 18:55:05 +0100
Message-ID: <20260119175505.777598-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119175505.777598-1-skandigraun@gmail.com>
References: <20260119175505.777598-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 17:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123647

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15504

The vulnerability is patched in v0.17.2, however NVD is currently tracking
the CVE without any version info (or more like with out any CPE info)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lief_0.17.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.17.2.bb b/meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
index e7de6b6d3b..44b4976ab1 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
 "
 
 CVE_PRODUCT = "lief"
+CVE_STATUS[CVE-2025-15504] = "fixed-version: the vulnerability is fixed since v0.17.2"
 
 PEP517_SOURCE_PATH = "${S}/api/python"
 

