Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357EDCD5BAF
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 22:36:50 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5846.1779403009747782334
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 15:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Al6k+5Vw;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3100688b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 15:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779403009; x=1780007809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzVPATOdeopneGjqDodTpDNUBpWW0vd/CQZeEH3Umgw=;
        b=Al6k+5Vw6qeGgJZ2XrN/QngmCcPaJv7dD1gGt51lCbI8zjH/oes1XNwvvIVHG6Nca5
         QZeXRifoD0Zrr0UggiVAhAvALSqD6cAL0jQ3wzk486fMI+oGz15TuOIxOHMRkH2TXdOI
         L46rf2EDNCKqWTcex60OocnzUpLenWe3ZtlRcT0CRPmumD0VZGYOhMRnpNLC+EY0LcDY
         iVc18ovaX6Q4gJ4vO/TEABVIiK8sAckWBDbpB1YPSAXnh4UMBI/Iz36zY+5BLEi6JWOt
         /uCrJHzhCW1Fw+MfVvS57zOV9u3vNOl7jvU0Njju4YnCVykS/1WwNc/9AvxZzdEOxj1U
         xyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779403009; x=1780007809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QzVPATOdeopneGjqDodTpDNUBpWW0vd/CQZeEH3Umgw=;
        b=OkrIQJYkT97xYx+RsEtj0p/Lo5owXKYDn09lU4EuBEpnO5MXtcf1O9m51ruHIUdPQ+
         6st43NdkFo7Ve4cdD9ywYsnVO7HL0LbDTMcVj+ThGqB3nDhfZ30W60wEneXunb2oPI1V
         RsF4cX7VCh78ie/OSfhXuElIg899pz54papAASbrmRmVDBjanA9LiJk1EFqh4g+yC4ow
         tH/+64AtCzcuPtPBuIAmdoodd8JRLsckbWpZYKmzMbL33bWsQzbmEOFBMN1NuFLQ47Cw
         aDlpdY/vj/q2uE6C8PuQ2rUW/HKB/R0G+zHGPII/onyRC2UnNY9FQGiFNYzOqqgn/oOZ
         OwCQ==
X-Gm-Message-State: AOJu0Yzk9cr/46zejQDQk01UYANRu3VhPmTANN6q2KpnWwDiIWaywsTP
	4sVDL9eDCKplAuFKfXtptYzdBtb2Bza76DShbbCnyrTDaxmxAaEkjP4L1tqgEkwG
X-Gm-Gg: Acq92OEWRWzFhhe8TqOSlTesyasasSrp5iyiKH7ZxCEapxzSdRzoVNj89Ou83DqS4Rb
	T6j18OVwPSuDEfnZewyfowwwM/G3qj9xEteriFRzY2BCNDbpOWoZ3DU54v6C7w9APUP9NNSJR41
	UTbRQYRgXCv2EJUJ/o/ILaTEgEepQrj4gOOPT6aLRfK/zrmGo/GLFKR5TXXoQyLpiDPQEdZMyeU
	w35r8xppiVf3tCi9umrOi2sUJdZOrtp/yHknMyvawowbmNdiQmMz22bMQHKcNiFW039zY0y7Rct
	dko0LPevGkFraIdsBn7CZj+x+U61YqK+nQ6iHXukYaXCUT5UugtFr9JKEXt9vj58RhZfNl69bgO
	HP/pzOoLKvNvyvnndUqeS6PdMBQD99hWB7EEF8/GeFhFKZ/1pc8+Pau5K0vCr3Uh8iyCQ++jyHY
	qcCpu9987Ky4Uqd7lkpdw+qmRkLn8NTVTb9Rc6sVCKw+DUx7Y=
X-Received: by 2002:a05:6a00:1c8b:b0:82c:7f08:8826 with SMTP id d2e1a72fcca58-8415f15b50emr1006932b3a.17.1779403009040;
        Thu, 21 May 2026 15:36:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84162879230sm124505b3a.33.2026.05.21.15.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 15:36:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/5] libjcat: upgrade 0.2.3 -> 0.2.6
Date: Fri, 22 May 2026 10:36:23 +1200
Message-ID: <20260521223623.1335832-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521223623.1335832-1-ankur.tyagi85@gmail.com>
References: <20260521223623.1335832-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 22:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127144

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Update packageconfig option to use "gnutls" prefix[1]
Also include tag in the SRC_URI

[1]https://github.com/hughsie/libjcat/commit/d873545c23064620eb884b7e67ff1cda94b891fa

PTEST passed:

root@qemuarm64:~# ptest-runner libjcat
START: ptest-runner
2026-05-21T21:45
BEGIN: /usr/lib/libjcat/ptest
Running test: libjcat/libjcat.test
...
...
# End of jcat tests
PASS: libjcat/libjcat.test
SUMMARY: total=1; passed=1; skipped=0; failed=0; user=5.1s; system=0.1s; maxrss=9688
DURATION: 6
END: /usr/lib/libjcat/ptest
2026-05-21T21:45
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libjcat/{libjcat_0.2.3.bb => libjcat_0.2.6.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.2.3.bb => libjcat_0.2.6.bb} (82%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.6.bb
similarity index 82%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.2.6.bb
index 6e31889b69..ee49834524 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.6.bb
@@ -8,20 +8,20 @@ DEPENDS = "\
 "
 
 SRC_URI = "\
-    git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
+    git://github.com/hughsie/libjcat.git;branch=main;protocol=https;tag=${PV} \
     file://run-ptest \
 "
-SRCREV = "f284d18a694ed98f49ddb06e6920265781a30125"
+SRCREV = "4f4bf849c1728ba291f28cea86d140785368fdd0"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
 
 PACKAGECONFIG ??= "\
     gpg \
-    pkcs7 \
+    gnutls_pkcs7 \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
 "
 PACKAGECONFIG[gpg] = "-Dgpg=true,-Dgpg=false,gpgme"
-PACKAGECONFIG[pkcs7] = "-Dpkcs7=true,-Dpkcs7=false,gnutls gnutls-native"
+PACKAGECONFIG[gnutls_pkcs7] = "-Dgnutls_pkcs7=true,-Dgnutls_pkcs7=false,gnutls gnutls-native"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
 
 # manpage generation is broken because help2man needs to run the target binary on the host...

