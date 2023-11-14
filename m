Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056D4C41535
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:28 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.5384.1699931304176089208
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M2KhzCEC;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cc3bc5df96so37407535ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931303; x=1700536103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdCC1/2yUwxY6A3tN+yV+HWEweslPnqbWb8Fxqe+vF4=;
        b=M2KhzCECAdDSFoEMXE9Vwz2Rfh7lyOkUWCe1B9Dix+VQ2EC+zmvmR0AZOGEdGUk5KE
         LFHlfBQMqYp7xEjqDd09i2P1Jtrq63AHlD7B6eYsXNyhVvLMWE2UNnpfY7Rt2ct6Xpmf
         U6VmAS/6PUkSmrKT8Y5DTS66dXOkSCetrtQuUfm28ScS+f3E0CzfEB4ufF71vJiWy8pU
         zkXZynkVuo7/gHLHPcrTdLojUOjZPkl9HdO8B7645qleTdZ5NaQRACBtm5Te8/M9VlQX
         +RThNXN9B4wzssrj7KC3WPpRBolsB0dbrm/QaNbR7/tM2wSCa70C0N81r1w+iRDtO7oY
         jtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931303; x=1700536103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdCC1/2yUwxY6A3tN+yV+HWEweslPnqbWb8Fxqe+vF4=;
        b=pLNpbN4nXHuSShVvAWco0ueDpFPSI+Rhn0aTVMATIUqaA1+K1JgJw5VJ3eolk9EvWG
         d+gvur0RReTILsMlPXXbdozLO4I+67cQnCxCYzPbwQpDYr6fbL0pm78LbqFnSErhJAUo
         tQ+e5n4dbqa5r3yVbfXPmByahwKOSCIorFfM6txti3jiSURE9sVpqHvGGFFCheHbdm7+
         9vKDmFCkMZ2r/rJtZ4KwXE+RSuvA5P1Z3jQU6lGdB+cRAL8F3CvWV6I+RZOyxjgZXOpC
         XPrAco6/MqQeVuiNQLGA5k9zLggDKV07UUFIyn57qzMUtCPIj3KSemdXNe+7/FL9Iln3
         u7uQ==
X-Gm-Message-State: AOJu0Yxv+QYfxSkV86+LHvFjMgiWFM+Q1fCMB5c8zc15tuTUD+O46vwh
	xrN09fdCkukiU49PltNFbq2N02ZKkQ8eiQ==
X-Google-Smtp-Source: AGHT+IGx2pxK/UHUbpFjbxDixsuW8SQK4Si7WkndPcUt2ncUNF31m/WyOroqNaCqv/Zz0tZuZaLdtQ==
X-Received: by 2002:a17:902:7048:b0:1cc:4669:c0eb with SMTP id h8-20020a170902704800b001cc4669c0ebmr903115plt.21.1699931303234;
        Mon, 13 Nov 2023 19:08:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 08/10] yelp: Use autotools for build system
Date: Mon, 13 Nov 2023 19:08:09 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-8-111dd5d0fe68@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106695

OE-core switched the defaults for gnome recipes to meson but this=0D
package is not yet migrated to meson.=0D
=0D
Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
---=0D
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/recipe=
s-gnome/yelp/yelp_42.2.bb=0D
index 51d51ee0ab..1b3ded0211 100644=0D
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb=0D
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb=0D
@@ -3,7 +3,7 @@ LICENSE =3D "GPL-2.0-only"=0D
 LIC_FILES_CHKSUM =3D " \=0D
     file://COPYING;md5=3D6e1b9cb787e76d7e6946887a65caa754 \=0D
 "=0D
-=0D
+GNOMEBASEBUILDCLASS =3D "autotools"=0D
 inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc fe=
atures_check mime-xdg=0D
 =0D
 # for webkitgtk=0D
=0D
-- =0D
2.42.1=0D
=0D

