Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3586AD5E133
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 11:14:45 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20017.1765883679394391593
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 03:14:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XxWLwh+u;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so3142520f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 03:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765883677; x=1766488477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CqqS+3bQlumhQyz5NsrDQ5Jaxgq+hFyR0G8ORVLe1/Y=;
        b=XxWLwh+ud29zVEcWLH6f+3TuIP0CYPYBGYUW8oCjLtU6kMX62G2dhjZnsh5NhO+Bfi
         89t+JcKvzFNGceWNBDDTR9jahKq38KlyXTt3T8/tIC567eDWG5hEzXh7VLbKC2Wj0wBU
         6zPoVW25zy/pDNzaOjTCXNw8J8K/Ip8FGoh1b0NsT9O8gEJDGv/LLBWQz1yVQzGMmKwZ
         6lUDDvSfd2giMJZU+fdRrMkFCbochx7kIuSJsDszaPKELb2g0i6NeTN2MvmDO2WB1ZLx
         I+SIB2YYLtz7O/HsR9MTj+OnV13LK1c3o7dYW56vMyN858Fb1c3FLfbB7nFha/3K9LlT
         W8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765883677; x=1766488477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqqS+3bQlumhQyz5NsrDQ5Jaxgq+hFyR0G8ORVLe1/Y=;
        b=rgwEW042qst7IUcqze7Ct2UCr/6VzrjU+gPkJCWqrsItBeSIWVriynlk/wCdlZmYbE
         rclqkAyEowNze7TWr6KTZIt1qH22J7vx4nTIfvs+BTXUyjBtx7kRlxCSeUz3iInnSIG4
         8XfPEk1gN34dsGV0mkzcl/7M1MtXiJyO7tcQINf84pFH8fP0kXl1fWybPFS0NEEDg4/U
         cT+nfNCcdLyZM4noW3TWFi8uMT/FyeoHGW1q7rqoYT2F6XyFYiPZK+1xcVWY6OwjdIfb
         dxFfbM+MtPBRxdWKz+q/xGPHhDQddvrlgdjJTkvZ/cGQ2gTqEui9Y2X8uCtzxtPUFG5F
         wB9A==
X-Gm-Message-State: AOJu0YxvmkBpAIBWUqP+T3EsWldc9k9OQ/F1deP0A/tliFtc0jo39fbO
	g+M6Zn5wXXV3AYXgnX2iXDLgIMrYEkA3GfeL2kdj39ebNsoLntHTbnB42A5iLA==
X-Gm-Gg: AY/fxX7lLkmcrlydAPXRdHhRS1dw869gB5uhGToMRKg0XStKnfhky5RN3m26HE4V1qq
	dZwFV6NL6isaiwioXxpxfrRFYpTY0BkxyaUo5qPkOVfoUHnJFVRAEVBw9u94GSeiHWKoLPuPk5H
	7ChVtbkxZ01R0YR0YLCK6GQ42kXqVW+xv2B9U3XPOmPRejvVD8KuGsRBgMWzoOTmqb6F0saHvLG
	EFOTY9pyyNUk+SPVXdvce6soYNZI7WdmmmyTBDCJtdamkRM+rNI+zTwd6pW7+YMJRwYqhh7tlrO
	hc6BpxlsNKnBh2X3bFQKv99Secag1spCEP9a31+DgrQOdWf9hgCbBxVPWxVf02fEf4F2J+8J43u
	H37ElC7sxGxf+u3yQhbaABVwHXa0adJ0Vw03leh8x1u/xoIg9QNBxPyoOIT/xfSYpp8cDVGInQn
	yiizz6l9Pp
X-Google-Smtp-Source: AGHT+IGd1QRehgbx6xEIl7cqpdEWg4v5JyxjeCRqAY4QU3EQxTNIDUrLTypBVtq9NGdBsVuGBoSBDQ==
X-Received: by 2002:a5d:5887:0:b0:430:f879:a0ee with SMTP id ffacd0b85a97d-430f879a253mr9202928f8f.5.1765883677381;
        Tue, 16 Dec 2025 03:14:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430fdcc6bbdsm11221138f8f.14.2025.12.16.03.14.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 03:14:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libcoap: ignore CVE-2025-50518
Date: Tue, 16 Dec 2025 12:14:36 +0100
Message-ID: <20251216111436.1553787-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 11:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122693

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-50518

The vulnerability is disputed by upstream, because the vulnerability
requires a user error, incorrect library usage. See also an upstream
discussion in a related (rejected) PR: https://github.com/obgm/libcoap/pull/1726

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
index 55c5ed8775..1a8d7ed725 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
@@ -60,3 +60,5 @@ PACKAGE_BEFORE_PN += "\
 
 FILES:${PN}-bin = "${bindir}"
 FILES:${PN}-dev += "${datadir}/${BPN}/examples"
+
+CVE_STATUS[CVE-2025-50518] = "disputed: happens only when library is used incorrectly"

