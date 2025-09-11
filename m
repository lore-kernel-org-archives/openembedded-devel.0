Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231D5CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 12:53:00 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.45959.1757595172780966474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 05:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cQ91EiEt;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-724b9ba6e65so4430017b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757595172; x=1758199972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2t6Q/n2X0kx2OOx0Fhpq1UOveqAhEYOOo5HRAoRnteA=;
        b=cQ91EiEt4QRJRugMck8kEcURXGRxYGWewC2ga7g0Ygzb2O2OwHEM4b1/qq++5XP4oO
         xtmxqB/Jpy489K0Y2FFqAaNKj+bWMNnDd8uemK9hFyF+MoZLKPVaNFzIDNmmLTUIVsu3
         EV2ZAiGcfX/GuB+GM1/y8d3W7B8QZ1QpSBlTIKopAZwMFnvjkVw+t4efU1B76+O0iWCD
         B6oL9QaQIIvCQKnK+bTBB6rdhGetYitkzYSvA9Gr+GYXud4DkUfzgBBLBI1g7CtKhdA2
         7XTvoXhbSY8qQLOnJ3IifO09PiDKTc7s+Br95jFfhlcIRJvJkrYi0CJnDO/QfzNc+Ee8
         +EGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595172; x=1758199972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2t6Q/n2X0kx2OOx0Fhpq1UOveqAhEYOOo5HRAoRnteA=;
        b=YnsAivMrd3+lWsPl7erGckycY3RZffhm3eH983Axe6NsZyvkvEp9W53rPdlrcoGgZ5
         qH74W0MtvFSX1oJhNd1S3RbgYGK/xdaZKYa9TU+QpswhhdjfcoiQ1SWWsITsBrEQBnCD
         JlN0lJmbwLKM7It1SOYuHzPeIbRuHdzrDOKKr/DqyE8f3dHKvlvtQiODT46BkZMfiGww
         jLYfv7yd651K0X7QQqW/jDmFs3E18HMmTHrRhrWsUL2/Xmeyg0IlY2xFce6ycQ4LNigv
         6kjHoTQp/qND0FD1Iwt11sJDGi5hrTPQ6V/0z6pA/gys90ARqp1/ps1fpLQQDzWH2rVS
         KJrA==
X-Gm-Message-State: AOJu0YyhqWEmoDAHMT6EibvBtZy+IYvsF7iC5x/5GVO75ayjZxqoBJd7
	gDGXbjdF/rfgDfjbwTmjGontAeOU1znX8y+L0bqrCXzPoKyiJaV3bbwe7ACX7Q==
X-Gm-Gg: ASbGncsKVZ+zrbzplkvTaIN7lCAXcn+lowXrTjQ38qXKQyPJ5dLw7oe7I/5FiM/7aOz
	n/UoxUgLYZSVep5cRDFODBdCG90WKlF5R39jT7PFFdEE/wj1ofNnQeaLfXID/wIZQdqGXyMrjYf
	Cpfylfw57limaE3bYTaSPJDEoKsMpm5ShCXJxTq43Gufe48W+VemoJ/tZBxAsiROjcSssqNisqJ
	jjEIe8BoALDFwpf8+zthT9qagoXmYJiTsPFYQfIBepG4Nj3rfceyMXH+GIxXabABvVROPVOBImQ
	5f+Ux121t9A/vXYhgDsFTG9sUiW8ggjUc+S5x0CWiMu2jcaEisxwzwLOzQvtZ3S4W22Qx6itV7k
	7CkrOR0CLCnRkr0sF+137Ye0ZTTuv8JuGEF0gYL0=
X-Google-Smtp-Source: AGHT+IGEKiH2AoGe83PxjCfJild5TyYYxVk1inrzed1DpaEqEDKP3IBbxR+Xf+DWd8rYf3EO2DFvUA==
X-Received: by 2002:a05:690c:724a:b0:72e:ec1c:8513 with SMTP id 00721157ae682-72eec1caa41mr32037017b3.42.1757595171268;
        Thu, 11 Sep 2025 05:52:51 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f76e166fcsm3146717b3.32.2025.09.11.05.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:52:50 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libhtml-tagset-perl: upgrade 3.20 -> 3.24
Date: Thu, 11 Sep 2025 08:52:35 -0400
Message-ID: <20250911125236.11878-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 12:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119369

License-Update: Now under Artistic License version 2.0

2024-03-11  Andy Lester
        * Release 3.24
        No changes in functionality. Only updates metadata for builds.

2024-03-09  Andy Lester
        * Release 3.22
        HTML::Tagset now requires Perl 5.10.1. It might run on earlier
        Perls but I don't have the infrastructure to test them.
        Added <ins> and <del> to %isPhraseMarkup (RT #151970)
        Fixed docs about %isBodyElement calling it %isBodyMarkup
        (RT #34913, RT #109024, RT #118356)
        Cleaned up metadata and version requirements.
        No changes have been made to handle HTML5. That is a bigger issue
        than "just add the tags to the hashes," because that would change
        functionality for existing users who are expecting HTML::Tagset to
        be HTML4.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...html-tagset-perl_3.20.bb => libhtml-tagset-perl_3.24.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-tagset-perl_3.20.bb => libhtml-tagset-perl_3.24.bb} (72%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.24.bb
similarity index 72%
rename from meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.24.bb
index 519c2ad54c..802fe050da 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.24.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "This module contains several data tables useful in various \
 kinds of HTML parsing operations."
 HOMEPAGE = "https://metacpan.org/release/HTML-Tagset"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-2.0"
 
-LIC_FILES_CHKSUM = "file://README;beginline=62;endline=66;md5=aa91eed6adfe182d2af676954f06a7c9"
+LIC_FILES_CHKSUM = "file://README.md;beginline=42;endline=46;md5=6e702d3d2c184c6972123c9bef7b29b7"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PE/PETDANCE/HTML-Tagset-${PV}.tar.gz"
-SRC_URI[sha256sum] = "adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2"
+SRC_URI[sha256sum] = "eb89e145a608ed1f8f141a57472ee5f69e67592a432dcd2e8b1dbb445f2b230b"
 
 S = "${UNPACKDIR}/HTML-Tagset-${PV}"
 
-- 
2.43.0


