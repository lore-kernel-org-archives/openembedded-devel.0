Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336E1C4167B
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:04:34 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.1297.1699905866561122440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CPP7zFBS;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6c320a821c4so4104696b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699905866; x=1700510666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtdkQ/MGZafF1CH38/bhRSYfhWYM5976L8fwvTiWtRU=;
        b=CPP7zFBSMYEUwppiW7QzwUtWYKegRfb/b6PVNUwu4G82N2IX2pwC/BCJAJq1G3LWS/
         jmzqN/q/wfb15YG6Y9VdxcVGGbKOtCPDYV7hvAVMDN3PwnlSBM3kxzngF6c76xSkoHeR
         4GJYemncLHYW5gSd0ZGHyuiidT++t5r9VBBcNPFKKFQXYwCMXIBg3szLX1GUuFYAhOgb
         gMqa9arrp5EQ0NDguzSJEtRMRVMGa4IyinO83GSgja8TjYuaoj/s6eHbroBkFteF+/eZ
         wqlsRNT4D27rGhh1pbv94bZrLqNiL9MlYwWWcxcgX9bFkiHlgEEP+mIg3GMa4n0Vj666
         9JXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905866; x=1700510666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtdkQ/MGZafF1CH38/bhRSYfhWYM5976L8fwvTiWtRU=;
        b=O32siS4UXYaQEAv2ZUpRrN87tX3xjQ9lCOaYNyxyOTtETM+HkxR7RjIzvhqckbOCKO
         KtjcB/8haB5cCba7/KNlp+kqm1jH4z4+WmNdgWgxfVdxG2Rbz5vi4EyEEg1YwcAaUiFc
         k4GMDY3N8leH9T2Jp69VfKQzQ9Xw5mNeDnpvpW8tWGDopuR6FqbFL1FeJ8DLhcqoIOsP
         n6/FrjWMPIKeP27SgrJBofvLdVFwuc0Rdyo9pajtiWNLygplkm+aMg9d3cX9E2ygtrUZ
         YdV7wOApz4gYt3v25otGSWVqTYxyjMPD4ROxOdKAB7kwtW5/9DG4x1hCNO/2whV0ylFG
         pBHg==
X-Gm-Message-State: AOJu0YxJjiIcuvUMc2FAp5dY2vD5ZIK4I/JK7e3KMtOJIHlcDnyqZ/+q
	n3+4MGg5anYJgPqsJaVPR16xmYQ0AMVYvQ==
X-Google-Smtp-Source: AGHT+IEhqoAZ/JSnNeQuLTNjh56hYGr+ewmvErWfWlMxPJ49SIwSA0/qIeRiXR1y7K02LPSUvnvB+w==
X-Received: by 2002:a05:6a20:748b:b0:186:603b:6b53 with SMTP id p11-20020a056a20748b00b00186603b6b53mr3377814pzd.0.1699905865612;
        Mon, 13 Nov 2023 12:04:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id cm19-20020a056a020a1300b005b9083b81f0sm3773679pgb.36.2023.11.13.12.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:04:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 3/6] gnome-terminal: Add missing dependency on libhandy
Date: Mon, 13 Nov 2023 12:04:16 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-3-a2b88b041141@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 20:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106677

Fixes
| ../git/meson.build:367:16: ERROR: Dependency "libhandy-1" not found, tried pkgconfig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
index 069a95f202..014b329b34 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
@@ -15,6 +15,7 @@ DEPENDS = " \
     gsettings-desktop-schemas \
     vte9 \
     dconf \
+    libhandy \
     libpcre2 \
 "
 

-- 
2.42.1

