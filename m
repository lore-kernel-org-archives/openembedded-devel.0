Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B2FD3C554
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:26:23 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15635.1765373178340195720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CLiUkTMB;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so8419496b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373177; x=1765977977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSAGn14C1h62N8TCk4/SFmZhWZ+b/QbyaNYIj7STslw=;
        b=CLiUkTMBQ+sGE2wJMhZ1EtIVOHLZ1S9nQxytR3SlrpQDUnQuPAb2FlD0lV0EFywf5t
         NU4KGgfaKNXnf7vnu0dreTLvdtfAgndIVx/8btleB/sTxe2DHhkADjE4grHw1LpewJtP
         v7PVmWudM+Vhtxjs+BJ4QpbDKfj0v/CyrC/eAOV1OMVyuYHE7BEFkSL0rbCSOjOIvXiR
         IU3wYDESnlvP101hrlh/orqv4GhYEjqUXJ0aGKvJN06C4H8Qt503VEkascEQQDa10uOP
         nt1GxbVkmlQ//QDpC3P3duK60XeS5VmJbZh2FUnd9nro3Toeu/xP2Z1YeVn82wtqIxLx
         0rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373177; x=1765977977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uSAGn14C1h62N8TCk4/SFmZhWZ+b/QbyaNYIj7STslw=;
        b=XAFJz98VWH5bR/i0mdqbp8MgVqkp7vbK6xry9Jb9Sur3y3TVinU4tyiqfVMNsnCLxN
         kcOjQTa4UuP10oyMqnPZw5oMro4rubGfPEPlDu29l4zRuro7trWikudlEVCdbtiTACSm
         5g+i7ihPN8Wb+hgq22kfb+U9VfCAIFS+gIawhf8LJ5dPfkqEskpGlQbBO7wfzYzU5GWd
         dGDkQyRn/H+9N/332XbQhGGwrnF9cs8bFaHqhmk+UGQkFEigT12Jd79BX0FgqXxDjeoQ
         AbpoKfiW8cdWAiANZNxGmMnXonfi4/zJk555veTxNTcohl6uvv7Zj6Hi/H25Ck7yvdqU
         9yXA==
X-Gm-Message-State: AOJu0YxZBzJYxCZNpkA1oMR/1Oy5ZrehAelNHv69EOxkudD1jHgVyRiA
	WpbyExQIH76RIrgzLl7WMpv/2DL6DL3gQH2hxLzBH627B4B+Ee1mnKM5xw9eaQ==
X-Gm-Gg: ASbGnct5ds9v2Czbe7GtYgM1vqDaOMBwjv7tjqa/D7qyMFh8PN0Z8XN32OeaChg79il
	3FRxkd6uBXAYnXHVraRj4uHGZyKi5cde2B74VPhR7op4euicLK29XW4K4DlED8kAv+tYXtHp3xk
	xhfcvFrS7rtOYML3SEzxyPS5gZVVifiotTuoVoO1wUKr+IB2pVSLvAsmDVz30up4xQ1Xvw23MaP
	J7VYBqVnwsl3GuRdLYJUBIohpPSfFWf5I66BvBU2/GLolvTyaV61SnN5YwpEVHI9wy4oK42F5Wi
	/TCmRqFno4ed6C+EFudKEVOll2pdBUiCHFdQdnLhwAovJm4H45t1IiUYvtDzdUjIbVfqml87Lfq
	Ja7un+qe20uHCo14K9kYCcW+X7VFs7XHGM8T8AszSw1epsdI/LqyINFrombEIScvWDAAg1mLktf
	89aE2zTq4fOR0Jh4PKHJHsxZ8=
X-Google-Smtp-Source: AGHT+IFNkLuDbWszlNWBm1i7dpu1ZxF9zowhrmUHgsVCD/G+kKPC+FIXXW6wN3oxvbh38IyHxzlpNg==
X-Received: by 2002:a05:6a20:158b:b0:366:5d1a:c736 with SMTP id adf61e73a8af0-366e03c7b2fmr2148753637.9.1765373177487;
        Wed, 10 Dec 2025 05:26:17 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7092b1c1sm2550009a91.15.2025.12.10.05.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:26:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 23/43] dbus-broker: upgrade 36->37
Date: Wed, 10 Dec 2025 18:56:02 +0530
Message-ID: <20251210132604.317279-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132604.317279-1-ankur.tyagi85@gmail.com>
References: <20251210132604.317279-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122527

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changelog:
- Add `/etc` and `/run` to the search-paths for system services. This
  change is aligned with recent changes to the reference
  implementation.
- Support systemd's `notify-reload` to trigger a reload operation.
  This replaces the old `busctl call ...ReloadConfig` operation.
- Extend `org.freedesktop.DBus.Debug.Stats.GetStats` with all the
  fields defined by the specification.
- Fix a bug in match-rule processing which caused argument processing
  to fail for any but the first message argument.
- Fix a memory leak in configuration processing when parsing invalid
  user or group IDs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c7812d7f9f598e3958c8ade1d18523d97efc7976)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-core/dbus/{dbus-broker_36.bb => dbus-broker_37.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_36.bb => dbus-broker_37.bb} (93%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_36.bb b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
similarity index 93%
rename from meta-oe/recipes-core/dbus/dbus-broker_36.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_37.bb
index 8959927a92..f0312181b6 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_36.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
@@ -11,7 +11,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d333d99bd2688135b6d6961e7ad1360099d186078781c87102230910ea4e162b"
+SRC_URI[sha256sum] = "f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+)"

