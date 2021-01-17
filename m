Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.21485.1610905597475077320
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d9JDx6Fg;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 30so9484465pgr.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HXE/ONCsCstPBSSLqce7KGKqgmwB93ZPffJTsSehmw0=;
        b=d9JDx6Fg0mugriVNE63pFtXpXvwahUOrJPcA9YYGzt3auBN00a/fSnlUKqYfGvxGRL
         n5CTCP/rrlf+7KWrEr2zQeSkapxgixAeS5us/sTGHKUqBj39SExLaf4q2QizK5iubBKD
         JK07oXy7soMZTVHycTluDCesSTKLasR+iHVtkLiHgUGY3ND0Rb4Jf8eQqGg9qHUQ9jYa
         Nu48DzgEaSqB02d4/SHSMRWN9rISFQL4Ro2A3NaD++mz6BsHU4W1ARrx+hUpu0G4+l+p
         wFaknFxDTQbwwQj2O+DAWIlGCiZh56qX58m3EZP2Lso81GWg8OW7LrsQhao62nQrG4CT
         y6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HXE/ONCsCstPBSSLqce7KGKqgmwB93ZPffJTsSehmw0=;
        b=XJWR0wKsuejn11ZVTIiIpBFGHF4bzpe7c7HZe22dkzdQpHedxYPlOu05TeGFqOEsSB
         t4iQmFgSf5tTzGXED6jFxXy+Al459lSJnyb/9egnbO3I2xiIFERKNxe8SehX901hoxoY
         EIOBHGoTBwd9cDjxSyX/WwKEr1MGpM8u682df68BDNZqgV8DwL7Glh1FpXF7cEtM5pHP
         pncb3ztOo/4405d7wRoLElEZv0cPvzSapaRr5o/5hvvyjFv6Tbn5qIBAuc2fC3DzWmy9
         Ig+wUBDFttuTNUmI2zMtbyAjmcSTb6KPUXartvbflN07d88DuNwuekYpV8H9RDholnbs
         TYQw==
X-Gm-Message-State: AOAM530ykFe9gLxr1+v7jh3SFJOUw8koAJDCFg+dEvp088K/S49HurHR
	XjfHiOOc+ldIjqlscrGjQ2LbFcCPDWI/TQ==
X-Google-Smtp-Source: ABdhPJxAM8IlR/BzeirOPYgqJlQuDm9rgnXppSQ2G2KUoHMoW0OQ6Pr6pb9mm7pAFMud8XHB/04LTw==
X-Received: by 2002:a62:6047:0:b029:1ac:6091:cf50 with SMTP id u68-20020a6260470000b02901ac6091cf50mr22514558pfb.40.1610905596867;
        Sun, 17 Jan 2021 09:46:36 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:36 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/28] zabbix: CVE-2020-15803 Security Advisory
Date: Sun, 17 Jan 2021 09:46:04 -0800
Message-Id: <b5ddfc05f5951071ac2a452149c8c0b77aa3de2b.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-15803

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d259144422bb44af9dbc7397fc4077d0bf3fc83f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit d9911b087c83e0c73fbe7eeb497ca388b62d7706)
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

