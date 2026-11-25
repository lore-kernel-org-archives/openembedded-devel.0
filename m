Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37956.1795594122259485094
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pf+4E0Bm;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386b8f2f671so2583399eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594122; x=1796198922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=taFA/cZhP56WTYsjzK4YhHYRrsUvCamwJO4DJEitGcU=;
        b=pf+4E0BmbSce1lZzjrmQuM/tQYJTTb78sln/6yFeA5PabntayRN9s01uQITG3oSM5u
         /jtlKLHUqmIG/TcwpRrk7Oer6J9SU+ShsgIivdk0pVqdDENX49m+WxMN9pC+5t3e1Mpt
         JV/XXBhW+fgPx+s7wLc7bhtE+1FzScOC6Ag9oG7fOj71un7Xw6GSvvJLyDOxttXHy6Ew
         0UK/hpkbkToag02DnRspL5sLHaJtzho17twAC+eft0Hmw3Cy0hB8UWPnI9UJlhgmf9Eq
         hQtU/Q61/oUmqylAbWyRSBF9CuPUtbFZ/rNJSHhi/b2BEcUB3AuKnSdUoxVDKSb5F4+9
         EFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594122; x=1796198922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=taFA/cZhP56WTYsjzK4YhHYRrsUvCamwJO4DJEitGcU=;
        b=AnWLzj5C/SbzcwB7egBxSU/nFPpNKbVxgQR3bV1R4BTP2KcdYg0gwHoAP4flpqjaNU
         GDUJjTG1Lp+wAXUyGFoUiC0LczRO32lNtnUyqKEfCYA/uftYCA5VmcCkCLhp/82R5hia
         kj6kgrplmHITeFpyS/eIV1mLvsF30bjBZUjNgPEvp2zvYrniiTqtwFLz0qLekKsabW/A
         QohfnrkJLfgE6ume8dVjZeOa2r3H4AV00cAIaVSEmBIXmPO363XhKSQ1GykhTt1fw/8N
         DtNPYrZ9dapUqejbX1ezE4AWzGSYAkOnk2IqZGxIx72IT2jH7HK/flR+g8OblPJJr6t8
         wheA==
X-Gm-Message-State: APuU4Z/JMq+tpmpUvhAOu8r2nXyTyibNA75DoQmBxQMXZ8L0o+l21jEm
	/52p001ujcOe9lIcJ84KPkYAs72w3ZURYeECgBR/15S8SEaik2HnBXlIZpgHOV8V
X-Gm-Gg: AZFdTZdlk41dTiqLRzRmMU+f60m7hlpOYpqgsU+nlRjfSZ1jT9lJjym1Y5hp9Z43nNb
	/Fvf/gkCBEQagF7cD252pK/a4VhefIMwF95hcpSAu5gsABFB8HY5IHraN0LoPY/L4GyT35MCUHU
	L7iBIRy6SaPhJ9aDyoSARWyuazITm5dABIFON6WRIgN7WjpkvOPk+Z7C9Jbhl4r7hOOSa8ugMRp
	RTokZOV67rSGkNqBZAzlUIs2e7ug1A+RxmPVsq6kj3ba/e3qd1BdYR6IbBv5qJZf8e+B/uyU9oX
	0jZthp4srOcI4yaxQO+gOzysg4W9nHUmy6pnOPUiWy957vfpvrdCI0yzXSdYMcT8dTkNOIiXjoX
	BxfWa/CYooVJxl+HTDQT06y3Oj0M1i6TMA+dSjaTLDNNJEPErtSXAgmtPGo9ZhCija5H3MtWsbM
	tBH+4UlxkIEsaD9daRQBIz96tNJy8zRBXE9p/7LKIzy4c2+UdV6EX0YUh+F/DhKh1IfnndJYR4M
	V4HnxRiHaXEXrIvYHivzqKECWr32QJhfG4f0rGlvScVNr6kxF6cwa9pjoTgq9htCT2fUG8eRZGW
	yI7sDDNEZeYdKObL0mOKOfUZ+f7R2VhHUbjmZNvhpWwPb6JJmSQwWvTRi2lfSM4w0+vyC7gbXx+
	e+WmCkdeI1gxNdtMPkSvNYGQNd3NLEGbEUc+mp0MaPWJ9wAu+DwIkjo9ooVfKlYfg+2JzWrJt1I
	mvP3zK5jC+il9ubwQigEhM23S/8z98M1OKk1tGFl4Yc6iW1aNUxo7qD2BvB99lzOg0hD7n3buWF
	1vvQlFkHaM389degWIlM8TDJ09kcvrhhVoqv6ouMtyeTUpKJWNuACCvidDq+eNjwjnaAn+z8JXZ
	g6K3
X-Received: by 2002:a05:7301:6408:b0:383:1bfc:f1c0 with SMTP id 5a478bee46e88-38570f27a56mr16915532eec.32.1795594121591;
        Wed, 25 Nov 2026 00:08:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 48/55] sdbus-c++-libsystemd, systemd-repart-native: upgrade 262 -> 262.2
Date: Wed, 25 Nov 2026 00:07:04 -0800
Message-ID: <20261125080732.2419614-54-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133051
Content-Type: text/plain; charset="utf-8"

Both recipes require oe-core's systemd.inc, whose SRCREV moved to
v262.2 with oe-core's systemd 262.2 upgrade (4ccd16d6e8). With PV still
262, the fetcher rejects the source because tag v262 does not match that
SRCREV:

  The revision the git tag 'v262' resolved to didn't match the SRCREV
  in use (8cc40e0c... vs 63511d72...)

Follow oe-core to 262.2, a v262-stable bug fix release.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{sdbus-c++-libsystemd_262.bb => sdbus-c++-libsystemd_262.2.bb} | 0
 ...ystemd-repart-native_262.bb => systemd-repart-native_262.2.bb} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-libsystemd_262.bb => sdbus-c++-libsystemd_262.2.bb} (100%)
 rename meta-oe/recipes-core/systemd/{systemd-repart-native_262.bb => systemd-repart-native_262.2.bb} (100%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_262.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_262.2.bb
similarity index 100%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_262.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_262.2.bb
diff --git a/meta-oe/recipes-core/systemd/systemd-repart-native_262.bb b/meta-oe/recipes-core/systemd/systemd-repart-native_262.2.bb
similarity index 100%
rename from meta-oe/recipes-core/systemd/systemd-repart-native_262.bb
rename to meta-oe/recipes-core/systemd/systemd-repart-native_262.2.bb
