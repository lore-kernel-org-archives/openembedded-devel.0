Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23235.1794814548197035564
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tLY7mjrk;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso19707225e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814546; x=1795419346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WQMliRHJZdNwdx+bT4XQnq3AwTxRH3C4+r9c/U0lps=;
        b=tLY7mjrk35ni4h5E36PThdoDzi6Tah8irEmq0R6veCYMlqtir49iZIX8VRyAxE5uE3
         IL0/ZtoF+HAYjhpWbSxfoPEXO87azG9nVOQUgVEoiLHU3IBsBXja6QHL1Co07Z37OqLP
         DWmkNzdZCypyjGtcfFYkkquU+mL2GEhv6izlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814546; x=1795419346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6WQMliRHJZdNwdx+bT4XQnq3AwTxRH3C4+r9c/U0lps=;
        b=uUzMgpmgPhbZgssru0bcX5d0vB3wV7UJKWJCwmRjjQieYSBojedpCiVtzXTtF0h+9h
         HP+ir8Uza2znZlEfJU1SJA2KSRMLp8GAe/uG4eVxkQ7rVW0gOQrU9o6HJE6nIaZt0tY/
         i3/sgiqX+/wOOWSdqrxzjtr4bASu3qWe0DyhrAmRHU1auuLFZGOrSTWQHAhW8tBATfsk
         TgzY2wK696bcevj0j0v0t/kTlHgVisPodIjzt+CQ2HxaKzRCbw2eqIHYasRVR101Zk2+
         KwTPi/LfTCUq8F33w7J1RDQAsZezgcVeIiDnzssNYi6/9njgbrKcC/gGzYxEVwmzfzfI
         LWIA==
X-Gm-Message-State: APuU4Z+gtBAHckK+3d0i6Nb6NGWnRzU0eX/H3zFmMctKqRUMJOy9zlHI
	Xu9rw22/GyzSvLwOUS3/bBZFt9qO2pjeDfAn880/tiWT0yROajQdyeJNM4C3+kVg1Dp8vrVnaEe
	Y9qH8
X-Gm-Gg: AYBFou0LlxiuW0i0e1qH2K3jfeRbyKYKWOXYIpMQxK072AySn+iD0VV6zMAM9XoVl0R
	USxg1tnP80/QrzOFX8D1Evv17HNGC0kNGHZ0jIIHBiEJb5Cqmd2HxKFU45xHelpGtenTWpW9VOh
	/ks6Wz0EtfboMZYtwWCf9zd+x1VCoulSfbW/62JBrCAdgz3ftolLiiIE4pY2oRCuQtP4cAEfiMz
	Lcgv8Y4uQRgFE3UsbE9wkDFWWWq4KqSEhU7Nsh3I6hpdiMs9xQ1gXqknAveRna4Zmp/+E6BBCCX
	C/80lvzUuw4F4N6jEz1cwJRG30+qjyyOPlfMnHYMoCZ19ldQmfcjEhKVRGbaKxQHsqUdNeBfTLD
	oZMm9T2li/m6O5UZFboU19hZ2dWXce3Swz/T6no9Y78QuncrmMyjSqbxyw0wEq5/ZZ51pD5OTjf
	l0ze+ZlOsZeZvfuXXe8r06tGns/+zMPDfZqnz91Wb6If7XYKDtHXavLoZJ4+oXfkiKZ1iLwEB2E
	warvDw/9kD+uLvCMYwm0csv36a2PwJyQRbRs9EmpEsIG7EVBhuvVgs6G4H14V3w3jUYcHTGUNME
	7/cBnISa/b5S32CXJp/0Rjrd34oZCpbq7D2lOupqg4SEHItNHINgXP+eDsJ2l+z7g1TqEeQlaT/
	kywtnzAIAzwFmCB9R80hqjBkvjM4LQoITCvxTfEoU5o6O2gHWYVCF6w==
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb5de1f262mr145317235e9.26.1794814546494;
        Sun, 15 Nov 2026 23:35:46 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 14/24] python3-semver: Upgrade 3.1.0 -> 3.1.1
Date: Mon, 16 Nov 2026 09:35:21 +0200
Message-ID: <20261116073532.880420-14-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132442
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.1.1:

- Reject invalid token arguments in Version.bump_prerelease and
  Version.bump_build
- Fix: Increment old-style prerelease with dot
- Drop build metadata when bumping an old-style prerelease
- Compare long numeric prerelease identifiers without integer
  conversion
- Fix: validate and match prerelease token prefixes
- Annotate supported bytes inputs to Version.is_valid
- Preserve version order when switching prerelease tokens
- Preserve version order when legacy prerelease counters roll over
- Preserve constructor TypeError in Version.replace
- test: cover six behaviours found untested by mutation testing
- Use the integer index protocol for Version subscripts
- Bump version 3.1.0 -> 3.1.1

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-semver_3.1.0.bb => python3-semver_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-semver_3.1.0.bb => python3-semver_3.1.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_3.1.0.bb b/meta-python/recipes-devtools/python/python3-semver_3.1.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-semver_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-semver_3.1.1.bb
index 45664c6be9..867124ab01 100644
--- a/meta-python/recipes-devtools/python/python3-semver_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.1.1.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/python-semver/python-semver"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3ce011bad2c5218ddd4973952a6db93a"
 
-SRC_URI[sha256sum] = "14bc073439513d7773662a338f4db9829cf16c12b74b9568e2d2689975fbd7fc"
+SRC_URI[sha256sum] = "149b26cabada6f63212f97e94505d21578cb1d280cf714827f328d5e70765fea"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3

