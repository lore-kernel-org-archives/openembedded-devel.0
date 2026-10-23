Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12742.1792777451721775932
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 10:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kXzYLpR3;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e00eee27dso757155f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792777450; x=1793382250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXrjPVTFQ0pUJ6HrCMchtXNxpSNxhc/0x7mw1HY4OpY=;
        b=kXzYLpR3zn/BJ92pSP/ij1gJDxJVwZNHYASPioSLOSOZEAn9jaRDIqlyKMX9bzjObK
         5HUmkKYD9RN0hZePkqeLfDjzzuw1Y+vXwMys91ND8928xQ7PooQ5bGNuZjNX5Rq9PTo+
         Vwz0R75QPbAD5Suxqz6QM6YetJfvfjd5Y/DxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777450; x=1793382250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXrjPVTFQ0pUJ6HrCMchtXNxpSNxhc/0x7mw1HY4OpY=;
        b=gZGMrRi//gwj8TVLeYFefIqWImly5BkjbO3jmlvNcebCkVO+4fINNPdKdFbe/ur99V
         yDQGNUx4OxWuH3NNQi2e8vq+BhZKkzpdPJlDVvp9OqAM0zWWRh0yivlCcgzdJH5kcDn0
         2Dad2TUsV8oszsl594oukoKDrTV9weobbfHclFVygacoT8wAMPOrXcYI08iV2ipwubaq
         83xHyzEYkbaxkMvszxNAlc5+4qtGcKS0/tZlTiYikRMjrDZkKdRXwS05gX8ibB/wwhj/
         Zo+d0DQnQzQ7B3lEkHPPNbFT88E3mJM+EXkphpKEicCiXhbA52BR7doxm0EAyM6bA0Bf
         M+HQ==
X-Gm-Message-State: AFq9FYKWXaokYuRHj8fXC/IbQOBk+AMGiuFkkolcMaAU+c4wG6c/FPMa
	IYSC+lmsfjDS2lPkUVgoFF6BHh0yaR/yE5oCsCCIvfDd3abUHJqwvwpzCgSsLkM3SKFqo3wqlca
	fAovG
X-Gm-Gg: AYBFou0lqPQBkpNjuwQAzezch5ECkD1cAq+WFMthDECjHLUMfbhsbFk+wsberiftBRd
	4d/TyA1RBTRtYHJTfuezJUtGeGxveQu7tL/xh5jAqwsrba5hjhT6Sdsvo6QWy7TAHo/2gNrjTNE
	2hgI/Ahqz0QZKeIN9GtLLLKHS9t2p0hmdJLByTTTBru7vnrwGS82h4mJv/FlfJElGkDLd4cfieH
	YU2o8bbMf+8nTlwejdL/Vi3dUIuj3emaNM9vLpkvH+7LwyBN3Frmmm9e5KmQOPoTPs5IfNHkkSB
	wZCI618LDqDQhIrhuW5l/05Dio3C6rsttkzW5Cv/50JkZpK0IVE+ueoX9WfD+NCr8S+RzMDAPHV
	PayfgMniOpjpr5KP7caA0y3RmzqyeQyLzp1aBQ2ZzIy9DzyxRlk+rfvbjR0sb6r0NfaM3XAHaWt
	Qwp8pKgOFVNQBSTBWBwnNQwevm/yoUzs76zHV4GFK83r4zpBkwNv/tytwW3MT3LrRerW64iQeYx
	2ygQ57AaXqB/MNxMsddAGE245SwVBn/vCfddLZrKWcIwokvZJY0K8+CoJoolGrI5Wp268cdEbP6
	qVq6Qr0nxCAuAoG1gIrDKdokfns5LVPtYaDsKuJR+8Zj1SFOFylWGfk9dg36bm8c4UEDsYlUqZ+
	HL+4QvDXvuEAtGSLQSITCVhozMQ==
X-Received: by 2002:a05:6000:2403:b0:48c:4d32:ccfd with SMTP id ffacd0b85a97d-48e3854e4e8mr5008995f8f.6.1792777450008;
        Fri, 23 Oct 2026 10:44:10 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6d8sm1147864f8f.14.2026.10.23.10.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:44:09 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/9] python3-imgtool: Upgrade 2.4.0 -> 2.5.0
Date: Fri, 23 Oct 2026 20:43:58 +0300
Message-ID: <20261023174401.3617912-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174401.3617912-1-leon.anavi@konsulko.com>
References: <20261023174401.3617912-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 17:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131385
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.5.0:

- imgtool now requires Python 3.8 or later. This also fixes key
  export commands, which failed on Python 3.8 and 3.9.

- Added imgtool keyinfo, which reports whether a PEM file holds a
  key pair or only a public key. With --require, it fails if the
  kind does not match, which build systems can use as a check.

- Added --name-suffix to imgtool getpub and imgtool getpubhash,
  which appends a suffix to the generated C or Rust symbol names so
  that several keys can be embedded in one image.

- Public-key-only PEM files are now supported by imgtool getpub,
  imgtool getpubhash and imgtool verify. imgtool sign given a
  public-only PEM now fails with a clear error.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imgtool_2.4.0.bb => python3-imgtool_2.5.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imgtool_2.4.0.bb => python3-imgtool_2.5.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-imgtool_2.4.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_2.5.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-imgtool_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-imgtool_2.5.0.bb
index 6b88fc0535..6ba236e89a 100644
--- a/meta-python/recipes-devtools/python/python3-imgtool_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imgtool_2.5.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "MCUboot's image signing and key management tool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=0645fb61e2f961a110302fbfdb227446"
 
-SRC_URI[sha256sum] = "ef2db1d9e3f62b9bc9425a8e86c4ea7212c164f0a16e923d55250f0d8743342e"
+SRC_URI[sha256sum] = "226b5029beb0cdb490095edd59ccfa32edfa7b31450c2683b44b1abb772e80d9"
 
 inherit pypi setuptools3
 
-- 
2.47.3

