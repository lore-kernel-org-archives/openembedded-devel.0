Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C5FCC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:41:11 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.363.1791866461873207993
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VXuhVHFi;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so1364232a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866461; x=1792471261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JI5SPv4Mgvuqc1EQWVSgRUqv2OsgGWNzaQr9ubcQptE=;
        b=VXuhVHFi3Latu7a3TqKOXINH59iRRX6LxdCEauIIx7Q2osCah2xVB5tLZwqqERxH3Y
         2FZqaGzx5hlzi1fA1+GH7pPexdeot4dKChAhK3s2JomBN7I67JSD4LkMq+eIxIFhmb/x
         cBYGeOUNPV/M2TDElOzaQTltilHOlan6DvGCp22SyY4lclqBf31ESKNCrpk2IKJ9tRcL
         tpaSXcdKTfujymB6MMn66PkmaBtiuxUcrx1gpkMwmh/NRQ4QZcHHQXCd6UyFgjG62PCu
         eaOmu/14yfACvC88J0E4I/YdzdESWBmPdXuE0laayhECqkI2VtrGrKJw47pgBvt3ikq+
         4z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866461; x=1792471261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JI5SPv4Mgvuqc1EQWVSgRUqv2OsgGWNzaQr9ubcQptE=;
        b=G+JIOafexJjlop51Mx1HbQf9d2+fkVTgl1S1m3hmqHgQdJaQhU+BVRqEmuRJTaAPJM
         FT5HBvGjVaI0+S1sw5AGo+yGWhWclnEYM8plGfgPx/WDz8TqZuMJ+3OmiCzdnKJ4tcLt
         SBtZ8UTuaWWoRy2Zqz8QKsa25x3bZTEeqRIvL8f71oDl+S14elWZUOehLzQPuUAKbKAN
         jD9qn8CQm0MJiP+UijTSDvwTHXCzf6POJoqAKgeR5Cw/HaFdXp7b/xgK2RrIZH5xcrF1
         d4i/eaF70iuoySXEr+NUqCsAoCpDioumwvSV9JaPjostL7ZFs7bkJ7CWbTJudl5dgHO3
         w5SA==
X-Gm-Message-State: AFq9FYK5rAvoNrzkRodfRQF2lPFXBSuuQV0AjaTzBW8wMKQuxGP8gnyD
	cZBWv3qOHnToS/lCEa/tKexXsZfqRg4NRYGCHjXKrqGNlJUeK8od/mBVoGdLJQ==
X-Gm-Gg: AYBFou1uZKEF+fm1OmXncqA6p91gLK0w003A2l85Uj2MbZNe1a+cDnXe/QqZE1ctMrq
	fRfitqyCStkOh7Bl8QWiL9SKQGLTjnKlHdR3VUEFLIJtk14RfyRRJt1/3AiG4IIIm5Jn2u1l72M
	VJ0MWDiKWpgUy6R5K8O0hQ35ti336IVdDqPUXZZozHQmdPaSKkVD/+SctIgs1UTLdLv+2lJrvHP
	0ijSdGABPGdsli/Moy6knZCjMHbhtaPT4vbZsRhoG0zb5dusoAm/TS4neQRefwEbKPFv7AFEWjM
	bUio1zJ2yJxLwy+lAMli8huAKN+IXdq1C9nDfPfU5ZBwukUZQmbMWypyhMSZ8nhptFaexPR1gaT
	0jJyE7Z8hxG/9YhQ0eFKTwb6bv+IuyrudPbP6ItEtzl8bVVczNU6qj3h8lH/AAiLsleG8UiQFU8
	4hMem3/0Id+tCvUyvwlFLFQQy/z36WNRX/NqCs27xL1l9qV7/5vH3tgiZAWJq+WscgYUqgkLedE
	g05/c9lazNeJ/2u4oh1+wwhzm+T9xFSVExxcSE=
X-Received: by 2002:a17:90b:4b92:b0:3a4:a525:56fe with SMTP id 98e67ed59e1d1-3ab3a359f94mr9722071a91.5.1791866461210;
        Mon, 12 Oct 2026 21:41:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:41:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 16/16] gpsd: patch CVE-2026-60122
Date: Tue, 13 Oct 2026 17:40:06 +1300
Message-ID: <20261013044006.834868-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
References: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130830

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-60122

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit da527bb6ba21025da9ff5eafc758156d659f6c9f)
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
index 52d86503a1..2bb70aca46 100644
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

