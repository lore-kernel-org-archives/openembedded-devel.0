Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791CAD35E5C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.27748.1730831919093395735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=US/3+68W;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e30cef4ac5dso5216720276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831918; x=1731436718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxPVQspwZ1rvXVq2govk/oZ4HnypBHD6KLT4MOGf1R8=;
        b=US/3+68WizqjL8//vZmorQ10Rxvpw3HVr4SXdOlNxCwea7D82cv8rtqfvdWCfGlbRM
         Rn+kgRRa/CpYfDS4dYL6JzN7Bv7aXtMPP5HwVCRovQtXqwtW+cTTnOrsCbwgcxMXEYKq
         Q8Eav6VemZKWJf5fNwTTJ3JF/rGEFHmbrC+8sUDjpjfqRmhn/t2CnROhV/iRKaRFC8iy
         VaQlH9GsWAe99sRk/98qHMyYirk5zMxz9O95feKongvlvZbzYX8WLmoocDu9TtwYd/Au
         S5r+Tqkn8e5d812+lxcL8AbbIrQ1gVZ+6zMWJcKs7ZlO7x2F4eyy0LuCmIHXiGeBNht+
         sPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831918; x=1731436718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxPVQspwZ1rvXVq2govk/oZ4HnypBHD6KLT4MOGf1R8=;
        b=rNOxdspQvZjAcAcSaA1HW9JHq1vNNBrshY1tj/+0eYVVLZkmUYaIINAm3RrtOltGpx
         SQHF9fITXrC1oZlcaq5QAWnF9dIMp2hsqt+hvwD52bpxz8rf4/SaQGZS7Jz65aJ989eQ
         gFhFDmXiztU92BF33rDApLCwX6bogEXpbAs9C7Lz/xA0p/BZj7Gh1AS3j21sJtzE/LLj
         /p1vblVf0rIegJQSaAgCsiR1IyrfFgbitkT8P0oCt/wXbziaGovBrECj576emQSJf6xz
         8QCqDsyeCyADwrFrVVv5C0Z+1iVw8uv8CeDx9bAlGE5tOgYPfWAzDel6I0tZtPOf0tAk
         qOWg==
X-Gm-Message-State: AOJu0YxiEjViCRKqH5hiQqaeICyQ/KS8i1EuMO9g6NpC3V86pcggzKLR
	xrNX6H9g+niHZSpi/jak6dtQhxPklVi4n0hxJu3t6qc/vFi3/kRlJ1UquPl+
X-Google-Smtp-Source: AGHT+IF2qCv8XcSVIbwAKcLsbaXWldSHHv77xaSd7t2IfpRBdbSlnfYzwjcGpR3ky7dZyNam0029Rw==
X-Received: by 2002:a05:690c:6610:b0:6e5:cb46:4641 with SMTP id 00721157ae682-6ea3b8961efmr274240607b3.13.1730831917678;
        Tue, 05 Nov 2024 10:38:37 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:37 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 047/161] libserialport: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:23 -0500
Message-ID: <20241105183658.34982-49-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113562

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb b/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
index 4190338c1..089d426bb 100644
--- a/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
+++ b/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
@@ -8,5 +8,4 @@ inherit autotools
 
 SRC_URI = "http://sigrok.org/download/source/libserialport/libserialport-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b93f0325a6157198152b5bd7e8182b51"
 SRC_URI[sha256sum] = "4a2af9d9c3ff488e92fb75b4ba38b35bcf9b8a66df04773eba2a7bbf1fa7529d"
-- 
2.43.0


