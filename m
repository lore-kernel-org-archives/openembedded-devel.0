Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3D972FC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:15:14 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n37so2520073qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LE4AqVlq1FioNbsW1ADOf98PBcq/SA3ccDEsWKiEpwE=;
	b=OxVn0vnYZ8a5j3zP+EYEhqIc4GchZ8z67p/3QVrDCSchhSUhztMRWIN38aEvcb6Dtg
	Tz1lUjR23h/ueImYafTj6GLULHjv6cVIfYC9xccHKvg0PqSTVIl4sKkJkVL5quMPwiSa
	EcA8CgQAPMiNkAj658OxEyaWzNNZYV8Od6AsqpFylbDn/s6pJfHzoE7mn6jcSvrnEQ5I
	SGCoTfQFj1p9fpH86GYLAokJIwFdMgyhcDinsretjPPLo+OCmGE5Eqa7enlnBegPv4Z7
	Y8ZL81+3oRfOjSPDdIc73Sl7Ih7k+VXw+foRCVJ/Uq5J7IuCmIy+too+eoHoOALLrBeg
	WUqw==
X-Gm-Message-State: AMke39kTzsoAvdXvRpG6iJymbIXc+Xr39Q2SM7UOWnTjFW/PzgdfekIZmEcMJLAM+L6p3g==
X-Received: by 10.200.50.92 with SMTP id y28mr28592552qta.289.1487808915568;
	Wed, 22 Feb 2017 16:15:15 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	i51sm1696378qtc.67.2017.02.22.16.15.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:15:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:15:06 -0500
Message-Id: <1487808906-26116-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-prompt-toolkit: update to version 1.0.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2017 00:15:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-prompt-toolkit.inc         | 4 ++--
 ...python-prompt-toolkit_1.0.7.bb => python-prompt-toolkit_1.0.13.bb} | 0
 ...thon3-prompt-toolkit_1.0.7.bb => python3-prompt-toolkit_1.0.13.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-prompt-toolkit_1.0.7.bb => python-prompt-toolkit_1.0.13.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_1.0.7.bb => python3-prompt-toolkit_1.0.13.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
index 8554aea..30c2c81 100644
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
@@ -2,8 +2,8 @@ SUMMARY = "Library for building powerful interactive command lines in Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "f74cd8ac84176fac1cdb136843ccb0d6"
-SRC_URI[sha256sum] = "ef0b8188179fe7d052161ed274b43e18f5a680ff84d01462293b327e1668d2ef"
+SRC_URI[md5sum] = "427b496d2c147bd3819bc3a7f6e0d493"
+SRC_URI[sha256sum] = "33d68ca09f76cd73287fde7df5748ffacf26a8238dd61ee81ac50860ea7c6776"
 
 PYPI_PACKAGE = "prompt_toolkit"
 
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.7.bb b/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.7.bb
rename to meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.13.bb
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.7.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.7.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.13.bb
-- 
2.7.4


