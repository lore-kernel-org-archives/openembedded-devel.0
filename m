Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37925.1795594076447349926
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=e1n5mmvE;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386cf1041cdso943596eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594076; x=1796198876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPJeVQAov1bm0wEo8L3M0VWuQhGOOf4+FV6cO1w1ujk=;
        b=e1n5mmvEPnSuawbfa8beA/quqk8jZfijhQPuiVAzDC427yzbMv90McPqvGx3d2nZJS
         0NcWNx+FIM4Vazdnrl9w6MAoY3mkJ5kLVCCFjmMnzn0A9LuwY/8RUJQraH658bYmAjoR
         Czl8+wiq38inwH/A2G5RpW/Rv7Lr6Z4NVzykmvFJSfwGcfPRsdcyZX4y007r9lS5hojR
         SmSKfDwz5DJuU2zQFX5DEsBhFgKVDp84Lsx/hfu1qKnYmO+2nGXWVBi12KGLdrTPfnyr
         j7VD0VWhlZsvFBjzoUXxt9j4R2AaDhP66m6nHCSEiThX2Q7gi1woy+O7zvcsO32Um5dW
         GWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594076; x=1796198876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPJeVQAov1bm0wEo8L3M0VWuQhGOOf4+FV6cO1w1ujk=;
        b=eV8ynyNTFoSZ2uhPRVofDppobsAp+hUN5OPPlkJj+iP16rMH/W16d67k6mA9aPELrY
         iJod5y5gCZMFFNsfznvpjgS6uK1vD7Qc1vziZD/LOUUHUJzR2/y0kFWs+ldUqPj7pLJi
         uw3e7Ou+cSx+S4b/CRzaeka46nXBKmCF+ebbFxeMzX4RzVIvcNculS9IIKHDSx+T/5wJ
         yaLGxyBL+IBR3+cviUrjdUl27DoynzFsINJqfieOL0fneVtUEjqXQjJMecyTNC4ug0Bu
         oAXztII9l0FW1YGI/Ybpg02f/b9K9cWynBWcbY9woqR4gFl32NiWUdsuHa2iieSJr7Yz
         yKIQ==
X-Gm-Message-State: APuU4Z/1Hgmb8K8QuV8yx6OqfDQftTCO8x2eC7jh44jfN0XlRCEnkN1W
	0SEUC+uhONgk+AHzvfFT35+SsLny3di/rm5w3PY+rmd+u6BRRRnSFLUYRGckhm05
X-Gm-Gg: AZFdTZen/Vm1/0bjWZgjxjgjbqFTA8FRmzCQh+gmZxrkm26Rr4CxnKak4HwJ8qtstkF
	ehL/MAJ1bzRvABe7vtJthJKnSp5g6lxTgdQMocZIbD93GKrUxGi6fr2sHq7jHJRoMpNM2pfN0e+
	bm7PrIIO/scn0g1saisJKYzYvoWUd6qKUHLJkaLIPMdJ/qLgB4sZXQKwlxy4BLIYO3pmC5HW8HG
	UBljYbUKB9IcyRARQa2PE4KBVDVcLwBduySOjQezARVBC5Rb+HcqRtR1PYsozGfo9CxwYyX4kGV
	K1SeUKtQpLiOMUZtf8Auk//5WWjzThlU4UP5q5Nt8fNfOTeZaALzJ1UYNZA9GBbz9UuVhMSBhvi
	/KQ6cR/z2oUuSpuPfcFr8LyLpPHh9NzOZeX4RpwW0mclN9ZMAQq6Sebw7gyrzQfJ6ZM7eCFPsbG
	Zn9JVCreCxj4/hgfsK0UVP8Ap/Ic5EdtmIqlwbU2BrZn22fzbuJKl9yqTWcU77k/Q/nWLwPXZTd
	i5pTGJFutDKaPwn7xCSK/TuioT5pASVTIgD21stVc7ETvZpQTczS+aFAz/XgedrDs3QjWXRgFkM
	b+Q1DjGUrwX9Aouqi+/UUsSiURiDEn0YzUSC24gbapbWIKva5MwfCKzTnJrzu70EizUsLGHtQwr
	6p75zex8mdnQa+bMDmvqStHSCjRXQS2Oierx2S4az4RqqPrAUBPGTOEX1Be9T3NnKFGgXGB2Cy2
	3wwPTkrW+H8e4cfTmEFsrWnWf20ARdz3cHq15hhsQlWPMUyxAhqQF/4B9SnF3GBHD2rMsnjGuFF
	Ek/EQaHq6Vg/2eqnQZBLmifBFNuAZevlEsvbfhihzbJ7u80vptoFu24Cg+UVAfkcAAgnH8mOvJi
	VzVy
