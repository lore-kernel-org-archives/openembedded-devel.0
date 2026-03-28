Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BF610BA45E
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 07:30:35 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6940.1774683025381283284
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Mar 2026 00:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NJsNzjzO;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so1490080f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774683024; x=1775287824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aZV8TXSq8G4pfASTMKwbvLr3EMe57QGrUuifx34GMw=;
        b=NJsNzjzOZptbsxT6rm8N4oboCPXbMApx000/m503397Ka8mD8VJVdGd1KPhapvNiIW
         YSM0+nVhaudxznfR8IvBg95EmbCN6b8DDwHPIpC8q1z34sTnlsw/+H5NW9WECgC+i2gm
         8z6lBtvTCs9IQZxqhxzShNY2CunCXkhNzFWRFD3t7/MJUz5o7WCjk9TzyMsdpVlwz2cB
         cTWz0PKD61N75Ic66XKjBqz+b6Jo18hfc13c3bijuY1CIk31dezp7jSVkCQcBBkcat9a
         UgqR7fFlKWTES8pe5YvOtc3IPMETZMBpVcW7SxgDW4ty5GL8zsERwzkMgaoSyLYCkYcz
         tbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774683024; x=1775287824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3aZV8TXSq8G4pfASTMKwbvLr3EMe57QGrUuifx34GMw=;
        b=abkNoMDLUJSdencoj7MvkZWF/TKfYHobrSTLGChu/tuRIMNj3lfA/VpvXRA+mJuc6v
         mNOcSuxq0COjG60t5kbrfAb99Twjwg1PBQjMZvfZ7wHqF66Vcx0oioyjFECQmcpVyg0N
         tQS4Z3xVvj7/B4dWcdkiueL9Psr84Bas2+/TYof8TWgMOcvcdLn0ke9KcZcOKWpRZdp8
         pxXsI2XcKPVW1WVQ7lWQDHMHW/O3s/BB4J/FbE2J4n79XvE1wTy0I9hE7m7/fUAZ5766
         cUVIxCCWTjvqIUUgMb5BUSSOSybCO4NJLC8nozqNiVCRdrWCbmI87JKf/ZtRPPvWLphF
         PnXQ==
X-Gm-Message-State: AOJu0YwIAbvYQJt5PFBVUwBmT347CQFwIK2FMJmUcoWhXev3OAFURY2p
	rcrwIDhjLquTK+CRql+jwlaHpnv4BuAB2zK6dKH5VaXEZ0jUQrxbffZbNxuESg==
X-Gm-Gg: ATEYQzxlI1NlfqRAHNjjPgOuKhnD7yAbRIUh8Xyu+2bglNUMJFT1fi1miIFqmafVGwD
	S9z81maTKtZ9KeLpIaRb8TVtiELfrJDcuTDyIIjp2wZoHn3T3Yzb1QstA7dMEcrKbpLVs4mZvQW
	6x+5w0zPiEFj20c6W3A+OfMUf7/jKXDioHdGi0Dw9TpnluaP0ff9YR749sv3H6ZLWx23ZJWtGBh
	9HD60kIrrcQjqRadfnuzMhPRnuoN9fN7Kuws3AOus3XIxkwhZnvfx2vVE7And9YxRyilS9Cfv73
	FEMJ/wXmf+kCtHWi8oNqaMAY/YBWR2USPdcdLJ3T38fecn2IAbd6aKVfQ20rr7mPTM2zPuPd03L
	3L1Ox38+GgPzU824/JpVzRnqpQfN5z5kx+cptoo8sN7Bdamz2dsLpsSr6676oox9Fhi7FakKCV1
	FhPifNwUflnJfKir2o7NlS
X-Received: by 2002:a05:6000:25c1:b0:43b:4273:a6ce with SMTP id ffacd0b85a97d-43b9e9d9415mr9257993f8f.3.1774683023460;
        Sat, 28 Mar 2026 00:30:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24707f2sm3458347f8f.26.2026.03.28.00.30.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 00:30:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 2/2] nginx: upgrade 1.29.6 -> 1.29.7
Date: Sat, 28 Mar 2026 08:30:21 +0100
Message-ID: <20260328073021.1895690-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328073021.1895690-1-skandigraun@gmail.com>
References: <20260328073021.1895690-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 07:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125800

Changes:
*) Security: a buffer overflow might occur while handling a COPY or MOVE
   request in a location with "alias", allowing an attacker to modify
   the source or destination path outside of the document root
   (CVE-2026-27654).

*) Security: processing of a specially crafted mp4 file by the
   ngx_http_mp4_module on 32-bit platforms might cause a worker process
   crash, or might have potential other impact (CVE-2026-27784).

*) Security: processing of a specially crafted mp4 file by the
   ngx_http_mp4_module might cause a worker process crash, or might have
   potential other impact (CVE-2026-32647).

*) Security: a segmentation fault might occur in a worker process if the
   CRAM-MD5 or APOP authentication methods were used and authentication
   retry was enabled (CVE-2026-27651).

*) Security: an attacker might use PTR DNS records to inject data in
   auth_http requests, as well as in the XCLIENT command in the backend
   SMTP connection (CVE-2026-28753).

*) Security: SSL handshake might succeed despite OCSP rejecting a client
   certificate in the stream module (CVE-2026-28755).

*) Feature: the "multipath" parameter of the "listen" directive.

*) Feature: the "local" parameter of the "keepalive" directive in the
   "upstream" block.
*) Change: now the "keepalive" directive in the "upstream" block is
   enabled by default.
*) Change: now ngx_http_proxy_module supports keepalive by default; the
   default value for "proxy_http_version" is "1.1"; the "Connection"
   proxy header is not sent by default anymore.
*) Bugfix: an invalid HTTP/2 request might be sent after switching to
   the next upstream if buffered body was used in the
   ngx_http_grpc_module.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.29.6.bb => nginx_1.29.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.29.6.bb => nginx_1.29.7.bb} (74%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.6.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
similarity index 74%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.29.6.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index a1e39b6e36..4d884fcbb3 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.6.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "316f298cd9f061d6d0679696152710285b72f75d88eb1f7e323f40c5c52fe0d7"
+SRC_URI[sha256sum] = "673f8fb8c0961c44fbd9410d6161831453609b44063d3f2948253fc2b5692139"
 

