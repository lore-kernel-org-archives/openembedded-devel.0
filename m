Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9871FCD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 10:17:27 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5314.1779099439534791810
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2026 03:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=OIZJrRw8;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6830fe22b6eso394672a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779099438; x=1779704238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IdHXktViwqid3LgDPzZj4sXZZ0XKpvLb7UFEUMvdcBE=;
        b=OIZJrRw8AucFSsTv60qS1+S10iNB6HTjVp9RpZohMCsnsx0H8LYPkDWhRkmyRMp1nY
         KKQPAeS1HwVCDTGa9LitXOrOUr8rJvA4lK1D8sO6kLQnnnUOuVNpsMeEVWGMeqs3SVDE
         pgTA/W8NkeW3ELKjjZipkjwjd5H9zTbn5MuHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099438; x=1779704238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdHXktViwqid3LgDPzZj4sXZZ0XKpvLb7UFEUMvdcBE=;
        b=ETNha9jL/lynyeAcf7SK3ksIPH1TKXfLQ/eJ3sA898S3bahupoVLLdDMp7DRbiq/G4
         730TriX+hEF5PUl7UomFnokb7Jxt4w+zNGtx0zi3tEPmP9wNkT6WcV+tLx2C77/tDsXK
         CSS4/u+TiMFZTTN/jcBFqAdHE6b/BeryaUrRqYY+QGXgcLmgierahssRnVOsInsET5sf
         Y1gIkb/g6RMo/Bxn/1hjbPyQRYvLErsXaePgrE66DBzHG2GCWidbDDCZuOgzYmSjVEzG
         FV0e177RjQlbI8TtXxD5g9LZM5GQ/tnpycL7ukVRfV2K++X2cXpP47uqt+PVqQp+kEVw
         L25Q==
X-Gm-Message-State: AOJu0Yy4bknypVDJnRluWfXhdtChUQ2yvSdDUGMTE9I80ysu4OMXfUpR
	YCuf34hGOx9moIVOso9+7IFhUCDzDPsOFX33Mlim/hvjd+zg/Ado9nCFIUpmmE16k0oU+XPdfR/
	O+Dom
X-Gm-Gg: Acq92OEPaqA3lzFa3+2F0lkDRLQhEKH4xaRxVkgTDGjclP3D/YFSgbusdajC/sQnU7C
	48RFSnUgZvwd9R8omMUlttFt+VSEu1Nk12MYKcyioepBqdbEKD6XR8WSPvzs1/qMJ+oIU+eh3Tt
	fszxqF06VuRVvxeccbe6FH6/5xHpiB+UaOOdrlMDhPaakbOEVDZSlJZ8O7R09avX8rBcCYX+pnM
	SXjGudDK03utLw9ytQzlKqFxmTU0wma6h9SVL6qXUyYFd5C+LU+hCIyurVGolnfI2FaL8tBR8lv
	BXp5ISXGagq05CtfeaxjCx4kNG0QtW23RM4cYkOqT7GoixT2YqOMn7lzqO1Eewpz7MusVtd2sjm
	7QcDUERadnpzFJeoUT9wg+IXIULETCpUhWiSz3QFPgOHsqibkQFFtBdpcxWG+qlHeilfQiEOnVy
	mFI3jfknxzGktrIi5e10IGFWXRTneW3xDAJYN2iyeOvaytQsFuiyrKlPE6TEKeZ9mpQGRL/0Iuy
	9Gn9YGSdxXzLd3gFH2RoP4fVYXMa+JfI+FCB5inpYLFlWpOJGSxZhwwevooMheURPbllw==
X-Received: by 2002:a17:907:96a0:b0:bd2:37d6:8fc1 with SMTP id a640c23a62f3a-bd517b5854bmr304044766b.3.1779099437617;
        Mon, 18 May 2026 03:17:17 -0700 (PDT)
Received: from adam.amarulasolutions.com (2001-1c00-8183-9900-dfb4-52e9-0b83-429b.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:dfb4:52e9:b83:429b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c23feasm557257766b.14.2026.05.18.03.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:17:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] chrony: add group argument to useradd command
Date: Mon, 18 May 2026 12:17:12 +0200
Message-ID: <20260518101712.2714997-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127049

If privdrop is enabled, the following error happens during the build process:
useradd: group chronyd exists - if you want to add this user to that group, use -g.

Several other recipes have added "-g $somegroup" to USERADD_PARAM, and as such,
chrony should follow suit.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta-networking/recipes-support/chrony/chrony_4.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.8.bb b/meta-networking/recipes-support/chrony/chrony_4.8.bb
index a7fc73e081..837f2e073f 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.8.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.8.bb
@@ -47,7 +47,7 @@ inherit update-rc.d systemd pkgconfig
 # Add chronyd user if privdrop packageconfig is selected
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
 USERADD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '${PN}', '', d)}"
-USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system -d / -M --shell /sbin/nologin chronyd;', '', d)}"
+USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system -d / -M -g chronyd --shell /sbin/nologin chronyd;', '', d)}"
 GROUPADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system chronyd', '', d)}"
 
 # Configuration options:
-- 
2.54.0


