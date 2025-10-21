Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB39CCD1B9
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 18:32:16 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.20638.1761071527566413951
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 11:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fxmAc1/S;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-471066cfc2aso13319125e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 11:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761071526; x=1761676326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxHVn4UBABWYrVjTXDAeBRsTbdxVdhmRd9uVGM/Dmzc=;
        b=fxmAc1/SoIoLWeutLCvJiOlMd895g3pKkX9NwdAvnJp3dhnTyjJ2o1g2gmXw2i8cDL
         zGGuyyyCaiSsO874mk263RwTO9vp5XM3sADf48+oNNb41uJ/F7d9vTndbOVezRMWQtG3
         UtxKWQGkKQpI5gbzDBBQ2b0/qsQAQBoZX5FXf7UEWWWFiuvxV7AU+plSTgB/w+xjSI80
         QPdOR60eqhfHg58qyqhEVoaaLkaMQXVNgybXjjzLjW1QYYFyCuHeBaeu+63CvlfMRQSp
         KY95zfykN8V2UwkYnDhCyZkkNi/GwFzfws1sqB1U8cEcVrnEqV5nuDOXsVGaLS+0CvGw
         q/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761071526; x=1761676326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxHVn4UBABWYrVjTXDAeBRsTbdxVdhmRd9uVGM/Dmzc=;
        b=rKLHngbUzL2lJpYN8FUGhjsnfKQHWL229mAXJl/T/G8s4hlYnFikIQxG1Tjp55VTb8
         DeH1ZFb2lUG2N910dlScoaENz3/AcI5HNopWZDQ6cEB43C+mWuw1iWsXB4E1CmEUy5Fr
         e3CeZKrfMZhRx5ZLOzrrguQykRvftluaqmL1qQjQwK5MiOTF20fzLsnJ8H6DjIOUtZxm
         W9NKf0qD+VY6lqIOeH5UbFr54sC50+D7r1WjB9X5pIx7VfTKzSmuxQ6+qh1+aVEN2cSv
         QeyGD6+uwfzyd+fVsGWdyxWOSSjFaJ8L411JUiUWP2g6mL0CPl4qjC86igRFMQKC+DIe
         QOaA==
X-Gm-Message-State: AOJu0YwmGFOdufX6ZhMGhNnpxpf5eEUH8lcvSxz1eLzO+un2nJfDxZHr
	+OaZsVrA8EFtoAfxnujYvBBgxTRcvj1j+KGuOP6QVA5FGobKIRlciqaQuzpYiw==
X-Gm-Gg: ASbGncuOASieYCT9loGZH87p9/5sBU65ASFgXR3uvAK67m/Tso+NqfV82lBg0VWCR9c
	olCjFNSmZoxZmYro7xmk+rh1i08N9zniMXVJTKK3ji1aLviGwblKUF9REaPm2vxnlFzavEUyoZC
	vm6gBeCoc96E9s3MPFO7wjzHz36dpvn2aYR3nDOq1W26+JzYoYofgAgeo7beRA4VTYU1HCIUG3/
	hge5vyYFBi3Bz1geTD2LxjwAQsEfDsY6LXFleBErtciQD3Kczv31Tb9V07prazCk9b5cEpSX2Tw
	RrAE3cvxTxIX6USij9AhU2fjXn8nvLv83jbjD5EU5Dzs5YLIPlK4ypZhhwfiGkpoEXjWpq7lbAl
	PkJ82VOtlHQ2KJzOJ2M/O0kbu0MhVaZJ/DMv3G7pLqI4ggtZZMDAKdPI5tujgFbU6bIjyqO3+7E
	oq4mRXzy2QgEksGqarZcs=
X-Google-Smtp-Source: AGHT+IH+0xw856IKRjQY8SL6tBDdd169R4WajRrDh80x/BJ5OGvCw0cNLlO7sjUinK+yPIziNaFcjA==
X-Received: by 2002:a05:600c:468b:b0:46e:4cd3:7d6e with SMTP id 5b1f17b1804b1-47117876a24mr134838385e9.9.1761071525722;
        Tue, 21 Oct 2025 11:32:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496cf3b45sm20984535e9.7.2025.10.21.11.32.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:32:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/6] squid: patch CVE-2021-46784
Date: Tue, 21 Oct 2025 20:31:59 +0200
Message-ID: <20251021183204.269102-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 18:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120841

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-46784

