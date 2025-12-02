Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED218D116FE
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 12:34:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6584.1764678836165101055
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 04:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NofBaPlP;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso35677755e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 04:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764678834; x=1765283634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJy8LHQGMZyfs1G2/Gu0d4GqqRAmb/+odv/sz1OmWvQ=;
        b=NofBaPlPp7JL0s+SMc1YtgB+BXxHLQr/ik8DDXQ4nQlcJCsL+mqxvXwirZWeVrwrXj
         L6IKBtpn9EWsCjP9Y4RfBiPOEls3VKRR43OouRmcCmNOhixk0p3DHRGoh5zSeMI45v+n
         PALI4gUsVGyBUCRx5megQG00C00goPpVcNJYgkIBZcpUigdtjYYNA+2HBpRpXIGJxjDG
         TeBD8q3d4E+eZDwoOKqTJ1/QXfJY2LQp8FCjuAb9cMNs8X7gJh2G0/OZJ04IpMNz/jwa
         MUjZ9/gusE6+tZsJzkAjpHfTpnPxiQg1CA0wam+EjL2b5sH8D0ZCmXgZ4o7FroG34Kf3
         MmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678834; x=1765283634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sJy8LHQGMZyfs1G2/Gu0d4GqqRAmb/+odv/sz1OmWvQ=;
        b=gSujPqTMU/WeJYwTratj0L9kxR3ZgGDklHIZ2pQi24AvdxUvcI8N3X6vi4u2ftcUiz
         rbQdiV6Hrw5YYIWz5bv6oop8GJMPvq04zar/I9d8ZT7SDyCSuZS5XXBAtyRi4teTVG75
         8D1rWTej2zHdX7U/eEOcGvbHXrapnrGDtSmWGyhKdNAG5ibRhbFFK7V7vCcq5VgsGA/t
         J0pUOe0sXuee1KgB4wu+uFbSfTAQ5HRQ1gLE8VDH7P3LLWJKlom09JMEnO2KPR8GB7it
         jJFV4HXhJN5NKU2aIDePyyU9QvBJC5/T33yBYUK0lli2Xaf2r+VLukCjwy9e5FCOUgNX
         JQTQ==
X-Gm-Message-State: AOJu0YzYoaCktEpvjRCvKUEfhJwycjQQ0lS0xbU/qfuVfMwWg3/w+AKB
	XMYIwK7kxlwQWkNw8u4iTv571xHFhy9FGHh4BDquQjapUtJfZB0DMRC0nXNY9A==
X-Gm-Gg: ASbGnctID5o4fFI/Rql6c9mlcZCqi69xdER8VM2fXeJG0Kqfl4cT5gpsSbQODPaNeE2
	qCBGKDsfEancfkYNaZig3C/oPOqF6y1fQ8LQvZqEfE48gy11OE1Tjxg5wksdspJZOOzud5c8RAv
	nDetyOSe5xD5xdXKlTGITgtExM/EclAC7nKeDOjXjDR08cH31o3scAMBnS8Y10aPTePoYKIiAkZ
	0Qm+kNWszOGqeV3/l4cdTA+3ZBFQDaPVBfCSeQc2LqFHV7NuzSEzCDGUbHoa1rMpka2nU8VHgxe
	NhEbwEBDqJoqd+g0qwZU3tBdy7IHS7Fx6GGkx7eVBKruH6oBjuR+9UgNidP9FKsMsNyl/vb1L/f
	E9Ba/Q9EVQ98GVvA8ZCGaw6JrGJ7jUDV4NCEgf6F7USuChBo5p63Wp0V54/+en/f1WJcK1im/GT
	y3/2aTAn7w
X-Google-Smtp-Source: AGHT+IFAa7ev5UIYYDv4Sw60qxejcRl/U2hp3RxG4oCUISoEzwpz9Ojrip3v+dr9fxsb/XnlNN189Q==
X-Received: by 2002:a05:600c:1c25:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-47926f8072cmr25872365e9.1.1764678834415;
        Tue, 02 Dec 2025 04:33:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164ceecsm303438075e9.14.2025.12.02.04.33.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:33:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/3] scsirastools: Fix build with usrmerge
Date: Tue,  2 Dec 2025 13:33:51 +0100
Message-ID: <20251202123351.1645828-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202123351.1645828-1-skandigraun@gmail.com>
References: <20251202123351.1645828-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 12:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122263

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4448cd9ee7e62de0a2787110256c8c0cabb941ee)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index 66620ea5ff..d3f2bd678d 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "e7b997e75decb06a650c42c35cd63d0c94c34e39cf133c723337b0eeab
 inherit autotools update-rc.d
 
 # mdadm Makefile has CC set to gcc, hence override CC to ${CC}
-EXTRA_OEMAKE += "CC='${CC}'"
+EXTRA_OEMAKE += "CC='${CC}' sbindir=${base_sbindir}"
 
 
 do_configure:append() {

