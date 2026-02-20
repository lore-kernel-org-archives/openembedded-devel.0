Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49305C5AC80
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:47:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.470.1771602475622564256
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QwDromF8;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4837907f535so20168335e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 07:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771602474; x=1772207274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qgkg+RFIN0/lW+DoOiXqLtJ0Bh0h8a9TifrGQEUgOXA=;
        b=QwDromF8RSS0st+Qlno+LIvHa1ZBBEvuyEFwoaEE3U8EOTz+Xeg870o+uALDKVQNRm
         o4stWoeTtDePOa9M1UzCLNZykhXjXkEzIH1iiyuZllJRwhRqRX6FQPROYDmWSq5Gr4xR
         3uX/1xjbHwgK7+fKV0wJnSd1iK5sRBSBOUt0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602474; x=1772207274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgkg+RFIN0/lW+DoOiXqLtJ0Bh0h8a9TifrGQEUgOXA=;
        b=MlTWIvmodVwfsjJYjfdlt4aS3bn/RRgzygLrKJsvJ94xYOLfFNVAoSQpJ4LpgZYXgK
         fjYJGJY2+V08GzqVQ9GsxkvtlsEJBt5OWFgA0WWPTXqdlIHaN3R7wEALC7CXLiukI9LS
         ukd0OlM4T+vun5AsnL4Bvz+KSET+xR5gI08VOFrhUdPvOY/f9iTwd1MRJWLg3/3esIiI
         BkXahrCLS7V2vrruNRWI0KVLr0OUwPAqK9Y/QZs8rFOsrW9UqwfK+s/APLZPmuCTDlHw
         Szs69fe4ggaiktAEF9WPQDi+ceRxf7J7zi/wg1dmLaA3B1t7khfZSpMR2JaDEyPRI4rK
         P8CA==
X-Gm-Message-State: AOJu0YyEwQtNk8b/CcoUDJE2XmyWoEJt2F4sQITc6LXzw8Ey5byWIPXM
	UJp2KVsCZSvykv5Ju5DS0/8rP2O4EaeLJCYU4kvLL+cLS6ni5OCoIdgKNm2omnyZYJMUUbzo9bl
	tHc4r
X-Gm-Gg: AZuq6aLfbE6Z/+gZhyRd/0Xx46HGZYXxJ+V8GE44dwEV7yUxDL2CVaCj4cfLHcx2zqT
	qKezlL6YwARwNKRjqa5ePVdNV/pZpgi09vOVaRZFaRGjg0POb7XdZrkzITyjnpZFmqllJfAOSBP
	snq9By74FsCf8tm+5zVS6V1fp1cVDqOPargr9fyA3d7Y4iG5O7StdMG/ohc/GiSRdSOeBwyc1UN
	60Kpv+NlvDR9oEF14uov1MyDefNBB39UYbP1kA5PecUoBmn/2AITxFxmNRYR4b2CRwdzFDsQQmR
	ntuRuo2aG8qmuTrBhvTJRnW6qCGYE3QTIiOia226fodZxZMII1lANuk2om+Jwn1pM/dVDbLGs2Y
	eXsqtBQia2RRGseufvBdVUB1h0MtZdbkwJ6/IIXB4Z3EwdFHSi36Qb3WVPGM/OGF6VSna84i79F
	NBei/nbmukb+oQp8CWvJkJ0nSLVuCN2GI4/C/5
X-Received: by 2002:a05:600c:310e:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-48379bf4709mr400183565e9.33.1771602473583;
        Fri, 20 Feb 2026 07:47:53 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4e8d392sm48783375e9.2.2026.02.20.07.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:47:53 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-stevedore: Upgrade 5.6.0 -> 5.7.0
Date: Fri, 20 Feb 2026 17:47:48 +0200
Message-ID: <20260220154749.1422136-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 15:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124524

Upgrade to release 5.7.0:

- Add typing classifier
- Enable logging related ruff checks to extend the enforced format
  rules related to logging.
- Delay string interpolations at logging calls
- Remove reference to tag framework because the framework was
  removed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-stevedore_5.6.0.bb => python3-stevedore_5.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.6.0.bb => python3-stevedore_5.7.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.6.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.7.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.6.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.7.0.bb
index 634df7db37..cb194b6c15 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "f22d15c6ead40c5bbfa9ca54aa7e7b4a07d59b36ae03ed12ced1a54cf0b51945"
+SRC_URI[sha256sum] = "31dd6fe6b3cbe921e21dcefabc9a5f1cf848cf538a1f27543721b8ca09948aa3"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.47.3


