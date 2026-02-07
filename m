Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78058EE0AC8
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:21 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2681.1770460451332358432
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z/vKlNmz;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4362197d174so1766035f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460450; x=1771065250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gSYmsKX0nHo37qRqK+3iKcJeoEl7tvf5wGY4url11Q=;
        b=Z/vKlNmzpo/Whv/HQ3cXr64Qi5nbnomDpBHTUP4E6fR+oPa9iuE9yzbnQv/VFdMSci
         8JntMj+hcXIrbUb257TLJMBeQGqUDpA6WMvJC9eOvZ9qqXb0hkxLkGryz4nci8YIuI8b
         zv7mXWIHFpq2fvhpP+9gwxZ/8ytV5P24dUU23/YJba63Xzrp72s7IEZj099FAipzjqLN
         RR4CjCXDoygVMbtpm/vnse9lF6SGoTbX08p5YlPMJEYNyCYfAtibTFUzS3vB6xXYQq7K
         PFT2GHunGlbu/VnJbAcnR4a8kePup+MJBUBubAbwQCshV9BjUlIYOColnbttFC0mSqc3
         jVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460450; x=1771065250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+gSYmsKX0nHo37qRqK+3iKcJeoEl7tvf5wGY4url11Q=;
        b=T8F/CyIGiJFOT5b2Cd8bDW5xO4hjxAKMmf+Vl1zaEVA6zDBJjby87Qnd+zQp8Q7PgO
         yhWI+DX2IMal3IzHC6iQJodynb4rVeee5t+jjhf5WeGbpl0VxTEe3fVE778B8yGEwCe8
         rGf4kL9Ogr4ZS1h7fQNmdfB8CLOz6dQXdJeVt8yJHH2t9THURwoZ79fbbE8GyIntcK6G
         lG+KTdvZcM0VGgfDh7IVmNXNOVX35cq9B6yRrt5OeU2seoW7alCydnrWB0NzCmhPkmJq
         r6bI11cUmeosPYbChTxHcTzU58A9NNLKTyd3cTmXlW4cjwBv5uy5FScxrm+JAwgzF4mo
         7iPw==
X-Gm-Message-State: AOJu0YzBbq2nxy0/1fM+ICWIrSrCWJTIMfXh4WWj1ESrwxxE7UbxJ8oR
	Cbn8Rjo28ViOWF8ggQ9VGfglPyrul6+/GUvk6oNHoddf99XDPAAarkjGFMo69w==
X-Gm-Gg: AZuq6aLyWzkqTfp/Ob4NAuf2d5QSPnRMGOrYBbJHALui7XN7w1spzJd+KjgGgIzOpKo
	sSAYaNEmc+bKQUbtNqth91A/3/EE6iq2N16czcN0ezVVKxwL2xowONmH+NMXtlwBMfouwCP6XN3
	4bj9lGskvLrtmb8i6YrbHgxY96jfgfnpQ8ZKn8ZbbqgkZoyRnMd3ZCECuqjYIoj2SQ8RABJC6ps
	i5a91he4Ez2QLfa7ZpChF5MuSiETJCZKQFbKoUQ4FMDni+Hv+7x5c73/pj4pHWIpRsOto7PKm3Y
	UQ4pLKnagNEjqkgV/MA50//moilFE/xmsk985/bvdMG6KjOmfB0fBQ4r4ZhtZKg+Gyqnf6MFlOx
	TZVs0SOe6YmrJ5QPMuupAOmYF9StvcDjXEq82CpH5RlEY4I5nydeby8d1qDDMOuKv10JJXLiFpB
	OQDHJMxLkl
X-Received: by 2002:a05:6000:2303:b0:435:9612:2d24 with SMTP id ffacd0b85a97d-4362937e1d7mr8683219f8f.53.1770460449568;
        Sat, 07 Feb 2026 02:34:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 13/15] python3-eventlet: switch to PEP-517 build backend
Date: Sat,  7 Feb 2026 11:33:55 +0100
Message-ID: <20260207103359.4177243-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124254

From: alperak <alperyasinak1@gmail.com>

The project has a proper pyproject.toml which declares the hatchling.build PEP-517 backend.

Fix:

WARNING: python3-eventlet-0.36.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with hatchling.build, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 19affc7a212d4edca4faa4119fa8e5f9e0b7daf4)

This is cherry-picked into Scarthgap, because the Setuptools backend
seems to be broken - it doesn't install the submodules, making import fail:

root@qemux86-64:~# python3
Python 3.12.12 (main, Oct  9 2025, 11:07:00) [GCC 13.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import eventlet
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.12/site-packages/eventlet/__init__.py", line 6, in <module>
    from eventlet import convenience
  File "/usr/lib/python3.12/site-packages/eventlet/convenience.py", line 4, in <module>
    from eventlet import greenpool
  File "/usr/lib/python3.12/site-packages/eventlet/greenpool.py", line 4, in <module>
    from eventlet import queue
  File "/usr/lib/python3.12/site-packages/eventlet/queue.py", line 48, in <module>
    from eventlet.event import Event
  File "/usr/lib/python3.12/site-packages/eventlet/event.py", line 1, in <module>
    from eventlet import hubs

See also https://github.com/eventlet/eventlet/issues/1071

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-eventlet_0.36.1.bb        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
index 72032c756c..170e4b3fd7 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
@@ -8,7 +8,9 @@ SRC_URI[sha256sum] = "d227fe76a63d9e6a6cef53beb8ad0b2dc40a5e7737c801f4b474cfae1d
 
 SRC_URI += "file://CVE-2025-58068.patch"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
+
+DEPENDS += "python3-hatch-vcs-native"
 
 RDEPENDS:${PN} += " \
 	python3-dnspython \

