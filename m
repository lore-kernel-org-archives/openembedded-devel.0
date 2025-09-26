Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03358CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 16:49:26 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.139.1758905364512730592
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 09:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHOgg/hc;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-78115430134so863189b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 09:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758905364; x=1759510164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x04liVQf8lCjqu7/IX9KpgxfZCko7kcdoiyCP2CRL+g=;
        b=GHOgg/hcw8UaDURC6GxHVvf4rUCyHQ7tyAun3OUWlNk1Ixc0r08ytoDqi34tgL3imo
         BCW5qlSo5T/1FaoUCLbeUz8sMz9wL25BDHaaMOyOOQjalE1meBjICjpRxEYkrxBIvTnp
         bkoyPZZagSxvDyg/kgyI9GuQVNWlneZANGX1udzXlJq87uezEWWun6GQ7PYBZFHGKr4+
         7DFnaOUJFD0ngESUQiim3AKIZDkh321u82L+asV4h+w9/vhI8VA6KwIwZXuD6lilwQXf
         DUKw1/Z7Qbjv7F2oSc1DFCCrTcoMwma5V0NhH9KbcNV+SPuShDUFRmFjX0vyo6tyld71
         rQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758905364; x=1759510164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x04liVQf8lCjqu7/IX9KpgxfZCko7kcdoiyCP2CRL+g=;
        b=rUfB3M27ihHQwiKtwxwVKtN6DKVb7qlmtpsi7755oF7XC6zrEMialKKk31wCfcei1F
         BbrARRM8NxvdAx+A07Zf7JUIouos7v7QPuYsvF5duN8zWvOeaD4w0c2CX29C/zm6Fu7S
         /hW8NpOgi7HhlATf9rn2Lb7/RZtlBgOKGA5D/QXMbTR0bzB2UE7Ohap0bbSHJZhdGE7t
         dzmGcNF/Uz4JSMqAKVdhsQZnDeGXGYkb9m7SB5c/B1k7zftUjYBZSswfnYoBE3hyDhIE
         a41wWfUgymevzSNmKgU5MHBfVXUNhb4auxT4kaUIMTUrZS6nsYJJiBGjyFIoRmmbIe7S
         FZAA==
X-Gm-Message-State: AOJu0YxXF0ZNneF5flIYoGa6iNYsZK7QQVbSquPhec6MdFojzIvqQetC
	9QN52ueNYmLlX+fXOvxhJTy3V/So5ko56kSEJBED8Ci7qWkw6wOCpvRDcF8e5Q==
X-Gm-Gg: ASbGnct6OcNqheYz7kq4qGPPfP8B2PZY3yuUgKkVgCYmelTokG82Wlbp1XmCoUrpdZw
	5AnoklVULkGYIxbpKUGiP88dXCXbxZKZAp6KuUotCwc56q/fJsq97RtyPU46ys+pfleWcOlbrk1
	zVGji5zYNgm4llLG4t9yi5HBLX68IkapcFYEjBYbNmY/HjzbIM/RKnbiwS0eWPZDpn1vMeDIyG2
	KTPU/q6gxZp36dQzTvhyCUHvT16fomVyojRBujexqAEN2xQflu+DcMVaULG8fjvpA+HWr4m3Yfv
	K3IXXwFQKvF5bbTUik/GHV6daGWis3vd7lF4eoXGZN1lQrVWGo30r6QWkYjYCbllAvAdXmGR5Z4
	kGrg=
X-Google-Smtp-Source: AGHT+IEqVdvFPlkhzG8cfvvgf+yBB6wTJzloDMDNwb/7ckEwwdFk801j8LZvUmkzSBQ3jxu59mL+cA==
X-Received: by 2002:a05:6a00:139e:b0:781:2271:50ed with SMTP id d2e1a72fcca58-7812271540fmr1046535b3a.5.1758905363724;
        Fri, 26 Sep 2025 09:49:23 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:d4bf:d4c3:9352:f98a:353f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06af6sm4765795b3a.88.2025.09.26.09.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 09:49:23 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: skandigraun@gmail.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>,
	Philip Lorenz <philip.lorenz@bmw.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] 2/2] p11-kit: backport fix for handle USE_NLS from master
Date: Fri, 26 Sep 2025 22:18:50 +0530
Message-ID: <20250926164850.40701-2-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926164850.40701-1-emailaddress.ashish@gmail.com>
References: <20250926164850.40701-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 16:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119934

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Disable NLS in the build when USE_NLS is off.

(From OE-Core rev: b94798ecd535956ef4565663710ea9a701ff21ed)

This change corresponds to upstream eeb3974472429a99a724f324dc8a63e435741f68
from master .
Since the p11-kit version are different between master & kirkstone
applied the patch manually

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.24.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
index 72b446204a..62aca0cfee 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
 PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
 
+EXTRA_OEMESON:append = " -Dnls=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'}"
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
 FILES:${PN} += " \
-- 
2.43.0


