Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9863DCD342C
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 20:55:23 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13301.1777755316213945672
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2026 13:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JU6tuGrx;
 spf=pass (domain: konsulko.com, ip: 209.85.210.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso1557346b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1777755315; x=1778360115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nElmrVvHlPoSI6Ch7Rf3DG8lTRZcUuN5LZO7pAb3TIs=;
        b=JU6tuGrxhrz6th/hLWNEfb/i5jl3+dccn7FIRKjZpkZlFVyeQwPtswSvfS88B5nqez
         H1nIgkygDrxpyq6LokYX4L/78WWxDGtD/TQdEXE5OPjKOAZvCiXwRgbbdO9zLLjd86eI
         H9FdJ1OjzOdXSXpVE3ixfxLONMBFWzQFUSLa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777755315; x=1778360115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nElmrVvHlPoSI6Ch7Rf3DG8lTRZcUuN5LZO7pAb3TIs=;
        b=WX5+UH+CoJorz3XMposrqIca9H2qHwtVNLhcDA3wbdtRqEmMgrO+lmhsilB5WYjGSJ
         itxFGRrSLiQt1lFBJFSCkMa8da51vuvKl/VmorMm2bo+I8wykS4ALpdYibMDhqLnTsQA
         NScHLMhB2pV50whZu7gU0WO1705slghN00GMBAKuweoKRUa3Pj6JvJYJYyk5hKk3wuiK
         QT3FGeOUbU1DYihVhe9bPR8ZW4ixLttizGrXJmDNte6EEwhDu/L9Yi2w8r5gH44S1iGA
         5d3bMJdo8cSHk5nqe1VBxDXRNp8XcRyyV+lrbUnDR/UIGTmB57ekDs+2whq2E16iMJkf
         15eg==
X-Gm-Message-State: AOJu0YwEQ7jj93ToB8uzv0LX4JJeZg2h356Um7alBmX3rRanw09uCHFs
	2f1g1/ZJxua7Gs0r1szGzIHvvngqG7LUq4Fpcu08wPfn2eEgI3DZH5e6gl6CG8M6H6uDrIDgN4R
	e3g1y
X-Gm-Gg: AeBDieuaVzICFXGfDWh9O6EYHcAE/5Bo4nGi5LmFNxpLw74QnAXGRdUclyetb3rbXs6
	XsQCViTDqfIV5SHsYqotAc9YgxnhZFxRkI4vooPzBjfcttM1XMaWm+TqGEu9JauFQRhoPp/ixDz
	VRKW8II0qboc/pIXoSFRqOa1YHHTX1Cqba/b5z35q3l6yKJO/SDSOMCh3zjsgdAJaxOd5H9Swys
	105YJ/Os43DK2XYKys4XiRx+amFCtdtrlqLLsCyIWHJFDNF8+eRaiBskEHvWOVcA+D5KASsJ+7+
	wnFtnczUpQTowF1URvOqbNi00t8nA5PZMIgLt0AnyeMFJxIRcX3Z/dYOkM5pEloRyJw3UhGB6js
	VMHVl1WqW1cmfmwzlaizA/gNo1mqjVvUK5cOLcqOBOB98r281/jAjVLbdzf7qCfMIfvuotv6q10
	NeGB0E/8FP+tTkzSpbRNTKBtuYcaB3HgGsEU7waIv0QMrLK8nrqu8HP8Dvj9gs
X-Received: by 2002:a05:6a00:2d11:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-8352d1a614bmr4275366b3a.14.1777755315379;
        Sat, 02 May 2026 13:55:15 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6021:700:f870:4337:268a:bb6a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b8500dsm7198746b3a.58.2026.05.02.13.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 13:55:15 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-webserver][PATCH 2/3] nginx: log error_log at notice level by default
Date: Sat,  2 May 2026 13:55:00 -0700
Message-ID: <20260502205501.185550-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260502205501.185550-1-tim.orling@konsulko.com>
References: <20260502205501.185550-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 20:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126765

From: Tim Orling <tim.orling@konsulko.com>

When the error_log directive omits a severity (as in our shipped
nginx.conf), nginx defaults to 'error' level, which filters out the
entire notice-level startup banner: 'using the "epoll" event method',
the version line, 'start worker process N', and the corresponding
exit/reload events. The result is an nginx that appears completely
silent on stdout/stderr in foreground or container deployments — a
common confusion for anyone running 'nginx -g "daemon off;"' as a
container entrypoint and wondering why no logs appear.

Set the level to 'notice' in the default nginx.conf to surface those
events. This matches what upstream Debian and the official nginx
Docker image ship for the same reason. The change is essentially
free for traditional service deployments: notice-level events are
infrequent (master start/stop, config reload, worker recycling) and
remain useful diagnostic output rather than noise.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.conf b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
index 6d219422b3..afbd79f9ac 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.conf
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
@@ -29,7 +29,7 @@ http {
 
     ## Logging
     access_log /var/log/nginx/access.log;
-    error_log /var/log/nginx/error.log;
+    error_log /var/log/nginx/error.log notice;
 
     ## Gzip settings
     gzip  on;
-- 
2.47.3


