Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EA9D5B85E
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.113.1730140096694840448
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yf1MYEFI;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e33c65d104so40830057b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140096; x=1730744896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxdgwwBu3J5I6J2nBQcgL5QRPzFDRA64poenntXCM68=;
        b=Yf1MYEFI09Ub5Y8yhbIyO2PNqnWbPpfH9HxRAen+PyiMP3NKivp8GuH7CeZDNQCert
         WVK5YpR3erf+oolo2XlMV9tZw6lHnuquvlds1EL1rbEvg9JnhnB0c1Odu19wfFTTViT3
         wzz1/5WPCIZeYa+saewlLQSh4O3FyMtj4FoqygNxf7GpEXKzS9keMmBUwteD27+qfhTq
         z9P7gbjoMzXyRED8OhDu9QLp4NIrUuTEMXohH2y7N9/GKOQ5DlXGgJdiKUFrFVevq6Al
         muiQcle1ee9eZL7RhRbFT2Q56IhITZ8QBwy3G5L4VHe0+dAXokD8Pn9XDRR6F1+1w0SY
         RNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140096; x=1730744896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxdgwwBu3J5I6J2nBQcgL5QRPzFDRA64poenntXCM68=;
        b=Yb6O02lE+JgDtfCfMRXVvQIZ+r59Vj4nz+/SottDiSv6FypGXGkZK3HA+dwzZp6e0Q
         eL3EfOG9puBo+bCs7OPpzbIhI1J5CwwbVygP3ivC2+i1+tN/QD0CEyyc52j7uTTaTHRX
         hYUFBePjQHSA0UH6kkx85RrxBELFIgQqUky2LCReaT5rhrKoce6sPnVWVNZC2ap5EgDh
         VJ1RLXwFHvWy6iBMbwDvsDI3JfIOoHZuMP2KLz75cD4fiw6eJZbdShzB9UJAiX+q1Jg1
         9Qd/ljmup8pBbt3+8/SVVTVoNcEzUivS5AoQTqsoM8RxkjX7HwVvJdNmEIA580PGlOVI
         kWtg==
X-Gm-Message-State: AOJu0YzYiO7+Gmmb4EAbq+JGmiCsesDbFpXiE/E1g131OTgpZL4yTFe1
	X/MuNWo0K0aSHWCg1jLI3dC2mTj4j3B6B+9ICTNEfsh4BkY9UI97ikFnYg==
X-Google-Smtp-Source: AGHT+IHYip7mn1O/fmCF5VQ1lMK05eAgAN5EPVosxnLvuoYaeMg/dXlC2EmLhXyuLV6CqC4WalFd/w==
X-Received: by 2002:a05:690c:94:b0:6e3:1e5d:fe2 with SMTP id 00721157ae682-6e9d8acb426mr76529447b3.31.1730140095251;
        Mon, 28 Oct 2024 11:28:15 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:15 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 07/22] libenv-perl: Use
Date: Mon, 28 Oct 2024 14:20:23 -0400
Message-ID: <20241028182749.5058-8-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113275

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
index 8e3b3dc2d..f88a418a4 100644
--- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
@@ -9,7 +9,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7014ce1200251ebb0"
 
-- 
2.43.0


