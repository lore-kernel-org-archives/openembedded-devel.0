Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20432.1793559420650634004
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 10:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=v19OTAX+;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so4312247eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 10:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559420; x=1794164220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7oTelNwMWuBklqU98jreW1tVkqRTGFYjOx7W/kUlnY=;
        b=v19OTAX+gKH7KyKlhyC/6Y06ml8v8y0wDpa1+rT2Iy5V3hmgtiO/NCLheRE56w9+7o
         cyZzZV1HAzcC5hkzvDFsgmv2CIRpRubAdmjqRJ46b/VQzOzvjM5YbAHqK6Jsy0ySz9BZ
         Pte3B7kTxO0tOYuIIJxfXo0SmKAPbGLLrtDHszfgnWhT2zXG8tfPWpwRYUr97PmeZ/B8
         cyHOhU27pqZdJy9DIdWbx6m1WhfeFil/aLKlWvOkqrqjFNqEysHAFUCOtu2lrtrCUmBY
         D0OxjRjyl1NRL0+p9PelBSDHBpom+GXHbqtmBhRTzwClXhXok5BtEemoRiD1L/z0U8Vj
         ORnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559420; x=1794164220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7oTelNwMWuBklqU98jreW1tVkqRTGFYjOx7W/kUlnY=;
        b=RMIK6nQFfjgaRYcMkw9a6yW0mU0tTAOUuCoxREkIMoqTpIQiCQ4FC5DdjZMI01H7Mz
         5jexj8tn5RjIJwvzhhksNWcuuBVd0ZmhdkZ8I+hoJ8OXSqC6bO6u4A2Z5scDZjsjpd2B
         rcdE3qPGjQkxtKxUvx/TpetxD0ApMNAl263OnstQSP57c4h+BE+R8npgngjad7zCYnNC
         kYcKF1YDYaQNh8OYVixISzEZ4CGGLjzDOGjP4W8N8RDXtd/dVDhXXkjNCiN8EBoRNHYq
         8lgsphLn3IK3eyL0ulwlgw7YKiJy9PUbW7uS7Dqhxktg0QB4YhZ/ZKQdTaF02xvnd9g2
         YOmg==
X-Gm-Message-State: AFq9FYJTegecfGD/e/ZvBX8pDepnRQrW7yQlRFBX4XV/6ZyeMPmvlup5
	9RIrdC6w1ekZB9ixlRgpE4xstpBAEXKIC7mfwuLQaUz3xueuGX+5QlrJZlQRCyMVbko=
X-Gm-Gg: AYBFou3DJyAvnX+GomGiv52z49N7Jy3gQH3sI9moggrmSyU02PmFAbzKHOLg9noBZau
	ZVrlmH/ghmAxJkEBPG6IcJMd5XjK77gIg6y2RPSGLZWFu2cSVMLLAPe+B9RKBrveuI/SgGfv8Rs
	nzow3b7Q5n8cuv+4AqNA/X9edBvzsZUdRRH+16HWvjZvnUZwvWAuFV3zKNRhtZ2bpqP4tTE5HNJ
	etpzZa2zK7LU2D+g7v/cWeBbQLdKzp2MpYQKkYE9BiGapdOj90YvbKGb4DAhnWmeFoN32thGcMJ
	6xpJXYuMTWGNn76ixzdw679V07Fm/nyCQHAyFQGn9dOWOXoUoFtbbXpyPW3RDAmsLeOPBfOPRcK
	VvMkWblSFEM7sQXr2yQpMWvJ4OxW+FrDJx0+z9ZnzU6vDPVddBStXUorS5jlM7vaFZMH3FPHw54
	lyOSJzxqkC3nmZeM7vusWw8HDUxEibrGUsV+18XM/WYu/iyCRHO3+CmviISEj6hCBYAi3c/BV6D
	qLGSdPUtUg/OipHrmW2CAbMKMEmsbiOKzxI0EtuJYjOuf6M+Upvmantb6Lg4a7UVC4QmkrUhsHm
	w5RPYEhVeW+qrJAzsnKPuOea/o2mVktgMetDwjvsRGpZFYkBvbu6lEpNTmjXbvt5n2da2JjNs1L
	6/zodrxXUqL5Z1jeOdXCT0GCwocEohRHMLAqsTigJ6/kYWPANjrF27onie/G3191wsC1nZKb2ZB
	KkO/01JROdRBRXClMzBo+HWY34I27C6NcY9iJPK9ar6QAudguqoPFr5SzAXUdbx50ZvqRwQvSWe
	9UE25L9W2wwOM7So0E31tG+1vTKUeTA5cLrudfeqewamaH4VRdusujLXSrYnjDqmHumPIUKfGp1
	kir4ngbFQanDHbXUjdl6N3hjvg==
X-Received: by 2002:a05:7022:7f03:b0:1b2:32e1:3bb4 with SMTP id a92af1059eb24-1b232e13d6cmr1151255c88.18.1793559419808;
        Sun, 01 Nov 2026 10:56:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm46337863c88.10.2026.11.01.10.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:56:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 2/2] accountsservice: Require the systemd distro feature
Date: Sun,  1 Nov 2026 10:56:55 -0800
Message-ID: <20261101185655.1459673-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101185655.1459673-1-khem.raj@oss.qualcomm.com>
References: <20261101185655.1459673-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 18:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131731
Content-Type: text/plain; charset="utf-8"

libaccountsservice uses sd-login for its session tracking and links
against libsystemd or libelogind unconditionally. There is no elogind
recipe to satisfy the alternative, so on sysvinit distros configure fails:

  meson.build:206:2: ERROR: Assert failed: systemd required but not found

Declare the requirement so that the recipe is skipped there.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/accountsservice/accountsservice_26.27.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_26.27.3.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_26.27.3.bb
index 4a95d1410e..dc03677926 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_26.27.3.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_26.27.3.bb
@@ -13,7 +13,8 @@ DEPENDS = " \

 inherit meson gobject-introspection gtk-doc features_check systemd vala pkgconfig

-REQUIRED_DISTRO_FEATURES = "polkit"
+# libaccountsservice needs libsystemd or libelogind for its session tracking
+REQUIRED_DISTRO_FEATURES = "polkit systemd"

 SRC_URI = "git://gitlab.freedesktop.org/${BPN}/${BPN}.git;protocol=https;branch=main;tag=${PV}"
 SRCREV = "4e254d9624cc48224c9920b9509df0b144f7be0c"
