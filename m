Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33112.1792974491304961731
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 17:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jQhxmrNm;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67a2efec15cso2346252d50.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 17:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974490; x=1793579290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmJuUreQPc8QwI23qMROnvTfYLDxvEl3/KQD8+LsfVI=;
        b=jQhxmrNmq7VAaZVfFIQwRt4nmFK9X0l8B7o2eyMIttMeH+PYejRCcpxRZtdDJJOuZD
         JXjVZ+SopjFZM+JT/OTYUI0uujxEfWDMKENJ/ZiB73s5caLdZRoeD9osK5NtRDOea/Ec
         VZGueQlrBZ/Za17pXYkzkjuKvN6QUeOyTswmYl+AZbS4jajBQrpVusLkMciTbli0lAM3
         1DRWFIX6MCcPj6s8bswylhZlu5f7TlOYnZXGJ4DrWOgEA0cgcXY0c/vJ9Q8Fuo/WD1io
         ysf9fjOVf5eGiOW+W0lXjLI1wVHlTOtgY4bahDRpRTv2+FUTvVyOhgsnZB5D8+VUpnT7
         Em7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974490; x=1793579290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmJuUreQPc8QwI23qMROnvTfYLDxvEl3/KQD8+LsfVI=;
        b=gvFCJ6IRk1YXvV6EBeQ0PSGDp96mVLVlG0V3Poaa32bYoTb1urlGw894k3PK5Aj4Ty
         GrCJBrraOKHmlaBMSUqlqCJG1IliJfKNjo5Lsq1M0S52yLuf914L3+wU6rbuhPOiYfYj
         X7qY/ttaZ1Nm3sivy2Vz5FWCNEmOoJ5pioVFnEUBevF4T51QqHIbOqqluTWNUlTIJ0hh
         JNQqU2hSy3J18zPM1TxDBKdxIW2qS2+bS+3MijMrx7VopVnVBgKY7yF6ch0tmbWCVpOn
         iJRrb45kfJiTlAZPH5sn3VAFs+bbMw/1zbF75XZHUcITQO5mwFRM2xkZnypZYiAFIY8v
         8lhA==
X-Gm-Message-State: AFq9FYJ3UiaLq33i2H4Qf9HO8MX0/UWu206NHi8ZImL++QdKaYmPg7ya
	eghZ4W8YIVrwgvPpmOunj0dWu+VBfWU1x7VIovTxLtQz1dj59B5RLamILOZvQNu4
X-Gm-Gg: AYBFou2bRtBg2dPIVCizk29j3u54tKRm0g0X69pDjy0FRVnCd8wBNnqcxYQGVLx2zmB
	3DjBlsmzmx3E4AiuHEB9ZpMPs8+4jzjXHqLtK6V2/k8w9RL8pOuXfREcmzSLISHl9IC87EDQ4sN
	IkJ/LkQ3ZdonUrYgKRfB78CXFaG9eG2rOWj2fUaHXnQD/1egqQ1TUYhPzkbTTm8ujTKdBg9c1Tn
	1uqsurHWvduYn0TPZ7oyMauu68OXInpDM1fXY0s6Mw7mMOim0X7FIUI4em5ja009mA8rjul38XT
	CN2TVG6QgCRh4Bnt4wxjPVI5VjDg9jXKkJNFSjp65JKLODNaSiCocFsFIrYcQSyuyw+oNZwmbUJ
	egv/MiYQXLT5wBkRvI9jEpLIf6ObC3ambYEansKQpNiD+J9Xb6iMUIwuXULKGzjUartuzbdSU3B
	/4ylaPK5H0gbQjRKBg04k5548PzTaQ14MhPVhUYTByf2iU1UOwoQwGYqop/GhglcpoEKttH8Av7
	FJO3Tf+dIyGeo1X8Wi1Cw8l9CbgUd4WvJ0h2oXu5BhIfWAQ9VQKWxTFvjOfDQhXUAOVlCSdHL4L
	yd/FOixtT0RERH2i6JdZgQWc1SELd6j82Ic1jQvmaRZ4vHi/kTN4+pcSEaEGiUlBNH0+4c7zVgS
	sZXNDGL9fNMiKnX7sjIc7mt8w
X-Received: by 2002:a05:690e:458a:10b0:677:ceec:5ea6 with SMTP id 956f58d0204a3-67a45787e94mr2519513d50.22.1792974490199;
        Sun, 25 Oct 2026 17:28:10 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a462c5bbasm2685073d50.20.2026.10.25.17.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:28:09 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] webmin: upgrade 2.653 -> 2.660
Date: Sun, 25 Oct 2026 20:27:58 -0400
Message-ID: <20261026002758.585754-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 00:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131412
Content-Type: text/plain; charset="utf-8"

Changelog: https://github.com/webmin/webmin/releases/tag/2.660

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webmin/{webmin_2.653.bb => webmin_2.660.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.653.bb => webmin_2.660.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.660.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.660.bb
index a46c3aad16..a98a0a3ab1 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.660.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "9acc680d3d45cee876f36fc8810ce68bb6e44a0365e245a4298a180e0d016696"
+SRC_URI[sha256sum] = "185cfa4ac3f2654b363b4b329df0033e4b997a5af92711a211fd038ec042696b"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 
-- 
2.43.0

