Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BAFC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:09 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27808.1786651802578370591
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KyNr7QJJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e347638adso323018a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651802; x=1787256602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6n3nGVBt3pgUxuCi9ciWtbdn1wPZDB6ZvrO0zIOSjk=;
        b=KyNr7QJJGxNdRxvqaCbBSL/8MbpS7H2LSlUcC9aqm54A5DIJDHrfJbGB0Jt1pb8yTa
         +/iYfghIGb80WWjfTR9GotQoVotIuc2zC93H0Xs/tfrr5WjmfQ/GM5ifwp5FsiY6OMrM
         BpXJSDpSVWis8e5oPq+ZuDg012r1BaMV62+BUoh8CGtzDRbQuuAU9NBYfWpOPPRlKtXm
         7qUy+OubbcDjr81OXV59s4qqWrPQdLTvYhhsOrMJnsiJy3RvKpHotA8ZcA6KoINoXR/w
         Imgn/lXvo4kz91W8I9vSnBiU+H+fHqztzgIn4TC++3aguwFTr6pGmoEq6iUJkXVkiSX3
         wQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651802; x=1787256602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6n3nGVBt3pgUxuCi9ciWtbdn1wPZDB6ZvrO0zIOSjk=;
        b=jNR7MDKoHWpmxzBcZPaSvWGDUpUVyjMJdPwX+qbiXqH/qVDzuAeTTTTU0uyPKivVGu
         4lb9NTjrWLCQzDy+3amNrOxI8+kBQxfj9ZPLiOU+N8HpnMXeJmm+iPoZ17RJ7RZDoR/z
         GBz2TAgbaC1aWtftJFUJlcGFNQnUX6lJA15SAcInFMBNORs9L7XpdqPqtiV4OVWJ+lLm
         oPGJjbHJiiEf4SBTUtbgzEWsZNOO4dy8TYR+M5R/35bPGlBT0OBmdLy8iqXU4t7MVpxu
         bH3xG+/duq9szsVpKeyr1yJTbwiMVHb3RGlVCKEFMUc1WkJTcBVKaqzKL1eRwbBUZDiD
         JY6A==
X-Gm-Message-State: AOJu0Yz2hHUidO/sn0A4QE9VjxDDoLJIyejao9E9yjKS0rQA1+41SnXl
	abU/mWkWC+3pkAhrAyt0RyMLJIEF3EOEJFs/x/HoLBl6oPZYDMtYi/z8rimrPI3J
X-Gm-Gg: AR+sD11h8JTX48HQcFhOOB3BzQspoeKMpE5j7T1bF1Q//GYqRi9TfdTZA8RJ9TLkELs
	/77kAGHhWAhcg8yj+DaSYxdAmQTU6mX1eiQaePawACY6BBkmP78ZheWR9SrkVB2W/A9ADum198y
	NWQysVz52k0oofa7gxLWVIMjS8OmLnsRLMtm0p5tb124bLDDwLK74DYBs6b4if/Bt5lK/yyH9eK
	TrbDh7dHHdW/CCEgBhh5oiPmepUfXotvnmEfuv8hyNZJ70UkWTizphj21Au/EasoreXbFTtwN4Z
	moo3ZYz0Y3JrzDrQk61/oSHIdtqyB4IfEo7xpDuVnIl+erX9ntEklKBbAay0Xks3IvhlCbVUPzM
	UNirpwStgetHWEE75Y+9usWS9XWqJ5EU5LW+PHBIrDBKyR0dnE31bmcfeK0Sgx8kUAjDZL/g1AH
	5Wtx1MU8aWbaRf3LqNFUEuwt6qRdhTnsVtPkI0kmi6nxqoHujeqerS2DSkJMT9BMNmFjUICo/tB
	Uj+6fpramtDDtAP4WNt4cdKGYJSLtoX4sRsWbyRAWnQFoh6qADKGVUeFwqt47NwgCMnTP/MTcLP
	PnMwhfvseIuLYN+LJbIkhUC36cIFY+Nc77yqMBoH+77hX1ddzHyEe+mOy1Hl21qq3BbJEQ+HRVn
	hUpdwLc+TClYDinRCuzwwpc1olVHyQkqKZ6zZTHNEUfw7Aw==
X-Received: by 2002:a17:90b:48c1:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-3933b792c20mr620662a91.9.1786651801805;
        Thu, 13 Aug 2026 13:10:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 46/80] python3-parse-type: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:00 -0700
Message-ID: <20260813200834.1302829-46-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128990

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
index 6d740cb130..0cffff3e82 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.6.bb
@@ -13,6 +13,8 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi ptest python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 do_install_ptest() {

