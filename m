Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CD5C5DF77
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:07 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24352.1786747560369455847
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z5pAuvyu;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1635203a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747560; x=1787352360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zQRK3EncrrJ7fXQ+2H/LG38pLmHRjYNw90TalCEZec=;
        b=Z5pAuvyuegz9PjbOgWITjxfKkQ4kI8UE6YsixBY/AXB84Lu9Si3kC2VL8PaisdThmv
         erVcMWFrPZTP1phwpjxHAkUYjHS30m2YJV6iWtl+XaYD4Xnyhwk2bIAOfFyI8W9Mjr/t
         3y32O+F20svy2HSA9s8qE42EAzxHd7cCe1rVxrgmQ+abKx3C4GfX3hNN+yRRUdT/bv0Y
         4s1lzl+UilcqxW9pbvngNOL05HbJE/AWrSvFJZmqf9hwqouisUODJmWFjWvoh2lcfK0D
         u7hHcgQXqDzG7srM37ORLoeAU4ECSLkqdTOdwq5Li7we1YDly/M5HbDOx0ldI7l36Vpo
         C9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747560; x=1787352360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zQRK3EncrrJ7fXQ+2H/LG38pLmHRjYNw90TalCEZec=;
        b=gZjI/fxS//Ewd7JuW7JTzccJfNNi9NcaUgB3nj53mmrgTJQZy6fxB15THpwDu5dFRj
         laJ9Z6TI9bUloiaizwFtmupDvuFEbWANwl4g73iV5IO2/XCUz0NX2U3kHFIudYp41fUm
         OGYdNNwWsYZuNVzA1AYkjpuixjJrg7KR2xMTRKFCHgZMMiuzPFnif+UhJpT97OoioDg0
         j2cMrRd2/SSdYNXxEa8FHM7O7n4WTUpge5FIGuBxFIkuQEj3022yrtJwhs/P825p/KJy
         +nFjQOtboWbxG97YNxdxrMdOKebn+QNppdwH50Vlnt1iw9QLEq8dfXQNTo0dAlrLXh1F
         JrBQ==
X-Gm-Message-State: AOJu0YxFQT9kLmuPtzakQsjQrrJf9pLnSuGnrcQfZPej685f6CfjHOqE
	0zquUq7iyKv88rRvCLhEXYsiJeK4RfRdEZhbObj6CKxom5IxbXpj3s7YxnYwaeoJ
X-Gm-Gg: AR+sD10mpcu8CPXPv233oxXKfAjZPK4MSAgm+NINlTLrQ61xaXYnJ/rqDix+qPIK6sZ
	34JejTbsUKxvKaXVznBSbpF/FoOxEZ2tidk1RoftsEX5ZaZWp4GkyspQknOyjIGkVkmlbmDhe5C
	NCDgkK9kdo9KSJnUJj90IjBUl5uONb+Dz/boETWP/QanhfWFg30Rvs0qD6AbxYnuixhD+7064Jv
	IafH1HpSjHnjeU3K3hdYS0OekiqyvOIF5MHej8Ok/7z4/Q4PZt9SVwIUjJspwGOLU8KO8uvH1+u
	wEFehTHhyqTGVsqoMsLSkTZc+O9Bkt3wDvu5x5x/1PHIUjd/A3r//cY9o+IA6ERdIBllVl9H1oy
	rAcf3oQIa+YYQ4MrMp14/hCSct9yzxPbm6mGZPryETyEkpRGavvSnkhup7Aw5a4GeE0WO16C2PO
	uawBuxt+wA0fvTSua9afr90z3gi/gj6cbSOr+V2OhTsjOox1ooRWPIb6M5o8nwi+2Y3yM5Lj6mI
	ToMgS7869UbZjmM6vnZwgv/9W2DFx6nSOvMmB222DDRqPYzax6c6Tjjoq/diy1WKYhiq0p+rsT9
	QFaLQDvSVdm3kKet6+bgn3e/Pbqz4jSH/kFYNZ1Z49GVDFEXI2309QGjVesQwAwPS5IBsGzkcpE
	Jkobb1TTPXAZnt/YNMHWZX7QVSCOvqzqQVnUbG2jw6uWyJw==
X-Received: by 2002:a17:90b:1d01:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-3933b75535cmr9992450a91.7.1786747559681;
        Fri, 14 Aug 2026 15:45:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 015/109] snapper: upgrade 0.13.0 -> 0.13.1
Date: Fri, 14 Aug 2026 15:44:01 -0700
Message-ID: <20260814224539.1523174-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129079

Bugfix release in the 0.13 line (the newest snapper tag; the higher
numbered yast-snapper/2_2x_y tags in the same repository belong to the
separate YaST snapper module, not to snapper itself). No build system or
packaging changes; COPYING is unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../snapper/{snapper_0.13.0.bb => snapper_0.13.1.bb}          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/snapper/{snapper_0.13.0.bb => snapper_0.13.1.bb} (92%)

diff --git a/meta-oe/recipes-support/snapper/snapper_0.13.0.bb b/meta-oe/recipes-support/snapper/snapper_0.13.1.bb
similarity index 92%
rename from meta-oe/recipes-support/snapper/snapper_0.13.0.bb
rename to meta-oe/recipes-support/snapper/snapper_0.13.1.bb
index 56d4c89d0f..aa8547b33d 100644
--- a/meta-oe/recipes-support/snapper/snapper_0.13.0.bb
+++ b/meta-oe/recipes-support/snapper/snapper_0.13.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "acl boost btrfs-tools dbus e2fsprogs json-c libxml2 lvm2 ncurses zlib
 inherit autotools-brokensep pkgconfig gettext manpages
 
 SRC_URI = "git://github.com/openSUSE/snapper.git;protocol=https;branch=master"
-SRCREV = "3a3bd97083976d28538d402284ff947b4aab5b8f"
+SRCREV = "8cfc33817b91dbf7194d7fd043dc378026d01db5"
 
 EXTRA_OECONF += "--disable-zypp"
 
@@ -26,6 +26,8 @@ export MKDIR_BIN = "${bindir}/mkdir"
 export TOUCH_BIN = "${bindir}/touch"
 export CP_BIN = "${bindir}/cp"
 export REALPATH_BIN = "${bindir}/realpath"
+export SHA256SUM_BIN = "${bindir}/sha256sum"
+export LS_BIN = "${bindir}/ls"
 
 do_install:append() {
 	install -d ${D}${sysconfdir}/sysconfig

