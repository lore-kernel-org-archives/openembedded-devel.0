Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.21048.1610905003587839724
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oEeFnuKj;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id q4so7338869plr.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QItqEzR0VA11lhvu2xpM8TLQEzwpPDZ9ssC/pN7hySY=;
        b=oEeFnuKjuozddudhSvlofIcR44jJuIf6VidhZACt+/XAGf+f/MlGETjkGbC6wrQswG
         RYwHejsLqPZ+l80oxne+PteTu3Yrt9BvA5KFXD0eq5L3FdsBINpq2iDiT6ZdPL3V8of6
         N63mm/QNEmUvkfT//DbVHCglXEPSNhHvYqDgIR9LinqUi14n3foYMTCkTIniFmfP4IdS
         Ba5tBgqhPmkDq7CByuWARlRxA1XDp/DJZWkAinWCqcv6IiOeAilSUlKl0zkGIvBX3QFg
         dFdmtV6TP3iUssmbfJgNlcVD3GkgJl2j8UXpbO1eSAElPBZukXKo0fFpv3M2VXM/uq6i
         aFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QItqEzR0VA11lhvu2xpM8TLQEzwpPDZ9ssC/pN7hySY=;
        b=M/rhYTLmvMgAnEOfKv1GiivK3ukdJrxBoqI+zJjbH3wBzFAx7HDQWc0hyQwxyVOvY+
         GChz43RcTlVJgzYhwEvrSt38PdBOX7zPNbGA8f/AA8scWyFpchuiLpukSzPsBDUygezz
         cUDqJy+cCUZ5BBhAR5k4WJ3mXSJtjOMt7ImJe9v76EcQpz97oT6vTThzziAdCpFZeK/z
         EIvzQAaQ2kWcX3uzf2NsAuRAZr+v+Y8qmF5LR9YbEtw07QwL4UJD22/UiX9lpXoD8Rcq
         RHdOLQTqQONe7oMtJpDFt8tmjtHh8zen2ZbDZdW/Yan0fzawaxnnPQNR2XTYcQbaxK8z
         8XVg==
X-Gm-Message-State: AOAM530Vmyp/84uUvRROz77xNpdE2ZHddUBldH64PWjKIK7vQM3JVSYK
	gE9xEMoi0uWagsyiIcDdODGlSZsGqZDXgg==
X-Google-Smtp-Source: ABdhPJz3RzmCGteO27tSvAtvvwuelhI8Y1hYu9NAs3A/h7i0lwNXpFFY5+I82U08ccuvCxaN2CTWEw==
X-Received: by 2002:a17:902:c115:b029:de:8961:47e5 with SMTP id 21-20020a170902c115b02900de896147e5mr9062936pli.46.1610905002864;
        Sun, 17 Jan 2021 09:36:42 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:42 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 02/31] zabbix: CVE-2020-15803 Security Advisory
Date: Sun, 17 Jan 2021 09:36:07 -0800
Message-Id: <d9911b087c83e0c73fbe7eeb497ca388b62d7706.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-15803

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d259144422bb44af9dbc7397fc4077d0bf3fc83f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../zabbix/zabbix/CVE-2020-15803.patch        | 36 +++++++++++++++++++
 .../zabbix/zabbix_4.4.6.bb                    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
new file mode 100644
index 0000000000..2eec4bf327
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
@@ -0,0 +1,36 @@
+From 4943334fd9bf7dffd49f9e86251ad40b3efe2135 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Fri, 11 Dec 2020 17:02:20 +0900
+Subject: [PATCH] Fix bug for CVE-2020-15803
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ frontends/php/include/classes/html/CIFrame.php | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/frontends/php/include/classes/html/CIFrame.php b/frontends/php/include/classes/html/CIFrame.php
+index 32220cd..70f2ab5 100644
+--- a/frontends/php/include/classes/html/CIFrame.php
++++ b/frontends/php/include/classes/html/CIFrame.php
+@@ -29,6 +29,7 @@ class CIFrame extends CTag {
+ 		$this->setHeight($height);
+ 		$this->setScrolling($scrolling);
+ 		$this->setId($id);
++		$this->setSandbox();
+ 	}
+ 
+ 	public function setSrc($value = null) {
+@@ -69,4 +70,10 @@ class CIFrame extends CTag {
+ 		$this->setAttribute('scrolling', $value);
+ 		return $this;
+ 	}
++
++	private function setSandbox() {
++		if (ZBX_IFRAME_SANDBOX !== false) {
++			$this->setAttribute('sandbox', ZBX_IFRAME_SANDBOX);
++		}
++	}
+ }
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
index 0e0ddd5779..98a31879c4 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
@@ -26,6 +26,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/${PV}/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
+    file://CVE-2020-15803.patch \
 "
 
 SRC_URI[md5sum] = "e666539220be93b1af38e40f5fbb1f79"
-- 
2.17.1

