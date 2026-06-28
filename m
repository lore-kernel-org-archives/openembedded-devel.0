Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAF2C44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:48 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14758.1782634365326918497
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V8xcVqnc;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30c6874d295so1451906eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634365; x=1783239165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJPChXV5IQeECJ2OHzIZXuVTrV00x2XAbeKPCjI0lsA=;
        b=V8xcVqncX/7Q6jdiZrDpmsJBEoeAzA0nOMuiX2PA53aS30C2GZsLYTsmEn2SI6XB4X
         LLOtlPbO2zoJxmax414uI4SVs783KnMh6AnA453zEgdrQ1SRonnkbA6GTvj4vXU80gUL
         /GMoWosMTUgVUSmRoLa0amjRAPwkTuNTAmYhBIlvSM9UuaVFVI5J5pqRD8f7/MePOpnM
         jxIzG78EWAhDbs4OB0Fbe2ljvXXrZOkogMl9CdVozktIk8gVuRfvjAlqVzWyFWwQ6IhI
         IRqfBm5kih800qUxPv7alL1KinZjgWjm+EswPwnNVR00ZBezOcqnJ/jbXSguG0LNhDFg
         2Wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634365; x=1783239165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hJPChXV5IQeECJ2OHzIZXuVTrV00x2XAbeKPCjI0lsA=;
        b=APC30WEoaeH2Gu01gNMIKPjiZT6wYpGzvnHosuTPCBwbn93jDnf9T05I8e89U1DiIk
         A3GXzDXDmvCLtW3kGO3rxCrpELRkWVwu0HbwdxAQjBpWr//GnhFNSMBhCcpAWf/InDd5
         Z9ZW4kJ4/oTQedT8kocSGMBfrHUSPLxfPh4ra/9wA6j5hjMSAPwqoUTOgu84KY+PiVCa
         XPevaU+bjU0lCSLnu66This2j9UQ/Nm5aMIrSykybp+Bwt+m2W0JWaXfPwDfzVfF45Xp
         mWzXDPQGf4L+YIlMVfZAktqtTyIYOM5NsYmnzKvqeiV7ko8MfbIZiRs4fiXA3NR4dGvX
         lRAg==
X-Gm-Message-State: AOJu0YzZq12HjRTcVzE4llug8xteHHO5mlwqz3e65HuYGy92hCouFpQj
	32RPmIxAVtJ37quW0p4MXFOlA8LK6/TnVbIPysG4xh5yXTGLwHiyZ2mk5HaQSnOoo8Wk7w==
X-Gm-Gg: AfdE7clI052yJl3wKWnbxCpTPnEKzKtpjF2SPHfly+v2fxTwpSr+W9IyBZHknrA8uDK
	p5LOcAKjWx9rAR9WtD0NGyqteLunH1Wq3FbVnFQBorljd0oV9Gy9lu6m2j/HKTFrXeG3DDSS4e/
	q/Ip91ZVI+O0frc+Ph8VzIs0V8D/jDbqdTLBu9xgp3jwkxiKgE4ijd16lWaw+NrcMS1Oji4/0Sv
	IW90/wj7EuHfaHCmSLa57NmCwVdhvKtpDhKtkpcLP0K6Tl6mcnZzbVSOQ5m+eQhaDglEcUAVh/S
	lZFWmZs6bAr8ilxYd4ooTW5TPpiMVpNgIXPAYnOdv6RkiJ4gYk0p0OcJSu9DRnoLCDtsndhf2CD
	v0jAP5csE33RvniQE01Qee9OJUJnij7gZj2VTJjWSYiQkCN8q9YYaiE45PtLrUTY2XlOjUy6I/Y
	CargW54Fx/6E1FpT+K8xfJxjTgBrR60iUE/RWfYIvlsZ8OBv3oPn7c2sL9DWOA6N5KEHzcOUjma
	R0tvVciQG4P/UtCTdAnSjcA1GnuV06t8xkjl4hg7hco4gRArxJLJV8Hdogy6X8EtRVFzNSqlJq9
	ZVd31732oKdWkw9I5DkkhuSxgiAG5FPVsa5a/M+P
X-Received: by 2002:a05:7300:3207:b0:30c:aba0:bcc9 with SMTP id 5a478bee46e88-30caba0bdc5mr6110247eec.1.1782634364629;
        Sun, 28 Jun 2026 01:12:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 086/128] cairomm-1.16: upgrade 1.18.0 -> 1.18.1
Date: Sun, 28 Jun 2026 01:10:37 -0700
Message-ID: <20260628081122.178348-86-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127896

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cairo/{cairomm-1.16_1.18.0.bb => cairomm-1.16_1.18.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cairo/{cairomm-1.16_1.18.0.bb => cairomm-1.16_1.18.1.bb} (81%)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb
similarity index 81%
rename from meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
rename to meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb
index 03889ddf9d..371e085b0c 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb
@@ -8,7 +8,7 @@ inherit gnomebase
 DEPENDS += "boost cairo libsigc++-3"
 
 SRC_URI = "https://www.cairographics.org/releases/cairomm-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b81255394e3ea8e8aa887276d22afa8985fc8daef60692eb2407d23049f03cfb"
+SRC_URI[sha256sum] = "e0e996a979ee52c840dca3ee74f5d005e3259b94ddce58f255d3b6f47c8cb41d"
 
 S = "${UNPACKDIR}/cairomm-${PV}"
 

