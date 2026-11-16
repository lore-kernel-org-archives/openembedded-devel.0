Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33681.1794851743700865649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RrPxBCmf;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37071c0f42aso5534613eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851743; x=1795456543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jloNvh58xhWe6Tgx1XAvMoqAF3JVvElz72nKl1AmMuQ=;
        b=RrPxBCmfbIGs5pgR9aMWdbgoHrPpnhO3qUdK4GuVPS8EOmUpqqjGwOp+uSfiBuyW0z
         sZjI27s+gNVwpoMhRo4kQY4bZu1T7ApCcyv1hIwyeuo5iAAb34JoEfcugo83IAbkGOzA
         uQ3f3VS0XM1pktq5J3eUWJUwAKDwTiJwabf+wPB9m6SXaAyoalrMIbXEX0ELYbYmtF5v
         cpw51QVwpZweapSLQmzDPAmTkk2B2MAWsYsM0fOKL6BSe1I79gpHOQySKym1dVNuiHnO
         YucGrPtsmbZIqVtwGyuyWj17G7fhT4gIu7XV++o88QYiTX7ahlitU+D5FDYszHRuH8XF
         QK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851743; x=1795456543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jloNvh58xhWe6Tgx1XAvMoqAF3JVvElz72nKl1AmMuQ=;
        b=FWITIa+aTerdXy9uU3jAMpWxwq9DH46+8eI6EV7nYtm/0TiOt8qLHFKyyCbxyFRkoT
         9tTfi19tArQcDAC/HWCnDhaEkix8zmMaFrxHU83enyTISwBkam8ThkLJoOpZ8mfYEo+g
         E6wbJsutvKXZLmvU/PqF3Zs/hL0TGcZLtfrrSM/INc8SugEJ3ca5eEthoxF5i1St83aU
         e/aH7WOkKYENHIdscI58x61r8L7BWJyl1rYNjKXsiq49WJYB3T5DLe16nlbcZvFB0Jxg
         jLsUR5e9JT8fErZ4vvSqPPxJWFsLP3O431cVTdJ1xg4DBDzhFafabc/QtnSU6v//uWuM
         lZIw==
X-Gm-Message-State: APuU4Z94CXzkzXM6eM8lQ3hvKgSkATwjTqHthpWxIofOXzKh5vS49bv1
	IhNptluEOg4lIL5eScSeb8SWmppOGUSR7IE7A1PRDHZsaxuoR/tO99yhDWvSUwne
X-Gm-Gg: AYBFou2F5Su8dlxLLd4yKJdy4JtMCmYr0h3w+7YcZvQPrTPq4w+LODO+8pc6dpW8iyr
	AwoV9gFkaANW2dMR0eWfRVEy1bUPQJoPZs9qSXVJol0iqBzeLc5+/fL81u16jLThfua2IzQAzhl
	EWaiYYXtkeVtYM+aKdrwhRLvxUPjV5kg6/FWWqEHK2cKL4dh4Vcs5ODrP1XOTEfrCwx6Ykmo1Nx
	7X0tiiF3giVBBlrZ8CykI3Kke8S7O1EfJk6jGAJxMXoiLyzjKc+fEojLBOexCTEQ3+F3dHFpGpl
	CXfFSEqwm4G9xm8Rsvp78w27NXviKkRLmZ8yAKBZSvhSAR0gQBylv1AzRVDSZRjHVz2zutijiRH
	K3YYxXbXir82SRDXzZpDHpiAOuGkjyx8uVrYDONLFd/SBLqHaaJ2F4OT/o2MLIOgy5dPN53Z5Fn
	E7ig4nlrKn78TiwbR4MG0NHO7k91B7/PomeIMphPlS8ygp8+GPXpyH6AwW+vFaZI8tFaAHpxW6d
	ytHHZSuLCkxJOVhYZmDy6CNBTYIkcnei33rPtybkrH2MilNMsRs+XbB4ayC3qhfcrRK4NSFBTTt
	E8BbChtQZTbDM+dM/VAJNuzJarmifTLQyvxkpqo0d06ZOez4OETvHYrrhglA52ALVNWPIvvFlTP
	/aUo/iDJR29SIYS9dd3eya3cbmDpSeW8ITSRS1QezRZTVIER/mmdTGWrC0IFaaxNe6f6rXQiRyM
	pqVhlxJte9Q5KkclauvlfImvX2XhPiYbGtGSSa9CwXjh4x+jbCkAuHexlNEn0q3tjvxpGbJ8+CW
	bDL21fMdOgqR1NqKZu1MZJjtHjpgNci4yWuxMk83adheIvr2/7XDf2hGkwKz4EZOTPBksEnZWqy
	IIAS
X-Received: by 2002:a05:7300:d40b:b0:376:b957:c08 with SMTP id 5a478bee46e88-37966c489d6mr12069541eec.9.1794851742953;
        Mon, 16 Nov 2026 09:55:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 073/105] python3-pyproject-api: upgrade 1.12.0 -> 1.12.5
Date: Mon, 16 Nov 2026 09:53:25 -0800
Message-ID: <20261116175359.342679-73-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132529
Content-Type: text/plain; charset="utf-8"

Add hatch-fancy-pypi-readme to DEPENDS, now required by the build.

Changes:
- 1.12.5: ensure_empty_dir replaces a symlink instead of following it
  (a link to a directory no longer has its target emptied); propagate
  filesystem errors when clearing nested metadata directories.
- 1.12.3: clear stale files from reused .dist-info directories.
- 1.12.2: backend fixes (trailing space in PYTHONPATH, BackendFailed
  pickling, non-representable stdout paths, stop backend process on
  interrupt).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...pyproject-api_1.12.0.bb => python3-pyproject-api_1.12.5.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.12.0.bb => python3-pyproject-api_1.12.5.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.12.0.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.12.5.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.12.5.bb
index 299df5f913..9646ff651c 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.12.5.bb
@@ -6,12 +6,13 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "2e83226079dc446a8e2357def7622c01c733284e39afc8e332d9f722fe0c2beb"
+SRC_URI[sha256sum] = "0795693708f631af4c665ab02a315edc0fb97471f1d52e4a6179ed60504e96bb"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
 
 DEPENDS += "\
+    python3-hatch-fancy-pypi-readme-native \
     python3-hatch-vcs-native \
 "
 
