Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D285CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:40:41 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.352.1791866436501019582
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HZIiFRky;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso1681271a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866436; x=1792471236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NjEwcz1evegYdskFb76XdF6DQwohpaVPIJPmv8IdZU=;
        b=HZIiFRkynIpiJ4VRxZPIzRm2J87G1W2mBgn9lu0DVvMAughDksleCpy8V9k438f6GG
         zEPfRc6RSD86p+gZc9Pm7QCuvR6eRyuM6A/7kHOg8nF5N+xXQFzXkWY+qXKocHGKuwDd
         dqXZOXDwYxZI+NLWYis8cOiN8qhbBptWjNwh8Wd4pa6vUOaigGyZmy5W/0GzcM3ZGFM4
         /azZjxKP2XQgB8qC6QtQayu3ExtzKkiam+yESWqzMG/9dfMgu7eCMWosTjj5R/Xohp2n
         pFG6UGMr67m+EqsKzOAzWJAd+Aq4KGNQcap2yvn+VOwl7gPYTKcZbNkHiWEIKaHhAow5
         QZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866436; x=1792471236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2NjEwcz1evegYdskFb76XdF6DQwohpaVPIJPmv8IdZU=;
        b=SWq52Ak4fnEAeE/XHb7hnAfKB6DIl+CZ7Rf88duFKZV2gEE5/OlQa23fHHPzOBHou9
         E69dgcyWDfutTvFL3+sV9i1O1jt0mIm47yXHOrzyJsoqtBZ4Q96CXukdU5P0gn9vU4Zr
         wTrmhvs2ty0ZtqQ6SU/Qe+KBgavymVXVvTJy+KLnVvsZpgGMldsMwugNbBK/Epl7RGC7
         FUA8f08sev7hg88b59G2m9Vbvp1PfYGmRYz6JKHk2AhyvvCcJgGywHAAn9FGelA61nNg
         V/OL23qWds8ssldCbg1tdkDvB9UFK5B46RLaI5vpcB1ZwnIZTJTWWNbs3ZJkkHBuiAJz
         PVlA==
X-Gm-Message-State: AFq9FYLGsQox+C6kCiomv1QEJIktAKBQK+BAeQOSP/zOyacP92hSseL9
	uR6sMhJbO2RwFsVfHSvW3emEa4/ejUPHQWRgqh1TvSC7ZkQtBH1gxIb8ZJWpRg==
X-Gm-Gg: AYBFou1CjWeqTQ6LrJ51IxAGPtJ3+R4q3vXGDMgercsZJUQ8wkUr5B78lW9gvW5b7hx
	xCf8l/R8nSqH5BZDJ5viD2EHmbSxXit9lDj8/Gtf+BJJ2iDmALZ5mJCU2zF2hNJIRi6Q+MCpYlw
	yY+sU5cAHTEwiZ6hryLy9hrSvRs/Z0tBRJo8V/u4J3wnBNP3TTr5wK7fhvyPKS8ME/CxA65G5vs
	KR6hYiTwTl5aZO7kzHPdI7mQROd5Ve+qsJmJwJjHuxV923+nvoOwic4cosznx7Fbujk3H4L4ALR
	vV8w3PIrNB9I8yT9B6TwA+oglDNU7BoV5wj2Aco3VUrRKcKMGFAuQx98KGlbgvRd5oQazo8QwJt
	gnZNyD9Md4EfywTRBU420QEcq/jAl9e+nATI7CwrNC/WuHjGtmiobaIEorn47L+ofZJGrg06/Ma
	Ro7v/4g8dfVORJ3f2lDpyCND9xK4e/Cvw9H/kfrJvMDgb+zX5vlwwxhId/JCQnqE+3P4yNgh+rb
	tVe2y+eMRJhpKqYmFr/VSe+hJB423k5IcwD6fQ=
X-Received: by 2002:a17:90b:5486:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3ab3ab1d56cmr10251925a91.41.1791866435816;
        Mon, 12 Oct 2026 21:40:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][PATCH 7/16] sngrep: patch CVE-2026-90558
Date: Tue, 13 Oct 2026 17:39:57 +1300
Message-ID: <20261013044006.834868-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
References: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130821

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

