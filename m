Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.10745.1593562078259491320
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uvJEk1hG;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e8so10769849pgc.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+f80GbB4LYNIwa0u8S6ptnyDd1quyCUBb+74srZVQuM=;
        b=uvJEk1hGm5X9ol1OQJ8twq+9kKvPdth0afqYKP2nDlgsVSmnprRSZyXP4e6oG+7gVj
         XU+IqF3NMk6iycpIi8myoRhILN7HLUNfGKzE17P6n3JQYxAkWPufMFPZnbRlJO1EnXJS
         aBC/qLNtHZ9twfattgfXeb9cYNAlz/O2DbuN3+1EJElJ5hi3UloBhf3RXRYvAJj6d68i
         Eh/vguw8XpiCJk1uFM/vcvZtZdNvEA6B5rwTPf3/IdUOzWzlPwfQW4EwdlzZV1i3uuJi
         dyCsmtzJG3i4iLHlyLHG/ln6kSNSAcPhrSiAKdS+7fnkuAfeWKM8EoG91+wFd4z85gH5
         BWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+f80GbB4LYNIwa0u8S6ptnyDd1quyCUBb+74srZVQuM=;
        b=gUbnWddGcb3MCrlAixFGdB6enILH/HE+x6ZpyJOUpCSakEkCNJVzaBAG4IBOK7FTqg
         vFoTAGesCIMUDQD6RM1xxx1gux7waZDNaN+mFLBv5bwVtTCGI9Vi5DFxF1NWSjDo52D2
         cHDBPi/29lSobElzF9A4Z5d9eNv5bWje3ZN13drApjX3g9HAEvAtVCM/Qzw0inmnY+VO
         IWnqO4+SuRWE/dU3IN9kK1y9FKQkNvMQAhVUb8bN//yDtahYXbnRi215rYiXhK2a2teN
         Y9zawr6psS79Z3eV1v2vJ38y+AORB3QcmuGf1CX5T3YuvOGSSCMjnxt5fpy7cliXA1QH
         k24w==
X-Gm-Message-State: AOAM532Domy6JiYZtX1xtShbVPdoc/6cAE9DokP4dHd+DmSachQZN5oC
	rLPXiRBGturiDnjWfphQrdu8UJCIFMo=
X-Google-Smtp-Source: ABdhPJzlU7rGUQpGHuy2FjLadP3HWIhtEHe0D2LVyVoyQccoFmGhNpoyYF1U4aziCcz3TTo76yoOAA==
X-Received: by 2002:a65:6384:: with SMTP id h4mr17049943pgv.196.1593562077599;
        Tue, 30 Jun 2020 17:07:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:57 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 32/32] ntp: update 4.2.8p15
Date: Tue, 30 Jun 2020 17:07:17 -0700
Message-Id: <9caee0867444998515e7ea0ea737f0b5b97b00b2.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c9384d7fc40acdf8b5ed668ac3f5fa0e2ad4dbd1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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

