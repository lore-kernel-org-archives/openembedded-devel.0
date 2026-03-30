Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39B3FB3D0C
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:39 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47983.1774867177944314486
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p4Y84C8v;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso758773a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867177; x=1775471977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLteU4IAYOyyoPowaBOfDPsCU7iI8oOeEk8LW9Q6fMI=;
        b=p4Y84C8vAWEGiitnjt+NJQkwd1ipBNlfs6v+tCU8QYF+A3B2rE6xojCVo726llj8fp
         oFZFEGfoHPPRzLD1uTejD+kV3Qd9i+5sLZXXF5s7OMe+ofvJSXvKds3rkN9bW2UoUPZF
         +B7PsbDVPh4ZvyUR9PAXqpWJPBARDo/BnNixmkB+Y2HIvBmvXgHz5OqsDGoEYfhf7IEW
         b0AWkS2I0v0dnbmT+rmJrQw9Lb/VG0yqVqq3Cs2kNhZPRHLkoujNwTedA9WUWkcdPSN9
         GCwpgtgO48U9UIG5ZY+ohcYOPd7ibl1oTp2afGKNzttHFdEqgGifrCkouZJANbYuP0tK
         oSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867177; x=1775471977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OLteU4IAYOyyoPowaBOfDPsCU7iI8oOeEk8LW9Q6fMI=;
        b=ONOGy95z4NTARoiBRA84w4cfLqwOlyeEkhxbL7K7nY8fnSy/2jai2Pt0inWEPbLjkr
         +VD2w4dm2eh8pei85ptgKtiIzl2Xl+aGQHxX1PPfHpetUn4Bui1gDYQPLa/Gnz6xjXaD
         fazUA5jx6kj87BktS7qCp/qi7VyocShmYE4hb2JAAmdplSkCkbv+XyNbL/30QY4Lix71
         Oj/Mnl2hUS7Uia5IWdk8IoRdDvm5a939qX2EYzm1uZbntBXUxLKZdT6BgdUcMzbGGTe8
         sOX1VAh3IK+7nFI8gijX4R/xtmHuXFa/5SNfMV2sDStp4P/lE5LuhSB2BL+szYsv/qNt
         k/ew==
X-Gm-Message-State: AOJu0YxqsFnHOKpC7xu5R9FXJHxqBHJtyrIhGRzKqrHgczMHxmK0Sbil
	Mge0Q3WOh8HuNb6Fj2n/rJGAgciAwAa/Ll/tlMml7F1qhX1OZihJaMQNK/MNUA==
X-Gm-Gg: ATEYQzwaROqcDlvoaeoK6rJ5xhbBYzfjkc6mP60pP3uBCtMQ/x+wBvPyigQ8e1Vv5aT
	279/HMJY0K6qQ8ymj4U1MewtgfJBrms3JN1zId0aaNePrzeNWOQsAHQYm6Fd3AumItdQ5sks1gO
	tn7tMldadKKpi6Obw3ad3gm9vowYbQJzwwxusq5o9Z5MkvXcHkhTj77/pO2k4cxKOe7bhOrandS
	5pv/GRUwADGZ4I4Vv8ZNxAJv0JM4ZUE0tn2nDva4lscc+fvBFv0ayr89lu9bPP2j5Bm2QGrW9vK
	AsX2K2aNT+0AUIQ6p2O7lVKGjPe0fX4xZUHhW5qt4ucnFZhcsd3BqF+Dp3ac8vjAwKzk2PzEwZP
	sw66uO3bCoZ8VkmpmYITXiYk5xnL7RWvdx/TMoZlB9ps7Nw6wugaOjkgRwxibeXdgwXc9d6gDzS
	vglD/qI3T+aq3MgdVoOckDlT2qvYRlRj8YVPk=
X-Received: by 2002:a17:90b:3a92:b0:35d:997c:8ec0 with SMTP id 98e67ed59e1d1-35d997c9d0cmr6810224a91.18.1774867177156;
        Mon, 30 Mar 2026 03:39:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][whinlatter][PATCH 13/19] nautilus: upgrade 49.2 -> 49.3
Date: Mon, 30 Mar 2026 23:38:40 +1300
Message-ID: <20260330103846.3381644-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125856

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Don't waste resources on images with extreme dimensions
- Consider thumbnailing finished at correct time
- Redraw view when screen scale factor changes
- Fix potential outdated view item usage
- Correctly close mime type program chooser dialog

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ec8cdac89c5302a17ce30d96c6299e983512b3a8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nautilus/{nautilus_49.2.bb => nautilus_49.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.2.bb => nautilus_49.3.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb
index 1229fa4a80..b6c13dedb0 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "2576b34bed2781a89f09051ec9fcae3ae17eb7172cd7be678f592aa14e4c26b1"
+SRC_URI[archive.sha256sum] = "aa6bf376f08992362805eae01890b1bf5ad148f356aa7ccfe1f664eda88d413e"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 

