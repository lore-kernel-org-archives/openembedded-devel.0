Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B496D63959
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 02:08:39 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.1563.1732154917123193303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 18:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZAgI8vhr;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7206304f93aso360229b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 18:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154916; x=1732759716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ngm5lWxnf9mow5YsMc0kmJx0qz6007VGW0+6U4y4lXQ=;
        b=ZAgI8vhrUqvd2vdnDuMGmFK+wxca2JwhP1mcpuH55PEUuI8C+BnI8NMiZtQw6AWZED
         6dxHP3WmEfgB1fQ6G6EorvzCP9vhUAVeJRrdiVRU0M3VCpjrMufs9ncZHyMIF/ry1TiP
         hp8vad8RFgN+jZ7ACDD7RF3PQvQyQxYO143phleq1ykEnmVYRASig6U0bgQ/F6p2ldP4
         Mfwx4Tsh1SwOliFS/uZ0zFJPsZFiXasS3Iy28FN/NKmEaPnjr1VrgkbFxQAgBOKNCo9Q
         6cdpQ1l5MUZjfy5TPX9MRrD68osZJ5lRRTenEqXALZ++nKaZbqBYaX2574eRFbQdAuLo
         aLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154916; x=1732759716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ngm5lWxnf9mow5YsMc0kmJx0qz6007VGW0+6U4y4lXQ=;
        b=dzPoguzU5z9Ybhm5Nd61+8ZDp2q53hS1TSA5BYCNGJ45105IwltB+NUcMdXHsXWVFp
         b9AUJh47o9BvQ3MdxZ71ZAhkEizbVIevroLlPwSHbYKVWm2rCAjuNqLdwEgH7x83h/zq
         4eZvXdcEcPvGQCXTWbTqlGp+kt5+G+4CGj3IZz/GlOYVtF3bTpW2VBd0Aw1hptEAr1Qy
         YtYsko9TKj5/gna0HM4lDlKC/vPHSKonkLKtysB3vBKRe7YPbdO5jBx/EODyfT/TK7Nl
         aOfDDWl5Qok8/CFyOFkWCYVNr6mDtEgkZWi/73eEtLar1yvOZOhDZFLHam4rlNuotW6F
         38YA==
X-Gm-Message-State: AOJu0YzgoJ7m1w3YFGHZhBEGNPCIjTlx53s7CxThxXskbahBEu9fJuio
	5NDHy3ajlchistlNYaTJOve2HB3UnAlqHtCzqfg9Mke/08xjLdRdy64Meg==
X-Gm-Gg: ASbGncsIx5OCEutArdFMnydejUiWKDNa+gQE2C9mtVzw7fox1Sk1PovoFN3S+/xI8pW
	CNH728d7LZWwb0WF/K3aawUbi/yQ1tWSnI2Smm/VLg1F8a2f0l+6mgrdjPT/MwDv1OPn12OM6Fn
	g4XEwXZ0j0w6ts46VePuFqNZypPFx5XLhRVeCENnHVyMXr7DJuYQOnCWHVzGXfMK14teLn6NCpI
	zVXGKLI/NUwc0YXx0huJu/vErLZBsSQLVYv7ps/JNbZ25VX2UoP
X-Google-Smtp-Source: AGHT+IHRQM95scpn6i2RX0jQwXZV/bIzj1fUkzingL6zS7BH9bW0liIFZtpcJZyiiTkiqHRbccWeiQ==
X-Received: by 2002:a05:6a00:c81:b0:71e:c0c:5996 with SMTP id d2e1a72fcca58-724becf6b81mr5787357b3a.7.1732154916275;
        Wed, 20 Nov 2024 18:08:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beef75e1sm2397550b3a.41.2024.11.20.18.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:08:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/5] python3-pint: Upgrade to 0.24.4
Date: Wed, 20 Nov 2024 18:08:30 -0800
Message-ID: <20241121020831.884684-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121020831.884684-1-raj.khem@gmail.com>
References: <20241121020831.884684-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 02:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113948

- add error for prefixed non multi units
- build: typing_extensions version
- build: switch from appdirs to platformdirs
- fix GenericPlainRegistry getattr type
- Replace references to the deprecated `UnitRegistry.default_format`
- fix: upgrade to flexparser>=0.4, exceptions are no longer dataclasses.
  (required for Python 3.13)

