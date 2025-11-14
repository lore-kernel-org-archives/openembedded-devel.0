Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C0DCEACCA
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 19:45:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6778.1763149527455240879
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 11:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZQIOAjPf;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso1262581f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 11:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763149526; x=1763754326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAt09NZqDi1HAMpLIQG/MAblaP5Ok5MseZRrxv2iGzk=;
        b=ZQIOAjPfXVzYQI7WIp5nU4h2r9bWX42w0rF1ZQxpLfTixRgaOD7U+lpOOrVGmEl7V1
         Y6oiPZgAg0tNEl4fGEu6e01bbPdUwGxbsL+3X6nkubwb4gEIuPehGO8vlhjHYOgHzRKH
         BkOHMWTJz0erD5LS3sEshwTdRTVV+PlHUXvwVIZ3A2r5Z+mL+cehcNhuRKkDWE1wYlZc
         ZB3SMRMUHzD22pOAcLIL3oS41UaDrZ+kaxg7Qh3a5VQa3xKMWStxOk+IegTzRNJ8uC4D
         y6iESWMAYV6viNfQ9nU6K/c1mswTve3tLjJis2eccG2aHXW3vDoBIBSTK6P9d03VbOkb
         EmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763149526; x=1763754326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XAt09NZqDi1HAMpLIQG/MAblaP5Ok5MseZRrxv2iGzk=;
        b=ZgPGQL9mQLnxgsRfOU66Vib4c0P5+wPQa2rHC5hQr+H63z2HFdgFOgL6vkJbe67689
         d81ktaLubkHJ8258t/rVxtCV1aOFJw4DAvnx6vssYyb/cfaISdMYW4vspfHFkYgETFA7
         zoBt+dZL+xg5pb/y6CwL5x7tWnuay5x3Gcr/SJq/HDMihPOb7iEcp22s49bnxRrH55Kb
         1y17u2JbSAJnVT7+FPkM8UafepEJDLvz+tOOyyKfoKPjmdlltZMy9HBWSa2EvGxni3WK
         NIFiy1hxNR2glRWM1JKdkv6RSZzQqfnexj9cPfODGXbnkI0jkxsJDZeM9l10CH9WpUpA
         Apzw==
X-Gm-Message-State: AOJu0YyKmB/5/plhzfPfkL/Pc4p+P2o9mOWEKhKHmt7m7cgnlXRW+76s
	FgTXP8BKNhcXywSB3wJhleuOU+fTc5edencYy/8/fjgbJ/Cr6o5YnEMS66DT/YFQ
X-Gm-Gg: ASbGncuS7hgtbLsH2sc/f3OQGvEHsQKJlOP7OkGncW+TnKPOVrpRYRkkXHRL2BY/I22
	IBUfGjCLGJrzUNos4NQtMsBY2wpbPJ5hNM57uIRJV/oBDeEV6b1txCNcNNrUQ0MzZLPD0KK3onP
	7Nxqh2j13DfWokn5XaAUL5kkfblkicT65zX15+ArMY2FfyO1fTLwspUuS+DOgb9eUiPYrx6GdWb
	XMIOhzX888B3uA35huMVsysMpv/eqxDgW1JaCsA8NvS2mfnlFlp6oUU1EzWQITlmmHBXdemHGM3
	2rprIkQS/gVDOdREOKTFtRBShURHL2/lBTRni+qLfBMIIGnzRSSFKwtkLocJO18jtk6g7z+z1hc
	uoow6tRUG4Mso8KlJv5UrEqrbgJTh7J4sUaTNOe2uoSTwpSnLov6StL2CXmcHXllOYal7Vcq6YA
	==
X-Google-Smtp-Source: AGHT+IGo9HEC4T9XVtDgAVY6fhUjnl6weyrigkkoa9gfNJ4XmV5tcDe3l2DClxlHKBjHzO35nAiy3A==
X-Received: by 2002:a05:6000:2509:b0:42b:3d7c:c7cf with SMTP id ffacd0b85a97d-42b593446acmr4417715f8f.15.1763149525684;
        Fri, 14 Nov 2025 11:45:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm11561514f8f.35.2025.11.14.11.45.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 11:45:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 3/5] usrsctp: patch CVE-2019-20503
