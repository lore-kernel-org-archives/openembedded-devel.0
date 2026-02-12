Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03F2EE3688
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 14:10:34 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46150.1770905426267289913
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 06:10:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kv53Yc04;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso20695455e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 06:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770905425; x=1771510225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHOVIpKwM6BCRNqff/st27eHKgj+guNl9c8XAEF4/W0=;
        b=Kv53Yc04EHODnpcixR+9VaDuO9BbAuPNapfROkLsxoWUD8US98opEmlZG5gNzCJAO3
         Sh3W5mbHQGZYTC5a1iYmDf2FzR+840jfzaS4NW3UnxDt+jnylzbx0Go4QJnS0A0yBoHy
         7ACEN58z8+bx5GPNRukh44R3NyccE+nbNxhZDzNmAtK4vf1UOESr5FeZ21vA009PqikK
         cc4vlaiiNqk0315zrtG/0SOA0WIZlQkldvJow9IFuN9YK5EkqpUoub6ztxXD4mRoJGWb
         9yZTSJw5IkdA8ljM1xiFG/98mnS3zuyrLe2EzL2Tv0l8XylRLrK/S9kiOT2gAqwvTdxb
         A7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770905425; x=1771510225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iHOVIpKwM6BCRNqff/st27eHKgj+guNl9c8XAEF4/W0=;
        b=Rb62msX0VtxPZsvWXZ37dli/1WnHwQRqRskWCWOdMC5ZrzhMRgE1sIB0VDI3d6/v+4
         cGsavHr/FiVXAzAxQQLC6ByNouIPgAV9gGQ5tEpDFg7CMZ/MdaccW78N50cMmmsluwR5
         aeyd1IAaGyfl5jQPufjs8f/XkT8dgbBuVBvBbv9VJc9X1YAu0pcVLR7ZSCTcaO0SPl28
         y63tc7Cq4bjf0A6DvW0VW7+ttDWiTgXxzWbxlbm0wRE4NUxo0IYGX2ddo3FHf5RemfS1
         ek2RpS5Xn8T1tXQZRJ119Y7kdI+gckAyxSak2YehvaHNKj4lmvkH1gePlRMtz3dOvDHs
         aWUA==
X-Gm-Message-State: AOJu0YzrjphuMhhW6Vbd4lLQDpycqBQg9aFnP61F+YbNBFRDosi+udUP
	OhrEFctxfEYUBw6l9UyEHcU04j+I0GjsOVG58Ods9C9gO6lyeG/ZX32sk9wPqw==
X-Gm-Gg: AZuq6aJmH3Ga7LueoqUMWoY913L6D3EtSrogaWoB8vw7zYGiQ4/9udNiJmz4rhFkD1S
	WX+zx58Nz6gAbGIu2ihEL+m7rhoo/LdiUzHxEemyjEkpyGjMYhx7EHXbSTRahz77tozHpXADLm3
	a/Z9a9jhzgVk/u+eakXxSNvgnG4Zn698ZKFxb6bAHITy9WuHx1AqVJrsSamPhDt85WTKtPM8X/Q
	Y7mtYHOr9/uoRF4oBqKD4sKZHv4UnqWXkfnO3DlIchCb4XZnxYQlqORxFpn37PX4XOIg5KY89Rv
	OTvuACquhH2ZFTECBKd3U2mbeulGkA5Cx46ncE3BvloQ1n7TqFSGiG1DXh9N8BpLzsMjuzx7KWU
	ejAcmw2brQoB20YDlVA0ed1K+TgaIHyqKdmuY/6BPAktHXPclQj/zdTAiESFwQ+c4WOHcPDYi/f
	bE5WWQeHLHdzMYzdcl2Di8haxJburaCew=
X-Received: by 2002:a05:600c:896:b0:47e:e051:79ee with SMTP id 5b1f17b1804b1-48365fdec0dmr27919635e9.3.1770905424446;
        Thu, 12 Feb 2026 06:10:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d50f24sm12435260f8f.14.2026.02.12.06.10.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:10:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] nginx: upgrade 1.29.1 -> 1.29.5
