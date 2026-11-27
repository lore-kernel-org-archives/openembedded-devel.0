Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10262.1795753006935329698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NDgYU6o4;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b589050416so1676445c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753006; x=1796357806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RW2VpTQqK5HG2OV9tWShaQkIqVNXksvnqgXJFCxxQ28=;
        b=NDgYU6o4EJUq4l5lql7oxpY2w1wak2jZYn1fO7nTCCst59DP6/phPhd23cm24P8ULI
         FfO8KwUv62zB3vMy/JOvxHW7nNz2GbGL3Gt+jITfhknSvGioMxRpMOUd/PFfo0812tiV
         gmGY/evxQ5WFdaLMTQ/SgWwp0mdddXLTbBlMHury16nAIcyZ1yROzrUa7EjBBnb3xsdU
         PRWeG7kJilciNPN2pmU7BeJDSTKzc7Ii9J5WgKIKt38GWJYRYKx/O49RAa0eO37jQk20
         PGaIemttZOUlnl1M60g5GMXi18bFalaGvG061wVVMGteGuLnNYNwDqW75MVtgC7Citf5
         GkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753006; x=1796357806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RW2VpTQqK5HG2OV9tWShaQkIqVNXksvnqgXJFCxxQ28=;
        b=wJufNsBuQO348/9KwThEvXB1VaHtUOQN5KPoWmmDU01TN1tfQI+3swcds/0lBh0nqj
         3i0HR16pOREyV+9eDH7/hpulMDrRjCYDDGlJ1/5/79ky6+qA5VvFMBjmVh5ZHSmQKOe6
         xYS8aniwNWoSx0l5Wyri64g79CuGbC6dEaGYr4ALzuO+pcy3RecyJblPdskXTnWNsWEC
         fkmtjfvAbywVu8+CnP/JLfsHYHqAsi+uBXFweISME8GOEw4roY40mMAQiEgv11SewEdv
         cI/mDiAsixnyEophLUAMsv8tCBZ9oXWjCUcYGa9MEC+e7aDh3yZEHMhaK2xwPHN1SDrb
         R46g==
X-Gm-Message-State: APuU4Z9LgeA206WGHqi7eZQ+XOGxF8n1z+ZW6VXWCCtjo4b8vFxE6B5G
	cEZg9PiHjQS9EfOavHLpbWAEAoXu/DSGCtUZso5cL+iqI2Tj+5vnM24AuXbgF2Iv
X-Gm-Gg: AZFdTZc/mmkKSgcbHG/eCRhBXpHZRyrGyC5SjeQDK5u0pJcpXLyRhb4Mu4uvv4Tenco
	FQDVkjZrwk2JVWuCwSOc3YyZCtpKAtRGHGE8Vp/pQJCzuZP9Gdm8y901xpNiPgrbVAOMCQR+YDQ
	qcgFY04ax1mSqcjYUrd+GlYvoQ6eKil/Y/whAlEOg3q141WTNR6SXdH2gIsE6iOYMmu3NxSM1wM
	J3RS34i70unBYWlr5thRZFxK6eD9gN+JYSxqrRFHPeKE4sRAUOPvyttQJ1Ij+o/+TO4k6xOj0Nd
	HrNrrAQAB8Vo3UpjYcZEqWq1PiT77oGV/FmHST4sZxMKQ2311IatqgakNn2bNJjD7DloG8heeqY
	dWU5C+EqS8uOnDxwp8+sF8l0cSsphGpHcQPnABoWUK+vGSWSVLr1mPROqYiS7RDTnhw1IXUTmW0
	LwQE27wLSS732cEuk5LBE+2MZddvZSu5gNSRw8I5ZqfUMytRKra70a4bJ7Vc7MaxiTZAV26eljp
	BdRinY2KzXJ2kApiY/TsZY+HvBLLXXcGhVuRhvTuto+7V3MTBu02RlKtOdgubXZJBezsz1+Cjbx
	umHVgMBsGrd4GVcD4wQf4sRr3xQaHuHKMkeQy1i3BiPpZsDRZpWsTz37w+Wx7tkhamOc1EfG6nb
	dB+L+xkx1b5oDVqXTLD9zDuAKpFhZJdL9huJlLVOH2Wfm8VyysZ+0i5ynGCIsCysTz0rdr8ONag
	5trQIeTBzl4fT+zhWhmcn0rJGdebuT8VGE+R6lqVcvxjg/C5GRvCV8P5eiAmp0bejUIrSjtTGR5
	+fVtyegtauq8hPdQc08yyY9rglCwbXz6HVJHalSghSIVUD2m0dKVBQ3qLLaWVMl/l/XaWTdzIVc
	XCXV
X-Received: by 2002:a05:701b:4594:10b0:1b5:17c5:9f61 with SMTP id a92af1059eb24-1b55df5ab00mr18790585c88.0.1795753006154;
        Thu, 26 Nov 2026 20:16:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 27/32] python3-tox: upgrade 4.67.13 -> 4.67.16
Date: Thu, 26 Nov 2026 20:16:09 -0800
Message-ID: <20261127041614.1775064-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133246
Content-Type: text/plain; charset="utf-8"

- Interpreter-prefix environment names with explicit versions (such as
  pypy-3.10-lint) now combine with other factors.
- Reject empty set_env names; fix set_env values ending in a backslash.
- Create the work directory owner-only on POSIX when no package is
  built.
- Resolve TOML and INI references to sections whose names start with
  env or contain colons or dots; detect build files in package_root
  when choosing the default package.
- Defer imports for faster startup.
- Wheels now carry a PEP 770 SBOM written at build time by python-sbom.

The build now requires python-sbom[hatch] with the python-sbom hatch
build hook, so add python3-python-sbom-native to DEPENDS. Runtime
dependencies are unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-tox_4.67.13.bb => python3-tox_4.67.16.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.67.13.bb => python3-tox_4.67.16.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.67.13.bb b/meta-python/recipes-devtools/python/python3-tox_4.67.16.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-tox_4.67.13.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.67.16.bb
index b0a6c81e22..57d5bbc8a0 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.67.13.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.67.16.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "9f70b44ca2e31d91d8fe2e2917f505554950adc3961c0ee70bb42db16d903f62"
+SRC_URI[sha256sum] = "5aebaa21a648bb4c129724a2e7aeb4ce951f0d93a37f8709b630719fd5b78ab5"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
@@ -14,6 +14,7 @@ inherit pypi python_hatchling
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
     python3-hatch-vcs-native \
+    python3-python-sbom-native \
     python3-docutils-native \
 "
 
