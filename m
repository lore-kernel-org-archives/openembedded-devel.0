Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7A3E784BE
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 12:11:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23529.1766923871575130916
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Dec 2025 04:11:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mG+WF+FA;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso67911025e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 04:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766923870; x=1767528670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sc8Qdy6Aedujxi3l7K08T52VX3ToIMZSd2jrOGSMetc=;
        b=mG+WF+FAee0lKPSXcufvi14w1xO1oUWvqftP9UuFS46xP6velBZ3qkVyoy51o2CSqV
         tDnlL46d6Ql0nvJoR8S5+gWU5JiVwQL+VP8ZeCML91xKxk4MNOvy3nIFRPdqifiTVzLW
         YnTgDorIC8S4oJq2b4yhhTtPbncdl8eVjC3yoLqqZYi+ff1x9lVESHzd926q/drZnFAu
         ikY79PVrA1hLlg8vYmd7HxREZMLTmjK38nnUFBhojk/bM1q4sZZ8+DtULp7JuXWfEuQt
         dQ2pfiOwSDuHzEQ5lorxXpd6B71qSvVxN6wCKmcKPc0zWhpqwTbo/cyyQyzSGxsZG0q5
         haDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766923870; x=1767528670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sc8Qdy6Aedujxi3l7K08T52VX3ToIMZSd2jrOGSMetc=;
        b=IkCGSAeKLPqwCun8a/RmM0cET/F2mCoGl50b/qv2jIT9/rydKIioSPErGevWnhLnYq
         MneFjD9PCdWg0BGcaCIn39lYhJi8Or1Cpj3WdCQsgIA/igYRJC1mlMRHG0GAbYDkuQ13
         6W7nrBwnOyCsZs8KAXqLlfrhddH+wAyANF9k/MQ67pGy4Jf64cdbwUZpak+mP4AfcEp0
         u7AcKKbndxOYzh+mzdGX4i+J0jHXRaqCZpWy3JvQ73NCOcuijnWYY1crqMcsCe8vqMcM
         DRF0IqNWMqgdDlp3QveYFBOEpZImRvHS/dWJCyd52488TovZhqorF9MwGH/9Ak9HM8/T
         6mhQ==
X-Gm-Message-State: AOJu0Yw8uq5/YUPvDAD2dFG5xbO7obSUv17F1a+H4xIPGfdNDrVfC6Id
	QN2BG56pSlI5abc5W9kM0TPrXmneOofqqKWk+KG79tg3lvmyV5E9ylRXnvP+FA==
X-Gm-Gg: AY/fxX4uDwajGlP86oHNaxHkDV0ycNzNWzmhMllbFNQAseHA5GxmA3ALGCT/DP1ow1o
	JlJp/Ue6cNH44OIseGb/PBHys9huMjsRsHNtzVHqIHmbDBHGAmD8kKqwOvmigPoLe04OSeGgNS3
	qrneb+pO4gFoxg4Z95wY3XwbXPX3h0wP9kj3vDO/viV3lab6ASiASNwa0sRIUWYl7Od+X8lcFdc
	hx0DH7IuUBDaEI5t0QQ8cbMU7Yj3QhgFQRMnNhK3o+R7ljBLAHLY9YNFPGHXFQIbD3xwrklrdPB
	dJQbQ8bLjDL3VZjItw89nryUk0DSLeEcRv7FSB+EZ8MTyhTgDnjoNCMrUCBL2cNGCmNNODsUSSi
	LHKhhf9n5t1JYlESyHmR4FwrNqiFqVrluoqNN+vH0f+jzoJiEgw92h7O7zZ6vOSWESsHVtavEiB
	ZHyaqxiA/v
X-Google-Smtp-Source: AGHT+IEGlzpPQsg6taTJQ6T6FVSFfLE6lUPLnpl9IGUiIKdseD6FaysAqH58AxkLCouFaGmcitzT7A==
X-Received: by 2002:a05:600c:858e:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-47d1c629902mr244898165e9.4.1766923869863;
        Sun, 28 Dec 2025 04:11:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm546859805e9.6.2025.12.28.04.11.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:11:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/6] thrift: fix SRC_URI
Date: Sun, 28 Dec 2025 13:10:57 +0100
Message-ID: <20251228121059.1810946-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228121059.1810946-1-skandigraun@gmail.com>
References: <20251228121059.1810946-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 12:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122959

The tarball was moved to an archive server, so the link stopped
working. Update it to the new location.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
index 8141abef51..c51113f67b 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.16.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c40a383cb3f747e0c7abbf1482f194f0 \
 
 DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
-SRC_URI = "https://www-eu.apache.org/dist/thrift//${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://archive.apache.org/dist/thrift/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
           "
 SRC_URI[sha256sum] = "f460b5c1ca30d8918ff95ea3eb6291b3951cf518553566088f3f2be8981f6209"

