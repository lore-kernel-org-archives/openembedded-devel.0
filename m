Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22FFC53200
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:46 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11433.1784859277882145792
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r9ktThvg;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1355254a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859277; x=1785464077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afKKfIthvoKNjjtM96izZ7BTz/DnwUvscawnX7g434w=;
        b=r9ktThvg2qXNFDWWXYqqpAZM6RAeBj6QRMg+G0tIMNEsUpBlv93XMuY/i/dtSaBiVW
         S6OAmePG8yTeYkXQRuw7NuBwgxdXlCZW63dJKxYHzDL/AvYmxNNrRdHam7B+Nw0HPriT
         Q2u3LEJCYnJEds87i01Wzbju5ho9vhUcG6BSicjVhDZ9UmFEjdIGMAOXo9vxze4rF6lN
         ir67RASm3/Qj7EGtDGF42iQkvBDrF3f3HID0LQDSY9KLEHL2FYOvFN41TZ1yBzZ622ja
         AK0UICw7oyz3B9oo5yKmks8DyHITRLtXbtRpxm1QWtgqRA/TEFWWlanQZNKaqkyolfr/
         cQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859277; x=1785464077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=afKKfIthvoKNjjtM96izZ7BTz/DnwUvscawnX7g434w=;
        b=bWw9enGu2Sl/xMxFySoBWKlUbq3m5ydwjM2tJyj4DumK6UmQNBKgUmZVoqcYVRZdil
         qG7yA6YipuHKaULp+uFmna4Olo0Qxlee0fdszvcmii9/ARSg8WpYb74eJtFYN6hPHF8z
         eXPmxEroYOQPtDZ1AtEBav9B368Tv4pU+IMKW4JrH5eoXc5c1UFMai11hX9LBh4Jp+Ih
         kKHHB6mdTYfuEh2KZkguw52ML8Kq7h3LMiklE3TL4giNryQuuILYmRioL6QtvlTMaoZ8
         he5IxVLR4L2fCo+ZGa/Zxdm/mMgsn+bUTd1mbUNG/0VU7lNdOsvkTygspNEyAg/70P+n
         91kw==
X-Gm-Message-State: AOJu0YwQC53C4Wva5uXZFIDKGFV9/m6ogEvs/jnoa092rOv1VR4wumQW
	cTv0JlFvsFHqupTa1oLyLe+mB2yhDJe/HFh7a+D31IoA5JXroYCc73C5TJ6Z6hf3
X-Gm-Gg: AR+sD13MGAk232sdw17vVAXaNI4UpcCGjry3kIYA6k0BdOWHdeWp8IRqjCRSzmcZtOy
	/HAzkmJfl/YG7Mitf5zb2VJg9SWbIMdiOMmFqYmn5zORmG9H4BfljCRI9iZNkfYWMlGPQfEuM1a
	C2US4TwiqvFkLEbsoKJAOMHXbcBZUXY5wi36D0BtQZttfxUjsvpw4OaTwCd8Cjt2rxDfK/Vp4Lf
	ShXW59kGIjObxtC6YivU6KrfpwinUXKTSg8mQGG+pS9bfND8foXCly0B3mdu7LAiLYB70nc1VuX
	U129uu0sHG0IchKJEfujTcSr5xDYi/ZmVm/zos47UiZoqUtRuINw2OrAmghkPxCG5mBa+XyFWnW
	z9C2o5/QgKIRfowRK8OUY/C7tIvefMysE9fWlA995W7rSCtIbcEKCVsAo6fSjt/tgTsD0Isbnqy
	eaDhMytZvHtMz3MxfqckyWuVItnA==
X-Received: by 2002:a17:90b:1c88:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-38ec653890emr5435981a91.19.1784859277138;
        Thu, 23 Jul 2026 19:14:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 7/13] htop: upgrade 3.5.1 -> 3.5.2
Date: Fri, 24 Jul 2026 14:14:01 +1200
Message-ID: <20260724021407.2840261-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128429

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Removed OpenVZ and VServer support[1].

Changelog:
https://github.com/htop-dev/htop/blob/3.5.2/ChangeLog

[1] https://github.com/htop-dev/htop/commit/90369a491283fc2880f2356cdd28f2033eec9a1c

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/htop/{htop_3.5.1.bb => htop_3.5.2.bb}    | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-oe/recipes-support/htop/{htop_3.5.1.bb => htop_3.5.2.bb} (81%)

diff --git a/meta-oe/recipes-support/htop/htop_3.5.1.bb b/meta-oe/recipes-support/htop/htop_3.5.2.bb
similarity index 81%
rename from meta-oe/recipes-support/htop/htop_3.5.1.bb
rename to meta-oe/recipes-support/htop/htop_3.5.2.bb
index 3043f9348e..775e8e1d78 100644
--- a/meta-oe/recipes-support/htop/htop_3.5.1.bb
+++ b/meta-oe/recipes-support/htop/htop_3.5.2.bb
@@ -9,7 +9,7 @@ DEPENDS = "ncurses libnl"
 SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https;tag=${PV} \
            file://0001-configure.ac-Remove-usr-include-libnl3.patch \
 "
-SRCREV = "82841011ac3e2ec6ee4d3dbdf80f8d26797abbc6"
+SRCREV = "393b224603620e62a693628ac50b9f4e4424a851"
 
 
 inherit autotools pkgconfig
@@ -25,9 +25,6 @@ PACKAGECONFIG[unicode] = "--enable-unicode,--disable-unicode"
 PACKAGECONFIG[affinity] = "--enable-affinity,--disable-affinity,,,,hwloc"
 PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[hwloc] = "--enable-hwloc,--disable-hwloc,hwloc,,,affinity"
-PACKAGECONFIG[openvz] = "--enable-openvz,--disable-openvz"
-PACKAGECONFIG[vserver] = "--enable-vserver,--disable-vserver"
-PACKAGECONFIG[ancient-vserver] = "--enable-ancient-vserver,--disable-ancient-vserver"
 PACKAGECONFIG[capabilities] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[delayacct] = "--enable-delayacct,--disable-delayacct,libnl"
 PACKAGECONFIG[sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"

