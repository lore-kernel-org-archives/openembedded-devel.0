Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8623E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 15:41:52 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14602.1771429312135333330
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 07:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aGXYEHyr;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-482f2599980so59421485e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 07:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771429310; x=1772034110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmT/LH1J1g+uNBBBl4EgFtJgfqfQ95FDQRAAqKNkyfE=;
        b=aGXYEHyr9+484j10GoHrZvrV3Jg9MOZESo5NGAwRqvjeWZmaapG4xpd82tl2LQ+p6d
         XELhw9A/lviYtz9Ls0sihVK2V/98hScELMzD0zN3qY245fr3i4BTulyGCmpWs86O2np9
         vdBka+h1Lb3W2C4Y0EQk6uQam+4Dn5K3yl34U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771429310; x=1772034110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RmT/LH1J1g+uNBBBl4EgFtJgfqfQ95FDQRAAqKNkyfE=;
        b=VBA6rCbfsnj+LR4UTLVYXnyMKLd5k24w4MhmHno+cLQrUSubgIM2uS+RJTUBn74Q2X
         u0ATbpnse5DUlaoOAemyyHZ5Gl1mtOV9o2kgj4jikDwIqRpXzJTBDCqHu47fK4IsJh5T
         xRQ21x7HChZOY+0B9DXeMiJ+K/K2/f8iafEDmMRcEIwUoaelUvr2YgrfQO/gcG4m4mEn
         Kj9RB0QmvE9aX59W0WVlR0iKgOpmzz9Nk2dwPovF3hpZDL52UIufpu90rZ3jJNhcy7zt
         qibzBhgeK3CYqJdYulBNWt5kNiHhBLbHs3cp1FuwQvMMkDcZF0ePsMw7bPFr9VSGbt6+
         FaPg==
X-Gm-Message-State: AOJu0YyfrN6umIGSljWFeSuntEhYwVsrqhc5ZmwPfAvu3IzDV0JMSysX
	br9AQLkxo4XIiG15UkGD7YFt+TnLR6z9k7VkzdjwUxsrTmGhi6iNMXv9mdxxG2UThUKq05BgDEr
	n5URO
X-Gm-Gg: AZuq6aLUHlR7CgcZ4+py2sqUJ5u/GiqAjXnGugl6HRQoCnM4cew4pZzGZJQum904Kqv
	45GkbZwelC50sbLIr+kDA+NTuoCKWSAZt5B8dZc2zR//KI841L0UbUOtk8cKOjlN/KgGDsrLfo4
	4OngLxumrHZDeZ8TdFYAfW8uEL45ii1cjWD89zXsJSCn7Y7TFTLQsxDphAYwwoFzPvtU1dXBcsz
	VjLSzHXLaMLtWDESnSwwBMno6Q6PliO3wb2hMcHO52Yg6FIi6LiYRag4nr3dU4JDxIHbTYixSBP
	yAyqWzQo28Ed6qIAq4U8ORqLrBFGnUWLisNv//TPy+GeFfaBDbvmAuOiXYCqFV5+0++5ux8RChU
	3xZozKMiRQVcBzC21Gza2b0wZX99m0j41nhpSLgtigYile5b+vFrXBJPvw1l+c5MAuWD9tDKZrQ
	h5M0DsFPJaCmVoOvYYFYFmyoblzLGUs1BRNs3p
X-Received: by 2002:a05:600c:1987:b0:483:79a6:e7e1 with SMTP id 5b1f17b1804b1-48398a4839bmr43351755e9.7.1771429310098;
        Wed, 18 Feb 2026 07:41:50 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm45102522f8f.16.2026.02.18.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:41:49 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-telnetlib3: Upgrade 2.0.8- > 2.6.0
Date: Wed, 18 Feb 2026 17:41:43 +0200
Message-ID: <20260218154146.3267220-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218154146.3267220-1-leon.anavi@konsulko.com>
References: <20260218154146.3267220-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124487

Upgrade to release 2.6.0:

- new: TLS support (TELNETS). open_connection() accepts an ssl
  parameter (True, or an ssl.SSLContext). create_server() accepts
  an ssl parameter (ssl.SSLContext). New CLI options: --ssl,
  --ssl-cafile, --ssl-no-verify for telnetlib3-client;
  --ssl-certfile, --ssl-keyfile and --tls-auto for telnetlib3-server
- new: the default server shell now displays Ready (secure: TLSv1.3)
  for TLS connections (the protocol version shown is negotiated
  dynamically).
- bugfix: telnetlib3-client now sets terminal mode to the server's
  preference via WILL ECHO and WILL SGA negotiation. Use --raw-mode
  to restore legacy raw mode for servers that don't negotiate.
- bugfix: telnetlib3-client declines MUD protocol options (GMCP,
  MSDP, MSSP, MSP, MXP, ZMP, AARDWOLF, ATCP) by default. Use
  --always-do or --always-will to opt in.
- bugfix: log output "staircase text" in raw terminal mode.
- bugfix: graceful EOF handling - connection close no longer prints
  a traceback.

Fixes:

WARNING: python3-telnetlib3-2.6.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with hatchling.build,
use the correct class [pep517-backend]

License-Update: Remove garbage characters from ISC license text

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-telnetlib3_2.0.8.bb            | 14 --------------
 .../python/python3-telnetlib3_2.6.0.bb            | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-telnetlib3_2.0.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-telnetlib3_2.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.8.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.8.bb
deleted file mode 100644
index 46f72b8f08..0000000000
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.8.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Telnet server and client library based on asyncio"
-HOMEPAGE = "https://github.com/jquast/telnetlib3"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b2cbfe1ec99d8830fa20d62c8f21d0e8"
-
-SRC_URI[sha256sum] = "08a2a7a3a6790f89617442b7d491da8b531d87706fffd6a33eeff57ac440b752"
-
-PYPI_PACKAGE = "telnetlib3"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} = "\
-    python3-asyncio \
-"
diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_2.6.0.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_2.6.0.bb
new file mode 100644
index 0000000000..bef533b39b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_2.6.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Telnet server and client library based on asyncio"
+HOMEPAGE = "https://github.com/jquast/telnetlib3"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=15abe157ad6f0b483975cc34bcc1aa99"
+
+SRC_URI[sha256sum] = "c231e790c626f5b6927a4a85e79bce18cde994c9424254d2193582b430972164"
+
+PYPI_PACKAGE = "telnetlib3"
+
+inherit pypi python_setuptools_build_meta python_hatchling
+
+RDEPENDS:${PN} = "\
+    python3-asyncio \
+    python3-wcwidth \
+"
-- 
2.47.3


