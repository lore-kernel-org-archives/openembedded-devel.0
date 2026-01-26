Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C256AD1951A
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 20:41:59 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31399.1769460111809446049
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 12:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JT3nffLz;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8d7f22d405so190910066b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 12:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769460110; x=1770064910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/hNxuYB+AWGh1c4ZeiVxnHFf0drr8HeE5W5S7xodLh8=;
        b=JT3nffLz/a2T+8XAmj2igimSL0XnV7CJNT02ky9etgzMJtPv9wDCkMyEdoWFAlKPBW
         vKcrYLMzqmb1mF2au+AvGtZCE5U15y/hG0dLUxJ8pq3GZUu2GMRdAHFZpECx+vXHJxyQ
         pOeiVJcWSoVW7iSy7Bc/U1mAj08BXHUMQF2oHJoKs7UqVaA3bLSj4PktfxfbHGMfpi8l
         cACNCn/gFORsSgVLSi8xGDNwBvoD7MDIKOltZzPvCppzwJMYMv8EiOiMGLJVU+zJ8OZo
         dynTN8ezHrj7s/3Tc0A/A8hPTdRqChuMLI4pT9N3mVezkws/3JyhKm84CWChnzAGdMN7
         76Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769460110; x=1770064910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hNxuYB+AWGh1c4ZeiVxnHFf0drr8HeE5W5S7xodLh8=;
        b=L7/V1GV8sMYQypnaHTsB8E4zqxWIIyeU9Snk3O1+GfnzaegzGEo+KHc3Vyl4FQodB+
         fbtmdSSYgTYT9T1PiUFBxX9q2KeQUHnWztLbRkBoPFi3iwK8x2QfOsSqpoLE0l9l6U2X
         ax2JkOOBw+fqAEZcJEeXp6Q7gQZw2ObSMHPK7NDlZfAhw7UHWsT7/+ZzH0upo8C4xV7v
         U4yGc+ltMBc5aeWuxY1rz4TlMH9+4J/K2mXYXZKSZMRxWNkekC/MFot5Dd4/Jzomx8dp
         hv2A0Ox6sV2Hob19XovfjySeUvZyWAXBViIoqQ++OaaG7yy5K+9qEvGZnOjrCmjmZ6Jf
         nshQ==
X-Gm-Message-State: AOJu0Yz6RZ3OURUVhSRX974Jn4+Stb+TSaRAIQmRgcgXuNKbMU0X7ICd
	AhksCbwzDrn/T87q2+QrhfTgeQAoo/D9MJqjwiHxHABa7tq8rM3QR1VhbM2LVg==
X-Gm-Gg: AZuq6aJUhGSZlfN9Qdk+iOMFzsee3E/GDbMGk0f6/FkeDD7LC3CYCS+jncoe/scrtO6
	nkzzs9z2rireU7y8AWgJpU5Jg4KUxt4ZhL+rJ0Itw6YWjvro1NPFRTkDnSTmPCJaLOI/jc9xS4M
	Fmx7lZ2+6lPW3o4dXwwLUbq1HA6CBiewBYKurHti7rcpxtIvlb66aG6y3FOfE9sk4et3nhXGq8n
	IzTfUgPe6tzJOBUxxiTwzm4L4K3gml/eOXMFObPRpVq2YjRZ9VggvQU9KlwiEAo4yiHpLnyaSkq
	j3RmDUrUW0CFqx8s5zctsDWiWISdrJT7fjbcQfq2QKY/S/yzb5qyOewXdhZ+zWFzKdGH1mkC2fL
	nzg7Avrjh1mYSWUUCPS7GBABAGXQgm4v97Tdk6jYzRilN1D2HoUMf5f+86XKFPxEmnapounSxB0
	fNCM0w8Qv9/303gNQMz7n+nhgCFyapXzyHRvKV26nTqRkp1gNS/2rpeKIHfyrtn0Qr
X-Received: by 2002:a17:907:1c21:b0:b88:e09b:88a3 with SMTP id a640c23a62f3a-b8d20d8411cmr439634066b.22.1769460109633;
        Mon, 26 Jan 2026 12:41:49 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b41614csm694702166b.15.2026.01.26.12.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 12:41:49 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH] rygel: remove x11 from REQUIRED_DISTRO_FEATURES
Date: Mon, 26 Jan 2026 21:41:44 +0100
Message-ID: <20260126204144.2576530-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 20:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123890

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
index 60a79f5fb3..97948d896f 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
@@ -18,7 +18,7 @@ RRECOMMENDS:${PN} = "rygel-plugin-media-export"
 inherit gnomebase features_check vala gobject-introspection gettext systemd
 
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be configured
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
 SRC_URI[archive.sha256sum] = "82667b902fc0672e64cf91eb727a70137a8fdfe7a3d9a4c158b0f4b1fc700882"
 
-- 
2.43.0


