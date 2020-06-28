Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.7016.1593383760416720499
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 15:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=agO1lusR;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id ga4so14676345ejb.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 15:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xZA0Z8tc39nKRysXxrB4Xh18xwjtfGnw8lo/Mc4J8/0=;
        b=agO1lusRAgMBgry5aO12zkhyNO26hngMQzZgO9JcxIlvHBv3KDaTrz4J+Vgp/2XrhH
         b+66zEldqSkyazHwtp8Vzwj+05cHl+so5c1JPWfZN7FSccg5ypiUNRb17Kcjegl2AbSa
         EvZ/yOz32lasIkEtQ+DPF0VaUwKh4CbMiEOsEUdmN0f+obk3v9WKCvDpYPmM5d46x14Y
         SY+lUDlS7ofwPId8cec0iLqYgL5jSYaN7rHIGSgVaqiUVUgzzgVD2deEy8ihp65p7Pf2
         s9CPwjSeswG6rEbylHL6NxIprVeoBY989wRhkUrISDJxpR8nWkK8r5L8H/KtUgBHPw++
         EatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZA0Z8tc39nKRysXxrB4Xh18xwjtfGnw8lo/Mc4J8/0=;
        b=CpIJ3GI4m+AiVCF/+0b96ywX6I3sJZ86GhSgdadTkZq8cTJ89m0VnNcLW+5kmF7Vy3
         IMjSsSdZ6SWAyt0Zr3ExJ3hebPHrdmEWWvqi5JN3tcqTasi4Xt2EYbsgmxeWuomuxZ9s
         C1ryOu+dFGbPmYbz4RH6WHUokKFWIfJdnB+QYgf1vStmXskNagjPzuh68+43dcplET9x
         1dODwE00zs4CeAAhQekv2aGSSp3XAct5pmP+88vK7whNqS9k66iqh88KeV1+xobIucyj
         onyvO1Ks8ZBpexj8Rl5UyPMqlAUNsxrSTyuQuvYDmjaRMMg+lakse65MYguFLY8/3lIm
         ZGPA==
X-Gm-Message-State: AOAM533538ZY+n+MYj9Fg2zS5K7i2klRB8Lc7ZYYs2gD7LccJ7sap0jX
	X/BsKnUvW+IKt4Db+p/dEqyzKAnC
X-Google-Smtp-Source: ABdhPJyDdtxSbOKE4Lk6Svt3fGCjaaETy+8F1PagsjUxf65EPYTgIE8RvkXlK8e8lwy7s9A5HyNyLA==
X-Received: by 2002:a17:906:694d:: with SMTP id c13mr11173670ejs.337.1593383758636;
        Sun, 28 Jun 2020 15:35:58 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f4b8e33cbb401a015e6742d.dip0.t-ipconnect.de. [2003:f0:7f4b:8e33:cbb4:1a0:15e6:742d])
        by smtp.gmail.com with ESMTPSA id q25sm7602169ejz.97.2020.06.28.15.35.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 15:35:58 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] network-manager-applet: upgrade 1.16.0 -> 1.18.0
Date: Mon, 29 Jun 2020 00:35:45 +0200
Message-Id: <20200628223545.3853840-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200628223545.3853840-1-schnitzeltony@gmail.com>
References: <20200628223545.3853840-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

=======================================================
network-manager-applet-1.18.0
Overview of changes since network-manager-applet-1.16.0
=======================================================

* Enable build with appindicator by default.
* Add WireGuard support to the editor.
* Support OWE (Opportunistic Wireless Encryption) in the editor.
* Fix crash when disposing VPN secret dialog.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...er-applet_1.16.0.bb => network-manager-applet_1.18.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.16.0.bb => network-manager-applet_1.18.0.bb} (78%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.16.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.18.0.bb
similarity index 78%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.16.0.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.18.0.bb
index 0cac52c05..c5e95b388 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.16.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.18.0.bb
@@ -9,8 +9,10 @@ inherit features_check gnomebase gsettings gtk-icon-cache gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "9652c2757e85d6caba657405cf794fbd"
-SRC_URI[archive.sha256sum] = "d6f98a455a271e7e169b5d35d290f4880f503cdf7593251572c9330941b5c3e5"
+SRC_URI[archive.sha256sum] = "ddbb400ace804b59cc513611ce9701f7ef3f00de151dbbfb96284c8c1ef2b18b"
+
+# We don't not have ubuntu's appindicator (yet?)
+EXTRA_OEMESON = "-Dappindicator=no"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[modemmanager] = "-Dwwan=true, -Dwwan=false, modemmanager"
-- 
2.26.2

