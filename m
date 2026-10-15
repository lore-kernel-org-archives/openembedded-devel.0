Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00024CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:09 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32856.1792043100374696637
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MEvGcYc5;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e60f9af6e6so14000085ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043100; x=1792647900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2NjEwcz1evegYdskFb76XdF6DQwohpaVPIJPmv8IdZU=;
        b=MEvGcYc5XilcYvDDHqiG6mZHTJOYjk+CzcXunLC8KmRZT7F254Z4oz7y1c23SCwV3Q
         rBF0Y4kr0jcvephlioYHXwFvzVxJ5Y/d0fakkC5hW9uVD3FPnrMzuFWZ/i3Y1U61uK1n
         cu/p7jxpLZIp6frJavMkjHsQHNwsMlWqmTQoOQNG4uYZvmD1UbDegfZONvI1sgon9Ysq
         h15AEtwek8RzKCjZ1A5HsUFvi9by/dKlSTDa2pTbe/W/fPsXNBnvGr0GPaveT64jeW7M
         +406c68ZbNqrTFesH15ksyuv1txC+sJ9TCeCzNKUYnSZurOsvvHZ8HgT0EMDm297TvGy
         kTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043100; x=1792647900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2NjEwcz1evegYdskFb76XdF6DQwohpaVPIJPmv8IdZU=;
        b=ZwuKUyRM7yRcqV5HLgHx+dMmKq2GF4WrQXXx87ibt624fhtkKwKBCACXC4z59zODwO
         d2MtfbSBN+bFa2PTP1mGeHwi2BS9dUKHIRfffcfxnellG3vD65fHuVf3rvorNyQXpeIp
         EwkMRmGQafbyt55zvbGQhAjpPS/Qq7EjEH3OxI4u78Re3Je97VE95E0Vj0hzU836x0ag
         zf9EMOfbOZT3aX6D5E924ZIDgvpZiSgGe8k5FlePcGV2N95pWd9L28YNIewVgeHnTO93
         KRoGAFtoYqYHCrdgOCi0Y6oWJZio91FjcRvWAkKHXRkMGmNFFiLceV1EgYi6KDm4d1rg
         byIg==
X-Gm-Message-State: AFq9FYIu+fHAm/pxjYHeCEYH5hhPKdNpkayIh1kl3SrkLFipZibS2vwW
	tJgwMqqlaUdOB7LCzYBZf+/5vV1mWofHOraeBNCoxAZ9/NypIeZJPAemPr/lLQ==
X-Gm-Gg: AYBFou0l6C6O/QtDNVgqEwwylSyeHEAAPYdH9/RdogpIEiQhKLRP61ahS//BCRtbaE+
	tk4C4NB/Xbw1x5aiYEbLDd7LTUifJhFZjTKoTRbv8SYygb3rTecGnK3wHo9oYnk9zghVUBT0qes
	cQCKKVTS3CiphAwN5Lw9n6f9YXwwKxZP6PojogVdHy39/rcyk4sFB2s3CSKrMn6gzkFrwe07LSm
	Q0P4qLgaW9EC+4KozQCacsZX255MLQJD67MQG/fPaIzh67FF/8sB05USdT/U8vQ96A0KALrzIiA
	sxHDyVXvb/D4DBwV5fhR4Ov6jIMQke5Us9Y7Kgd1EftmSlnm26+zSlbB0w6gpijLnD7Ht8yVGAJ
	1B4taIKDx51Ct/vDTj5qbD9RmBaU2HiJkePNGgNIfS1hCg7fYPC1blHWK1Xjrk1rbDcNlH/CwYa
	RJ+RzzmqSkgKgssRTodBYOD/3b4/FhlXQHaOdETYKF+Va+RoUT/hmQoiyUuwYwFX73PKv7A13Qd
	kmGIFtOTQxSi5WPdETyapQ=
X-Received: by 2002:a17:902:f70f:b0:2e9:660a:7944 with SMTP id d9443c01a7336-2e9660a7bc6mr3027795ad.58.1792043099639;
        Wed, 14 Oct 2026 22:44:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 61/82] sngrep: patch CVE-2026-90558
Date: Thu, 15 Oct 2026 18:41:49 +1300
Message-ID: <a369135b46dea0f33635fd62d78593aeaa26aa0c.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130981

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-90558

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 36ddee53b179b5108186cc3e8d76c0f6a5e5d069)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../sngrep/sngrep/CVE-2026-90558.patch        | 84 +++++++++++++++++++
 .../recipes-support/sngrep/sngrep_1.8.4.bb    |  4 +-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch

