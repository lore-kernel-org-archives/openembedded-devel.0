Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91524C43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:05 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69123.1782634315614714164
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZmLrKOEO;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30e7eb50b83so778504eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634315; x=1783239115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZKXD1CfoVTI9tMasjsRnDMLGlU+pif8A5XqWddQDas=;
        b=ZmLrKOEO4Z/QPYY2Jfm/EFUffQes9GbzoM7ka+ce0WYCIhzGyzthxvQBrelFGSEH64
         zShMbJPc32Rw0RrjMVJNlejo4bgUFuZL4gJrH8WpgSQ5o/vaXUw4NsaV1+5AjYANVFRD
         w9jw9mU5tmk/h7DhdoVbpyrdzfCuaGuRCWDpeVmVHA4VXGUqQowlUCirqw33+BsC/rkq
         2H00VGpJ5MuxoSoYugH1JU0m7Mdm8/ZW2ZG/1/8bPgGc1JUg8EJvsHh3pti9OSnf92EN
         8FzjyIUqKIFpj4T/oW1VlvP3c+Lj54C2lS4vGvxZgmkB93QS+jmXvQZDtBrbC42HzFXj
         tLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634315; x=1783239115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oZKXD1CfoVTI9tMasjsRnDMLGlU+pif8A5XqWddQDas=;
        b=SLHYT22oE6IJUk8EPgdOr5pns1rlJIvYYd543xy22Z2konYhdxObX9ZW+TVXzQl40h
         WIMW5UDuO+9x9/l3M8rC2e/mEfPepQ9xLjbjg9ujB/OoqgnZCa2R6BLhf0nfhNYLLjE1
         aqCXS2gCwqLSPHed+4kD+DRmTYljRb5GITrB5b8zVOMuzcUgZu+D9BcAFriPZUh9011d
         Jyc86r/qGP6spq5qH8mXx9Aa+FCYU/0pyCD1vWZNdKQfb/QoPkHe7HZ73WhQvH9eMLmh
         +goJAXh4gWfpKPYXnzsuxXCIXj/sV0EiI7Kha7XapYBiz45OdNADZzKXlKOFpNM8FfSA
         GMrw==
X-Gm-Message-State: AOJu0YzFkWjEkzqCEZWWvwd0vmaCCbNcxThMOa/UO526gAJAtcokzIUM
	wdIRoq+uNoC9azkCnzR3RCSStNjCRTI87w12R8OXE8IUKkQvrKg8W0RgkND03cUa5+lD8A==
X-Gm-Gg: AfdE7cki+/LeOced5eXWACV2AjLb5Lp7qrJmejxCifXEljiFKppDuVAiS9xW4FPmOW4
	6jQQQTrLftc6ezxI8zEnvsBUsNoi5n42+JuRtMUKlutDsEdlR+lNQR1rZ3oOqy/gGCg3hL6c75u
	YSQ6P7hs2rE8t/idt2ak6nIqOpwVx+9Fz7kHN0EPOacTQquRn5UVNxROwJs8zz0Th6Cuqop2dPi
	jg/DcmBarawCfbw2FBUveI8Olo8ObZjTsErhiazPF6NBsZcAv8FdbXasEjYXOJjLtUEtk6wfd6X
	7gDXOVJWNqkDQBN/5WXKTacSyGLl7FmwPVZjDWKD1G/8bQh6vijWsvEbXl7dw0hOFsDSyLa+dux
	obVSOYmBN37rHSjA/KPXG+rNiDGDDTXddTTq3cKl/ErTb8AiRFmOvKNqQzyYwMV12izoUvIgm/J
	cuJbKI7posifmadmvavBhUiFtuzod0ZrkYUJaiycoYy8VFkGkA5esVfVL0JKV68spmPCSXKTvYR
	UkDmLCGEKYr9ml+BnVReu+dfklRwF5FuBbOPtvnhnL1OPvYKbefaTrhqsPgmvKctjYF7YZiMNX6
	pqN2l32vdYzQhdi6Jz2ziGYUEENxky9KJU/PXGuL
X-Received: by 2002:a05:7300:e8a9:b0:304:bce8:fa30 with SMTP id 5a478bee46e88-30c84b2c0c8mr13402982eec.5.1782634314877;
        Sun, 28 Jun 2026 01:11:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 032/128] networkmanager-openconnect: upgrade 1.2.8 -> 1.2.10
Date: Sun, 28 Jun 2026 01:09:43 -0700
Message-ID: <20260628081122.178348-32-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127842

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...penconnect_1.2.8.bb => networkmanager-openconnect_1.2.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openconnect_1.2.8.bb => networkmanager-openconnect_1.2.10.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb
index 6369d8d0ef..c3f9b9f806 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb
@@ -11,7 +11,7 @@ inherit gnomebase useradd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openconnect/${@gnome_verdir("${PV}")}/NetworkManager-openconnect-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5dedaa785d82d8e239ddd082bfac5250c691e964464be1807b6827263633cdcc"
+SRC_URI[sha256sum] = "844b6bf64ecadb97b4a68c776db89aa5e6ee7e59bd24b0180228406863136464"
 
 S = "${UNPACKDIR}/NetworkManager-openconnect-${PV}"
 

