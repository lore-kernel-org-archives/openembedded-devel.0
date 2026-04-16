Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9233AF433F6
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:19 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7040.1776318672489470352
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eUtsKkgs;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-126ea4b77adso17588147c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318672; x=1776923472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXson6xeLj8h9ETjcdhT3bX5+YY5pVZg8DSN8IvW6BE=;
        b=eUtsKkgsH3h/NRWjaMOVX3/zHoYztptpoVeGSNhOt7udCQy4s+gjee5zfHezINUdwF
         iTwGxCaxkzbdfOEBAVjXts9uLuXItd8/yFIBQZVe1CPSed/RWjk4c0/yY8EBBdBB+yKb
         063Qb1ecm2rp4lxdHSIczbV3HIq+aOGNMNg4UeHHYPxu6g+IQ5oN+d9hSiJgSpMqUxu8
         5o7jqyTf1CYYc49sLjN08+uITKsgDBBlRAkDm2BRPUI7KnosWrPT9qN1yKL4xxXPijij
         jmkiqsKBHEUCX3Bo+gNeCT238isNVJCm3BSlUw19qF7AE1XqGbvZbCx/ufyh77O1Wks2
         Vr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318672; x=1776923472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SXson6xeLj8h9ETjcdhT3bX5+YY5pVZg8DSN8IvW6BE=;
        b=ML8Fvm1np8ZMPG6JL6IqXNxPoM+xVFaLXzZXvkofnQNFFQt0a7SyZQuccQqx9+pQGA
         xpaDlLo4wWfSzASyatYwgBD9r4genCCLdcZGbOHFh9O/evq81A7WZth0QKRys2fIwmQa
         KnU5OM5jiu7HdvgTRF8LTF6a5NA/RpZsceUy1w/Nx5/mBjdba3vWFR5w+FST3BNWz7CU
         obEmtyr7QmR/nF0kWoyvsAJvPWYI/aTDDr7x+jKjfppdpdmU7Ty44QEzIU/z7/r0E35u
         gTVkZ/+pxeHxjaCUZpnIdt46C2XrN/kbbb1YdMvvw776p0v61dSYtyG7ZXHBH8DVR7Q6
         e1DA==
X-Gm-Message-State: AOJu0YwQpcK0vIhbRvbE6Rmc8MSIrD9jSv8lV6CttXSbFh+84ru7erpe
	lvDc2hztpGID+0SaYbWnMwh/nv1QMjYsrAmus2YAJGdmZGwbt7y42Z4E1zp3ADZ/
X-Gm-Gg: AeBDievna1qu3g4/2OTMAAMmViKaVwqovAAhwq1CMIAcXC3O/0NX6ec2LxqE9cE9Pe8
	ayrrtO/g9utZJxlj8GSM9D128HlxTarZjcAd7BwWVa7uGTXKcQoTf4wfbbYZCgr1phQWYt81fuI
	+2wwkwdC+bwYeNf0YOI23GiRREHnkSS1EaAwcKjkknZG2ofndvDBJji+vIY9hpQiO5oITcu8FXg
	4M82l3lPF+BGYJkXg1itfNZU2oimYdZcPbSV+x2T+L7825l3MMApBIHHBDZQHKwagAgp1bOmd55
	nNuB5L2noO4zAr/eJeD6KWtA6RCrqGwHvuAU70hV0w5OEp956bJSZgvTBqucBF5sCzpwKtxEVyh
	W1CsOdcyvYPPz3aLSVs0CSPCE906/Mxbl97ZptQPMXSWkkuukgi3kcnaDkIq/IWeXrtXxM8VPUM
	QRRnFiwxI+VQ/ZKkou+WFL0yECZChjQHxAGjBkQ/g330/QZy8MuN5jmftu2OF5iuXc6v+JxC250
	qUeCeQU1uiFW8pvrfZP0mvopsTHguOmfiiiWsyBu6yN7h/gRgD5GqDoo18CcuEEG5y8/lYwTZFp
	q3TsujoK2LqxnTKlbDc4cXuG06kB2XsducGYO1oPAMhrsjdrTcWN5fq4cLX2dg==
X-Received: by 2002:a05:7022:122:b0:128:cda8:3a12 with SMTP id a92af1059eb24-12c34e8a100mr12823957c88.11.1776318671571;
        Wed, 15 Apr 2026 22:51:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 09/18] sthttpd: disable C23 support to fix configure check
Date: Wed, 15 Apr 2026 22:50:49 -0700
Message-ID: <20260416055058.792189-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126388

Set ac_cv_prog_cc_c23=no to prevent autoconf from detecting C23
compiler support, avoiding potential build failures as the package
is not yet fully ported to support C23 standard.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index 9459670344..33543071ba 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -19,6 +19,8 @@ UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"

 inherit autotools update-rc.d systemd update-alternatives

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN}-doc = "htpasswd.1"
 ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"

