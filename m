Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB55FD0C84A
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:34:31 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55985.1768300466572685134
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bIf6bbux;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-432d28870ddso2802267f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768300465; x=1768905265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=StIToAiys9ZGtuPbGKIgXMuT8Q23iRorMHSR7ttlHpk=;
        b=bIf6bbux8zQVCyIBgip7A4m8kaokQvQr12stDtmOgcX5ves2daKB2sHdWB/rCLO/2Z
         CK80WS8J+Ye7JiydGxELVJxv4Q0nA7YbcjLq3RSFcV9Nxr+49ZCi4/5NSCKhrWfzldOe
         Bc542CJpmFFGt4wurpmOJSvfBi5TNbW968pfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300465; x=1768905265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StIToAiys9ZGtuPbGKIgXMuT8Q23iRorMHSR7ttlHpk=;
        b=VPqdE256NG2v0VoB/Wc9q3La05kj8ep99zTS22zM9YDOvCUSk38MEINtI4xcW3DenW
         gm4bnDeVwuyJxb0Z3gXSTxYjk7cngqJHfCWhyRHm4sPtpsLBB+JV9Dud7kQk8v+IdR/g
         UaI0wZTVGJwMk/3gi8/zuliS5a/BtFEkNNLzg+yFjpv/u+zUhfkoaPQA4KqQQBlm/zOs
         e4vZlpc4RjaOjYzRmOWYLfCHGED5fDerxtJuVxi3cSVz4V0BSdBdtWg80Zfbg5VPvyLH
         SY4rihJKgKgWWEU1s6+qscdH08WjHrNrOmJVYAHe0/IM78j1yBBsSpj47yVLVlcA+BAP
         4ERA==
X-Gm-Message-State: AOJu0Yzu4RkcOavZT+ED+iEzvs8oFhT0VmsG0nbSpCC0QMJfPj6TtJWF
	F93P0EkT4LougFnXkRGxhfr0y9/HjPorevgF35xlGX8RdqmLZOpBT4barNMITkk432kLCh8IaX6
	jc71q
X-Gm-Gg: AY/fxX5RHIxzkOAz2t2B8Q3PUUAHR1cCC12ULwY+DyalSdU4GrmBX8Am+NRWMU8+z9M
	g4cD163w8NiryDNBHCl4iicAOPnGEv2aiyGBxa7YcmC5hHaRILuMNbCXkjGJ4NIGBULtoO0WmN2
	JYIZ+eOuGurwAxHItMpkWBAPkUspHaAqkYn7aNqnWlKeIqB4Ad88DJphb3y9JWoSIZG/qeQQYSX
	kpWxWv52byEIqG+pOSsiw0gdsM7qnXHoydEVs4XxELDajkcvalUq8lRUOXbpnhWjFCp3PTjEVug
	J4krMYZRr7EhMetPHP/7o7hjoD+Gk16FUtrs9auAadCXr6jdAQSsFEAKXFQHRlZsC9DUKgW2B9E
	9Lxbh4ke6zm7gPxjW1Wrh9pkxN+RIVsNY9ajNQfoOK2Fhw5gDP4bvCS3zfFWhAEDqv/qjGkWaRW
	mD8yf2NKBLUZLsssptBC1rUzYb
X-Google-Smtp-Source: AGHT+IFGeLk7r5IYXq7bnnaZRBsguKmfeWBRkgJmA7VLUSbOMzSgJGov2yCEu+Cax4zDj/k0Hl94oA==
X-Received: by 2002:a5d:64c4:0:b0:432:852d:5276 with SMTP id ffacd0b85a97d-432c36280f0mr24815622f8f.12.1768300464225;
        Tue, 13 Jan 2026 02:34:24 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa84sm43341971f8f.2.2026.01.13.02.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:34:23 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pylint: Upgrade 4.0.3 -> 4.0.4
Date: Tue, 13 Jan 2026 12:34:17 +0200
Message-ID: <20260113103421.3568307-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123430

Upgrade to release 4.0.4:

- Fixed false positive for ``invalid-name`` where module-level
  constants were incorrectly classified as variables when a
  class-level attribute with the same name exists.
- Fix a false positive for ``invalid-name`` on an UPPER_CASED
  name inside an ``if`` branch that assigns an object.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pylint_4.0.3.bb => python3-pylint_4.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_4.0.3.bb => python3-pylint_4.0.4.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_4.0.3.bb b/meta-python/recipes-devtools/python/python3-pylint_4.0.4.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pylint_4.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pylint_4.0.4.bb
index 04144aa7a3..adee1d10c1 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_4.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "84b6552b86e210097ac29de7ef64b152efb4a454"
+SRCREV = "e16f942166511d6fb4427e503a734152fae0c4fe"
 SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https;tag=v${PV} \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
-- 
2.47.3


