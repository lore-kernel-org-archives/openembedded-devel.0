Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BE2CC6B0F
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:36 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3422.1791885574486712487
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OgHqxiF8;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc502d509c0so784886a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885574; x=1792490374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NjEwcz1evegYdskFb76XdF6DQwohpaVPIJPmv8IdZU=;
        b=OgHqxiF85t2Sy2QVFjNJIhQgw7ZWP14qzXdnjn8/IkBnWk3maJKK3ayTkIe25dpqSD
         78cEcFAToF9wRQAVVZ2YPCfb345sKn5CsyxHIcWzr5I7Rap90WMPvjJ/xTcerv9QSt+a
         XJWeVO7cKuC5oPLdvt2tZSDzdQovmu7/mzVsey6qfMgiCdraYMbuzP4bAB5QEX6zuICS
         uctBJCJv04AyIER+A+aQeiQoTDpP7EN2BjzYbSrLS/AEYKAVqrmIJINZSrvF1PbwaLFx
         K9G5GgthB3q1x1Xu83W3CBh+g3uM4OLxu1m8C/0y7aQgKAM3OwUboHaaqpdjXTGCkI0P
         i24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885574; x=1792490374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2NjEwcz1evegYdskFb76XdF6DQwohpaVPIJPmv8IdZU=;
        b=ct1Vn31QI2qa67+4/kDUP4bzc0y+p7Tm8AA0QbnQPvd4pmygQ/ah499UHi9PRsXRdU
         zszgmX8ox0kuElseuYi8iUyU6Q5RFi9nrnRrsHYJQfZmpp4L3uvz1wUMxRl86OtQxCBL
         aFNvp8eZ96cCHkrzlYbK92/HQRdRuXy2ojpAVGG97PQcepi0OzGBRSwtx6k/JvZ371gA
         xssg2qxDoMMI7jcKCvWrcxp5RY8vHcnBfHk42H5DYmML9y5rj5sHQ+oulJYJMYz/g0Hl
         GnE/PW95q4mIHbtoI8hz0lf29aD7EQxDENLBYVSQGPQ2vvUBCVKoYGswdVjCHlxUV7T0
         SpXg==
X-Gm-Message-State: AFq9FYKUCriIuPefavMJsi8qIcwFdPtBHBCRsWzVXhzH/UVyZHIdmnbY
	Ca+n6LgKyU5OBODS5NMd5HUVIAzy7AB/5liCXT6ZLKaLEQjRsxVNda96hHRPag==
X-Gm-Gg: AYBFou25z2b7FzNg5zrkgStqymmRRRZTSHgMhM7blz8lqgXPpJq/f8bXbE4nmTvEj0u
	uLZLBAGtquI+/O248WTo4L/MIVIXy2G5dui6F4K1+/OKx0nOhRJnQG1EzZHWqLbvy47w1yDABGw
	M46Mvuvc1QopH/uncmcjYmHSllp+rZVTJEdt515NJAQrC/4mF7GC+VJStPZxMam6HxecMPEApGo
	lEon3c2MhppunDPY0yFnYUdydpZMbAbwhDHB9r4oJdkGz3k9BPnIR882/+HXdnZZKbZ0og02Jy4
	jhStXdu5uLIC0dBbg1que3fwLuyMiDMvuYAKyuCX7hq/CJk330flqqvX3aUYQyWvphW+Q+pQ8Qe
	iYamT3avRbDAXMeFC7lpgXDfhF9d7mypvKD6LScoV2b0Fr733fr7XOYpt2PxbuBDHTdjQoWgzsF
	XnzxAYfiyXzkzjWzXsRuqLbf9i7IlGoiVZ61nV0UW1JouvjrU+aPBlG9k/lrZ8BF0i98uphBlrx
	2Z+avMAYedUb4eyPBG4q2xshEHhs78VFqb5cNQxzscDfB9kcw==
X-Received: by 2002:a17:90b:390a:b0:3a8:824:83ca with SMTP id 98e67ed59e1d1-3ab3a9337ebmr9932511a91.54.1791885573791;
        Tue, 13 Oct 2026 02:59:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 9/28] sngrep: patch CVE-2026-90558
Date: Tue, 13 Oct 2026 22:58:44 +1300
Message-ID: <20261013095903.3544906-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130842

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