Date: Fri, 14 Nov 2025 20:45:20 +0100
Message-ID: <20251114194522.643069-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114194522.643069-1-skandigraun@gmail.com>
References: <20251114194522.643069-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 19:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121713

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-20503

Pick the patch mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../usrsctp/usrsctp/CVE-2019-20503.patch      | 54 +++++++++++++++++++
 .../recipes-protocols/usrsctp/usrsctp_git.bb  |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp/CVE-2019-20503.patch

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp/CVE-2019-20503.patch b/meta-networking/recipes-protocols/usrsctp/usrsctp/CVE-2019-20503.patch
new file mode 100644
index 0000000000..fc75151f00
--- /dev/null
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp/CVE-2019-20503.patch
@@ -0,0 +1,54 @@
+From c7f318fc788472da19f0a2579d2c2d439e362f04 Mon Sep 17 00:00:00 2001
+From: Michael Tuexen <tuexen@fh-muenster.de>
+Date: Fri, 20 Dec 2019 17:02:02 +0100
+Subject: [PATCH] Improve input validation for some parameters having a too
+ small reported length.
+
+Thanks to Natalie Silvanovich from Google for finding one of these
+issues in the SCTP userland stack and reporting it.
+
+CVE: CVE-2019-20503
+Upstream-Status: Backport [https://github.com/sctplab/usrsctp/commit/790a7a2555aefb392a5a69923f1e9d17b4968467]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ usrsctplib/netinet/sctp_auth.c | 3 ++-
+ usrsctplib/netinet/sctp_pcb.c  | 5 ++++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/usrsctplib/netinet/sctp_auth.c b/usrsctplib/netinet/sctp_auth.c
+index 5e5813b..0660af4 100755
+--- a/usrsctplib/netinet/sctp_auth.c
++++ b/usrsctplib/netinet/sctp_auth.c
+@@ -1455,7 +1455,8 @@ sctp_auth_get_cookie_params(struct sctp_tcb *stcb, struct mbuf *m,
+ 		ptype = ntohs(phdr->param_type);
+ 		plen = ntohs(phdr->param_length);
+ 
+-		if ((plen == 0) || (offset + plen > length))
++		if ((plen < sizeof(struct sctp_paramhdr)) ||
++			(offset + plen > length))
+ 			break;
+ 
+ 		if (ptype == SCTP_RANDOM) {
+diff --git a/usrsctplib/netinet/sctp_pcb.c b/usrsctplib/netinet/sctp_pcb.c
+index 6629f24..b99d089 100755
+--- a/usrsctplib/netinet/sctp_pcb.c
++++ b/usrsctplib/netinet/sctp_pcb.c
+@@ -7245,7 +7245,7 @@ sctp_load_addresses_from_init(struct sctp_tcb *stcb, struct mbuf *m,
+ 		if (offset + plen > limit) {
+ 			break;
+ 		}
+-		if (plen == 0) {
++		if (plen < sizeof(struct sctp_paramhdr)) {
+ 			break;
+ 		}
+ #ifdef INET
+@@ -7461,6 +7461,9 @@ sctp_load_addresses_from_init(struct sctp_tcb *stcb, struct mbuf *m,
+ 			if (plen > sizeof(lstore)) {
+ 				return (-23);
+ 			}
++			if (plen < sizeof(struct sctp_asconf_addrv4_param)) {
++				return (-101);
++			}
+ 			phdr = sctp_get_next_param(m, offset,
+ 						   (struct sctp_paramhdr *)&lstore,
+ 						   plen);
diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index dcfa7406d2..2361eacebd 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ffcf846341f3856d79a483eafa18e2a5"
 
 SRCREV = "a10cd498d964508c0e6ec6bd2be9dd4afcbb4d86"
 SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master \
-          "
+           file://CVE-2019-20503.patch \
+           "
 
 S = "${WORKDIR}/git"
 

