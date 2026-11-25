Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37964.1795594143188284992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rdUa3tWo;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3ada81853so6331500c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594142; x=1796198942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwG8E0gIKOKsvmSuk0yDvtrx/ZFqnx4ejQCO5gJ0Cqw=;
        b=rdUa3tWoiUsiIuusOdWgSmGM9YGxaWPTRKKXvXYhNaqDc+iTeRGpjMv5ilfaNXW007
         b4eb0Q2YyPvbBvh+yGL/75JuriGQcxyVwzEj817ACrXtrXQYFlu51L4ooP3uuEK2zhDx
         MLmFZFKp9D5aIqtlWUThskqKMFgHQvamtaBnSNap3dqQtnTtkUShVREohKcuLqhszRh1
         X7K3CFKonak4bSwny+SqZpYkVRbePmTlZMcrTe2iwt879HVaymFpq4AgkTDeNtARtkEz
         b7w7OvxV0zpn24WCOJXRXRpKtj7pSEhozF4YRx48yhp1823kXMLkA3ot7QU3dibnfMu3
         RjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594142; x=1796198942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwG8E0gIKOKsvmSuk0yDvtrx/ZFqnx4ejQCO5gJ0Cqw=;
        b=HXNQMzerVDrr44Dy4Br6SEC5uaWFm4I8k8YLE6vWNmYb9EekHuzhSrGAY4PcSf6X4m
         A+mnKZfHBlSFo4ztBMMIeS2eLa8UVswzSyrbdtjuEjJkfSjUlwTYHKBXhK9tKt10rCvo
         Nckng1cyk28W/Z8QxmnQN2k+4+DJoCsIFMcdb6fFr40usgNtNu4XeKuCTUzpBkmZkv2g
         488GGpstrCfueHNy8fHeXKmPl9U/BkYwfLOjrwCCitZv1df8YDYN90D8vaEQL9evrlkk
         LBFhg1oXsa3TQkrryvWxoRILEZafm8zQ34u2A9FeRP+zfSpjBjBRviu62+cr2nVx1tvr
         Bpiw==
X-Gm-Message-State: APuU4Z/FiGcQCaj3PipH7WDnbINiggZQdg6pkjFi3TVOc6fU8SZdNuoN
	2gE/5uP/NBjPpvNzxQGLFEXqMhaW+CnoVPh18231Ahr/U51RfxrccFp9u3unbRiZ
X-Gm-Gg: AZFdTZeku5+yzP8b3qIGx2cveDwJ0LGJj3ZIG1Lhl/YWv2Jbqd2uw7dghE5YilBxltK
	pNttD+BprXGNnzeXJDliwcEmLNIWuoauXkKTv8IyFrf+LZn8vH24DzFiCHGLonVJUiqCxRaBsvD
	kOqu/XEASUtDwuatWAnbQlhAOOAmeSpLa5UPgREH9AWJuXul7k8YmOpVdHK3HC0uW8M/UXbnByg
	euXjuW+JYD09xOQshlKuAKvXS+T1W/FU3DXd1HW3S+WVC0bGMN7tX1Ks1U7Q7k9rYaowZuQaBNN
	hST2l5vSvHoKbskjYRWjKRDFfzHnbaHuTeD0Gdq3ZQw4Te66fK2LDwA/eniB78DAuix6etlp/lG
	XYUG11MunvhViW3Y9cCFc7PXvCHsGaisB37da9TTdSHzi87O0AOKGup3xzODsGxSDpcoGjH6ujJ
	3F1R99SFineBdVHYCAlt22sQwZ5TDJlJM+H4LtORXNtQ2x60wy26lYdSb3RdT+b5ipsArY0iUWT
	R5sg7N4ZHe6xcALzUJtpzDXeo4eID8Sn7sxwozIn8STEuVpav/6z3ECmFKTEh2YtKHqa3rFysLU
	h9Y6oHCciyjPkLo0I+21X7ZRoH+BmlvhEn6XJdHoXNh0oAV0euXNo/B12rIJstUcNbphi7CkZ6d
	ZzHHxZ9JVI2ehnpMIHiSd82M7qIf4LqboBS/Ic1wNpHwiUMys3/d+fio1UbrwRpqTDKQmYUHfQ/
	ywhOvm/DALq820rBxpbxYTLn5bJ4NDgIXhFjrW3ajZa1UFrDT/Xj4bXVn2SzzXi4pTdYDPDkI+Y
	+QgUZmBUAQX/v5MekUhWZGf/IlywyBtZirdkp3uHIADLGX5kcxZ68jfZDVKup0VBG/ZPoRsL8OS
	ashRMcHB3ElPzOTgGFjGfhZpCQ==
X-Received: by 2002:a05:701b:2608:b0:1b2:6eef:3f32 with SMTP id a92af1059eb24-1b5568f1322mr14809932c88.37.1795594142369;
        Wed, 25 Nov 2026 00:09:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:09:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 09/14] python3-argparse-manpage: Add recipe
Date: Wed, 25 Nov 2026 00:07:20 -0800
Message-ID: <20261125080732.2419614-70-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133067
Content-Type: text/plain; charset="utf-8"

argparse-manpage builds manual pages from an argparse ArgumentParser
and provides the build_manpages setuptools command. psutils 3 uses it
in setup.py to generate its man pages.

setuptools legacy backend (no build-backend in pyproject.toml); the
build needs python3-packaging-native. Native variant is the one psutils
needs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-argparse-manpage_4.8.bb     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-argparse-manpage_4.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-argparse-manpage_4.8.bb b/meta-python/recipes-devtools/python/python3-argparse-manpage_4.8.bb
new file mode 100644
index 0000000000..c32fa68a37
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-argparse-manpage_4.8.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Build manual page from python's ArgumentParser object"
+HOMEPAGE = "https://github.com/praiskup/argparse-manpage"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+SRC_URI[sha256sum] = "d55ce1c246479ddd82871170a8cc543a6831bb68c87a298e47f0663a9330b74f"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-packaging-native"
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-datetime \
+    python3-setuptools \
+"
+
+BBCLASSEXTEND = "native nativesdk"
