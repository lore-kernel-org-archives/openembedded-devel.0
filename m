Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.423.1593142521355759081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 20:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MlvVuJJN;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id f9so4075323pfn.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2020 20:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mfkQi3N3UxvYHsQGk7xMmqT+xgE5vhmqaxWIwdZ9Njc=;
        b=MlvVuJJNbHET75kbWFg3wgGssulX4gzRMDny73dwbX9eQAYiGHNsUniWs69A0m0DXK
         HdFVTZjtqEaRqVzbP4vXqbR7Reou7j9T4Cn2Vi90uMSBSKCEFmXPRrjZAtJYOkNCrFK6
         vRJJ8nbNvXDlLa/4c6KShZVciteco+OFdL1FZqZ0YjRlsOw1SBf0LxNtWZfRttB9BLRp
         lIW54EsKxd4svwDZnf378gkZxeUAEMlzYikNDYJ9efctQsoZpPykAMsvw0bk0gewKwGT
         4CoEPajmknmUYtAh6I3Bl6uboW6KRCA3aeel25wnJ1ohIhIZMVP+qLgiBuPQhpxB3iY3
         qb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mfkQi3N3UxvYHsQGk7xMmqT+xgE5vhmqaxWIwdZ9Njc=;
        b=OP6fOWSh2E5ERASVLGCK5i6KPghns+czh/JeYm/Z3w/WwkCj2fWA26jmxupjfmIl4a
         pV02MD9vxXR4LfBVAl8ABxkaG8Sf+6PQ5fihBpPOOf8/PvoAfZPeZv/YsH9bFOsMcsSe
         /VzKQOEVM+1kfGCdxdMXREzBMpOcohqZZgo3gwCUcUJ5+PAFrRM70C7zusJI59VF7Mo6
         WOegXHRLed0zpCuuKPA8wpoXAnKa96TBq9OYTZk0YMRyEDPTooTw0XvLh/FmY6vVbwsc
         +r4CE4Ggroae324cQOzkI/zQO5pOZmEcD4SxlEte/YTySsHMkSbChbKI+0sK0yODoRIJ
         SPYQ==
X-Gm-Message-State: AOAM530viyhRgBP0AJ1dSPkb/5P5MUFQljEsLoBrKHzqtvbmR70aMHsX
	Ap+o1Fe8hX/Lfying1sTuhWuxh6q
X-Google-Smtp-Source: ABdhPJxB2xGqPxFMw4+FWr/ZEZJUImJu0bOe5rtrWp/neLIbxpGBazb9rHKVAqwRbB4hXf+npdegDg==
X-Received: by 2002:a62:1407:: with SMTP id 7mr813598pfu.88.1593142520066;
        Thu, 25 Jun 2020 20:35:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:acbe:8216:8a55:1b44])
        by smtp.gmail.com with ESMTPSA id h30sm6759260pfr.89.2020.06.25.20.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 20:35:19 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][PATCH] ntp: update 4.2.8p15
Date: Thu, 25 Jun 2020 20:35:17 -0700
Message-Id: <20200626033517.28970-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

Source: ntp.org
MR: 104487
Type: Security Fix
Disposition: Backport from http://archive.ntp.org/ntp4/ntp-4.2/
ChangeID: 65b220646dc29168c45b051a6ea2a651b9e669d1
Description:

Bugfix only update including a security fix: CVE-2020-15025

changelog: https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ChangeLog-stable

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p14.bb => ntp_4.2.8p15.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p14.bb => ntp_4.2.8p15.bb} (98%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p14.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
similarity index 98%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p14.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index cdf66082f2..7e168825e0 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p14.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -24,8 +24,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "783edaf1d68ddf651bde64eda54a579d"
-SRC_URI[sha256sum] = "1960e4f081f6aafd108d721bc3ab15f9e8dfd08dc08339aa95bca9d2545e4eb7"
+SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.17.1

