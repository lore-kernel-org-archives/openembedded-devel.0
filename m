Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA05CD4F54
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:00:52 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3022.1779512450962898823
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qqVgJ5d3;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-83975e992e1so3159394b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512450; x=1780117250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DC7y4weyaN+YZh/wmp+IkeM9BdZfS8YcXbFc6QfNlLc=;
        b=qqVgJ5d3EYN1T4a0KBijNibicYILYwUX8ESyuGL6erej6kaYnKMwFAxCfYtVIgU5Sv
         WtifxiBRKVG5ivsJrOwsrFvnRbiqn/cgtB8R8kiNBZ3MdEdlDB7YjIPxrFFhOIoLVdNL
         /vOoW0d88JZgekwnUkfq37Z/KTCk+TGIawrQi2rzz0H1AseGuar7fsXoSf7x3xTEMr5y
         cRwxpgRkyWG/mN3giQ5UZb2OAAGhT4wIFfbHDEY+N0uI4ARM7ltugpDkTlHyTEbaPJM/
         pp5z8Ts4B45QW1VW7wajm3nTsIQu46Ibq09HhAb3vXNOJb+RzpSUhusNIjWtJ0cj2EnX
         dbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512450; x=1780117250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DC7y4weyaN+YZh/wmp+IkeM9BdZfS8YcXbFc6QfNlLc=;
        b=EZ/2+wnTl6jzIiXAeuK3AFpqzd1I71HdbsRkFsZrg/FUyE9aT2TmtlWcaH+Dr//px1
         xCyd1l45En9heF6QMMQ036VNWXbTLfHlFrEAnNJr6xd7LaQdhIhyhRXOndlle0DSTrbL
         wbzvTtJ5q0LodF1jeSZ0qLAIbybns71G95o8Dy+Cmv9qnw5HF6hme5PKpG77x/GGqGK+
         G/Bl1vYQxFZBhRoOsPWsft9qn/d3lB7NApC9qKBo7f408NlUEnWUHegeaLWQpsP4HeG6
         uiDgrBbKRRukwvlBqtqWQRXX9wgdClyb7lvUSfyhK0kef8WzaMsZmBhzNQUtjWWDWCVY
         PmTw==
X-Gm-Message-State: AOJu0YylzdBHyI1ZQZgEhmtu9y4M0+FBFC0oJx45dpTZrT4mo2zO63qu
	OB6+anuBl2VJn5nYOHdtdlx4w6oer/JSLiLAEL2PjiAvygNCERWwGHswePdusUVX
X-Gm-Gg: Acq92OEaJHElt5XYzvB+qaUsGZt2oIbGOfMo8mibC8vSgATdK9sbiVxrAeRCU2Gk6gN
	THwcsC/lNyKOGyQOEJNXX9FDtLIUocYO9FwFnI9rrQhm+lygW6qOy9doEY7NU3/Uztcg2uI2JoZ
	KX6Eat3yGNmVdwQHVNi7NEokA7sT7tg+Tp5vJefed8stZeWPdzu0y2i3XiwaQm+F3mSAlejkACR
	wK9qhM6m4qZd7oeKSed5yERxmZZg6ZYCK2p8irLrUOAWKjBFbMUEf1qhokRD3pADmHYZhFr6pbT
	c3PvF7XPayLsifSMRNzga1kkzkWO8f8Pf0QMM2EehbzSUbRfFvTJLwKfqc0g6aGuV/2ez6gWr8D
	s6kA0LAqQdir30BXS4/92StNmGMman7bouYerTABVI3/g8SYTKY/cnZ9xecgAusaVW6PhPIGf8V
	1ZNkZXX1g99qvhkVglHuygEztwN4dQXGhw/EvH
X-Received: by 2002:a05:6a00:8c10:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-8415f58d727mr6047168b3a.41.1779512450340;
        Fri, 22 May 2026 22:00:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:00:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 5/25] python3-typeguard: upgrade 4.5.1 -> 4.5.2
Date: Sat, 23 May 2026 17:00:07 +1200
Message-ID: <20260523050028.848327-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127155

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed IndexError raised from check_signature_compatible when the subject method has no positional parameters

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 537a4c4484786553795001e387e5c186113d6d77)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-typeguard_4.5.1.bb => python3-typeguard_4.5.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.5.1.bb => python3-typeguard_4.5.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.5.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.5.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.5.2.bb
index 1c62e076cd..0ea613ef11 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.5.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "f6f8ecbbc819c9bc749983cc67c02391e16a9b43b8b27f15dc70ed7c4a007274"
+SRC_URI[sha256sum] = "5a16dcac23502039299c97c8941651bc33d7ea8cc4b2f7d6bbb1b528f6eea423"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

