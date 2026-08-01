Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAD6C55178
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:11:59 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5253.1785589911813911934
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IAq+UL7C;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso1096735a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589911; x=1786194711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hHLjGuyxbzW56Q7P1ldlKfKHL/kUH9MWkKodv968R20=;
        b=IAq+UL7CwNuaAM+UIw35KkbUoBwXhM34WP//GTRQnsnwwru9AicHTNp5bUXbAsIs6e
         a0H06ueGJ23LRC5+yS93UJ/nr5Ygt8CZEO2kqpbag7jYFtiGh27YGL4m/o2uSnU4lSkl
         ddT+uOPudZ4DCzALfUPp0rXZxD4jIWROY6IFHi+aqFf4JwSv14uVjV531zEXynw1of4K
         Zyc635ORBE8kccqpEakWkwKpbiwihOFWWcdiZFtsuQNavxByBUhKtPXlygaUfoV6/rrV
         FAa9zRfcxzXJLBzbnPHyDShl17ax9Hm6EmPCutDS6LD2cE6zfUfq71Q2KlaatzIhI3ng
         ZH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589911; x=1786194711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hHLjGuyxbzW56Q7P1ldlKfKHL/kUH9MWkKodv968R20=;
        b=on1dIx2j5QYDzijR9DYB9oHUYkbXgIS6PdIesmKrP6i4IEbXFi/Qa/D5AFlKhNvc5i
         RAVeiLKJ6SPgPWvCCztRM3YmnlsUxF6y+cPCdEVG+rILPGwepO+pWLqzWuKgmn+e3ug6
         2ndxDUAEtVKcckOPQOZmoq/UCgIWO15y5V7Sd5wnO9E1DGeo+XnvvktgpukWPGnh2j2t
         Kal5jdmsX7knpaHLEh26bkh2+vpNOiHLjIu7ehCn7xSLvHbNj79hZmSpCf/KiC9vKsOg
         U5atD+A11P4ZpGJE7VueUEhmU0AFFJLCeM+jlmkzYhVNZ9sAcKgwpyMJBh+j5mW3/VOU
         awQQ==
X-Gm-Message-State: AOJu0YzUmUgRQrhQD3AmnN7dmuQLuKKB3/DDLxeKUl4RLjKyPADsC2nC
	tKlsnInildfO2IVC0oPhGMjiM1esc7MHqoNwnggPtEbVA3qOZn3e+sJKAfyrPW/W
X-Gm-Gg: AR+sD11liy33X9MTwy3h4x/GC4KhrshxRy6UhcFouuMPL+TXGdX6500dDPg8s1C7qEt
	H0NoMsoroDKhM5yPdhhhNMkOB8vQFAjiFEz2OfSF8FXVlUJK210CAMlEvgU3JucQNGzxCdfEEmF
	H+3LLJkDRqVfary2nTleecBwPVzZNrDvjAUG5O87gu5rcvXNxB0TyB3D18reNwD8aS11EUDpkQ8
	Wl5DPQRyAxngzJL2BYHEe+C67BN6RWAlXExWKL2IJvFMSzVgoddFdDKERyE/Y6mfG3XwzN8qbaR
	JmCqIVl+ov6KXwVE3b1G72QssWyQBCuN4avfBnN0qTybrR/AcWRZEldFi7fqKCoofRll4jj3QXO
	mlhVgyEW4xHnjP5gORfvAemLhxdIOAGvsEsMoo0q/iFO0KfAouvLKQ2t4SEiYxAIYZx2d8dLGvk
	NM00tEPwBEivU4KCBv6xZlNVa/2cO+rwMa5aeMPR1iApXVP7tqJcgmemsRfA8OHgTBGjhXr75d7
	g==
X-Received: by 2002:a05:6a00:3d51:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84ee4840812mr2847661b3a.19.1785589911041;
        Sat, 01 Aug 2026 06:11:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:11:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 2/20] eog: upgrade 50.1 -> 50.2
Date: Sun,  2 Aug 2026 01:11:20 +1200
Message-ID: <20260801131138.3299410-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128596

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/eog/-/blob/50.2/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-gnome/recipes-gnome/eog/{eog_50.1.bb => eog_50.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_50.1.bb => eog_50.2.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_50.1.bb b/meta-gnome/recipes-gnome/eog/eog_50.2.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/eog/eog_50.1.bb
rename to meta-gnome/recipes-gnome/eog/eog_50.2.bb
index 5d454f6236..7eba518a5e 100644
--- a/meta-gnome/recipes-gnome/eog/eog_50.1.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_50.2.bb
@@ -23,7 +23,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "6f5ee6d756548b88e25a987e0d06dabc3c6c32598fb7df49fb08945c1fe94a55"
+SRC_URI[archive.sha256sum] = "c6c2afdfe40a838de0c6b264884a80d388f1c2efa3f73a15ede08824c46be0b3"
 
 PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11','cms', '', d)}"
 

