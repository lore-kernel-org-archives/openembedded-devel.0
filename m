Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12020.1794070363131408213
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ruOwzmWc;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49134c8509fso1358166f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070361; x=1794675161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DkmznSY2A+ArgPlDYWnzCNjNvfPPCtKE+d57xHb9fA=;
        b=ruOwzmWcCptvAS/pfgy1UnwdMAefVBFFdtKfZHiX1GzaDnUlvFYhvuwZQ7EMYSQZQ3
         EsJVvMKsQLdfcPk3XfJnmIczAutZBFepuqr4nvYSd1xuur40vmnB9bddl1tMfuMqqYuF
         bwUFUL7uXJ/4cNfheP1eL93pE2S0QXNr0GCRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070361; x=1794675161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DkmznSY2A+ArgPlDYWnzCNjNvfPPCtKE+d57xHb9fA=;
        b=xqNzM9NejyaNT5fzJHm9ArMEIzW+6VWbzKBircgocK63dY6OpVxF21E3dTFo5NZKLs
         FETj5I5aizqZfmLRkwxv5SxFiO/3BeQeeQjqRc/P3AYCggryvlwlbWbeMhkk9tG62FFJ
         43r+1g/4iRzXqJG766UhpwV8CDy0Zi1a2/FWZaP0zM8znQlwHxSIfxTfOPKernOVKSqm
         VgMxoSjIt+FSyzjae49rb0Lh9KOcMiwHXCZIEldXJ8npfAJIM0Va5U93F1dKyF+C5KNd
         5tcjX4PGhg7Wa5YLFXsYOqBEUQi5X4z+ynJ7OuuYjOUaRFscaThGH8O4HB1xU8WKQeGa
         pIDA==
X-Gm-Message-State: APuU4Z93GYBp/hYWPXzedWlIaZBjITpg1seqWwvzR1v6Ci30ndubQQxz
	I/zVEBzIzYpvsLUUqy9rSO1a05u83MLH5TcqqZ0p+EhiAGC0WTRqIHOcIznp58zbh/SLP+tCXIJ
	1Uloi
X-Gm-Gg: AYBFou10uopF0U/rlKIvRFGykLJHah5UozQMAhD7cv16J0RVXsCgffsPhNFW16k3+8B
	cty+p1wk+KTlzY2kOpndQPu9OIY88tZfE8pmNyCWLD8o+Md6/lXrl6Lo6LLl9+I0M6k9ZE0/Uo/
	bXzxOQ1YtYGPz42RtHhFIw57pYdqBuR2FAYaTrgLdfbR4ttX2u3PAbEusb9/1qoJcbPGDAnbb7x
	YPLZOXHEAMbKXZPoFpk2JekNDSqOZ9Y6TUUV6XGmoQVPr3ardJ7IFhUkM/KPXyC4SW9EoLSAh3i
	yLiA16oXCoOXsZXvuzl3pVR6UFi35VHreu+Oq91b+gqdeIfGtGdR1Fh2gMQfRZurV1KATXlxhjF
	8E61CtPjBnL2aRiiAfZSfBGqc/r0AVtvu7x4o+z0uZJNi0VitLNfieVuSh44kiMH3VvVJbHa0o8
	ZbvN1zWXdxavF7F6x0Sypp49yKw5612kKwvBeao0Q+izeWYP8LJDHLpNURNppYKxW6yxLOwb+5Q
	2/DV1fLnwl7l2rtWcXSx3ofut8DTY6zbKfQm+4cj9mhOpRxSo8fpf3tuK2mV3VcrXeViu+Mbmzy
	S+nrI3PspwUjxjMKufkq/lWBVR0S723O1e9R95bzHLv8tpQBDx/6ZFfqA1wSCRToW+H4dch4fmC
	wvDt+spnuTuEKPatx6nsfdYk3qVaDewdsyDCBkC2qlF90yR0qwnoDcw==
X-Received: by 2002:a05:6000:1a86:b0:486:e707:42eb with SMTP id ffacd0b85a97d-492760da5a7mr11396845f8f.33.1794070361462;
        Sat, 07 Nov 2026 08:52:41 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 18/22] libtatsu: Upgrade 1.0.5 -> 1.1.0
Date: Sat,  7 Nov 2026 18:52:17 +0200
Message-ID: <20261107165221.122340-18-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132003
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.1.0:

Changes:

- Add tss_request_add_bora_tags() and tss_request_add_durant_tags()
  to the API
- Update auth client version and add Ap,Timestamp to requests
- Restrict Yonkers tag selection to SysTopPatch

Fixes:

- Handle realloc() failure in tss_write_callback()

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libimobiledevice/{libtatsu_1.0.5.bb => libtatsu_1.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libimobiledevice/{libtatsu_1.0.5.bb => libtatsu_1.1.0.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb b/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.1.0.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb
rename to meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.1.0.bb
index a9423f0b2d..9139c8be0e 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 SRC_URI = "https://github.com/libimobiledevice/libtatsu/releases/download/${PV}/libtatsu-${PV}.tar.bz2"
 UPSTREAM_CHECK_URI = "https://github.com/libimobiledevice/libtatsu/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
-SRC_URI[sha256sum] = "536fa228b14f156258e801a7f4d25a3a9dd91bb936bf6344e23171403c57e440"
+SRC_URI[sha256sum] = "96c8abd97552a4a0c487c701aba9a65d590c338dd331058ffb38304290b696c7"
 
 DEPENDS = "curl libplist"
 
-- 
2.47.3

