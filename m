Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0755CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 13:38:34 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.11664.1760189908175480231
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 06:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IrYjR1A1;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so5103134a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 06:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760189906; x=1760794706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDSmZR7+S3DbX1zH307Jb1TWetbu1WtgQhRTqq9o6gQ=;
        b=IrYjR1A1kp+JRfXQYkASnnOHDRP51TNQwPLGGA1UyPqTDeuiM57006uGffXfCt3cEb
         eDhkssoGPHlFi6vWlNrfcPuGZxnnumvD68U5KtZDXz72OwULRnzRjdHlzbwfPC+PLQXY
         N1y8ZdS1RAbnmfjxkuiYppKaS/t5btq0em8dZzWs8gKUvVZlWoy6b8ityVA/LNf7s3iZ
         bIWDMextvwSdMoOwybEemoypw4wdSo2WYWqTozN669AQIurM2KQkrGwIiic+feWcaI1A
         gZhfLHcQYEvpwkRVaDD++bMsU50PoemFStu1K05BbKchYxqRHyMwY7jXGecTJvVEC7+r
         oO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760189906; x=1760794706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDSmZR7+S3DbX1zH307Jb1TWetbu1WtgQhRTqq9o6gQ=;
        b=DBdutwjiJpv2gEIQPQ0603uvcHWQs2WjJdeGB5l5S8FET/wUisyPPVB9wCosh1D3jK
         EPGvhX+vycAx6zoDCN5PV1TZCSeVEu8LM+CrGMAGYThfnfwmggoEl6LLJhXUK0v4da56
         anyf7zFuIC6E8gGnFW25g1NzBBLAr83rICLPF93K19TCT8ayruC/gBBpu08pl6L4erk3
         GypDGKMQY5EhjgL3JPXEURZ1CYZ1ioHfa+gyXL7i3ZZsx6xwKvvZvL6OPsWQsLT6TWme
         ae346JQ4vtRlV7lS4I5D/JByM+v1RdpEEe4dmXkxiYcsgempw5m7TXLZyI3OPtOYJgbd
         hOsA==
X-Gm-Message-State: AOJu0Yw55M9IkhJZkB29C48ltbp/Q7dJZIC/nRJ0mYyoyJAPFnsgEAvp
	uhOg9R6BBRE/8MI41oVE0FMSXu5w8twfF/9k0I5PxSv352SfKVWBSbi6JcSpog==
X-Gm-Gg: ASbGncuhCukQCy3kA1Astl5JE8NkCKZRJ81evetnrYwyoK3IuUHxd0XOic7xFSB6hNF
	lq03atVv7qvwV+XBA7NkBq0MP+G7Bj8vYLSlKp5ISy8yMObDNXIy7x7+wHgwivFlpHa82CO2lso
	IRCuwI82gUmDb823/9E23T8cK4O/zEyi3X/yFi8xokGbw3jF0mNLC67UsNBmriXh7qtFwxhCRzc
	Ba/H87VvDuyzR2SGpqCuYcYEQEY+PYODIKDKmAXbpUaHsHj9nws9vIEiy45YVMpwSwaSNXoiOAA
	5EC3AFLNpazBVANDjEtb9TVvBL088y7qLguPyv6cm9AV4YvKEy0vyIP0T634XawkbG9viKXfpfe
	HyXt+n972zwIOlp7NLSq/jwVR88Dc+fFc9KCnLv9iGgOuGjEidQ==
X-Google-Smtp-Source: AGHT+IHa+y23kZ4pM8LxqWV/dNAq3VIzYdhn5aiRgXZHZlj0hqHKtb/C3xG6Br1SDVr28wNo/dIrCg==
X-Received: by 2002:a17:907:3e0e:b0:b45:27e0:7f35 with SMTP id a640c23a62f3a-b50ac7d4807mr1735334666b.46.1760189906483;
        Sat, 11 Oct 2025 06:38:26 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9525bd1sm481536766b.81.2025.10.11.06.38.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 06:38:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH] evince: Update status for CVE-2011-0433 and CVE-2011-5244
Date: Sat, 11 Oct 2025 15:38:25 +0200
Message-ID: <20251011133825.2146335-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 13:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120495

From: Alexandre Truong <alexandre.truong@smile.fr>

The current version 46.0 is not affected by the issues.
Both issues have been fixed in commit [0].
The fix is in effect since early versions of evince (3.1.2).
Thus, both can be safely ignored.

[0]: https://gitlab.gnome.org/GNOME/evince/-/commit/efadec4ffcdde3373f6f4ca0eaac98dc963c4fd5

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 492b1b1adc1c546efd10b659d220a810736cc04a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_46.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/evince/evince_46.0.bb b/meta-gnome/recipes-gnome/evince/evince_46.0.bb
index 57eb994e13..291d325848 100644
--- a/meta-gnome/recipes-gnome/evince/evince_46.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_46.0.bb
@@ -56,3 +56,7 @@ FILES:${PN} += "${datadir}/dbus-1 \
                 ${systemd_user_unitdir} \
 "
 FILES:${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
+
+CVE_PRODUCT = "evince"
+CVE_STATUS[CVE-2011-0433] = "fixed-version: No action required. The current version (46.0) is not affected by the CVE which has been patched since version 3.1.2"
+CVE_STATUS[CVE-2011-5244] = "fixed-version: No action required. The current version (46.0) is not affected by the CVE which has been patched since version 3.1.2"

