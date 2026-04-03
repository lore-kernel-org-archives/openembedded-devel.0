Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C997E88D66
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 21:24:14 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5342.1775251448795326779
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 14:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rB9WwHIR;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6500040ef85so2204098d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 14:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775251448; x=1775856248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G83ko2qChSAvSJpoZ4T84q24N+nOihQ5wTBT1+7lLvI=;
        b=rB9WwHIRNfstV4mZXO5OCfGc9L7N4irEQLxOOLl2FAHM30032ISeXaBaGOkmlKVkTr
         pt4doVmrjyNwz9s61J8g9/udWdYxFvdyyomNdAACrvu4IuNx7CvrcwZOaz7B9N810scx
         Tpi/KAI2CrGxF7SaQO9XNCHgeScH2JK3nKY1mZj4p7i62/Ur3l0wXg2+auaiy/v312O/
         wL3E1mEzk05kxHYK9lw3XEvznH17SvoNzbeegUg2uUo0AMzPLcepfvUEIu5u9D/Cygw1
         +5sy6kP5wgiyMmyO/1WDuQ6CGj87rwyAqOWSH2zvaIqDhnJwjN1R53hGYbCfEmWUN2WI
         4SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775251448; x=1775856248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G83ko2qChSAvSJpoZ4T84q24N+nOihQ5wTBT1+7lLvI=;
        b=eKlky6oUFQl3ThVo9hHMkAvqPPxQNrmL3BDwHDEL8zgjh0l5e5ntUh2f2652m5yhPY
         oth1hHyWVkxYfnrNDgqF3TgmYIWRhLu/5RE8LAhUFRJfFfmv9h2SSL1OPrelwI/V6tNQ
         Iej/2R047VTh9TdnglA0UaWqnkgMNLqlwZNlobfySgLSe61CDN3saVX5o0neIOoUMbJg
         w+j/HEpsuV4qZQLqneTv9XqJMUSxwbjxeQdc08PV7Lqrqxvnt3qi64ifDGxE3GcTvjs2
         5BfvKhw0wBx7OpVkvruOR5M1mFHz6qiQGdXLh9n+ZluDmpnX9GKxQpjU+74H8ZsBa/0w
         DBzw==
X-Gm-Message-State: AOJu0YwgGD49oRv/xSoe724B7twf7eYc/9hYbXS0QVmMwgPm61hRUgMO
	nrVJnCVLejAE5dmn+dJA9PjnKD0USfQnG8nwXFDgTaHOuF/+DPLLs1lB7dydXE7F
X-Gm-Gg: AeBDiesC2M0MgBUcgLOm/Dv3OGFyYt++pQCaIPjHzNCbs+5jV5VnH02DeI3vNLiXdk6
	L8d+Tp1Z6J46zAin3N4Oovgi3ZxlObhEnUUAj69rwMGDnpaZL74+znUVQ+mcyPcV49ltWOnU2bV
	6TIt7xMgB6ZCy0d5tZPlB2VoM0uumIuOXB0jHnenFqngd3dGBX+Cdt9gzz/D/QY5Hg5spMZHutL
	TSkBpG5Cg7MqZ78FcCgF4fZVaER07luKnsgFBAlEKFsbyYZaCeqiGmsjCRg5rP/aInTUCdqLivM
	RIAI2luZ+uh65hRE1t6WsypA7YhmfaQxL2Lgs4rfCUmlRZjjaTPk0ihWhF5aIa8tQuSliicqSRh
	IDt5YcP8K82KTCLgqxwJXhn8CUsUd8rmdyKDVvlhO7IMTQL1xAdToPJaq1TxbvJ5dml+Qj2tg02
	JRt5WyGm23v2SPY9vOM4Dtkr8anXQN107GHlFnwnUkjzPEuqRlZpfnhreT61PLNih8gDJ+FZtMH
	Jjldq4VGBgYkpjmGpxjaOhV4+O8UmQXQyqxmJ7xDwNg7Gp8UI4w
X-Received: by 2002:a53:e301:0:b0:650:38d9:a0a5 with SMTP id 956f58d0204a3-6504886c042mr3084273d50.43.1775251447485;
        Fri, 03 Apr 2026 14:24:07 -0700 (PDT)
Received: from localhost.localdomain ([67.233.60.136])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a978b7csm2880857d50.11.2026.04.03.14.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:24:07 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][whinlatter][PATCH] Update README.md with branch name.
Date: Fri,  3 Apr 2026 17:23:45 -0400
Message-ID: <20260403212345.25307-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 21:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125993

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 0d0077783e..523d60a502 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -16,7 +16,7 @@ BBMASK = "meta-xfce/recipes-multimedia"
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
 
 When sending single patches, please using something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][whinlatter][PATCH'
 
 Layer maintainer: Kai Kang <kai.kang@windriver.com>
 Layer maintainer: Khem Raj <raj.khem@gmail.com>
-- 
2.43.0


