Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBE5C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 09:54:16 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.4723.1752573247313330642
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 02:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FxUOlG1t;
 spf=pass (domain: konsulko.com, ip: 209.85.218.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso1288839966b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752573245; x=1753178045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrFJhxyH2X2CCh2n0aN324cVUVF971qdIqwYXYdIT6E=;
        b=FxUOlG1tdthKYl3B7gguZ1dO5IkExRp/W22OEbMN7uNF0+Sumzw7YAL291Jl3Bd0zN
         chl9wyUfvFyr96cxtZMugJ+UWmb5ZvteFSNIULjQ+9Eh9FHiaRYyxHi+w6zz3xbMKbbl
         g2O1feWIyhneTuCFsSntDCowpadkFFqi8KkRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573245; x=1753178045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrFJhxyH2X2CCh2n0aN324cVUVF971qdIqwYXYdIT6E=;
        b=DyV+0ju2RpzBoZulk96Ik1BUczjRtD8b3P/jV5Iue4zc2T/qNmyC3d6H0hftHzJ31+
         h7EGMQnaZpfID9eoH9sMSrNAwtafHzYTqA2XOcaFgulJDWvpZCghRJz+aR8i5wUjeJnb
         OaEUtTTkxxiWhOqQ6qVoCh3kCOJXGoUdkNPm+iW0I45r1I+ebu76QdEc1C4ykbPT26ro
         r8OvTaXOKnCsq8ClVGakWPcd0bQ+aNHShMDoF4CivqeU46fVsdZwH75VAg78CMngfnEe
         SH4fK2NgiUYocdkQXNy0NdHDJgTMlurF3Zql9hwWOsz6xeeAcokhzYsDDwO2FZqgkuuF
         7a2Q==
X-Gm-Message-State: AOJu0YwJbXCJ/fc+Bbhn5oucCJiaYfBc5RyTz6SjsH4VXi3xnqFUQFie
	YMRvqZTAbMALpDd6wIT93psYMF7bf9ayn/BU51G7bxpHXuj98cH0Dklb+ZfGeDboM9blyH/aMiq
	p2MjO
X-Gm-Gg: ASbGncunbP7LbDRQM+f+Evh8dBKooz/r5wxGKW2q9QhPzkPSKQVWV3cuFIE8DWLQLag
	+4PWKC8RhDFm0Zx5IMJvNvsy1YM3XK8PVyqyqoEN1ViZEWEKL/ac1HKIVn+/M++rka2vEwf+E5M
	cg7Pk2MuQ+0ybCp5HEISOOGohoZ3LdaMydMzlCFgGzx+tzATf2cW10DwzXBzGEoRgKZiSTVG2dO
	duo3vXJXEncWfyYOK9ve7w9X61UY9Qe9Zds70XAprvvBX6Qo/6Zu9+/MKOH60q1wt7T56bGiEoG
	hym+G3FP3EwbFsjRwSTuVYBjzF+V9AYme8OFW/DfFfmpieZsF6V3SlBtL6iUAqwxlFn5S3CvCIN
	Gf+Bib/Edhnwdnbnk0LJ0drKRT5Qz9F1en9cv
X-Google-Smtp-Source: AGHT+IFo1xlzEOVnPF8NRA4cPbSMuVUgtMthnvXkeDDGTJ7bUGh5+Sac/UaWqs6OzgXfHzZyow7jEQ==
X-Received: by 2002:a17:906:fe08:b0:ae0:c1c4:645 with SMTP id a640c23a62f3a-ae9b5d7f353mr232570566b.21.1752573245183;
        Tue, 15 Jul 2025 02:54:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82652b9sm983670266b.78.2025.07.15.02.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 02:54:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-mypy: Upgrade 1.15.0 -> 1.17.0
Date: Tue, 15 Jul 2025 12:54:01 +0300
Message-Id: <20250715095402.591088-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 09:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118556

Upgrade to release 1.17.0:

- Mypy can now optionally generate an error if a match statement
  does not match exhaustively, without having to use
  assert_never(...). Enable this by using --enable-error-code
  exhaustive-match.
- Handle corner case: protocol/class variable/descriptor
- Fix a few inconsistencies in protocol/type object interactions
- Refactor/unify access to static attributes
- Remove inconsistencies in operator handling
- Make protocol subtyping more consistent
- Fix nondeterministic type checking by making join with explicit
  Protocol and type promotion commute
- Fix nondeterministic type checking caused by nonassociative of
  None joins
- Fix nondeterministic type checking caused by nonassociativity of
  joins
- Fix nondeterministic type checking by making join between type
  and TypeVar commute
- Mypy only supports Python 3.9+. The --force-uppercase-builtins
  flag is now deprecated as unnecessary, and a no-op. It will be
  removed in a future version.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-mypy_1.15.0.bb => python3-mypy_1.17.0.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.15.0.bb => python3-mypy_1.17.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
index ebcac51ea1..0d1e0bd16e 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "404534629d51d3efea5c800ee7c42b72a6554d6c400e6a79eafe15d11341fd43"
+SRC_URI[sha256sum] = "e5d7ccc08ba089c06e2f5629c660388ef1fee708444f1dee0b9203fa031dee03"
 
 BBCLASSEXTEND = "native"
 
@@ -14,6 +14,7 @@ DEPENDS += " \
     python3-types-psutil-native \
     python3-types-setuptools-native \
     python3-typing-extensions-native \
+    python3-pathspec-native \
 "
 
 RDEPENDS:${PN} += " \
-- 
2.39.5


