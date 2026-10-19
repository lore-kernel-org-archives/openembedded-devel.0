Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1763.1792434883369004727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Asntt6ib;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1661346a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434883; x=1793039683; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZlvKZBlAkKW6gQ0COzgfziM/PoWrcDGqeL7tyqwers=;
        b=Asntt6ibxG/fCCghZoZMndNvYRe82MLRSjAwcsXDNzzklkp/Ih62L2kNCSYNPlw8SO
         BkjKc6174WoYlzYIqjqGrHY7a9Q1/SYc8A2y6xrR03vQ1S2IA9mCfIlPD6+mwn0JY+6j
         Bd5IVYJpijoN8qVlTjNH3n/957EvyHGUm5vtd+NR5PQwt9PKfo0uuaeUHG1MG2JRXKTI
         Wnqg+h4qs5uJdzLxyxKcbALV1aSVbzHMw4L9wlBYQLp18o49KqdNd0aW48geHzd/0587
         /E3v4LiR3RyyxyDepsfcUTKFhiR4UXhb6NeD4XInsQO8dX84rcJuFSPzcNqsc33FJFON
         l6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434883; x=1793039683;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZlvKZBlAkKW6gQ0COzgfziM/PoWrcDGqeL7tyqwers=;
        b=F62gf0hBqyj6V/1YcMjgkuSJSOuG/1MmW3fANyVfdZoJ54XnOMg6T8/eFrZ8vFnfi8
         OVr5WMz7S2RQJMBI39SVn27RZa1ahO1AFhp7cmragcrgnKH0jIHGZznKBqlgdpjl79uw
         PHMtqHjMNokPNKrUmq+LP/1ZyZolOVRFvJa3+9Yr+8jdiAdwoRhpGGE5cD1SUl4iRgeo
         TQ/za9j+lgLuQ0aOOvSeNX4cJWG9fsWM1nXN3qO5I5vQkDbxJC6K1GwToy8+FC/j5+RD
         IIREmjvmxK3FpsdcA1oYh74ThIIMnEU2y7/4/Qu5cT5GTPd7cQjh1/ja/4dG9SfJiJKp
         D5wQ==
X-Gm-Message-State: AFq9FYLfl9ejvsPCaMOylcn0lUpH99K5uA05NqybJwdyhIWRHpAxAP8R
	ybGbKfwgdq9HQqXh8sHFg8x8Cx6vK4NK3P5of8coAPijIOz5JNhoj/yDutxfvA==
X-Gm-Gg: AYBFou0Yf6JctJoASDwTctxzmO2KXB3teJULY8EzRpTGlZtNCRueIVVkdCsBMU+M32P
	H+Jgoxct++kGKdIap0s2AE7c7emJ/oFFfo/U1KhPs6pJmLKaprYWVftAiBGNAOu4zD2/S60hYls
	YPLnTQJddlLCoSfGnBQKfdCcDpt0mo0zd7fPZgfCaBBKxeebn/24olRVddkuXAIlfWbuarBjDYu
	YoFuEIuPrtd91XK+MS1glXF7jiqxZX3eyAjJs0PCkGXOwOAhB4I+zWAuS1w8QcrKbvnoe1YZ0LZ
	iBqTSzdvZhH37drQjqXPWy0ZrVNULEXd7A+TmICUSv4t2FadeEi0o27xXdCzEw289Sm/U89d9Tw
	wCfIPye3F7gqrnnqwiENwOZf0JO1SaO01NqLJgdlWVkhHW/PfgXqBAKrSoLSwQyLOYgDc6OGZiX
	qrnXIY2/XhkwQ2hKW+WLc8mUFTVgSHjn0i2UIojNBBBatMpO3OMIZxrNY2qHdc9rtPeLnVVsOgA
	S/FrMLxxvxtLbmiBvXxcuVvkF2hPUxcXMIns1Q=
X-Received: by 2002:a17:90a:e7ce:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3acef591b93mr7399694a91.48.1792434882627;
        Mon, 19 Oct 2026 11:34:42 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 12/20] mtr: patch CVE-2026-14461
Date: Tue, 20 Oct 2026 07:33:58 +1300
Message-ID: <20261019183407.1037972-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131138
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-14461

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit a5e913980f0107c4fe1ccde6a5e4a10780bd60a9)
---
 .../mtr/mtr/CVE-2026-14461.patch              | 32 +++++++++++++++++++
 .../recipes-support/mtr/mtr_0.96.bb           |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch

diff --git a/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch b/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
new file mode 100644
index 0000000000..6628d9d7be
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
@@ -0,0 +1,32 @@
+From 4c75fae93d9515f3ecdfecc966b8c6471efb7ea5 Mon Sep 17 00:00:00 2001
+From: "R.E. Wolff" <R.E.Wolff@BitWizard.nl>
+Date: Tue, 16 Jun 2026 11:03:39 +0200
+Subject: [PATCH] =?UTF-8?q?Fixed=20possible=20buffer=20overrun=20in=20asn?=
+ =?UTF-8?q?=20code--=20Micha=C5=82=20Majchrowicz?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(cherry picked from commit 48e1794414d338ce47abc0f27c25ade8788af9c3)
+
+CVE: CVE-2026-14461
+Upstream-Status: Backport [https://github.com/traviscross/mtr/commit/48e1794414d338ce47abc0f27c25ade8788af9c3]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ui/asn.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ui/asn.c b/ui/asn.c
+index 111c394..487d9e8 100644
+--- a/ui/asn.c
++++ b/ui/asn.c
+@@ -94,6 +94,8 @@ static char *ipinfo_lookup(
+             DEB_syslog(LOG_INFO, "Malloc-txt: %s", UNKN);
+         return xstrdup(UNKN);
+     }
++    // Clip len to PACKETSZ. -- Michał Majchrowicz
++    if (len > PACKETSZ) len = PACKETSZ;
+ 
+     pt = answer + sizeof(HEADER);
+ 
diff --git a/meta-networking/recipes-support/mtr/mtr_0.96.bb b/meta-networking/recipes-support/mtr/mtr_0.96.bb
index 9008223264..2716ca92aa 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.96.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.96.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
 SRCREV = "f392168771570b0fdc104c38dea6bbc2ce585710"
-SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https;tag=v${PV} \
+           file://CVE-2026-14461.patch \
+"
 
 
 inherit autotools pkgconfig
