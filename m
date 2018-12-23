Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id A136B71A0C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:21 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id v28so4860504pgk.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=txUy4sUhTKsGSray5+dKALmfjq8HfW+phhL/4LFLDBg=;
	b=NRhLuWk9E2MSSUzHE/cbLC/JxYHfgt5yZmK+js6/wYY+Hz5uoM7aFVuV2RRootV1rk
	gPmnPj44DDsMmMadQsS0fHKusyvVCl64fghlLa6NVzi1q5MXEaG5u0uMfhV8v3B6ds0m
	H8ykmuODhQ8g0EYTfQ6PbMEf45j4+gNgGHp74FMni+SnNh2wNwVjM5Rmi5e0PzbRLHrC
	ySRmjb+MqfYlJxnf3vGsRrxHp+l15LDCBwSI5ZmsmWfwets0hazjHxJU7iHfRsioi7q6
	SXT9ViWUw8cU9cNkJHS6n9Bup71oMk1QPzNLikqyPXsb0OgMe1avONtWBZ3C+MOdCNZv
	+vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=txUy4sUhTKsGSray5+dKALmfjq8HfW+phhL/4LFLDBg=;
	b=O5prkJB2kdvqIqLRMVpQXtTfwRrgqMkE55vl1+aRCabb3F/0tc+wgl3dSmDrzklpew
	4IxOuaui/rggLRRo1OWnG5kXj3TtC54U4SBMsix1+93QiUeiaUUvYHCOjAFqdowfizsS
	lifJbfGUZKJY7XZyf0/SKKhpJcPIQ/60xBWJDXHHOzwOI62rLhkDHcBdex38tP7qV6Y8
	NoG0LoSHVjTKP5ZCBk2qMez7PvxqyMRNPyQ1RAl4GHm4u76celNJqO5JlMS7eLBNTwFK
	vjuauCmisKqgqozIrwMOECCoJoHl497aSmnvzU6wuKFG1qkke1GZtTZb1q3JaEyk+7bK
	XORg==
X-Gm-Message-State: AJcUukcKtVS97ZcRVx6cyAlBoELkdk5pvXQBOSUOV5jtZ0LpvdzGxEIO
	jBqoO9eGS8kJKdh05o2Vb5CL9PWpmCE=
X-Google-Smtp-Source: ALg8bN6K6ieEM3gdTEJ9ObOLVgEu2oH8FBgRTgzV64KTyuwTc4oRoWz0707wRe6wJf9dt+jZvmRlkg==
X-Received: by 2002:a63:585c:: with SMTP id i28mr10397153pgm.178.1545600982294;
	Sun, 23 Dec 2018 13:36:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:53 -0800
Message-Id: <20181223213557.7834-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 14/18] python-msgpack: Upgrade to 0.6.0
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:21 -0000
Content-Transfer-Encoding: 8bit

Set PYPI_PACKAGE to msgpack since python-msgpack is deprecated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim "moto-timo" Orling <TicoTimo@gmail.com>
Cc: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-msgpack.inc    | 8 ++++----
 .../{python-msgpack_0.5.6.bb => python-msgpack_0.6.0.bb}  | 0
 ...{python3-msgpack_0.5.6.bb => python3-msgpack_0.6.0.bb} | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-msgpack_0.5.6.bb => python-msgpack_0.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-msgpack_0.5.6.bb => python3-msgpack_0.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
index fdc8926104..9147c06326 100644
--- a/meta-python/recipes-devtools/python/python-msgpack.inc
+++ b/meta-python/recipes-devtools/python/python-msgpack.inc
@@ -2,12 +2,12 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-SRC_URI[md5sum] = "6d644c06a87a5a111bbbf5b34b4be440"
-SRC_URI[sha256sum] = "378cc8a6d3545b532dfd149da715abae4fda2a3adb6d74e525d0d5e51f46909b"
-
-PYPI_PACKAGE = "msgpack-python"
+PYPI_PACKAGE = "msgpack"
 inherit pypi
 
+SRC_URI[md5sum] = "be3043cc2c1e3b5ebf08463ffa71cf17"
+SRC_URI[sha256sum] = "64abc6bf3a2ac301702f5760f4e6e227d0fd4d84d9014ef9a40faa9d43365259"
+
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-io \
 "
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.5.6.bb b/meta-python/recipes-devtools/python/python-msgpack_0.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-msgpack_0.5.6.bb
rename to meta-python/recipes-devtools/python/python-msgpack_0.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.5.6.bb b/meta-python/recipes-devtools/python/python3-msgpack_0.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-msgpack_0.5.6.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_0.6.0.bb
-- 
2.20.1


