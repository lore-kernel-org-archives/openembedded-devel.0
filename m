Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4262.1793738642173086249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hzH7nF5l;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so53354c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738641; x=1794343441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfr32258dotONBRNlTmIXHTOhD3+sLwgUUs/9UId8z0=;
        b=hzH7nF5l02KV+UgrErXPhAQQ4slmyBucO79sTPtT4yrpUTATv+ocaPcx3avDkNHeQj
         V6qm3t0SvnnoFt/yjUI9u6y571F10YhLcu7wt+OVioKlzRjr/PlJwhlnt0CZpbkLJSlm
         drdRCIE6ZlFSywoc45bhR9jdpbeHFZ5qT6KUhkYxa/v5OhGSkFR9QOAGF3BqcRrzv0CM
         SBilh0ZYoHXE0FFcr+DnsoPgU2fUF94vw5WSoFIr+IYfbwuUdWPEhIBykXym6/hI3gdi
         2uB94bfBotH2z2i9Ouys2IuVIGR61G1u5qiZm+s58x2Kyu3JvN8eCi7BBR/VW08it1Wu
         5QFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738641; x=1794343441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfr32258dotONBRNlTmIXHTOhD3+sLwgUUs/9UId8z0=;
        b=0aXOcjSVF8q+/qLRhlKk6PJOPvOW9AfbhmE6VPNWQkFUtSS3JkzxwHxT3PIVyf2hUT
         uDfrqYfyAZcdwPIkLZ9pKMnSkC0HzTcVVITV8oEzip7uERRMm0pBmeoWeRYS5qaA0NKD
         j9mFQ5VRVYN4Cvpt61JXHrzQupvwfG684mP2UaXSCIiguIeYg8tyFosVTY22zwkmD/Kv
         su6Fs/UPeQ+6XRsxlhhM4nDCsGzIgh8ySQtDHQvjZjalMM4TyI2Y6sKyDy1mtwTPP7UD
         eRyEz8Ung/2xHZHdy+LmndiGYEvwmUHNj6+Vj1FwbOgNrkbKnpc7KC0yCQ3zMwm4lBYX
         XkMA==
X-Gm-Message-State: APuU4Z9QnyNJ6BoBJDmeIqoXbtSuLdcbI3DsG7NGndz9hFCh6H+hV/Cw
	ztTrB0g6gFzvKOpToJaJVaknrnCk3w7vshB/8bi99LTKoOwjidd/kfvPAdVGtQ==
X-Gm-Gg: AYBFou3pmm0zYMHioBiZgn9+5uqQKCzupAswLtVgdRd/5YHyX0PwWVkKCvPIvbcZIZ0
	saE/jih6UwIQ9BkN9RMft+nOjybws9Ss8hfIehDdQXaflduKto345uPIgXa10+FxjSw14EDppsx
	BP/Wu6fARPJ88hVqfYzA8vevLWO0hKZQuCYJ173nPwWH674GKjW1va2czLm2Dg36ONHTuT7/MZi
	Jq1TzTCLp+WQFOcjq89TntHa52QBJa0WWJqgiDfBZUAMxZcOqtI6YVmhucT6Q1d/rJ0H7DzaShU
	dCoq/wG4owtHx7rYaNSTZzk2WHRSZ1a1A4yJGGa0bnapOKIVIhLuDnu8vDO/Agm8WNuuDez1YcU
	d02yZlDbKXeOhbtuYg42RG58jSKbfgu+ZiFQaJq7C8iWIgLhXtRIIyKmE2mGavhkJFowK4mPC0C
	wQ7QdHjteNB/NulGZo5oKcPVgVCC3TtTe9N8PbkI+ZUdQuxqAp5Fx+OAJ/swCVkEJ3bA94d6tas
	JeTE6DFuS3DYHLkXq5nnmUHR29Tbt0YAAK6Vok7uFXAtOyzeoSiioWUmDaK8z70QEepYndhqCn0
	wgFRU+WTlb8NZcA7B8NFpP/oSZD5OPXUICvVYLinKye/VUB0C6O2jHecmOM4HQ==
X-Received: by 2002:a05:701b:2816:b0:182:94d7:f76a with SMTP id a92af1059eb24-1ac6088a34bmr19942435c88.43.1793738641418;
        Tue, 03 Nov 2026 12:44:01 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm1544834c88.21.2026.11.03.12.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:44:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][master-v1][PATCH 3/5] jsoncons: upgrade 1.9.0 -> 1.10.0
Date: Wed,  4 Nov 2026 09:43:48 +1300
Message-ID: <20261103204350.1092741-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103204350.1092741-1-ankur.tyagi85@gmail.com>
References: <20261103204350.1092741-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131821
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/danielaparker/jsoncons/releases/tag/v1.10.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jsoncons/{jsoncons_1.9.0.bb => jsoncons_1.10.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.9.0.bb => jsoncons_1.10.0.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.9.0.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.10.0.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.9.0.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.10.0.bb
index fdbce38e01..f269e8d452 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.9.0.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.10.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "bcb44594c50c495ee1e690602cdd71455942ad0e"
+SRCREV = "9e57e421285422d7aeeb5aa7dc839f6a19121ee6"
 
 
 inherit cmake