- Drop the backported patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n-True-for-Python-3.13-compatibility.patch | 116 ------------------
 ...-pint_0.24.3.bb => python3-pint_0.24.4.bb} |   4 +-
 2 files changed, 2 insertions(+), 118 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pint/0001-dataclass-frozen-True-for-Python-3.13-compatibility.patch
 rename meta-python/recipes-devtools/python/{python3-pint_0.24.3.bb => python3-pint_0.24.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pint/0001-dataclass-frozen-True-for-Python-3.13-compatibility.patch b/meta-python/recipes-devtools/python/python3-pint/0001-dataclass-frozen-True-for-Python-3.13-compatibility.patch
deleted file mode 100644
index 6f9b0f5bca..0000000000
--- a/meta-python/recipes-devtools/python/python3-pint/0001-dataclass-frozen-True-for-Python-3.13-compatibility.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From dc729d5b6574e1c44ec12e13b68c2b900e4a7ba1 Mon Sep 17 00:00:00 2001
-From: Simon Willison <swillison@gmail.com>
-Date: Fri, 12 Jul 2024 17:23:21 -0700
-Subject: [PATCH] @dataclass(frozen=True) for Python 3.13 compatibility
-
-Upstream-Status: Submitted [https://github.com/hgrecco/pint/pull/2037]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pint/errors.py | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/pint/errors.py b/pint/errors.py
-index 59d3b45..f080f52 100644
---- a/pint/errors.py
-+++ b/pint/errors.py
-@@ -81,12 +81,12 @@ class WithDefErr:
-         return DefinitionError(self.name, self.__class__, msg)
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class PintError(Exception):
-     """Base exception for all Pint errors."""
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class DefinitionError(ValueError, PintError):
-     """Raised when a definition is not properly constructed."""
- 
-@@ -102,7 +102,7 @@ class DefinitionError(ValueError, PintError):
-         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class DefinitionSyntaxError(ValueError, PintError):
-     """Raised when a textual definition has a syntax error."""
- 
-@@ -115,7 +115,7 @@ class DefinitionSyntaxError(ValueError, PintError):
-         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class RedefinitionError(ValueError, PintError):
-     """Raised when a unit or prefix is redefined."""
- 
-@@ -130,7 +130,7 @@ class RedefinitionError(ValueError, PintError):
-         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class UndefinedUnitError(AttributeError, PintError):
-     """Raised when the units are not defined in the unit registry."""
- 
-@@ -150,13 +150,13 @@ class UndefinedUnitError(AttributeError, PintError):
-         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class PintTypeError(TypeError, PintError):
-     def __reduce__(self):
-         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class DimensionalityError(PintTypeError):
-     """Raised when trying to convert between incompatible units."""
- 
-@@ -183,7 +183,7 @@ class DimensionalityError(PintTypeError):
-         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class OffsetUnitCalculusError(PintTypeError):
-     """Raised on ambiguous operations with offset units."""
- 
-@@ -208,7 +208,7 @@ class OffsetUnitCalculusError(PintTypeError):
-         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class LogarithmicUnitCalculusError(PintTypeError):
-     """Raised on inappropriate operations with logarithmic units."""
- 
-@@ -233,7 +233,7 @@ class LogarithmicUnitCalculusError(PintTypeError):
-         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class UnitStrippedWarning(UserWarning, PintError):
-     msg: str
- 
-@@ -241,13 +241,13 @@ class UnitStrippedWarning(UserWarning, PintError):
-         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class UnexpectedScaleInContainer(Exception):
-     def __reduce__(self):
-         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
- 
- 
--@dataclass(frozen=False)
-+@dataclass(frozen=True)
- class UndefinedBehavior(UserWarning, PintError):
-     msg: str
- 
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb b/meta-python/recipes-devtools/python/python3-pint_0.24.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.24.4.bb
index 337f587202..88efefff58 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.24.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
 inherit pypi ptest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "d54771093e8b94c4e0a35ac638c2444ddf3ef685652bab7675ffecfa0c5c5cdf"
+SRC_URI[sha256sum] = "35275439b574837a6cd3020a5a4a73645eb125ce4152a73a2f126bf164b91b80"
 
 DEPENDS += "python3-setuptools-scm-native"
 
@@ -16,12 +16,12 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += " \
 	file://run-ptest \
-	file://0001-dataclass-frozen-True-for-Python-3.13-compatibility.patch \
 "
 
 RDEPENDS:${PN} += " \
 	python3-setuptools \
 	python3-packaging \
+	python3-platformdirs \
 "
 # python3-misc for timeit.py 
 RDEPENDS:${PN}-ptest += " \

