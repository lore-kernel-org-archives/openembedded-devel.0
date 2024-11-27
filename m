Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80ABE6ADF9
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 11:26:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.69765.1732706783096694426
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 03:26:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ACleKnJ+;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434aa472617so5769395e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 03:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732706781; x=1733311581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBzTDPToO4nCdInsGTrOIwheSG05ZTzXxiu/RRWmR4I=;
        b=ACleKnJ+0YGZYngjfDlcGmH2q7u1iCPoQqccBkSWqstJUxjsR3/BJu4ZImi3YgGUkf
         qDTPXLItA5qzoujVGz0gVM7AdNRoGYZVJtfT0jAax48R91MSTVsBzji+W70OkGES53tN
         0e+pzexb79xVm41PxZzzqYeSneHl+2ikES+QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706781; x=1733311581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBzTDPToO4nCdInsGTrOIwheSG05ZTzXxiu/RRWmR4I=;
        b=RwlEqKM+u0W0MeB5MRU0tk9htYCbMD7Vg/B3Cp2tS6AAZDX0MmDxURI2aYLXVUbSS6
         GVJK7eGHex6shqqCElzrVMNiu7knlwe3zCLMB17x/AAPGF69LimhOZAYrrSSoj7WY1S1
         KfveNHh4GbS2tpkPYKzMLbTGcihuWeSWsRlXjktMPaDm/DbB5iRu4IOl4URLcK7Rokhf
         SPFEsyINWdlHM1EO5NrSDnu1Dvpu7Hp1/tIH73L+JqnfYbga8lYnmBYK7YIdg/Ux3rRE
         sjlZR5x2NXWxRe+WDkC4MSB/gpwV9o0ELTOfLZM0pJ37mq4cK18iXJeQAN4/QCDURJKH
         ANjg==
X-Gm-Message-State: AOJu0Ywsco4zUkV37Xz/gKzROLMCYVrJVP8sngDv7nFSKiDnTFbq4sd+
	XX+iDvcDX1Zz4OOJ0PItjPeIj/Spah/ZvyTFwb+PNvNh9E8OYvuj5uZzG6k5xjkLFz+tOWSrvJR
	R
X-Gm-Gg: ASbGncudqXxByMSAEoAORT/XAJE4oY75wT3nVZq0rFULdH1rOObX46GzfD3B07wavFx
	URgB44R/8oKICFfQPJg9TgqQlE7/kaEEeA7F5peNZsPeNuqZeLB67vsqwo3VU08w+p2z6UHjBP2
	Hxe1bnpjw1CRwz/15zJ4V80jGK/2DEEoLXzrhVohFll26+qKlegiou0hY2ZGGO/6fchdKismFxg
	C7fbTpTrL6MEW5szILq35ERCpISVrN6a4OGdlKoMGpkSEtEiiIT4248EWXkDwqa
X-Google-Smtp-Source: AGHT+IG/3pPvNv2ITy911LXItQRwLheUEGvBeAEDpqeT+WwrETa5598V3A+NU88t7d992q/ozb8blw==
X-Received: by 2002:a05:600c:46cf:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-434a9de4527mr20684735e9.25.1732706781126;
        Wed, 27 Nov 2024 03:26:21 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5b9csm17951645e9.43.2024.11.27.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:26:20 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-cmd2: Upgrade 2.4.3 -> 2.5.7
Date: Wed, 27 Nov 2024 13:26:14 +0200
Message-Id: <20241127112617.789120-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241127112617.789120-1-leon.anavi@konsulko.com>
References: <20241127112617.789120-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 11:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114088

Upgrade to version 2.5.7:

- Fixed issue where argument parsers for overridden commands were
  not being created.
- Fixed issue where Cmd.ppaged() was not writing to the passed in
  destination.

License-Update: Updated copyright year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_2.4.3.bb => python3-cmd2_2.5.7.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.4.3.bb => python3-cmd2_2.5.7.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.4.3.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.5.7.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.4.3.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.5.7.bb
index 3d37e8b3c7..b764fd7524 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.5.7.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "https://github.com/python-cmd2/cmd2"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fad7740aa21780c8b9a214f5b320b4ad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01d2b71040983a2abc614fc4d0284771"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "71873c11f72bd19e2b1db578214716f0d4f7c8fa250093c601265a9a717dee52"
+SRC_URI[sha256sum] = "0219e2bb75075fa16deffb88edf86efdd2a87439d1fa7b94fdea4b929a3dc914"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta python3native
 
 RDEPENDS:${PN} += "\
     python3-attrs \
-- 
2.39.5


