Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.683.1585771951643865535
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 13:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mcvjC/yE;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id j19so1180706wmi.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2020 13:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z0AzOTCOq0MFKQm2H8m/jJxLiw2E+KZ3rZsdFCo7bUQ=;
        b=mcvjC/yEsYLbpccxUVrZZIeydeyR1zZF6gqkzSYfz1qzLoyMVZ3Ysmf1QUJ9sk1oRN
         m6Hg++zn70LKvW6347c5JyEoKzj/i2/bTw7GWDLi4EgtNdtDbm0Q2PIlpO7lA397wOLb
         qS31FO4qiqfv4F3l1nWoa7hIGNtFjIFWNxYjUsjMnkx5uQ8LPpCbAqsntWIv8Ou8p96a
         PeeCbVgxdK3SsUHEcCGDH+BCnBJ/4u12on/3XqJSjLnuQ3WoT4NsBK0Yx2HS1fNVmCeP
         3vQD0Z7bFsaeMdOVwaI8AFinmys3oxXMXIXEd28H36kA4xNVSuiB78IaqlmEMI9V1qdM
         DWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z0AzOTCOq0MFKQm2H8m/jJxLiw2E+KZ3rZsdFCo7bUQ=;
        b=bsKUu3eV/qIHuheY2+DnaMTh/992fSNT3YfRs/RCtzFuwzdDnpv5A/6QEpNeACmbek
         b+8F52wnT6jEGpsrL7VKpbMfE/eQhWZBo9sCjgiGiRe0De3AOX0XgLqZVjvGJfM9noP/
         DPQzLQcOOBwWZ1xBGo7RHVQvsLNg094LLj9vqiFj3pwV3c9QZoC0yr4Xpip1UWRfDxvo
         2b8dFbyrklnlGbQnKoY5RxqywE9/0L6qNhbf1PGSsW8Ec89c+CQWo+GECizNx5d9IHCK
         hoY2z5oXtdiLk8lhG///unz0G40XQY0bScJVEM9gB7APWoSe1OH7xVPtotiDscaeP384
         z7xQ==
X-Gm-Message-State: AGi0PuZJWYxeWUfBAJ4LsiaCEUi6zaH7qVmsgZ3e54S3oIrgyoB3YUPL
	su9QN/J6D4kOXgAZP6YWXCTFgRQ9bGQ=
X-Google-Smtp-Source: APiQypIZAfv52qaJEQjf6LIkfeIV47Nk2hPbhTvFFt8HEf1aKoZBld6VL5O7CnuKAG3VLHs9o2h9SA==
X-Received: by 2002:a05:600c:2297:: with SMTP id 23mr100245wmf.166.1585771949597;
        Wed, 01 Apr 2020 13:12:29 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F030902931B45A4944A4AD2.dip0.t-ipconnect.de. [2003:f0:7f03:902:931b:45a4:944a:4ad2])
        by smtp.gmail.com with ESMTPSA id j11sm3939512wmi.33.2020.04.01.13.12.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 13:12:28 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] gigolo: upgrade 0.5.0 -> 0.5.1
Date: Wed,  1 Apr 2020 22:12:16 +0200
Message-Id: <20200401201217.11809-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.5.1
=======================
Fixes an annoying bug about wrong port being saved in the bookmark when
saving it (#15455).

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-apps/gigolo/{gigolo_0.5.0.bb => gigolo_0.5.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/gigolo/{gigolo_0.5.0.bb => gigolo_0.5.1.bb} (67%)

diff --git a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.0.bb b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.1.bb
similarity index 67%
rename from meta-xfce/recipes-apps/gigolo/gigolo_0.5.0.bb
rename to meta-xfce/recipes-apps/gigolo/gigolo_0.5.1.bb
index 4446214f8..1233fe069 100644
--- a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.0.bb
+++ b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.1.bb
@@ -7,5 +7,5 @@ DEPENDS = "gtk+3 intltool-native xfce4-dev-tools-native"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "273111f5d7c26898e5ddea7b97d5dfe1"
-SRC_URI[sha256sum] = "97a301aff012a143d0b99e7ecbb27084d3872aa203a74745e8357aab3a1880dc"
+SRC_URI[md5sum] = "94e89ad3fabba7167760004b64062f4a"
+SRC_URI[sha256sum] = "ca87badb5871e4844579704704ea9e5ede444f710a3b264c12b60b2a0e48e14e"
-- 
2.21.1

