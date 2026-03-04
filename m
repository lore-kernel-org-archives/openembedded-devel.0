Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B724EB7ED9
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 11:40:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16230.1772624400561582832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 03:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZjbckIB;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4837634de51so28548705e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624399; x=1773229199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZKb4iIe0Qgi4fCxlhy7OBQqcu8h2ZMzEF1mFew2oZI=;
        b=WZjbckIBIlHG7DDpF8Z2qJaIU0BVKS6ZgRKzpGPn1r0JwTWzYbyfR6g9+zWcSuu9a5
         iIpxcKi8ep7NMrysyiD4wM/3+zTVrXJMl3rd7InulM6OqvKdPUCVIJMG2cUsTeiOjTI3
         Lir0TjdWdAjXPsqcpOOk+OOaLdjpYbl9Rfs43idwwg0FS1hdo2b6rHHZttpd+c+0ILr6
         KCYTczM0TXA8yTfMf21A4VeVbLxAFyqJL1nYy2m3ZjysbUDUM9gZNrDwD2KRcfmRfHtT
         +rV96M1MPNUtIvau130Pt08OmSQLtfA5Wz1M9IVbP6DWtEE+USaoh1cFMe7TABfwGT/s
         Cw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624399; x=1773229199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qZKb4iIe0Qgi4fCxlhy7OBQqcu8h2ZMzEF1mFew2oZI=;
        b=dTtlwYWI9nej9T6XjH8HbWBbWIdmKeaXnZ7ZlrOpTiqhtns46jayIle2SATjhubGov
         QttCGxgzxIkWH8cFHIsDr7uLKkK24gq6Cbpv9hNKnvmM4q+IxEUlshSTx9XBfh/gyxM/
         IAwS3M9mtTLnTKHZSPhVLm2E16Y/qFh/MQJCkQsMlIl7SN6Iq9Fcgxqz6Rd3y5OKk/pm
         1ZIkDyjIfzAovntldWKZAVDeB6l9cdiTXrd4fsI5YdyjKkFxATmhUmgT8ClyTLzK18Ax
         yeZsE6VB3dHr7tC2IZqzIrhanvEuv3g0pWVDgJlvNOCQgnNRX/452XnFc3Zj8/d3ME37
         Zxwg==
X-Gm-Message-State: AOJu0YyVc/wFX0x0PAAOq1rl7YkNd9AVk4ftefo+0LWNjy/RDhC9nSgb
	KFJI/jA6VSMScD8SBqdg35JMIcnJ+WTu68SjVJTF08i2piyowmP+Utz7wiFbaQ==
X-Gm-Gg: ATEYQzyUkPf1lFsUzx+gjhqC4Ba9d0c5fSPmaGV1D6tKntfa+OpS0biasJPLRwdXCYj
	oFnzyQ5aczk01Th0r9kujvCvO2b7xWYb6C/zxGCDSE3zT2h1cRKbD8CfinL2gH2w3PvllkgFm4z
	7M6TfJ0fUPYKM11KrPbxtZJXOGSnTT1+WNbOR9nk8X079DSeNnxbggBFSLcZBnbWgk6WeGLJ9ZN
	HEsR3Xhb5Yj/s4kiEb00ufS51fAQfii1FJ5RW7Gzh8lPeAVL7t+wYeuhyoRmASKHGEyBTb6+xnB
	oscFBXtz6VkgoNf1SUTDWfoSs+lETs3EnqibyfWjUYYNhvouyFBSSBEZRjJve4m0x5D9a9OlgBR
	xpHB5Ce+8e1neOynMOwxHre+Xs7RwIJNEGd1/iF6YE/f0RxCi6LXTDtpFGLghOfJg1zN9zZnG2N
	b5zgWFLF/0EaQDLSuC2PcZvrlo1gq+ApA=
X-Received: by 2002:a05:600c:8b67:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-4851989ca05mr26827045e9.24.1772624398825;
        Wed, 04 Mar 2026 03:39:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851880724esm88692195e9.9.2026.03.04.03.39.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:39:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH 3/3] netdata: patch CVE-2023-22497
Date: Wed,  4 Mar 2026 12:39:56 +0100
Message-ID: <20260304113956.2245844-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304113956.2245844-1-skandigraun@gmail.com>
References: <20260304113956.2245844-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 11:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124847

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-22497

