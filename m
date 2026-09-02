Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9C4C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:07 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9055.1788343559665189866
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z7MvaTAM;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so790958a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343559; x=1788948359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PD1rGJ6wlyiRrG15ajBfqo/kKv+9xdNOWc//4wgQtm0=;
        b=Z7MvaTAM68w3d76YPWfY0wBWeL3rDWL9nGXKnFDDNYRjR5rPO3qmdIahPZqaMXx1Vj
         JeoGuf1D/2YlBJuRugkET4DcXlbrNnwUFO2s0nYaCOncvpg863wr//ESCfp41nxx3Npl
         qL11W+c2KlfrDQv/d5aHG2D2M0Dz3nNNRbNh/IHpJMOErThJm82553ebyJ6vGQskRmw1
         rMNtLdVDLKo0AA92HJVDUts/uC0PfLa00/RfTAk8mP0CZNWGLYs0Yf8o9fTVpdUXUQgI
         ao6bTZnhsAZvYkJ8kTknYcyqBL4OJmrTS6KCM61y+ExoTQId7BxpumDOVuDi9iAIzzwy
         lQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343559; x=1788948359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PD1rGJ6wlyiRrG15ajBfqo/kKv+9xdNOWc//4wgQtm0=;
        b=e9BtHXznAGulsKpmnOGW/fN/Xeh/a69ZehhBmlppAA+2E9n2X+9ISkqIqlJO/gfCH/
         g6KdTu06XVjneuAHSpRY0qEHXG3jQZRsLQk5NcPiyy9Y3ODvX4oWklfQtSkwSOyvDcs3
         tqhuHQKVoAcnpBEdGV3X0EmYq/kURPnidDdP3QFi26vRcFEZsSv7KkDRqoUvfFcPVK9U
         cIlDDD0C2DSiUbtsQApVsAKvgohqA/YLCc15HAPN5tYg1EH6rgKUlmclIn5zc6LDkmyd
         ePXhzbEFOA8dEm+iNZcMvY4hUQ0FBXIABx9Nj4+wawXAFy35OPZv653z9bSstmBnJ/0v
         NZkA==
X-Gm-Message-State: AFuF++mk1F38hq42mkD7w+ydjabFJitS0AwzwEx8eldMKioPFRibQ908
	gUkp+PAQQxyseibdkjzdY0dBfX0tcJlqGWlF27b+qK23OLekuOAExiV8zvR35SId
X-Gm-Gg: AYBFou3pGJlbtf0HtaFEqnNK7nOipO6bze4Ovyd+HtaZnPTxY1tx4EAiNes8Uqv4u89
	wiS9CUw9RAs9y5lkRD0CjsJ/KEeKR8gWs/xv81EpPKBkwPFLN8ZVE6c6h18EuF+MIK6ttPyTx7H
	TM9n6u66L8QyU5yLCNPh//dPKp/24MStMC/P1TJj6vWTqxgx2bHT6+TwoHLb35p/nqXx7T7YsIT
	IpU6GYnOGfe23XYq/GABnndhBxK+J15vdw7dN9Ce49fVpbj7GH5R5k6fsuLuOAaoAZReMNJq/c2
	dQBrMyf+/89J3t5ZzO4MlJcuKCoWSPsT4+mHyasXSlkzVX9zoG46/EGM8imN3lbbODGHNvw5y0F
	rHO+pAwknQllTqQ7dd5bAS05UjxtRLaQjDOEaD5SUGgSEqZXnzlNgu3DWGa8O6WFEV36ueaSd+e
	N3rOPqTFkq46gLvegVJt784Fi9DuVUonTORHa0qvFfWhAzbIbBb2BsVsYyUNW62V3Jp8AXnDm+
X-Received: by 2002:a17:90b:5908:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39aedec4caamr5497844a91.3.1788343558965;
        Wed, 02 Sep 2026 03:05:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 16/28] firewalld: patch CVE-2026-4948
Date: Wed,  2 Sep 2026 22:04:58 +1200
Message-ID: <20260902100511.2105916-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129647

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit[1] identified by Debian as a fix.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-4948

[1] https://security-tracker.debian.org/tracker/CVE-2026-4948

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../firewalld/files/CVE-2026-4948.patch       | 38 +++++++++++++++++++
 .../firewalld/firewalld_2.2.3.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/CVE-2026-4948.patch

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/CVE-2026-4948.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/CVE-2026-4948.patch
new file mode 100644
index 0000000000..6aa422e0c6
--- /dev/null
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/files/CVE-2026-4948.patch
@@ -0,0 +1,38 @@
+From 8e2d8aa579164220624d6cd6520d904fe27cfa48 Mon Sep 17 00:00:00 2001
+From: Sizhe Zhao <prc.zhao@outlook.com>
+Date: Tue, 31 Mar 2026 20:46:50 +0800
+Subject: [PATCH] fix(policy): use PK_ACTION_CONFIG for
+ set{ZoneSettings2,PolicySettings}
+
+Reference: https://access.redhat.com/security/cve/cve-2026-4948
+(cherry picked from commit 5fb3914ad830feff6cb2b0670457c60a323c6c6c)
+
+CVE: CVE-2026-4948
+Upstream-Status: Backport [https://github.com/firewalld/firewalld/commit/5fb3914ad830feff6cb2b0670457c60a323c6c6c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/firewall/server/firewalld.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/firewall/server/firewalld.py b/src/firewall/server/firewalld.py
+index 62802528..9f969d8d 100644
+--- a/src/firewall/server/firewalld.py
++++ b/src/firewall/server/firewalld.py
+@@ -938,7 +938,7 @@ class FirewallD(DbusServiceObject):
+         log.debug1("getZoneSettings2(%s)", zone)
+         return self.fw.zone.get_config_with_settings_dict(zone)
+ 
+-    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG_INFO)
++    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG)
+     @dbus_service_method(config.dbus.DBUS_INTERFACE_ZONE, in_signature="sa{sv}")
+     @dbus_handle_exceptions
+     def setZoneSettings2(self, zone, settings, sender=None):
+@@ -965,7 +965,7 @@ class FirewallD(DbusServiceObject):
+         log.debug1("policy.getPolicySettings(%s)", policy)
+         return self.fw.policy.get_config_with_settings_dict(policy)
+ 
+-    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG_INFO)
++    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG)
+     @dbus_service_method(config.dbus.DBUS_INTERFACE_POLICY, in_signature="sa{sv}")
+     @dbus_handle_exceptions
+     def setPolicySettings(self, policy, settings, sender=None):
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.3.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.3.bb
index e77df2ddbb..a89b93248f 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.3.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.3.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "\
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
+    file://CVE-2026-4948.patch \
     file://firewalld.init \
     file://run-ptest \
 "

