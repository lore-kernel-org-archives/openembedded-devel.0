Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3100BC433FE
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 18:54:47 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.22568.1636224886127604465
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GQorkiuo;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id c4so19133735wrd.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XksVlucU8injxOahseFrKge3H7CQCCwbJPOD71nTr2o=;
        b=GQorkiuozPonmLys1VDN2KsoQ6y6vLsuyTa2c4cbUrGRGPqGeUSvn98KUfk/kP3Pb9
         JU80N4IowdN+k9K/rGWfBURP9Shl6LszwWYSt9ksX+uSATMfHGrhT6cLQPsAr/f68CHv
         5wFQ0ZlSr5DZENTdNAvZYuArcVn4fWBnLTFLwinWGn5UvgrbnenINYa3j41uD3GZ1mOj
         ztuxlOKhh5HJUE/JVkFw0OyMCapSoTTYQLzH/X0x+vBm9CBK7fnV2EI4hgPt0AO5arRU
         hJsyhtEUfS2muyeYYeY3gvXXjiHHuimlGnQxEIFM6zwaPKiODFdKc2aSyA7jHHrSZQ1i
         zB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XksVlucU8injxOahseFrKge3H7CQCCwbJPOD71nTr2o=;
        b=lxX5SFGigTgTk/B2hSia+T1rNFpzsMoWSc7pgiktMECZze4Hz+7PqNO3vyQXhsdKZ/
         L3gafDqkynpU6Huoe2lxCSZjAq1aGkVbAbj7r//kLm2L7kvj2PiYa5C2lTyJZwZMLPze
         l9YxGKyN8q3cfMNBW2Z7Tcn+1FMZUQNxmIxEBET6454r/35n9OJID0wYkHvLcL2/RPDs
         lTF9axDzJZaywuX8hkm41Kp+tFM0CLM2KgZjM+ewmPvq8CageKh+Cmxvyq5e9AR+Nk2X
         K9O8/P6mBu/d8sDeg+nuxu+0Cstek9IR2R4QN1pIeaptqyU1wXD7Hd2OSf8MhEOK8gHZ
         /FZg==
X-Gm-Message-State: AOAM532bDJKM8zFLqAuTqInAwWVJdgmm6C1PvUQw4C0g7GexIEadWYNk
	Wpt2jnrxrH9lO4XwjTffej6ykgURfTs=
X-Google-Smtp-Source: 
 ABdhPJx8Eb8N34ryMkXMRaTCDGFq8yCmqaS7NGbbSQpz0n0HEaM8j7+d/iW+FMwlCdR/+douYbgMqw==
X-Received: by 2002:a5d:58c5:: with SMTP id o5mr67579456wrf.15.1636224884494;
        Sat, 06 Nov 2021 11:54:44 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 y10sm14342232wrd.84.2021.11.06.11.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:54:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] ntpsec: require x11 in DISTRO_FEATURES
Date: Sat,  6 Nov 2021 19:54:42 +0100
Message-Id: <20211106185442.583429-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Nov 2021 18:54:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93861

* fixes:
  ERROR: Nothing RPROVIDES 'gnuplot' (but meta-openembedded/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb RDEPENDS on or otherwise requires it)
  gnuplot was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
  NOTE: Runtime target 'gnuplot' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['gnuplot']
  NOTE: Runtime target 'ntpsec' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['ntpsec', 'gnuplot']
  NOTE: Runtime target 'ntpsec-python' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['ntpsec-python', 'gnuplot']
  ERROR: Nothing RPROVIDES 'ntpsec-dev' (but meta-openembedded/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb RDEPENDS on or otherwise requires it)
  No eligible RPROVIDERs exist for 'ntpsec-dev'
  NOTE: Runtime target 'ntpsec-dev' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['ntpsec-dev']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-networking.bb            | 2 +-
 meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb       | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 3e3297c262..a539dfeb6c 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -217,7 +217,7 @@ RDEPENDS:packagegroup-meta-networking-support = "\
     yp-tools \
     mtr \
     ntp ntpdate sntp ntpdc ntpq ntp-tickadj ntp-utils \
-    ntpsec \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "ntpsec", "", d)} \
     nbd-client \
     nbd-server \
     nbd-trdump \
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
index 167af04ca4..d07cac4265 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
@@ -17,7 +17,10 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "f2684835116c80b8f21782a5959a805ba3c44e3a681dd6c17c7cb00cc242c27a"
 
-inherit pkgconfig python3-dir python3targetconfig systemd update-alternatives update-rc.d useradd waf
+inherit pkgconfig python3-dir python3targetconfig systemd update-alternatives update-rc.d useradd waf features_check
+
+# RDEPENDS on gnuplot with this restriction
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'seccomp systemd', d)} \
                  cap \
-- 
2.32.0


