Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57C6F531C7
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 18:51:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74.1776106270805807385
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 11:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lYuJ1mti;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so3275948f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776106269; x=1776711069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvMtGfdjsfAziWYxc+5uRrh5osD0KfWg/OUES7o+5F0=;
        b=lYuJ1mtixOjl9SKOCe+B+LESJlGuwZwjX1w93iTkxZeDO21EeYWMetdlDKb6Bu8xWJ
         Jfj2fd9j9EIGIJjczpJpN+tV9O7MofNIxuIOFdIOM7J1MrX4XX4zhGUQ6fG3YjryXij8
         PSHrd061LbDqZtSTkRJ10vNuZYPiyLT1DVIwLFKQ0ZZpMNFZ60dAE0kcalCK68fe7C9Q
         73YNQ27xQVbAWSqunEW/2XhRXWPy7bxTdofOlR9RyGNgrSlk3LlVq2OlM3cwUn8iR9UZ
         Ks87e3BwkQxYeHBju6JAPoHk/r80R6IvlVkkmtdn2SvO4M4ILG6qnlXRA99y87uiU+20
         Ficw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776106269; x=1776711069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pvMtGfdjsfAziWYxc+5uRrh5osD0KfWg/OUES7o+5F0=;
        b=ds1yRp3Frfw+wIleYhu7z6nE8GawIm9+AuWLXNWi++pTcC7CpyB4Hspt26J3OKolTk
         ziPMmjq4n8L/mDGfaeCONWToZEpkDxUgtNOZsw2fuC3JuzsS9Vq4XA0qD1btkSlWQa+b
         dkjGyXdp4Pj2fFaFQGXvpqrVh1E1tN0oy/hVHIVNTAZXJ5QYMSho6//DL2wswGYCK2/K
         UiBG/oWJ2A+IRTnVIhvH3EU9aa1llCtBWC/CWuWogJgg3nPtO4VHLCrNNnSVPSyKe7eT
         B+g1CZXvuj/1HSRWkx9gTjmthmOq3g/28+ugl0/yRM/9KGXW+lpYRoVAoBrCfwHbBf8C
         SURQ==
X-Gm-Message-State: AOJu0YxVsRlLyXJYQVpce07f6klXk1WaAvHYogrHyxaHVl49bmua6/zW
	Ean0avUicuFsdKD9VpP1DjvxzgukijC8ndw30u2esqoA2OPmbuSmJ8qb/5ISig==
X-Gm-Gg: AeBDievUXvVpipbgMx3W7UstDKJgF7AdbgKOk2uzRUrz/3u5OQERNAl5q3oWJMNOiWo
	eiYsx8dsk86uJeEi1q1LrKJB0QIMpS0+dr+tvkxDil9sDz+FCIsgfLv5cNqrgrrbBlbq3T1nHpn
	8/G+/lF758N3ao/xi3cynrEd7W6gDxB3CuYZP3DZbrPiBL7wdnRzAm+dsjQ0GTbeSjEjCQhJbRl
	cojaxTblN+x0dzwVlPLz+uu/y4Ilm8uY8bFxsdiuFZy4IeqrDPiXm7szNqUdd2V+KqA/oOqa8BW
	lCTxH/Q70F6XdIjSX+VX5meu7awr0Ok1//6h6xt9VVdVmeZDzUDpDRspiipAuCEXuHcxQHJclUu
	f7GciPLnViljH645s9Fc/M2ZZOaY3gZR7dUGsfXKsiDY5g+wBU4+cR5ovMXGrCmBnu8RMOFWFJu
	HoAkfnDJ96GmWGWVEeuVWAULZ5+5QquDs=
X-Received: by 2002:a05:6000:144b:b0:43d:76d8:5797 with SMTP id ffacd0b85a97d-43d76d858b5mr8979836f8f.51.1776106269031;
        Mon, 13 Apr 2026 11:51:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e4f16bsm33544682f8f.26.2026.04.13.11.51.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:51:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-django: upgrade 6.0.3 -> 6.0.4
Date: Mon, 13 Apr 2026 20:51:05 +0200
Message-ID: <20260413185106.1098314-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413185106.1098314-1-skandigraun@gmail.com>
References: <20260413185106.1098314-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 18:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126288

Contains fixes for CVE-2026-3902, CVE-2026-4277, CVE-2026-4292,
CVE-2026-33033 and CVE-2026-33034.

Changelog: https://docs.djangoproject.com/en/6.0/releases/6.0.4/

Ptests passed successfully:
Ran 18691 tests in 149.800s

OK (skipped=1397, expected failures=5)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-django_6.0.3.bb => python3-django_6.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.3.bb => python3-django_6.0.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.3.bb b/meta-python/recipes-devtools/python/python3-django_6.0.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.3.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.4.bb
index b3aec8870a..378b760f2c 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.4.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "90be765ee756af8a6cbd6693e56452404b5ad15294f4d5e40c0a55a0f4870fe1"
+SRC_URI[sha256sum] = "8cfa2572b3f2768b2e84983cf3c4811877a01edb64e817986ec5d60751c113ac"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

