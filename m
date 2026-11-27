Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10250.1795752992294950251
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UhmDdXiE;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b563e32936so3514518c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752992; x=1796357792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aO0GHdQ47wtwUUDbikggpMjELS9ONAp4UsA217JxOI=;
        b=UhmDdXiEdisRhNC8q9Eyem3Ee00XdCEojufVxigAZgCWp9yM1qIXrAr6aLUwmmgs+E
         fo3fhY7Z/d2hXpFoMYJz5Dvoe+jmUkX2uuo3L+BFLOc876GvDeWgp643CO9o5DHR/rXq
         vZX2IddROWgYUKeNGDYVgzjt95R9ek+/M3cWPeZ9q5nBByhVr7FwxEwmpZVtSxTcg7kZ
         zgjnBZfFbOE6KrXiXdR4OJWZfqURwomh0rSSFKS0ifznGRy3FDklqqTl2raBeF4McCTh
         S5AVPkFOQXlVwD1iLK0gQAL5b5H1erDxjoAHXcCzvkO49xjbIu6/OAqVmsYo/rL+zEeN
         rofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752992; x=1796357792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aO0GHdQ47wtwUUDbikggpMjELS9ONAp4UsA217JxOI=;
        b=EylWj0OlARYH6lh+74qbe/pSD4FHG1WVd09n5UxebpAupsXyTH2mMyBFUbEIzfl1OX
         kvKuKEB0mvrKHwg7BGiNAnuVVzjG4xxpUDjyCaEYWtHPHPDN0UUoALmvazHcPfnmHGrc
         ntgIcV/IAotvLDHobyxGnwslJO0N9lHuABpbIO1rMTQWD/XOwjIpVMRrXCsFMiHMmYBD
         ptjx3EQBc1O/46M39QGHlQxEDM22crOTImKT0X8/04E64kD54z203wFi+uTpv2WUmyEe
         i3IiTjUuECIgWroPnxoOltzviWTnesrfrgQBH4nuD5ZbTfXuvv/ZItcQRVgmYd8Z0Qtq
         KW5w==
X-Gm-Message-State: APuU4Z+A8KwMwSEo4fResECSBNdxCX3RHhuuSh77gXuveYKZovk1MKrx
	1f6/HdcdLDyQ77Xq/MjyvaWuSWlcS/pXzVocFsWkoCP/sbvRvSh10FwNwKLBJQJx
X-Gm-Gg: AZFdTZdhBtv1BAS/IUSLy6ChSwpIGWytwUj6EKx3u1K1Hn0MoYAlY7ltNIjcm0LwT0/
	Z2J3SX+2N+NCkF6EwIVBl5iJr4qgaqY7GDRFoC4iwbHLEol4lvmsfYx9ZBE6SFjvYWJdBxhhFmz
	XIxdPAbfL8V0801Adh9+4xq09tCJsLKakPZ3ZEV/l2Di4p6qORHaA06CURDQMvPYhFo/sTCqa/z
	umLjsmc11uUYOeYpn6JMxb0kwBrblHnxt6+8ng/MGIjVdmRtKWsHhYp2IQ9TTkLonL5xn6fMUDn
	J/M/ruiCoc4WPYiHrGvw8Od/FJmLDvZLuCIWGs8NDJK6WZeBnponGiekXXfzR3SfL5r2XQFspdj
	NlhLHvt5DIyMqUgBKeJWMNl3uaPPhdea18OaUX5ZKOBv5SZk7KWX0qJGU5rURWAOWiwmqw5p1U3
	Pt2bd6cF1X4bpbriLNj048bbHDVTLMcvvSWZSfFvMo8tEmkkb8JzrmKVd9pn9LYnW3Yg65po1Ly
	cGPk1atfZwT3ecNl7WnBcLARAff9jeykNcvpD6gcylg9MgzBJ/8NfMnTBdiUD+h92v2pdbuspnG
	l7gYKFN2CCzPytaXWdlifs3LJJAjwumUQigzvdwEkBpb77e0a7HrDiQcRzii63jyI07N+Mrm39Z
	wwIV3j6wpALeaV1THAzHXGptWNQm/c84jO+hZJKRlUMr6onbbT174wlmfEYooEF6kGKfxnX7MyE
	hnIsLa3Lgp6HtIoDQ0BWARhR6nra0B2qQzzfXd/Ua2n/UECxAeHsosRaGyfvcC0RF860Np/vpgw
	Z3AD74Cz81xVKcsIDbtUqnSRaSYPpdEVL3JYpi6CO2mEPGKlh0VH7sfc+h7HrD/8S1hNw9JaG3F
	3vUMdKHvbGiEn9kohmWwgJyqZA==
X-Received: by 2002:a05:7022:b043:10b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b5568ce1f3mr23910945c88.19.1795752991619;
        Thu, 26 Nov 2026 20:16:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 12/32] python3-python-sbom: Add recipe
Date: Thu, 26 Nov 2026 20:15:54 -0800
Message-ID: <20261127041614.1775064-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133231
Content-Type: text/plain; charset="utf-8"

python-sbom writes PEP 770 CycloneDX SBOMs into wheels. It provides
hatchling, setuptools and pdm-backend build hooks.

Newer releases of python3-platformdirs, python3-pyproject-api,
python3-pytest-env, python3-discovery and other tox-dev projects
list python-sbom[hatch] in build-system.requires and enable its hatch
hook, so the native recipe is needed to build them.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-python-sbom_0.5.0.bb       | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-python-sbom_0.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-python-sbom_0.5.0.bb b/meta-python/recipes-devtools/python/python3-python-sbom_0.5.0.bb
new file mode 100644
index 0000000000..54690f33fa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-sbom_0.5.0.bb
@@ -0,0 +1,41 @@
+SUMMARY = "SBOMs for Python distributions: write PEP 770 CycloneDX SBOMs into wheels"
+HOMEPAGE = "https://github.com/tox-dev/python-sbom"
+LICENSE = "MIT AND Apache-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7 \
+    file://src/python_sbom/_validate/schemas/LICENSE;md5=68aefe2439be54463bf213af4ca4d678 \
+"
+
+SRC_URI[sha256sum] = "fc7b2c46fa40f52e587ac59cada775e83dcac231fafa90b7a71c3554527ddfb6"
+
+PYPI_PACKAGE = "python-sbom"
+
+inherit pypi python_hatchling
+
+DEPENDS += " \
+    python3-hatch-fancy-pypi-readme-native \
+    python3-hatch-vcs-native \
+    python3-installer-native \
+    python3-packageurl-python-native \
+    python3-packaging-native \
+    python3-zipremove-native \
+"
+
+RDEPENDS:${PN} += " \
+    python3-asyncio \
+    python3-compression \
+    python3-core \
+    python3-crypt \
+    python3-datetime \
+    python3-email \
+    python3-io \
+    python3-json \
+    python3-netclient \
+    python3-installer \
+    python3-packageurl-python \
+    python3-packaging \
+    python3-tomllib \
+    python3-zipremove \
+"
+
+BBCLASSEXTEND = "native nativesdk"
