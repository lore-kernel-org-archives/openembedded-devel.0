Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F559EFCD71
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:41:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10165.1773049309067487526
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hXt5Dkmd;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so8010884f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773049307; x=1773654107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O+AixsYnUStkYRJ/Haq47cVHnS1p+shZ8BtxKz1xFAg=;
        b=hXt5DkmdpHO/rDwO0EjAC8wi6iBsrYLsKBvMiD4NL3OBRFNiQf5P3cpJErDJi7wMUC
         YcdQFoGVyN+hLNRZ5qfcOr/gB+BIsXcg7lQY3e6DqRJ1J8clE5rUWgikx3n5c2drnZhc
         S77OxGpb91zgvjPeI8+fdrfQj1Ew90IjT1gS6qrNP1xnkjfR0H3YF3/ExfcXHxPt0Gg3
         VlinTW9CCD25oAt5bejS53+M/tGAbijSfWwUhLTOrsXXR914rLc2q2Pkqa9hfiYxgcbS
         7nX2Su57Zzy0NWLr9LIz9sKTuTcvzjh4uDZLdmfD1c8mGV8dT4Z7AQEv5A0Z5mVUaObf
         wglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049307; x=1773654107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+AixsYnUStkYRJ/Haq47cVHnS1p+shZ8BtxKz1xFAg=;
        b=U9B0RkBUb4gU5AAOsQhjiHQm2HwuimX+ZP/dGFPbhh3NmbGZq4ur4udFAQfMISxxhy
         dQnYbfXNXNHvYn4BrZQDDGzR0k40iOpDyD4M4iTa79sG9UTGsBisDFzcANrdkGp3X/4a
         ZJHMVD4k731NHW2yYFzKuNWGLAEietKDB+Qe7s+mdYexX16M3kj0oIA/YNzuIToJ+aeQ
         5cu4b7pHKvon3Y3kdGBnc8ZsDTi830NxqDBaDIYX5ADRyfLH7Pfjn0IUlR32N0lhAaqZ
         6EGm8RB0KyZUFT/zF1cyCvFi9IUv3tK4tN3O00TlFExF4T7OWuTKqeOE0IhgZxF914aj
         H6AA==
X-Gm-Message-State: AOJu0YzaVraiC6M3e8hM9JbhBH0qzVaN8oaOaIW5anq65pDD7efmCTpT
	rAeDSy9YoFvXY/HTzJCojk+bvsQQ03scvjGJF0y7ayMToSBOhOQZ4RM5MArfSQ==
X-Gm-Gg: ATEYQzzD09qoj6gg7rX9WRyJmprfVqoizTgHtky+pGKf88j+GGr852xYBJN2+3rgb+0
	jSLh7uBiBVW1nUavU95R9Lsk7UGLHc98iSOSLNTvOdRmSgJK4J2lWoG8dFecD+9pqJl+QCYQTba
	WAWgc2Vrs79tB6jrgKyqFFESU12rP5zmQd0SPYURGMa3SfeTBRbXfpuWDdVwtk645D2nES8FBPu
	oevHQnCaSW7PHF//5eYoQe1S6Mx51xD/QNRu+M1zh0QfGAqInYYJVzZvNvhoXMv4dLrk+Tenah0
	Fc0VGxGoZ8gL07MWMXEy0wX9dFdQuBCQl3FNxmV6ztyRpnt4u+Uk5uu3FV+AgvsEvX0sDPfHMSq
	zJtUfukLQDfhdSsh8XDvumranw4cw+GYJvjhEY6gQ3zvFJaLiNEMpBEl99t9HObxl3+naGrMP+X
	2taZ9R1hyH/CdO+g9+IG1v
X-Received: by 2002:a05:6000:2012:b0:439:ac6b:dd64 with SMTP id ffacd0b85a97d-439da892019mr19082628f8f.45.1773049307286;
        Mon, 09 Mar 2026 02:41:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9fbsm25295998f8f.23.2026.03.09.02.41.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:41:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH] zabbix: mark CVE-2026-23925 as patched
Date: Mon,  9 Mar 2026 10:41:46 +0100
Message-ID: <20260309094146.275474-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 09:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124969

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-23925

The vulnerability has been fixed since 7.0.18[1], however NVD
tracks this CVE without version information.

[1]: https://github.com/zabbix/zabbix/commit/89dec866ec7f8230b25f06ac000575e3b7bd4025

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
index 28e4cc4eb0..b1a58510bc 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
@@ -75,3 +75,5 @@ do_install:append() {
 FILES:${PN} += "${libdir}"
 
 RDEPENDS:${PN} = "logrotate"
+
+CVE_STATUS[CVE-2026-23925] = "fixed-version: fixed since 7.0.18

