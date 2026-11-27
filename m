Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10272.1795753047362024733
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jDbdZQSm;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so12591416c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753047; x=1796357847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ot/J8+JvyfqX+1nQFM5gpHpSCk5Kd4WcJwLYpWg0dHc=;
        b=jDbdZQSm6cfnd9I4jLBXnmH13N9Wv2IYrSt1xDw9wCv1NwMhHQrJ+Q7T0deI+aAdaC
         R890gCq7MqiWWHYDiSZXxfQ/sSX86KKcF4RLODAIJE49SzJrRAWR4BQeKrh95K5FNJ/n
         Ct0395ME/ZEqpuukuSvxVngD5HL4zBNw/WI+lamrT5EIush3Wfsf4UJHkga4K72JTxel
         ry9nLE6jh/4yyYFQxkU8zgcENC2k3JsAYKgpccEddbLQmxBE+Ga3pIobH0RptWmZ4JT6
         eAVd0AVb5wPrDDcfFjbo9w02T2KcMKzDvlqj+M8P+hrGB4FykiV+UAge+mBR+InDnUO6
         FpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753047; x=1796357847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ot/J8+JvyfqX+1nQFM5gpHpSCk5Kd4WcJwLYpWg0dHc=;
        b=dlJOcgWPGx4UTVW7DRlzUUIqVM6BQKgfQ+vDKdPbJhlIE8O0D26krbWjlVK+QR1moT
         Yx8y9TwcVvXrnxOUEEIQ4r/jTblpMONVSlDr7BK9Eh5rgfEP8K6DFOqr6Pmf4B5sUlBW
         rmB7gxgIStjJ4QAsfq8t3IoSFC/K6ELJMmjVfIXsTQq8wWR0f/qiFUwZJjJ7gOdIFU4h
         O1rzCzEUagfaab4ATb/VWoPkhJNZEvVntnqc+GzOkazOf2V2gE9VxXe93527f6HJMetu
         SI+vlmCriHW8plqwQvOb5eZ+2psq1SGFG0Efmz4NB28AiP024qCGJfn4q3y/fW7dyyD3
         m7VA==
X-Gm-Message-State: APuU4Z/9kxIDGTeSlktCfYP4FR/cq4Q/RPPl92+pjRgp/7ED+AS7mcIa
	M1Blh7QeYyMfmtdQ/mknTaiAPjauFzEbl3+DwbFUW5gcymPzAhnz3KGCZrYnVBeb
X-Gm-Gg: AZFdTZer+8y7YIBG1CunKMOkudfAMa2WE1uzjirejNoq6QTphV6VB2poLWRvPPIe5OF
	ZMk37gieeQVtXbt2HBUplevQ9fQDOuJMm/QoqkdckswkcRjRpqU1Mgk6oCIgHG/cOh7Cnlo7kuu
	gyd7cXJjTzbOBDZvMNjbx90ESptuAhyX9ZsC6V4qOQQ+WStnXAMDSFXU+8H83AJWummmqfVMDnJ
	1Z6CvXWi9V+9Z5bU2C/Ovm2WzJbNf72xNG2f8LJ+yKDt2Fo8wwWn83hvsSsY1ZGPuMf9UB157lK
	kjZDfN2OEbuTZqjPb6RsLQZDss0K1uDictD37A8emPio4rXVZu6LBl4e/3pI95WRUc6CV7pgwgt
	UvcyIT3DPjYXAo6JM+DzTRmG6gh45KMp0sVwPGlStQnt+NcaiEdUxoO9iCKPRQ+m9/O2/bUHFVr
	QhX2iLJOflL8+COxUUveoSeCAOeegfiwvdodZla9mWvNYuC5wvj9M3DNYpgHqfnYM3owYbN+OUT
	t852tLnFegZ+XuAD6wyVc2vtZzdsXc5lJhUbr4N4p3eepCJBWQ1BIUcawDi5yi0I1Huf09gEPI+
	eoOL+MWul/CrvmLJaKP3qwmAa66MQ3lbU6+ualA+4CGAaUaIdJ6ns8AzsY2trBiRNq+MMGM/ZE1
	kFhArql/dC7f0ZLT2dRp9EvGsWEvuS3AC7GFY+M01hien7a+gE2E8Vm/Tr4VXKPxipUAYYqDQiA
	v5kKCzeJ5oBV1oIJODOjuBwP/0ofEBID9czae4qZNIXJO3EcUyIT61e3DBQtmU9UxjUR1AkSWL4
	ZqDPKm5Kn/iXTzXPY8Xszd023+kVx84A9anrf58LUMi5fPSxAy59Bw+2pugIVVCGCQ6lf289SOT
	Uvr4
X-Received: by 2002:a05:7022:b056:20b0:1b3:ac53:da84 with SMTP id a92af1059eb24-1b5568e371bmr24933697c88.32.1795753046703;
        Thu, 26 Nov 2026 20:17:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 08/35] ot-daemon: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:48 -0800
Message-ID: <20261127041715.1776485-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133260
Content-Type: text/plain; charset="utf-8"

The default tag regex picked the thread-reference-20250612 date tag.
Upstream now publishes monthly vYYYY.MM.N releases; match those tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
index bc0d86b0e0..0557eddf1e 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
@@ -14,6 +14,7 @@ PV = "0.1+git"
 SRC_URI = "git://github.com/openthread/openthread.git;protocol=https;branch=main \
            "
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake
 