diff --git a/meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch b/meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
new file mode 100644
index 0000000000..64fd8044a9
--- /dev/null
+++ b/meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
@@ -0,0 +1,84 @@
+From 399346a12ca3bcf7703734fa33b5b3427775b014 Mon Sep 17 00:00:00 2001
+From: Kaian <kaian@irontec.com>
+Date: Fri, 7 Aug 2026 08:45:42 +0200
+Subject: [PATCH] fix: prevent stack buffer overflow in SIP attribute
+ formatting
+
+call_get_attribute() formatted the Call-ID, X-Call-ID and Reason header
+text with an unbounded sprintf("%s"). Call-ID/X-Call-ID can hold up to
+MAX_CALLID_SIZE/MAX_XCALLID_SIZE (1023 bytes) and Reason text is copied
+from the raw payload (up to MAX_SIP_PAYLOAD), while all callers pass a
+255-byte SIP_ATTR_MAXLEN stack buffer (call list rendering, sort compare).
+A SIP message with a long Call-ID, X-Call-ID or Reason header overflowed
+the stack, triggerable via pcap, live capture or HEP/EEP remote capture.
+
+Bound these writes with "%.*s" and SIP_ATTR_MAXLEN - 1. Also fix a
+matching off-by-one in msg_get_attribute(), where the existing "%.*s"
+used SIP_ATTR_MAXLEN as the precision and could write 256 bytes
+(255 chars + NUL) into the 255-byte buffer.
+
+Thanks to TristanInSec for reporting the issue.
+
+(cherry picked from commit 1ff74ee3ab5ff280e8ba976aa8c744dca57eb35b)
+
+CVE: CVE-2026-90558
+Upstream-Status: Backport [https://github.com/irontec/sngrep/commit/1ff74ee3ab5ff280e8ba976aa8c744dca57eb35b]
+
+SIP contract change was dropped during backport as it was introduced in
+v1.8.4[1]
+
+[1]https://github.com/irontec/sngrep/commit/c61a26d90c166f996e31aceefc9c2f8f831ccd86
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/sip_call.c | 6 +++---
+ src/sip_msg.c  | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/sip_call.c b/src/sip_call.c
+index bea879a..68ecb50 100644
+--- a/src/sip_call.c
++++ b/src/sip_call.c
+@@ -257,10 +257,10 @@ call_get_attribute(sip_call_t *call, enum sip_attr_id id, char *value)
+             sprintf(value, "%d", call->index);
+             break;
+         case SIP_ATTR_CALLID:
+-            sprintf(value, "%s", call->callid);
++            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, call->callid);
+             break;
+         case SIP_ATTR_XCALLID:
+-            sprintf(value, "%s", call->xcallid);
++            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, call->xcallid);
+             break;
+         case SIP_ATTR_MSGCNT:
+             sprintf(value, "%d", vector_count(call->msgs));
+@@ -282,7 +282,7 @@ call_get_attribute(sip_call_t *call, enum sip_attr_id id, char *value)
+             break;
+         case SIP_ATTR_REASON_TXT:
+             if (call->reasontxt)
+-                sprintf(value, "%s", call->reasontxt);
++                sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, call->reasontxt);
+             break;
+         case SIP_ATTR_WARNING:
+             if (call->warning)
+diff --git a/src/sip_msg.c b/src/sip_msg.c
+index 379a40a..6762862 100644
+--- a/src/sip_msg.c
++++ b/src/sip_msg.c
+@@ -136,13 +136,13 @@ msg_get_attribute(sip_msg_t *msg, int id, char *value)
+             }
+             break;
+         case SIP_ATTR_METHOD:
+-            sprintf(value, "%.*s", SIP_ATTR_MAXLEN, sip_get_msg_reqresp_str(msg));
++            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, sip_get_msg_reqresp_str(msg));
+             break;
+         case SIP_ATTR_SIPFROM:
+-            sprintf(value, "%.*s", SIP_ATTR_MAXLEN, msg->sip_from);
++            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, msg->sip_from);
+             break;
+         case SIP_ATTR_SIPTO:
+-            sprintf(value, "%.*s", SIP_ATTR_MAXLEN, msg->sip_to);
++            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, msg->sip_to);
+             break;
+         case SIP_ATTR_SIPFROMUSER:
+             if (msg->sip_from && (ar = strchr(msg->sip_from, '@'))) {
diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.4.bb b/meta-networking/recipes-support/sngrep/sngrep_1.8.4.bb
index 5bb30da6db..c7457fd0c0 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.4.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.4.bb
@@ -15,7 +15,9 @@ DEPENDS = "\
     ncurses \
 "
 
-SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master;tag=v${PV} \
+           file://CVE-2026-90558.patch \
+"
 SRCREV = "9c370866afaf5ccb258bf03848b2d22f30cf61bd"
 
 inherit cmake pkgconfig

