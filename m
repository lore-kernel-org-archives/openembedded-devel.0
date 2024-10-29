Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4CBD5B879
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 04:25:08 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.11975.1730175901338157762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 21:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EzaqlRZI;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e600add5dcso2322902b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 21:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730175900; x=1730780700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ejw2vZlsm+k2SYkHVFxgXpsDr6zlDOPyveM9IS86JY4=;
        b=EzaqlRZIbttt3f5NPtjhpuj6MaouD2BusU1ox7kw6eJ225b6GUtKA8oBooH/pvFu8N
         PiBz4NJPonkRgmG3oqM/kV0YIjXYhrhPLiSTwkvi3/eCDc09FwNl0CAM5OzRDRZh21v3
         YUPmcFjtwtdDmxf1ehsA/gt5B5SgZNgGljUYe8/iDfqjIhI5eXJfvd6VwWo8Zg3vifdY
         YT51eiS9hAQN3Efs+h63kPsT+BP0l+I0AAsVC2CBD7fGhtRlbAPhzwj+DIlc7dzEDzC5
         Q1qDXqvpYZa4dNW9/eLFVNl6cAQRM7lvPK69/agNDla2bcb93gWuARLPWBYzNxakxTM3
         olZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730175900; x=1730780700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejw2vZlsm+k2SYkHVFxgXpsDr6zlDOPyveM9IS86JY4=;
        b=wwDzFFWBGRcxF0TwfeGlsdnPXIUp1aSEdR8wWxbICu12GKe4P6pCqnXbN0VaxixmZz
         XBZ4NIBLR4elIuQ6JKuokTZ7z6Vbzo3zCK8M8pYQHXMBF527cBfVi79akp64x3U0mu9H
         4ouUVUlNwLZYZDZEp2Gbp9gqEGnYllDb0JTXBDcWmSAZ/5P0JverWOuWFOQZSUcg3Zi+
         36b0Roj9CFicXJ29hCYtIzq/rVxRGNE8n0VOojct2dLrqf0FA4fXfOxiZNJLBtV70ggD
         0upJTBtChtUs2tI0PVJaTXXbVQIlm2/igib1G2UZvkez1xG4r+lhqcm5161nl3M2jJ7x
         AQmA==
X-Gm-Message-State: AOJu0YxzPMKB/KO0mmw/3s25PlorUXNq99tc52oUlnSDjcOuxJLdaceL
	82xA0RgOTs6Di3pOpnFBK0Sv8XsPglPiZ9mOWJ/fv1vFaInSIV1er6UKziWo
X-Google-Smtp-Source: AGHT+IFyIJgz2DiWxxyQieTGcJGNGIObXtJCtdR3OPlcU0ilN0QIEpFfUcTn3anxSMoVbJ9pUas94w==
X-Received: by 2002:a05:6808:2027:b0:3e6:147:6c5 with SMTP id 5614622812f47-3e638440832mr10385634b6e.10.1730175900087;
        Mon, 28 Oct 2024 21:25:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8085])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8679cbesm6710198a12.24.2024.10.28.21.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 21:24:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/5] python3-pint: Backport a proposed fix to support python 3.13
Date: Mon, 28 Oct 2024 21:24:53 -0700
Message-ID: <20241029042457.4125617-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 04:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113317

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n-True-for-Python-3.13-compatibility.patch | 116 ++++++++++++++++++
 .../python/python3-pint_0.24.3.bb             |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pint/0001-dataclass-frozen-True-for-Python-3.13-compatibility.patch

diff --git a/meta-python/recipes-devtools/python/python3-pint/0001-dataclass-frozen-True-for-Python-3.13-compatibility.patch b/meta-python/recipes-devtools/python/python3-pint/0001-dataclass-frozen-True-for-Python-3.13-compatibility.patch
new file mode 100644
index 0000000000..6f9b0f5bca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pint/0001-dataclass-frozen-True-for-Python-3.13-compatibility.patch
@@ -0,0 +1,116 @@
+From dc729d5b6574e1c44ec12e13b68c2b900e4a7ba1 Mon Sep 17 00:00:00 2001
+From: Simon Willison <swillison@gmail.com>
+Date: Fri, 12 Jul 2024 17:23:21 -0700
+Subject: [PATCH] @dataclass(frozen=True) for Python 3.13 compatibility
+
+Upstream-Status: Submitted [https://github.com/hgrecco/pint/pull/2037]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pint/errors.py | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/pint/errors.py b/pint/errors.py
+index 59d3b45..f080f52 100644
+--- a/pint/errors.py
++++ b/pint/errors.py
+@@ -81,12 +81,12 @@ class WithDefErr:
+         return DefinitionError(self.name, self.__class__, msg)
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class PintError(Exception):
+     """Base exception for all Pint errors."""
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class DefinitionError(ValueError, PintError):
+     """Raised when a definition is not properly constructed."""
+ 
+@@ -102,7 +102,7 @@ class DefinitionError(ValueError, PintError):
+         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class DefinitionSyntaxError(ValueError, PintError):
+     """Raised when a textual definition has a syntax error."""
+ 
+@@ -115,7 +115,7 @@ class DefinitionSyntaxError(ValueError, PintError):
+         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class RedefinitionError(ValueError, PintError):
+     """Raised when a unit or prefix is redefined."""
+ 
+@@ -130,7 +130,7 @@ class RedefinitionError(ValueError, PintError):
+         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class UndefinedUnitError(AttributeError, PintError):
+     """Raised when the units are not defined in the unit registry."""
+ 
+@@ -150,13 +150,13 @@ class UndefinedUnitError(AttributeError, PintError):
+         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class PintTypeError(TypeError, PintError):
+     def __reduce__(self):
+         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class DimensionalityError(PintTypeError):
+     """Raised when trying to convert between incompatible units."""
+ 
+@@ -183,7 +183,7 @@ class DimensionalityError(PintTypeError):
+         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class OffsetUnitCalculusError(PintTypeError):
+     """Raised on ambiguous operations with offset units."""
+ 
+@@ -208,7 +208,7 @@ class OffsetUnitCalculusError(PintTypeError):
+         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class LogarithmicUnitCalculusError(PintTypeError):
+     """Raised on inappropriate operations with logarithmic units."""
+ 
+@@ -233,7 +233,7 @@ class LogarithmicUnitCalculusError(PintTypeError):
+         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class UnitStrippedWarning(UserWarning, PintError):
+     msg: str
+ 
+@@ -241,13 +241,13 @@ class UnitStrippedWarning(UserWarning, PintError):
+         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class UnexpectedScaleInContainer(Exception):
+     def __reduce__(self):
+         return self.__class__, tuple(getattr(self, f.name) for f in fields(self))
+ 
+ 
+-@dataclass(frozen=False)
++@dataclass(frozen=True)
+ class UndefinedBehavior(UserWarning, PintError):
+     msg: str
+ 
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb b/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
index 72589dda96..337f587202 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
@@ -16,6 +16,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += " \
 	file://run-ptest \
+	file://0001-dataclass-frozen-True-for-Python-3.13-compatibility.patch \
 "
 
 RDEPENDS:${PN} += " \