X-Received: by 2002:a05:693c:8947:20b0:386:9ef2:8e01 with SMTP id 5a478bee46e88-3869ef28fe2mr11205881eec.0.1795594075848;
        Wed, 25 Nov 2026 00:07:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/55] cjose: upgrade 0.6.2.8 -> 0.8.1
Date: Wed, 25 Nov 2026 00:06:26 -0800
Message-ID: <20261125080732.2419614-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133013
Content-Type: text/plain; charset="utf-8"

- Switch from the OpenIDC 0.6.2.x fork back to upstream cisco/cjose,
  which merged the fork's security fixes and adds a CMake build next to
  autotools; the libcjose.so.0 ABI is kept
- 0.6.3: many security fixes, including a heap overflow in AES key
  unwrap, a pre-auth DoS via OPENSSL_cleanse after failed RSA decrypt,
  minimum 2048-bit RSA and HMAC key lengths, critical header and
  alg/key-type checks
- 0.7.0: A128GCM/A192GCM content encryption and caller-supplied IV APIs;
  RSA1_5 key encryption is now a build-time opt-in, off by default
- 0.8.0: RSA-OAEP-256, ECDH-ES+A*KW, ES256K/secp256k1 and OKP keys with
  Ed25519/Ed448 signing; OpenSSL types removed from public headers; fix
  HMAC over non-oct keys
- 0.8.1: refuse valueless private JWK members, multi-prime RSA keys,
  private epk members and non-disjoint JWE header names, which may
  reject input 0.8.0 accepted

Switch from the OpenIDC 0.6.2.x fork to the 0.8.x branch of the original
cisco/cjose project, which is maintained again. Add an upstream check;
the tags have no v prefix.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cjose/{cjose_0.6.2.8.bb => cjose_0.8.1.bb}            | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/cjose/{cjose_0.6.2.8.bb => cjose_0.8.1.bb} (51%)

diff --git a/meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb b/meta-oe/recipes-support/cjose/cjose_0.8.1.bb
similarity index 51%
rename from meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
rename to meta-oe/recipes-support/cjose/cjose_0.8.1.bb
index 492ee0d143..07a91face3 100644
--- a/meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
+++ b/meta-oe/recipes-support/cjose/cjose_0.8.1.bb
@@ -1,11 +1,13 @@
 SUMMARY = "C library implementing the Javascript Object Signing and Encryption (JOSE)"
-HOMEPAGE = "https://github.com/OpenIDC/cjose"
+HOMEPAGE = "https://github.com/cisco/cjose"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7249e2f9437adfb8c88d870438042f0e"
 
-SRC_URI = "git://github.com/OpenIDC/cjose;protocol=https;branch=version-0.6.2.x;tag=v${PV}"
+SRC_URI = "git://github.com/cisco/cjose;protocol=https;branch=0.8.x;tag=${PV}"
 
-SRCREV = "e787ace6a203d483038a793fd58f958a2f9b48c1"
+SRCREV = "6fdb5fe75a86acb9cd34ca2eb13d9e090a6df588"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 DEPENDS = "openssl libcheck jansson"
 
