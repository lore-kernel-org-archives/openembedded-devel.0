Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48037.1795411863560054012
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=V/EHJv8N;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-382f4710a17so4982287eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411863; x=1796016663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUwXBhAbqSvdeXyouO5NzYeVhRyH3GK6gXusZslfUEw=;
        b=V/EHJv8NPo00pyREoTLmO4EEO2uAyUYvYzPvo748ZyCdoHJgbMehL++i269tXoFWxe
         ufs0PwrnE77NY7FGv9t3sauMkO5T3SkorZxPBvwJr2P9clg3A8i1zKW1HLRHIylnhXsw
         vhw1Qn9tThdha9a1O1N2gk8xy64FX2Vh7E4hCzg2wM2fw7KYM33sjbDv1XTJHVM2oibk
         LERJo+JCeSgTzPg80PVxSUWW/X9l2Ta6/DDzdCcnVbCGvdBNoc2Jkh4JnjCdw3WVX7Ka
         L7IKIk5ppuS4YYbgcozS+GqguNCKQ7OkmTopoatC8lsWPGciaz2V9env1Xezv92lMgDt
         U/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411863; x=1796016663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BUwXBhAbqSvdeXyouO5NzYeVhRyH3GK6gXusZslfUEw=;
        b=asrN4ips0l5myfb4kHExzkUyvF7MuAGghOA2GytkSgtHxk2y+VlE/mCtjPZQ4IJVZw
         otohOOSwKfhvxYP9q/DvD8Rhkiv8tCw70eDBr6zZ2YL8/mTSz63i1TyyXQd+ZAtz5Q/L
         4hcCvvLw0vrpvemgFAt3q6Clwec5xWVXYXDA5LfKzDKIk1eCpaibAyzrLhL/G8XLTMpG
         EghGSjsmQ2/gr+CIkhKdI7SxFST2uI2ZdfKqphIDh8E50v0EzmL0NRpY7TpaOt+pqL3E
         c7M5U7dT5QHRVb5/eBXAEvuJZgUpKzEdet6nNzIch5SjLaOjKsqlioWcZHnA1Qv+y+od
         XMUg==
X-Gm-Message-State: APuU4Z9VuNaTjjKU7VLC/E4cxOP9OkVSNCU5LBLR5/XqakjONQ2/Tp31
	9cCHfXZOIhI9BphdLMfk9iYth6L1WAuBPfM8CpMszYr3OENxLxBXwExzbl6Ik778ZjI=
X-Gm-Gg: AZFdTZeEb3l1wy+dV6AeJu6TI7THVMco7He5d9y05snlNkWX/ylA9KQDb9Tq0Y5kjUo
	Gg5K6uvC6lh4E9QYPmLMct6PCJofpy34/OLIRDBVLcKmtGHK8tLFUS8NIj5bePeRehfVs7/ZZlT
	6l4WH3NwgrCNoScgKKo0wfgPajVsnjxQbUn+R12WWBlCZR1+UXiDIHoR72r5kVipQleuUVgDI4M
	uDN3V+VJWKFjhXptw7j6eCahDpHJB1mzmHwiw+l8ADc0HWrlcfHhjPVgYipcxb7SZ7DTNZEkWTS
	bf2linMI22O/FYbrdrXq8vExsBiMwgUz8kGNTvntzon9+ILVVOASqYKLrmgukN+UjQCufa4IMom
	6tnCILDosxvFZZ/QZQp8SKjVjpA9cf56hYNfL74iiwjA/4LbnE6VAMDihxxArYWLjh6iCZxHLHk
	UpY1N8yNvGZYmuXKmBqivWE8r9CxQ4gzOMXsPml/MLyVt0bELd3X6lYSE/3y/bNZI0LDrM5Yf0o
	rZADBUMOoUWASBG6rp/ewrKoUW6W2pyrVZzQbifrDvrYyp+BZ8mxFIhgaJOLwVrHZ4uOjdU1ILr
	N2SiH+WeV+jkbNDW/aYfmuaOj3Nk4ZtxrlOClriPWNNz8ORQAiVzA8dpnQAUfWOCKZbR6++Br2A
	PyX5GA8BkDXrjZIwaDrMfA0+UF0hoxQfBxKRxXimK3MsI3VSkOcTCQjn74sMtIUMIR+m8YB7iSv
	us6Y9a+2dGZrcEo3AsLzzi0hUxLfp+oqAsQliKyUghCFHTX3Y+aZ7uSclqsLfAGW5v8ZbwPJTDa
	iBLq/p8o/+fMlcXagzLUkCndXjAW3tFNiilzAnPSGeBt72cVIK6l0FkdGYB5+mmoyAAyaSEu22h
	6drLCKHn77WY0KZzAoFeT55smQ==
X-Received: by 2002:a05:7300:8816:b0:381:5fe2:8008 with SMTP id 5a478bee46e88-38571b071d3mr10848070eec.39.1795411862950;
        Sun, 22 Nov 2026 21:31:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 27/42] nvmetcli: upgrade 0.8 -> 0.9
Date: Sun, 22 Nov 2026 21:29:11 -0800
Message-ID: <20261123052953.3658549-55-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132842
Content-Type: text/plain; charset="utf-8"

- Support for NVMe passthru targets, reservation configuration,
  discovery_nqn and DHCHAP attributes
- Allow running arbitrary commands non-interactively
- Build moved from setup.py to PEP 517/518 tooling; drop dependencies
  on python-kmod and six (kmod binary used when kmodpy is missing)
- Code cleanups, type annotations and lint fixes

0.9 dropped setup.py in favour of pyproject.toml with
setuptools.build_meta.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../nvmetcli/{nvmetcli_0.8.bb => nvmetcli_0.9.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/{nvmetcli_0.8.bb => nvmetcli_0.9.bb} (93%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.9.bb
similarity index 93%
rename from meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.9.bb
index 5f54dc812d..e4d0abc119 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.9.bb
@@ -6,7 +6,7 @@ file."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-inherit systemd setuptools3
+inherit systemd python_setuptools_build_meta
 
 # nvmet service will start and stop the NVMe Target configuration on boot and
 # shutdown from a saved NVMe Target configuration in the /etc/nvmet/config.json
@@ -19,7 +19,7 @@ SYSTEMD_AUTO_ENABLE ?= "disable"
 
 RDEPENDS:${PN} += "python3 python3-pyparsing python3-configshell-fb"
 
-SRCREV = "d323d5a3091af490502c5d025ec7361a3a2cfbd9"
+SRCREV = "afd82ca535db1aea565cbf9f9c667aeebf19cf15"
 SRC_URI = "git://git.infradead.org/users/hch/nvmetcli.git;branch=master"
 
 