Pick the backported patch from v4 branch, that referenced the same PR[1]
that the patch[2] from the nvd report refers to.

[1]: https://github.com/squid-cache/squid/pull/1022
[2]: https://github.com/squid-cache/squid/commit/5e2ea2b13bd98f53e29964ca26bb0d602a8a12b9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../squid/files/CVE-2021-46784.patch          | 133 ++++++++++++++++++
 .../recipes-daemons/squid/squid_4.15.bb       |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2021-46784.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2021-46784.patch b/meta-networking/recipes-daemons/squid/files/CVE-2021-46784.patch
new file mode 100644
index 0000000000..fd074f0b3c
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2021-46784.patch
@@ -0,0 +1,133 @@
+From 0cfe0d3efe438658ac3b1eeac44bdc07836a1649 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <MegaManSec@users.noreply.github.com>
+Date: Mon, 18 Apr 2022 13:42:36 +0000
+Subject: [PATCH] Improve handling of Gopher responses (#1022)
+
+CVE: CVE-2021-46784
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/780c4ea1b4c9d2fb41f6962aa6ed73ae57f74b2b]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/gopher.cc | 45 ++++++++++++++++++++-------------------------
+ 1 file changed, 20 insertions(+), 25 deletions(-)
+
+diff --git a/src/gopher.cc b/src/gopher.cc
+index 169b0e1..6187da1 100644
+--- a/src/gopher.cc
++++ b/src/gopher.cc
+@@ -371,7 +371,6 @@ gopherToHTML(GopherStateData * gopherState, char *inbuf, int len)
+     char *lpos = NULL;
+     char *tline = NULL;
+     LOCAL_ARRAY(char, line, TEMP_BUF_SIZE);
+-    LOCAL_ARRAY(char, tmpbuf, TEMP_BUF_SIZE);
+     char *name = NULL;
+     char *selector = NULL;
+     char *host = NULL;
+@@ -381,7 +380,6 @@ gopherToHTML(GopherStateData * gopherState, char *inbuf, int len)
+     char gtype;
+     StoreEntry *entry = NULL;
+ 
+-    memset(tmpbuf, '\0', TEMP_BUF_SIZE);
+     memset(line, '\0', TEMP_BUF_SIZE);
+ 
+     entry = gopherState->entry;
+@@ -416,7 +414,7 @@ gopherToHTML(GopherStateData * gopherState, char *inbuf, int len)
+         return;
+     }
+ 
+-    String outbuf;
++    SBuf outbuf;
+ 
+     if (!gopherState->HTML_header_added) {
+         if (gopherState->conversion == GopherStateData::HTML_CSO_RESULT)
+@@ -583,34 +581,34 @@ gopherToHTML(GopherStateData * gopherState, char *inbuf, int len)
+                         break;
+                     }
+ 
+-                    memset(tmpbuf, '\0', TEMP_BUF_SIZE);
+-
+                     if ((gtype == GOPHER_TELNET) || (gtype == GOPHER_3270)) {
+                         if (strlen(escaped_selector) != 0)
+-                            snprintf(tmpbuf, TEMP_BUF_SIZE, "<IMG border=\"0\" SRC=\"%s\"> <A HREF=\"telnet://%s@%s%s%s/\">%s</A>\n",
+-                                     icon_url, escaped_selector, rfc1738_escape_part(host),
+-                                     *port ? ":" : "", port, html_quote(name));
++                            outbuf.appendf("<IMG border=\"0\" SRC=\"%s\"> <A HREF=\"telnet://%s@%s%s%s/\">%s</A>\n",
++                                           icon_url, escaped_selector, rfc1738_escape_part(host),
++                                           *port ? ":" : "", port, html_quote(name));
+                         else
+-                            snprintf(tmpbuf, TEMP_BUF_SIZE, "<IMG border=\"0\" SRC=\"%s\"> <A HREF=\"telnet://%s%s%s/\">%s</A>\n",
+-                                     icon_url, rfc1738_escape_part(host), *port ? ":" : "",
+-                                     port, html_quote(name));
++                            outbuf.appendf("<IMG border=\"0\" SRC=\"%s\"> <A HREF=\"telnet://%s%s%s/\">%s</A>\n",
++                                           icon_url, rfc1738_escape_part(host), *port ? ":" : "",
++                                           port, html_quote(name));
+ 
+                     } else if (gtype == GOPHER_INFO) {
+-                        snprintf(tmpbuf, TEMP_BUF_SIZE, "\t%s\n", html_quote(name));
++                        outbuf.appendf("\t%s\n", html_quote(name));
+                     } else {
+                         if (strncmp(selector, "GET /", 5) == 0) {
+                             /* WWW link */
+-                            snprintf(tmpbuf, TEMP_BUF_SIZE, "<IMG border=\"0\" SRC=\"%s\"> <A HREF=\"http://%s/%s\">%s</A>\n",
+-                                     icon_url, host, rfc1738_escape_unescaped(selector + 5), html_quote(name));
++                            outbuf.appendf("<IMG border=\"0\" SRC=\"%s\"> <A HREF=\"http://%s/%s\">%s</A>\n",
++                                           icon_url, host, rfc1738_escape_unescaped(selector + 5), html_quote(name));
++                        } else if (gtype == GOPHER_WWW) {
++                            outbuf.appendf("<IMG border=\"0\" SRC=\"%s\"> <A HREF=\"gopher://%s/%c%s\">%s</A>\n",
++                                           icon_url, rfc1738_escape_unescaped(selector), html_quote(name));
+                         } else {
+                             /* Standard link */
+-                            snprintf(tmpbuf, TEMP_BUF_SIZE, "<IMG border=\"0\" SRC=\"%s\"> <A HREF=\"gopher://%s/%c%s\">%s</A>\n",
+-                                     icon_url, host, gtype, escaped_selector, html_quote(name));
++                            outbuf.appendf("<IMG border=\"0\" SRC=\"%s\"> <A HREF=\"gopher://%s/%c%s\">%s</A>\n",
++                                           icon_url, host, gtype, escaped_selector, html_quote(name));
+                         }
+                     }
+ 
+                     safe_free(escaped_selector);
+-                    outbuf.append(tmpbuf);
+                 } else {
+                     memset(line, '\0', TEMP_BUF_SIZE);
+                     continue;
+@@ -643,13 +641,12 @@ gopherToHTML(GopherStateData * gopherState, char *inbuf, int len)
+                     break;
+ 
+                 if (gopherState->cso_recno != recno) {
+-                    snprintf(tmpbuf, TEMP_BUF_SIZE, "</PRE><HR noshade size=\"1px\"><H2>Record# %d<br><i>%s</i></H2>\n<PRE>", recno, html_quote(result));
++                    outbuf.appendf("</PRE><HR noshade size=\"1px\"><H2>Record# %d<br><i>%s</i></H2>\n<PRE>", recno, html_quote(result));
+                     gopherState->cso_recno = recno;
+                 } else {
+-                    snprintf(tmpbuf, TEMP_BUF_SIZE, "%s\n", html_quote(result));
++                    outbuf.appendf("%s\n", html_quote(result));
+                 }
+ 
+-                outbuf.append(tmpbuf);
+                 break;
+             } else {
+                 int code;
+@@ -677,8 +674,7 @@ gopherToHTML(GopherStateData * gopherState, char *inbuf, int len)
+ 
+                 case 502: { /* Too Many Matches */
+                     /* Print the message the server returns */
+-                    snprintf(tmpbuf, TEMP_BUF_SIZE, "</PRE><HR noshade size=\"1px\"><H2>%s</H2>\n<PRE>", html_quote(result));
+-                    outbuf.append(tmpbuf);
++                    outbuf.appendf("</PRE><HR noshade size=\"1px\"><H2>%s</H2>\n<PRE>", html_quote(result));
+                     break;
+                 }
+ 
+@@ -694,13 +690,12 @@ gopherToHTML(GopherStateData * gopherState, char *inbuf, int len)
+ 
+     }               /* while loop */
+ 
+-    if (outbuf.size() > 0) {
+-        entry->append(outbuf.rawBuf(), outbuf.size());
++    if (outbuf.length() > 0) {
++        entry->append(outbuf.rawContent(), outbuf.length());
+         /* now let start sending stuff to client */
+         entry->flush();
+     }
+ 
+-    outbuf.clean();
+     return;
+ }
+ 
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index 6a4ef0a2b6..b79f632508 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://CVE-2023-49286.patch \
            file://CVE-2023-50269.patch \
            file://CVE-2023-5824.patch \
+           file://CVE-2021-46784.patch \
            "
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"

