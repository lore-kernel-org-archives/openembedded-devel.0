Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7406CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:58:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5353.1763369931009296996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 00:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghmzRWm7;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso20540575e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 00:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763369929; x=1763974729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yia4lyN7SlDUQog7SwPV1DqsdyHMiXQTleiJZdWgplQ=;
        b=ghmzRWm7DIVGXYjw1MhWZ6dyzCoW+hwiirXx+SpxqA0Ll/wb390akBrVOh+LvVSRLs
         jYPMF3R9mlOG7od+sakDw7ATwOBA5gKIgTBu30ipclUzDcNQbpLiP1K01kNkOP2ar3+a
         PftMMBiv1HqFZlbNLSI9iTZnOFp+nxay/4tfBYPhHW1BSdvi3CmIF/5odGH6sz5e/rpa
         ACxbWVGG7xTMTpQwQVPaDQEUE2U1q3pigVkCN8+iTF2fM6o3MVEUfkz7xZb5qMb/Mt/N
         kVACjlUomoUBygcB/+Xfm4g3wBTP+eKw++czEBcuUnM+vTrIq1XNlBxa1Pvqlheukv7e
         rk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763369929; x=1763974729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yia4lyN7SlDUQog7SwPV1DqsdyHMiXQTleiJZdWgplQ=;
        b=WmFH70Ths84XSGVKc6z3XgzGSKRF8MQ//D4y81dgBMfVLH1tYm4qci2KPoBPZNP+oZ
         IBZcR8+XOxT/cUedKbu6ZnAbi1w92TYa18Wc9c6dcYmB/1iNTw1XMBADjT9tlckjUhKq
         e85l0WPtwFw2HlG/18oI1YYP7+J5yiz4Is6pd89t4bhbOEE2yeBl3XOn9PCdWlwg2l1r
         0f7ZNTuJW8417tNM2vfwoICY4RKGF0u90XczPII7+as38n7Ku4NV96CsEgAil6iI01LA
         8gmZ7/cEv3cai9f/nBof6bL+CTaL9FsvxnQftMQAMyTRBlE6ojhzvem1wgm8oOSfS54P
         /lgg==
X-Gm-Message-State: AOJu0Ywb/tnw65zKN0jG2yGgwq7H43l2KfNzO3cOBsjcc/QQjmifbwq8
	2tl+L3wqfHMpemJaIiAuPMAJfqAughlJFR313OSd17H1uammLnJ2cR6k0fVpt51q
X-Gm-Gg: ASbGncuuF5Yvtyeggs5WqleD/zJQysau8FxV1hmxwuMVaxnoi/s2KUxJQUbJIX9UyBn
	qwfxPy9oxmx3KC9fozreausmkKyu1K5KSqMSAhoBOj9LQAH3/PQ6RX1Og1PPSKuXjAnP+PL/rI6
	oEX7D/yh4pDhuBL7/Fekm8t30PRxPqlYRKO6WkKUzsOJ5kOaLaKfPnpLguPtic5ugWehbZ5FmxH
	gCFzWwDa47TrwExR4pEdpHiKvFGXSX6mbem2LqJpP+6ewlIo7edWXnqbFX69dlNOZfoIeFIKX/i
	sMcreGyyuzbGll2YgEdVaJmUGpO7Zs2bcOR2PFvQnnpgbcMiqpPx6jAymW1FFeB4j2Ug+PCoKMo
	HhKX80cJ6LcvCKRlzSVeMugOiQu+75KqWRceYZzoRwKXEdp/NwNZm94+2sIJEVxLN8x3fCwyZ7C
	oI3idVf7Fdjkm5NPCsFgY=
X-Google-Smtp-Source: AGHT+IGE7//avvN9BRtUzMjYLBmPrtcRV7ISDp10Yumx4An552KpCunQxt2IkWzjg3fUtJmIfRUOMQ==
X-Received: by 2002:a05:600c:4753:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-4778fe60658mr109157495e9.17.1763369928913;
        Mon, 17 Nov 2025 00:58:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a5153d8fsm10292765e9.2.2025.11.17.00.58.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 00:58:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2] rsyslog: set status for CVE-2015-3243
Date: Mon, 17 Nov 2025 09:58:47 +0100
Message-ID: <20251117085847.762880-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 08:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121767

Details: https://nvd.nist.gov/vuln/detail/CVE-2015-3243

The issue is about file permissions: by default rsyslog creates world-readable
files. In case a log message contains some sensitive information, then that's
exposed to every user on the system.

However the rsyslog.conf file that is shipped with the recipe solves it: it
already sets non-world-readable default permissions on all files, so this
vulnerability is fixed in the default OE recipe.

See also this package in OpenSuse[1], where it is solved the same way.

[1]: https://build.opensuse.org/requests/619439/changes (rsyslog.conf.in)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: updated the CVE_STATUS key to "backported-patch" due to the lack of a better one.
(fix-file-included status doesn't exist in Scarthgap)

 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf | 3 ++-
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb  | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
index dbfefb7597..6316efb629 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
@@ -13,7 +13,8 @@ $ModLoad imklog   # kernel logging (formerly provided by rklogd)
 
 #
 # Set the default permissions
-#
+# Setting the $FileCreateMode not world readable fixes CVE-2015-3243
+# 
 $FileOwner root
 $FileGroup adm
 $FileCreateMode 0640
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
index af46cc14d7..c5bd9be5bb 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
@@ -37,6 +37,8 @@ SRC_URI[sha256sum] = "acbdd8579489df36b4a383dc6909a61b7623807f0aff54c062115f2de7
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
+CVE_STATUS[CVE-2015-3243] = "backported-patch: The shipped default rsyslog.conf contains the fix"
+
 inherit autotools pkgconfig systemd update-rc.d ptest
 
 EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"