Date: Thu, 12 Feb 2026 15:10:22 +0100
Message-ID: <20260212141022.1032677-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212141022.1032677-1-skandigraun@gmail.com>
References: <20260212141022.1032677-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 14:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124357

License-Update: copyright year bump.

Changelog:
1.29.5:
- Security: an attacker might inject plain text data in the response
  from an SSL backend (CVE-2026-1642).
-  Bugfix: use-after-free might occur after switching to the next gRPC
  or HTTP/2 backend.
- Bugfix: an invalid HTTP/2 request might be sent after switching to
  the next upstream.
- Bugfix: a response with multiple ranges might be larger than the
  source response.
- Bugfix: fixed setting HTTP_HOST when proxying to FastCGI, SCGI, and
  uwsgi backends.
- Bugfix: fixed warning when compiling with MSVC 2022 x86.
- Change: the logging level of the "ech_required" SSL error has been
  lowered from "crit" to "info".

1.29.4:
- Feature: the ngx_http_proxy_module supports HTTP/2.
- Feature: Encrypted ClientHello TLS extension support when using
  OpenSSL ECH feature branch; the "ssl_ech_file" directive.
  Thanks to Stephen Farrell.
- Change: validation of host and port in the request line, "Host"
  header field, and ":authority" pseudo-header field has been changed
  to follow RFC 3986.
- Change: now a single LF used as a line terminator in a chunked
  request or response body is considered an error.
- Bugfix: when using HTTP/3 with OpenSSL 3.5.1 or newer a segmentation
  fault might occur in a worker process; the bug had appeared in
  1.29.1.
  Thanks to Jan Svojanovsky.
- Bugfix: a segmentation fault might occur in a worker process if the
 "try_files" directive and "proxy_pass" with a URI were used.

1.29.3:
- Feature: the "add_header_inherit" and "add_trailer_inherit"
  directives.
- Feature: the $request_port and $is_request_port variables.
- Feature: the $ssl_sigalg and $ssl_client_sigalg variables.
- Feature: the "volatile" parameter of the "geo" directive.
- Feature: now certificate compression is available with BoringSSL.
- Bugfix: now certificate compression is disabled with OCSP stapling.

1.29.2
- Feature: now nginx can be built with AWS-LC.
  Thanks Samuel Chiang.
- Bugfix: now the "ssl_protocols" directive works in a virtual server
  different from the default server when using OpenSSL 1.1.1 or newer.
- Bugfix: SSL handshake always failed when using TLSv1.3 with OpenSSL
  and client certificates and resuming a session with a different SNI
  value; the bug had appeared in 1.27.4.
- Bugfix: the "ignoring stale global SSL error" alerts might appear in
  logs when using QUIC and the "ssl_reject_handshake" directive; the
  bug had appeared in 1.29.0.
  Thanks to Vladimir Homutov.
- Bugfix: in delta-seconds processing in the "Cache-Control" backend
  response header line.
- Bugfix: an XCLIENT command didn't use the xtext encoding.
  Thanks to Igor Morgenstern of Aisle Research.
- Bugfix: in SSL certificate caching during reconfiguration.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.29.1.bb => nginx_1.29.5.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.29.1.bb => nginx_1.29.5.bb} (53%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.5.bb
similarity index 53%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.29.5.bb
index c08c8539c4..4536dc018d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.5.bb
@@ -4,7 +4,7 @@ require nginx.inc
 # 1.29.x is the current mainline branches containing all new features
 DEFAULT_PREFERENCE = "-1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "c589f7e7ed801ddbd904afbf3de26ae24eb0cce27c7717a2e94df7fb12d6ad27"
+SRC_URI[sha256sum] = "6744768a4114880f37b13a0443244e731bcb3130c0a065d7e37d8fd589ade374"
 