This patch was selected based on its description, and based on the
associated PR. The description matches the issue described in the
NVD advisory, and the PR credits the same reported that is also
credited with the CVE ID (in the release notes of the application).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../netdata/netdata/CVE-2023-22497.patch      | 120 ++++++++++++++++++
 .../netdata/netdata_1.34.1.bb                 |   4 +-
 2 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/CVE-2023-22497.patch

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/CVE-2023-22497.patch b/meta-webserver/recipes-webadmin/netdata/netdata/CVE-2023-22497.patch
new file mode 100644
index 0000000000..5aa2fde328
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/CVE-2023-22497.patch
@@ -0,0 +1,120 @@
+From 1aa77696d0853ab515eddea8ee7a7d16d3813571 Mon Sep 17 00:00:00 2001
+From: Costa Tsaousis <costa@netdata.cloud>
+Date: Tue, 29 Nov 2022 17:28:17 +0200
+Subject: [PATCH] Strict control of streaming API keys and MACHINE GUIDs in
+ stream.conf (#14063)
+
+do not allow machine guids to be used as API keys
+
+CVE: CVE-2023-22497
+Upstream-Status: Backport [https://github.com/netdata/netdata/commit/811028aea2f146cc0ac2bc403f7d692add400d63]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ streaming/rrdpush.c   | 30 ++++++++++++++++++++++++------
+ streaming/stream.conf | 10 ++++++++++
+ 2 files changed, 34 insertions(+), 6 deletions(-)
+
+diff --git a/streaming/rrdpush.c b/streaming/rrdpush.c
+index 8829d1e..0a0d9fc 100644
+--- a/streaming/rrdpush.c
++++ b/streaming/rrdpush.c
+@@ -594,21 +594,30 @@ int rrdpush_receiver_thread_spawn(struct web_client *w, char *url) {
+ 
+     if(regenerate_guid(key, buf) == -1) {
+         rrdhost_system_info_free(system_info);
+-        log_stream_connection(w->client_ip, w->client_port, (key && *key)?key:"-", (machine_guid && *machine_guid)?machine_guid:"-", (hostname && *hostname)?hostname:"-", "ACCESS DENIED - INVALID KEY");
++        log_stream_connection(w->client_ip, w->client_port, key, machine_guid, hostname, "ACCESS DENIED - INVALID KEY");
+         error("STREAM [receive from [%s]:%s]: API key '%s' is not valid GUID (use the command uuidgen to generate one). Forbidding access.", w->client_ip, w->client_port, key);
+         return rrdpush_receiver_permission_denied(w);
+     }
+ 
+     if(regenerate_guid(machine_guid, buf) == -1) {
+         rrdhost_system_info_free(system_info);
+-        log_stream_connection(w->client_ip, w->client_port, (key && *key)?key:"-", (machine_guid && *machine_guid)?machine_guid:"-", (hostname && *hostname)?hostname:"-", "ACCESS DENIED - INVALID MACHINE GUID");
++        log_stream_connection(w->client_ip, w->client_port, key, machine_guid, hostname, "ACCESS DENIED - INVALID MACHINE GUID");
+         error("STREAM [receive from [%s]:%s]: machine GUID '%s' is not GUID. Forbidding access.", w->client_ip, w->client_port, machine_guid);
+         return rrdpush_receiver_permission_denied(w);
+     }
+ 
++    const char *api_key_type = appconfig_get(&stream_config, key, "type", "api");
++    if(!api_key_type || !*api_key_type) api_key_type = "unknown";
++    if(strcmp(api_key_type, "api") != 0) {
++        rrdhost_system_info_free(system_info);
++        log_stream_connection(w->client_ip, w->client_port, key, machine_guid, hostname, "ACCESS DENIED - API KEY GIVEN IS NOT API KEY");
++        error("STREAM [receive from [%s]:%s]: API key '%s' is a %s GUID. Forbidding access.", w->client_ip, w->client_port, key, api_key_type);
++        return rrdpush_receiver_permission_denied(w);
++    }
++
+     if(!appconfig_get_boolean(&stream_config, key, "enabled", 0)) {
+         rrdhost_system_info_free(system_info);
+-        log_stream_connection(w->client_ip, w->client_port, (key && *key)?key:"-", (machine_guid && *machine_guid)?machine_guid:"-", (hostname && *hostname)?hostname:"-", "ACCESS DENIED - KEY NOT ENABLED");
++        log_stream_connection(w->client_ip, w->client_port, key, machine_guid, hostname, "ACCESS DENIED - KEY NOT ENABLED");
+         error("STREAM [receive from [%s]:%s]: API key '%s' is not allowed. Forbidding access.", w->client_ip, w->client_port, key);
+         return rrdpush_receiver_permission_denied(w);
+     }
+@@ -619,7 +628,7 @@ int rrdpush_receiver_thread_spawn(struct web_client *w, char *url) {
+             if(!simple_pattern_matches(key_allow_from, w->client_ip)) {
+                 simple_pattern_free(key_allow_from);
+                 rrdhost_system_info_free(system_info);
+-                log_stream_connection(w->client_ip, w->client_port, (key && *key)?key:"-", (machine_guid && *machine_guid)?machine_guid:"-", (hostname && *hostname) ? hostname : "-", "ACCESS DENIED - KEY NOT ALLOWED FROM THIS IP");
++                log_stream_connection(w->client_ip, w->client_port, key, machine_guid, hostname, "ACCESS DENIED - KEY NOT ALLOWED FROM THIS IP");
+                 error("STREAM [receive from [%s]:%s]: API key '%s' is not permitted from this IP. Forbidding access.", w->client_ip, w->client_port, key);
+                 return rrdpush_receiver_permission_denied(w);
+             }
+@@ -627,9 +636,18 @@ int rrdpush_receiver_thread_spawn(struct web_client *w, char *url) {
+         }
+     }
+ 
++    const char *machine_guid_type = appconfig_get(&stream_config, machine_guid, "type", "machine");
++    if(!machine_guid_type || !*machine_guid_type) machine_guid_type = "unknown";
++    if(strcmp(machine_guid_type, "machine") != 0) {
++        rrdhost_system_info_free(system_info);
++        log_stream_connection(w->client_ip, w->client_port, key, machine_guid, hostname, "ACCESS DENIED - MACHINE GUID GIVEN IS NOT A MACHINE GUID");
++        error("STREAM [receive from [%s]:%s]: machine GUID '%s' is a %s GUID. Forbidding access.", w->client_ip, w->client_port, machine_guid, machine_guid_type);
++        return rrdpush_receiver_permission_denied(w);
++    }
++
+     if(!appconfig_get_boolean(&stream_config, machine_guid, "enabled", 1)) {
+         rrdhost_system_info_free(system_info);
+-        log_stream_connection(w->client_ip, w->client_port, (key && *key)?key:"-", (machine_guid && *machine_guid)?machine_guid:"-", (hostname && *hostname)?hostname:"-", "ACCESS DENIED - MACHINE GUID NOT ENABLED");
++        log_stream_connection(w->client_ip, w->client_port, key, machine_guid, hostname, "ACCESS DENIED - MACHINE GUID NOT ENABLED");
+         error("STREAM [receive from [%s]:%s]: machine GUID '%s' is not allowed. Forbidding access.", w->client_ip, w->client_port, machine_guid);
+         return rrdpush_receiver_permission_denied(w);
+     }
+@@ -640,7 +658,7 @@ int rrdpush_receiver_thread_spawn(struct web_client *w, char *url) {
+             if(!simple_pattern_matches(machine_allow_from, w->client_ip)) {
+                 simple_pattern_free(machine_allow_from);
+                 rrdhost_system_info_free(system_info);
+-                log_stream_connection(w->client_ip, w->client_port, (key && *key)?key:"-", (machine_guid && *machine_guid)?machine_guid:"-", (hostname && *hostname) ? hostname : "-", "ACCESS DENIED - MACHINE GUID NOT ALLOWED FROM THIS IP");
++                log_stream_connection(w->client_ip, w->client_port, key, machine_guid, hostname, "ACCESS DENIED - MACHINE GUID NOT ALLOWED FROM THIS IP");
+                 error("STREAM [receive from [%s]:%s]: Machine GUID '%s' is not permitted from this IP. Forbidding access.", w->client_ip, w->client_port, machine_guid);
+                 return rrdpush_receiver_permission_denied(w);
+             }
+diff --git a/streaming/stream.conf b/streaming/stream.conf
+index e65e76f..7229ade 100644
+--- a/streaming/stream.conf
++++ b/streaming/stream.conf
+@@ -115,6 +115,11 @@
+ [API_KEY]
+     # Default settings for this API key
+ 
++    # This GUID is to be used as an API key from remote agents connecting
++    # to this machine. Failure to match such a key, denies access.
++    # YOU MUST SET THIS FIELD ON ALL API KEYS.
++    type = api
++
+     # You can disable the API key, by setting this to: no
+     # The default (for unknown API keys) is: no
+     enabled = no
+@@ -184,6 +189,11 @@
+ # you can give settings for each sending host here.
+ 
+ [MACHINE_GUID]
++    # This GUID is to be used as a MACHINE GUID from remote agents connecting
++    # to this machine, not an API key.
++    # YOU MUST SET THIS FIELD ON ALL MACHINE GUIDs.
++    type = machine
++
+     # enable this host: yes | no
+     # When disabled, the parent will not receive metrics for this host.
+     # THIS IS NOT A SECURITY MECHANISM - AN ATTACKER CAN SET ANY OTHER GUID.
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
index 516fde6281..4d57b84b07 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.34.1.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
 DEPENDS += "libuv util-linux zlib"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
+           file://CVE-2023-22497.patch \
+           "
 SRC_URI[sha256sum] = "8ea0786df0e952209c14efeb02e25339a0769aa3edc029e12816b8ead24a82d7"
 
 # default netdata.conf for netdata configuration

