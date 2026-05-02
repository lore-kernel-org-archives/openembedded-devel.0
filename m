Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816A6CD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 20:55:23 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13303.1777755318230025184
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2026 13:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Cr4oYALc;
 spf=pass (domain: konsulko.com, ip: 209.85.210.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82ce2e2880cso1949204b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 13:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1777755317; x=1778360117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgsqSD0BYR543B8uj2ahs3reBEhqE9DHzAakSbggMh0=;
        b=Cr4oYALc3beypY5suY/Dxd972R+dKXL7be5QBtiPtQ6BsioEWWzP1lPtC91f6olwX/
         9HgCtLrDl8YZOCJuCnJhP91jLukhAwmRKDNxSwxazX8iGAL+frG6Y3f+rpjYTxdZbcoI
         DSpauejffJHh5I0gKrnqcIHGDS7qmENzYfdrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777755317; x=1778360117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QgsqSD0BYR543B8uj2ahs3reBEhqE9DHzAakSbggMh0=;
        b=FIpauFj7fK1AnPgG/ZA9T7LqC2WHel19i2KizBAAegJWp+cpbXngZ4rUEvAosLX51p
         PeteH8TjG96hAnFDCQ1Nr+p7C8uXqJbFCeNK2RS/QByn64aM6BqLdO12MX8EytOthuF3
         bgQoJstSepF646/+CZ17GTpwhT00Bvl+OW4WTMONWOLIg6TSIWyRnhBtKH/PCkpH/49k
         Jh2d2hv6tkzgoCHdY8q7PT9QUas6YzYZ4pn7j9z2V5Luv5NhWBnwOG2LE18kZyX0+b+E
         9okpyDTNaprJXi4MkM2ys7/FUT2MgD/+u6Os0M2F7BP0BCJam+ghXt9fEVMZ/HtDoSKe
         3tIA==
X-Gm-Message-State: AOJu0Yze+n4PsjsyZGhINR+lOwt2hzjtjDmvq9qy2Zx6ttWh+mK8m4o9
	WrsNXnLoWNNnofurDz/b5NyfRrci77N8E15myz9/CEQuZ/M9LrdWCVir8hCXd8/zULrk/dhDIZO
	hxKqS
X-Gm-Gg: AeBDievrr3sqN+5HZAtWyTzDt4hYsGXocmtzQ9yqhXGXS4JIWM5U6oTqfUTDXDQ29oe
	kC6EfXW/bv1H9wPPwDXL1tMDq7Pmj/p4Hb0jye8hNZG1L1WXcv9eXACpoxgI2TNdJsYCHl2eP1E
	sPMGXgHUTsNy4q6hNYwPTh3qI0MrYmGfDvAt/qpCV/CGeCKK+6g9ScTaeHKaIphnKYxdSQm4KXS
	scofFbtGRxPjWFEETyHarF4sxheaE1O53FfsBlgSNApy3AAZOX3FW93hPBqgDQ3Uxp2eJ3ZcTz5
	+Zk0I0pP/leHjvzFlRc1ucEJuz2L9JoH+oTQZ4gLoNrNd5tWYURblYembORoRFcSCZIQSIth3Aj
	JQ0NHHOasvBI0XXKn96iOc+F+vMM1EIzKYGK2TWQVppsGU79e1aOLwIKcAMH0sbT7w/WuJbFT8C
	qsHPB5W70INqd+C7A8Deb/cHCO+1pk9x+GZalfpLjSDEebv02B6A==
X-Received: by 2002:a05:6a00:1748:b0:82a:17b6:53ca with SMTP id d2e1a72fcca58-8352d2bdda4mr3933801b3a.38.1777755317498;
        Sat, 02 May 2026 13:55:17 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6021:700:f870:4337:268a:bb6a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b8500dsm7198746b3a.58.2026.05.02.13.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 13:55:17 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-webserver][PATCH 3/3] nginx: upgrade mainline 1.29.7 -> 1.29.8
Date: Sat,  2 May 2026 13:55:01 -0700
Message-ID: <20260502205501.185550-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260502205501.185550-1-tim.orling@konsulko.com>
References: <20260502205501.185550-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 20:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126766

From: Tim Orling <tim.orling@konsulko.com>

2026-04-07
nginx 1.29.8 is the final release of the 1.29.x mainline branch,
published a week before the 1.30.0 stable cut on 2026-04-14. After
this point the 1.29.x branch is closed; new development will continue
on a future 1.31.x mainline.

Notable changes in 1.29.8:

  * New 'max_headers' directive that bounds the number of HTTP headers
    accepted per request, mitigating header-based DoS exposure.
  * OpenSSL 4.0 build compatibility.
  * The 'include' directive inside a 'geo' block now accepts wildcard
    patterns, matching behaviour in other contexts.
  * Bug fix: handling of HTTP 103 (Early Hints) responses received
    from a proxied backend.
  * Bug fix: $request_port and $is_request_port are now available in
    subrequests (previously only in the originating request).

Also refreshes the recipe header comment to reflect 1.30.x being the
current stable branch (it had previously identified 1.28.x as stable).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
deleted file mode 100644
index 4d884fcbb3..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.28.x branch is the current stable branch, the recommended default
-# 1.29.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
-
-SRC_URI[sha256sum] = "673f8fb8c0961c44fbd9410d6161831453609b44063d3f2948253fc2b5692139"
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb
new file mode 100644
index 0000000000..f810ac219d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb
@@ -0,0 +1,11 @@
+require nginx.inc
+
+# 1.30.x branch is the current stable branch, the recommended default
+# 1.29.x is the most recent mainline branch (final release before the
+# 1.30.x stable cut on 2026-04-14)
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
+
+SRC_URI[sha256sum] = "7f1b985dace8fe706dfc288b83927c928f0ae60bcb7507c2d4e0025eca7280c3"
+
-- 
2.47.3


