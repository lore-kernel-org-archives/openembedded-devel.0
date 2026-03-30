Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A846FB3D16
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:50 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47984.1774867184081969802
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LxOCelda;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1090503a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867183; x=1775471983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrDx2jN3GBIhz8EQeE3THMMjFaL15YPvOFGJbudDLkw=;
        b=LxOCeldaWiwbTR9iFjixweJm1REvLAMku1C6DcTvzGKh+9KpZKBb5DQ3s9O+SgFtSa
         bO9BXo7v7sanDfmXvsQ1UfbJ6C2Gpz4Uqabgnfs/szn2GbzTnTzQpuvYn/DJnM/N5KQ6
         pjNXtvL+f7pUk+w4GX/iJT1Cs/43SQf5fI6TqkdTlMYyiUK6Qtf/sVCuguP9BX8wZYCc
         gf+Fd4KQpQ+FVOIi7IHXdimJBu6CqD1J3xumlaYhn0jilRMzkqGt0j2JfqKKj1VE97z8
         hAyH4e1Su5EVCUJf3NKPlqZCpOnnPt3HE5qolobLohAZ/f5ycSKbXrlxn0+um3JPt1R+
         soBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867183; x=1775471983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrDx2jN3GBIhz8EQeE3THMMjFaL15YPvOFGJbudDLkw=;
        b=MrgM+wa+pwh4xyqwcWQUdebasevIkcB8vPmDoo/bRUxDuw4KX9pbcUBgR9U/WFpXXr
         d+fzSNfml84ENOYbjHyNcMB0XqLiY8vKa+CAhJx2F1xv+/PNA6eUJtH5LgD09JJveXE4
         VrsQQtgFzz4im5yLaHla16yDG60Tpl7BGp+VDMeZt4LH6H7GXllWQ/L/bMsLf485LKGT
         9fNdGmEduJ5dek1eeydzZkT4yNAUVa4P+ves+XyCPt82yPJ4owEExvgfcsdsAe0iLTYG
         +Kc3tdtxk6ZB/0AZ/QE9ma3qPMcW78U9FqDOj76POQYBOf3hkG+pqC0TWPQLi0RrfXik
         845A==
X-Gm-Message-State: AOJu0Yw43CcAXnmai1EsBD1Z9YGSHnVkJBQgeVUX2r1LYuArUouJKJHJ
	m9CimhnUIJ61dU4j6M03ZukY6em3AVP553Pn38LgiRCgq+nLGVjvFf+liayMTw==
X-Gm-Gg: ATEYQzzpoPqI2DVvf0sMdDa4HrExBWhbIOzlNmVwZ4yhu7ythyo2O4624ziv0rf3LhC
	CxNEd37nHmIgmWluZH7rfytFCgkTHENw8rRzuCRbsObzWxweu77ayxTjiSXwmlY0PSFsQAJYrps
	21uPfsyvr2WObyeJsP78XqRPCtmICaozRhe4p8czWr9+UabA27MEkY8DVj+ZW66WwMIxvIKz2AV
	Sb+7MWn3nJTMSbMN6AJbmsVIO+jWX3RxqOBZd0HSwKoSXvxUbcpcLo4Lv6t39ZOSeRVQNGJk6f1
	Js2++P+FwQ7fV02DVOZcDzEa4FwtA0VZkGdc0RsfQfhCKkrTpxPTK4TqsQVMbETsl8fOoEqkI8A
	pqarTyfRNIkvUZjL7MJBeoNVJ12FfJ4Gep3NwBuyABdQx3JTviFDKNpZoxQu0yaNh9NmbjuvaHT
	oIZOK6B2tLBeHzNOxZzigurwRcPvwWOQXcazM=
X-Received: by 2002:a17:90b:4c0f:b0:35d:a2d3:5c2e with SMTP id 98e67ed59e1d1-35da2d35edbmr4015912a91.20.1774867183302;
        Mon, 30 Mar 2026 03:39:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][whinlatter][PATCH 15/19] nautilus: update 49.4 -> 49.5
Date: Mon, 30 Mar 2026 23:38:42 +1300
Message-ID: <20260330103846.3381644-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125858

From: Markus Volk <f_l_k@t-online.de>

Major Changes in 49.5
=====================
* Bugfixes:
- Avoid unnecessary delay before enabling Skip button (parzival)
- Fix crash when searching in Starred (Shivam)

* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 866d0d78d50b5a67db44515feb3da426a2236cca)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nautilus/{nautilus_49.4.bb => nautilus_49.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.4.bb => nautilus_49.5.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb
index 9befe945df..45e0969d66 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "1476d9459a63c85f0ebc18f237b32d12b008ad786002376424919725f50e76a8"
+SRC_URI[archive.sha256sum] = "fa5655e73ee7953aecfe71fea67bfec0c67447e14e6df135aa3f80334386872c"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 

