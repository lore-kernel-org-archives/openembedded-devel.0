Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0865D33A56
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.27729.1730831895625248194
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m79P7i0G;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ea339a41f1so50033907b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831894; x=1731436694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCdhQsIEMHR7ShS94gCt/5tN3/H7aYvSFaRasmG9+Ps=;
        b=m79P7i0Gd3Dusx/0h0n9KJL/cvHvIoM1FpkDUYsZ4Frqjp22AOaObFmIMqMxOLgnfW
         TycBxKTqaeftpsK0gss/O55lrdPO+jlRgCAjboFA+8/htgnDhA9aszLXi6UgT53XGycz
         Oy3sVqzaQ6kp3e5Zza+tC3ul2VAcJxBFZWwlHOerkvXKTZWwjyKa9HSqaSzi5GKuwAY7
         98/FBn8p3VBlO4pfxauxTlLOoVuye61Vr8USZdvdyD8jqXBYkTONvoAhWds7WDarS+Mc
         nI1boqyxTaTVIfwGyLgao5mWYMYBJBif/jeLaG8WNmNcqnUQlrcRrKWi+TBXF2iqnZp2
         lYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831894; x=1731436694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCdhQsIEMHR7ShS94gCt/5tN3/H7aYvSFaRasmG9+Ps=;
        b=aJn8d8of86HAWTOJnO9rRXMf4iiXHTP0vkfWP4eeGIkdHmacTasPIeDFq5f0fa400A
         QOlYVSnRe91EAifEAzn5Z2sN4kt0OxoED5iJ3d/fTj1ArWn1eWiciM246YWQYmHTfMXQ
         xcTchPXx4+WOlW5FhUziXvRIqCCgHWDSdhIaQ2wlECufWgRUW/qsoV+FwKSBHODsWw+a
         yaEGwDLlJ4JTZsGUx11Yz9thGFhcF3a9OcObgbQ3cbhVv79pIO8gcyHPxtlfMFD0kuar
         tFi03muQH5FWC2WOM3NztxZGhxvKSup7tNJ/BMgHFq+BWl2jMB4oEidPgE3GLMhnx5fE
         cwnw==
X-Gm-Message-State: AOJu0YwZ+LOiQchbpZ2PHjn5uz7KzghIHaz/84zNFFxkw6os2FgRgu6Z
	+Qa4GyYDyXSNjfxe0I1OhT0CcW/CFSyFTL6WSN0WDVa6Woe3rmIfG7n6RBPc
X-Google-Smtp-Source: AGHT+IET0kZe11zQBfSoJ4cvVj9e3ab0UXsyg+Clcomimh8EFCXW+Md3KbHbJAVLM+AWHMUGqWgXgw==
X-Received: by 2002:a05:690c:3803:b0:6e5:625c:5ad8 with SMTP id 00721157ae682-6ea52542f0dmr226652297b3.37.1730831894150;
        Tue, 05 Nov 2024 10:38:14 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:13 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 022/161] czmq: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:58 -0500
Message-ID: <20241105183658.34982-24-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113537

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index f90b2cab1..33a339f5c 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -6,7 +6,6 @@ DEPENDS = "zeromq"
 
 SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "471e9ec120fc66a2fe2aae14359e3cfa"
 SRC_URI[sha256sum] = "5d720a204c2a58645d6f7643af15d563a712dad98c9d32c1ed913377daa6ac39"
 
 UPSTREAM_CHECK_URI = "https://github.com/zeromq/${BPN}/releases"
-- 
2.43.0


