Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F02CD5BAB
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 22:36:50 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5734.1779403003223772266
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 15:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dlENQzeC;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8173b2af32so5302646a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 15:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779403003; x=1780007803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYHKXXbw/5WT78XcSfar2RNiLpd939nrdErpDVYOAfg=;
        b=dlENQzeCktU1SJJmgUB8iuEvTM90eT5fwkINiiX7834GpNN0nxVMIFoPcaFTtcnhGj
         xp9xBypZONwLQR5+WO0I+IHpDo1gd4bkOlXmK4iteEE97Qz4psG+2lnOgP6ofG+xi9qi
         ILb4iwyO+wcObJA6URbOCSiAzUDTQAzKdCMMx3NNDpGkqCtiZk2B5qtcq5w9mu05fpet
         3ZQEHV6ty17BBgyiLPUX1T7HpSy3tB04/cG1FyJvCHARexSh6ginwRAHdON/GmXwtXuh
         TUTTd37iWFTQKeHI2ZBf6ztV1SsPcuxisA6nG8hgvmozpMxjepSX6/lS59OzzX01HT8P
         5eXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779403003; x=1780007803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BYHKXXbw/5WT78XcSfar2RNiLpd939nrdErpDVYOAfg=;
        b=f9kjLFTWH8LnXXL3CqhKnOlqNc/FwIQV+PgQTr48xpmI97H6GuUXBltgDXJPLtON/X
         MCFg+rh3kih12lo8GcDcS8WwIRd8ZsF+AyDLzzEF2SCyONrASAw9PaFqGEdmaH96/X8X
         kwQikCNubljl4kWo6+wRcxlSpIjWkj0X0+TsdK8XBlQUBnxkToo3IZdjdcrNCLR/cVNH
         0b7tbTXQus8pa03fDBf1LjyjN7HYyUAlI8wa8yFaFyO0UmPIYkybFjQADNMcqXpvUIDq
         EH4ng+cFfqwHBzDV9I6y8KD7IFWxFB0GMhSM2i3YB7DfckKOwmkEp+EVa3zrQ+dV6L45
         ZDlg==
X-Gm-Message-State: AOJu0YzENpXD7z2Ir4sqJywBxiT/Gy8mUvC1lyCwcbll7xal4wVwqCxI
	Cm+7XZiNoswyyaIHtIvOrhaKG/FPvoRLOooZGSi32J9Lsa3KgADeNRuR4SonddfR
X-Gm-Gg: Acq92OFTOIAQ3o9JgIrPo6SNHtpBehLagN5iKU7BOWVConS2jZVOU9UpZCh8SY/8oVA
	W8QbbCWpK+z0O4eIpww0VdRc0zz3A2/nYuH4lGwCNh6l003IJXekGSrQsRh78RgRi6aKyh6M3Ps
	PdISYg8l2g0Zp5e8zK+vuniz+3z72Nmn2dqjAjaizCAODPKCaZmQRBN0f9WTzTfvLuc1m03NWhe
	FQwFrPqPUFyR9ytiJhv4eVmgXwBhfbmK1PUMiyaj+iQjPM95ozspNvgZdZDLqmoVCtzs8vxRQ4O
	b3y3Q9H0AmqPX2vz+qhkT7m1Z4Fq7KlCzxhPbyxn4wtDKgF1FYucZs56jAOUS/vXq5CQsaVt4x9
	iHm05EGbLdNyFK8ebZUFRy2Tyeo49lcWFpmXthO2MD0fq1VpFiH1wuG3H8LuB08U82ub9qgALH1
	0Cvfl0IGVlWv+C1jNhk3FvAA1VQmTU7ZtdNJZD
X-Received: by 2002:a05:6a00:421a:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-8415f11f76fmr1163828b3a.2.1779403002492;
        Thu, 21 May 2026 15:36:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84162879230sm124505b3a.33.2026.05.21.15.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 15:36:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 3/5] nginx: upgrade 1.30.0 -> 1.30.1
Date: Fri, 22 May 2026 10:36:21 +1200
Message-ID: <20260521223623.1335832-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521223623.1335832-1-ankur.tyagi85@gmail.com>
References: <20260521223623.1335832-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 22:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127142

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changes with nginx 1.30.1

*) Security: when using the "proxy_set_body" directive, an attacker
   might inject data in the proxied request to an HTTP/2 backend
   (CVE-2026-42926).
*) Security: a heap memory buffer overflow might occur in a worker
   process while handling a specially crafted request by
   ngx_http_rewrite_module, potentially resulting in arbitrary code
   execution (CVE-2026-42945).
*) Security: a heap memory buffer overread might occur in a worker
   process while handling a specially crafted response by
   ngx_http_scgi_module or ngx_http_uwsgi_module, allowing an attacker
   to cause a disclosure of worker process memory or segmentation fault
   in a worker process (CVE-2026-42946).
*) Security: a heap memory buffer overread might occur in a worker
   process while handling a specially sent response with decoding from
   UTF-8 via the "charset_map" directive, allowing an attacker to cause
   a limited disclosure of worker proccess memory or segmentation fault
   in a worker process (CVE-2026-42934).
*) Security: when using HTTP/3, processing of connection migration might
   cause new QUIC streams to receive a new client address before
   validation, allowing an attacker to cause address spoofing
   (CVE-2026-40460).
*) Security: use-after-free might occur during DNS server response
   processing if the "ssl_ocsp" directive was used, allowing an attacker
   to cause worker process memory corruption or segmentation fault in a
   worker process (CVE-2026-40701).
*) Bugfix: connections with HTTP/2 backends might not be cached when
   using the "proxy_set_body" or "proxy_pass_request_body" directives.
*) Bugfix: proxied HTTP/0.9, SCGI, or uWSGI responses might be
   transferred incorrectly if the first line was not fully read.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.30.0.bb => nginx_1.30.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.0.bb => nginx_1.30.1.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.1.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.30.1.bb
index 139fe24dcd..f774979f89 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.1.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b"
+SRC_URI[sha256sum] = "99765000d974896b31ca5882d8c279ce3fe7ef6f5c6f9f0a967ed7fd3407f9cc"
 

