Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAC8E6ADD4
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 00:04:09 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.38791.1732320240336434191
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 16:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYVAPQmN;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e387afcb162so2736838276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 16:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732320239; x=1732925039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hm0lkXxzeivndnNmzZr1ow3l24JjSWjYWXQeScLxvVM=;
        b=jYVAPQmNgmZmkGmoIBbhaueDaHY6HELf8AS8IAVlUGi0t34TMFBKXgl25iOtKUaeBo
         eKPjJFSBLw4tFVc7HkbaGNmv8qdCdT0s1JQfm5Jih51BnaOQFeenbhA06fedqsX8mWcg
         RYPCl0y89Z2JyXeUEzx7BOs2onJ59J+Q38d7gD32mKPUvc4n6jYD6i4hVq/VtZhCQ0ke
         3QfqL7sI2pDuxYoY25D6EHoxpAt/PutvJNwS4a/YlQjdp3qasLa7Kz6m3UnNTx2+hixS
         CFRL6QNTu4CHtpPIyGMW7BPnQPC2ZjqlrQC8JZYqaxFYijYQ4RYYmLny7K/GVfuCTR4j
         VgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732320239; x=1732925039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hm0lkXxzeivndnNmzZr1ow3l24JjSWjYWXQeScLxvVM=;
        b=eEsGUX5MN+XsbisW0zSSgTeeWZd0t+dlTw5DCHcU0ucWDpTVqAfKizTLt6J3gt89Dn
         hkxDvV0EY2o6viYiToW14jKNzaSysDPqlS2CJro03OlyCJQhK7dsURbaH6lPqdaAgcey
         xq4d0wRKzz1V7kCPSlCnACW0Qa8fBtfJk+AgfLQzUYjgT4z59YagBPN3Xmv2jT2I8hty
         5N72cqEjWfpK6DbiW9QDyqSG9qQOyLbLJFiF6+MfvOplGqYTdG6aR4Chvwt30wj/RO/Z
         5OL2KWxjkKNXwjjgRK11JGMzWMwiv0+bUu0Jrp/2IIKr05iAeeIsxnCLkiW3h31LpTjF
         tVng==
X-Gm-Message-State: AOJu0YzT9gos+CVA3EMXDL/AlmUdwmIxS8Xm4TLfftNDk2tNy8FD6Sxn
	ljIJ6raleqHbeh97F0mlyOQ7sWGGgJqCk48pPgJ5tst3Zgha3ZQ40dyY+hdg
X-Gm-Gg: ASbGncu+DN6L+ClCajydQJyM53wAj52pWMXdCLsdOLnQJnHsqwRHP9H/pB0T+SoNtZi
	+pmP09zr7iPkIRQWMhIObyjhwFuXczurMm+qADxixhpmDSkfOsZSEAXQlCRkWyptTtydP27vh/q
	fIYlogxaHVVon0yXQWK28GggXmKVAtt/OWm/myCSBXFVhx/fpwbKH16kcqcGFJFvzDP6RPDn4sM
	yt3uH593w5JlcWjRt5X9QUOyqNS/uSyDg/7saqS4FWY4TaPcA0yiQ5U
X-Google-Smtp-Source: AGHT+IFK1q93H/3GF9ZM++cwEP9oZIsPeLT8PA5JTWo3oiJB24QcJOFls1r9kVqCbQjn82DUANFxug==
X-Received: by 2002:a05:6902:2982:b0:e33:2605:f80b with SMTP id 3f1490d57ef6-e38f8bccd88mr3010887276.42.1732320238929;
        Fri, 22 Nov 2024 16:03:58 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f6319e12sm888256276.38.2024.11.22.16.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 16:03:58 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 5/6] xfce4-settings: Upgrade 4.18.2 -> 4.18.3
Date: Fri, 22 Nov 2024 19:02:29 -0500
Message-ID: <20241123000230.1479075-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241123000230.1479075-1-schonm@gmail.com>
References: <20241123000230.1479075-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 00:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114014

Changelog: https://gitlab.xfce.org/xfce/xfce4-settings/-/tags/xfce4-settings-4.18.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-settings_4.18.2.bb => xfce4-settings_4.18.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.18.2.bb => xfce4-settings_4.18.3.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
index 0a182273b..7bfcb492f 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] = "4661361087faae57efb49741ffcf90bf9078760e163bbdef63b924083bdc4f22"
+SRC_URI[sha256sum] = "2db9e99be503280739a08779503bdf11db8b9db9851c3a981deb449002f3f1a1"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.43.0


