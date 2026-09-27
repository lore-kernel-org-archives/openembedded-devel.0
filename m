Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9D6C98328
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 00:40:00 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30003.1790469593852813950
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 17:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MI/rbBCn;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a147688bso1437422a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469593; x=1791074393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5KTHW9KWjVoScyLNmtZfx6K+1gWWzp678SI7V9AU+I=;
        b=MI/rbBCnDo1NNeWF2HuT5g2i2vUf+nSww5yRPLFvzdBglGn10NBo6uFslIUo0opxFG
         BDq4msDaGH6qakbdzYsZ1Kq30TohqWL1s/gYbySeKCnNedAo6cBBWbMeDzo1v7YeAwJs
         pH6peRTDpy9kjDPVeeP7BnNnuiuyhMQ844TzsytdYPcuXWQSTyanUWEcHbPVoY2Cq1Nl
         OJFc1T7apG/mZFuGbyTLwuLuRo5obmrIwnLSUF5149qmCNMyvB8SD2C80nDTkANlUQJO
         auw02CwKyQIEPJxw2G0MF9h5khhedhw2WEQQluIr9WOCfW78fj1WvJjBeb7eIZ4Ul/dg
         hMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469593; x=1791074393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5KTHW9KWjVoScyLNmtZfx6K+1gWWzp678SI7V9AU+I=;
        b=zBRJ0NwHBYWFurU66ovk1YGC3gmZ7i2rzGHMj5BsJulyaBqP2OIHrxbdWmZpOkbcf2
         NR0MzBxIOK57GylsimBR0sLNqq9KgBTMB0vqK2gJAcLb++lPSrjDuIzG/eHu+nnmh8sR
         4HCnlEJnDi/XVaGE78Y8RlD/ezAuZQ7JLAZ/DSaxltGmeR6xUUHH8qhczcV8861kgEWr
         jTGshJ5xP4GaGKGJDpgXqqrsix2ovoMqh+qjXOKAS6sRDflNUbdwv3qHBq4ejI0CQrCu
         QU0auO7Ef+wJOUdmLv+hOtxXZcYhh4SA5pwsdwbSIo7wy/K7P2bgMPy5g6UI94blttB+
         3psg==
X-Gm-Message-State: AFq9FYITX+MIYfNPQb/b5RAirmbY15wMBVi23LTXOavWulkBIeF1UuCM
	AozkY/1gOXeO9vTSmLz3MMNaoykN7XqsagaGHt4qwAzUZ082z0FPgSjA0cJYkg==
X-Gm-Gg: AYBFou3x3wU5lSJwGAeC8ndipEjY+IsWqJSxCEItMuYEiH0vPuxSS7LCiUsE4ZAUgNk
	1aN6T63xxGnWB0SFQq3HrWHPx1hpV49Fqxp+XeJ+fpF44bGIKihJp4j8cqazXMGAbBvD/h0Vfk/
	XsCICfZY5yGJmsGRbPOx7FghvGe5pct6api8Vv/6NFLOn+TpE1AE8mweaD1miN+Txtjug2qnrzD
	ZMlQR+j2DxZcdt+MLah1tEiRF7SUdnG78xAVyADUIWgxKW348pH9yzqBK0K26C6ajPS908bqIkz
	dNFDPFWfgdm6xKvmixHUV/YtvuBuLPsuqxnDdNBGrl5Qrszdu1kV95k5K3RL7H4TCfaP8hkOi/i
	quavmUuvjZE2/0UP4CzSAla9VWYuf/ERpivlZLQ+TXf6qDhNTMOAaxwM38duyFmnu5B7gfpZIl2
	LTwAaVBa0/JJYtQJ3rJqCXEDtJpN6k2KmcNA2w+33gUnoh93wi8ai2saYx8cJpZi176smUL1nqn
	0cbnEJDnEcLnV9jB7EiQW0=
X-Received: by 2002:a17:90b:52cd:b0:39e:6c69:9b8b with SMTP id 98e67ed59e1d1-3a099231f90mr7452845a91.48.1790469593137;
        Sat, 26 Sep 2026 17:39:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm2876420a91.1.2026.09.26.17.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:39:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 11/11] gpsd: patch CVE-2026-60122
Date: Sun, 27 Sep 2026 13:39:21 +1300
Message-ID: <20260927003921.746786-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
References: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 00:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130330

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-60122

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gpsd/gpsd/CVE-2026-60122.patch            | 45 +++++++++++++++++++
 .../recipes-navigation/gpsd/gpsd_3.27.5.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
new file mode 100644
index 0000000000..da8fa5f4d2
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
@@ -0,0 +1,45 @@
+From 50bf98d0240b94bbec6ce06be33cdaf99e2f6214 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Mon, 20 Jul 2026 20:12:16 -0700
+Subject: [PATCH] clients/gpsprof.py.in: ensure sats.used is boolean.  Issue
+ 406
+
+Prevfent command injection by sates.used.  Force to boolean.
+
+(cherry picked from commit 5a9c44a42136b9bb98d460a8a716e9fd344a8d93)
+
+CVE: CVE-2026-60122
+Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/5a9c44a42136b9bb98d460a8a716e9fd344a8d93]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ clients/gpsprof.py.in | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index e91367ee3..07123d417 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -334,8 +334,11 @@ class spaceplot(plotter):
+             # get sat used count
+             sats_used = 0
+             for sat in self.session.satellites:
+-                if sat.used:
++                if sat.used is True:
+                     sats_used += 1
++                else:
++                    # ensure it is boolean.
++                    sat.used = False
+ 
+             if 'altHAE' not in self.session.data:
+                 self.session.data['altHAE'] = gps.NaN
+@@ -783,6 +786,10 @@ class polarplot(plotter):
+                     used += 1
+                     if 'polarunused' == self.name:
+                         continue
++                else:
++                    # ensure it is boolean.
++                    sat['used'] = False;
++
+                 if (('polarused' == self.name and
+                      sat['used'] is False)):
+                     continue
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
index 7819dc532d..ed16ee4fc1 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://CVE-2026-58459-1.patch \
            file://CVE-2026-58459-2.patch \
            file://CVE-2026-58459-3.patch \
+           file://CVE-2026-60122.patch \
            file://gpsd.init \
            "
 SRC_URI[sha256sum] = "409873f5048462ef1ac413a51ab35caa8b50b31be62b3347bee1cc2994e7c649"

