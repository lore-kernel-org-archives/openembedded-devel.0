Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22B2F36C5E
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 11:51:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17709.1776685867043505065
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 04:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WQr/Yjro;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891b0786beso8709625e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 04:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776685865; x=1777290665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxn4ab6qtDkZV70UMOobou5YbAimseGpn0bb3uvTiPM=;
        b=WQr/Yjro23ja7A4YxYgVgHfmJYzOwGy5IVRLQlzHd2CqiKVGrKmcFtEoYPL/aIqip1
         wi9s8lwJCkAy3xYxgtzV7hxPpkVTed9yCYXU/qZS95we2eQIaA+NncoDwM803z08TP4p
         MKN6WGy5nTyI4Q4LsVudCQSv8zpGpIU/M+JXKFK1YIzJ9ShuGrD9rouu2YPfp6vSrRYP
         /2S9Zxdk/FoseMzsRAsc63vCKMYz4Cm8RNjuCcuG7xkMIViuSQCqaDUGDbZvCMWDMJLx
         /YmbYG1cqlnON12jogLtVzPgmwueLXUrBPZmy0lGPFvbN2sOaacstpp0SfibpJIODwjQ
         1OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776685865; x=1777290665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fxn4ab6qtDkZV70UMOobou5YbAimseGpn0bb3uvTiPM=;
        b=qcV4VBD9SAZexxiMUz2UedN4KWZ6mmn0poM47xV2WERFrFV8p+CCqRCnE4cyo/I74O
         ck/VQq2tCj9ziTgXY7bN1qSLr2pIHvHJAHw9g+ohM9L75N3pclqekdjanvJvjKIMzVJG
         PwPG8IZT+eAysYCnK5skReszEoVP4BtA2bUmzsHbjIklPg5fLp3vd5lSl6QGouNc/UP/
         Tdmn+oddojRdpczqj7px/zgkvzEmFH1/9hH427k34HKceF8D1gMy/mnMiwvI3xytLSma
         PqaarCo8ibYn/3hyhtnGsQtBC7ahSgnv4kpiPbWMrzvWSVQYnXjAObwFOr+6F0eZ01j1
         drmA==
X-Gm-Message-State: AOJu0YwV9PjJFxJQ/ltqVMHYkt6ReYW+dc1k0sBGHwjj5uQf3QstpALK
	3+kk224kCU+JgnoDpd+1Y89nGU5uKN95bQdC+x6iQVT3nHWC4X9Zqm3MGWKv1Q==
X-Gm-Gg: AeBDieucz+JvXTnMji8gYgT1fJ/NFdndLzsi7lXJ/V0l0W7lQhVuqiOIUo0YVFHsVTk
	aTwPmX+Zpifepzwsr5Mt7Finl2X32tzOwP3Ys8jjZIvWQGg1QfYnF9ntiE69hxP/O0rAhltaqt8
	klm0kLeq0jsQm0yKVy3WwnvfmrFAhPL6sGWCrons+J/iZRsLbadFA73GSwkXsYFltc/3lfg5D1+
	GnpRnshDxGL3RD87WW7fU18QjxagdONSWwHCWdDIg4C+Dy3UXsMiq/HsJcBbNhTSOD96QfBC1vD
	UAaFxq6Wjq4xZ1z7KS997nu/7jcejoBgHGmb50CpaH9M7LVf3Zu7JMGXnl/QNQ+hhCM4mW89d/n
	Zs0gKhPVQjn9gcYzrFI7VeLFXajofKRY252KvSVRw9mwD1atNZAclvlrKpoQY5HLr0CIV7dB9f9
	XudyxhKjTXnfYYQ5A8/npmapkpfEvlrg8=
X-Received: by 2002:a05:600c:4746:b0:488:9439:881a with SMTP id 5b1f17b1804b1-488fb738412mr172264205e9.2.1776685865043;
        Mon, 20 Apr 2026 04:51:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm314595715e9.12.2026.04.20.04.51.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:51:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 2/3] corosync: patch CVE-2026-35091
Date: Mon, 20 Apr 2026 13:50:59 +0200
Message-ID: <20260420115102.428743-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420115102.428743-1-skandigraun@gmail.com>
References: <20260420115102.428743-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126501

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-35091

Pick the patch that mentions the CVE ID explicitly (it was identified
by Debian also as the fix[1])

[1]: https://security-tracker.debian.org/tracker/CVE-2026-35091

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../corosync/corosync/CVE-2026-35091.patch    | 47 +++++++++++++++++++
 .../corosync/corosync_3.1.10.bb               |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch

diff --git a/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch b/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch
new file mode 100644
index 0000000000..a90193dbc5
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35091.patch
@@ -0,0 +1,47 @@
+From b9cb461121c8721c94a94309eb345a3c2f9ee9b4 Mon Sep 17 00:00:00 2001
+From: Jan Friesse <jfriesse@redhat.com>
+Date: Thu, 2 Apr 2026 09:00:39 +0200
+Subject: [PATCH] totemsrp: Return error if sanity check fails
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Previously, the check_memb_commit_token_sanity function correctly
+checked the minimum message length. However, if the message was too
+short, it incorrectly returned a success code (0) instead of the
+expected failure code (-1).
+
+This commit ensures the appropriate error code is returned when the
+message length sanity check fails.
+
+Fixes: CVE-2026-35091
+
+Reported-by: SebastiÃ¡n Alba Vives (@Sebasteuo / 0xS4bb1) <sebasjosue84@gmail.com>
+Signed-off-by: Jan Friesse <jfriesse@redhat.com>
+Also-proposed-by: nicholasyang <nicholas.yang@suse.com>
+Reviewed-by: Christine Caulfield <ccaulfie@redhat.com>
+
+CVE: CVE-2026-35091
+Upstream-Status: Backport [https://github.com/corosync/corosync/commit/a16614accfdb3481264d7281843fadf439d9ab1b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ exec/totemsrp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/exec/totemsrp.c b/exec/totemsrp.c
+index 35bf971..94d6c21 100644
+--- a/exec/totemsrp.c
++++ b/exec/totemsrp.c
+@@ -3811,10 +3811,10 @@ static int check_memb_commit_token_sanity(
+ 		log_printf (instance->totemsrp_log_level_security,
+ 		    "Received memb_commit_token message is too short...  ignoring.");
+ 
+-		return (0);
++		return (-1);
+ 	}
+ 
+-	addr_entries= mct_msg->addr_entries;
++	addr_entries = mct_msg->addr_entries;
+ 	if (endian_conversion_needed) {
+ 		addr_entries = swab32(addr_entries);
+ 	}
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
index 07d9333ec8..7ccccefed5 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
@@ -9,6 +9,7 @@ inherit autotools pkgconfig systemd github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
+           file://CVE-2026-35091.patch \
            "
 SRC_URI[sha256sum] = "be361c827f99b215b3bd3fa2fb071c03dac6831c2a351963d938caef62604bc8"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

