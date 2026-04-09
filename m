Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4039BEA3C5C
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 11:22:42 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129830.1775733742976265804
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 04:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pt3hvof3;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-824c9da9928so922774b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775733742; x=1776338542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV2oBXKgpg38zvLwL8wMTrLbvylol7tMVqZKACZUdLU=;
        b=pt3hvof3ao9mJ9WnjSQbWhufM95xXZm0prUq66XmmdIFpHlNKLotY10tOs968L8/FZ
         ISrmVd2fdNzyudTCLf0ix4hhET8bgru2zZToHdffSCsau8ciSa8Xty7KZisiTt6zsYw/
         DEh/zxdxEkRWadkUOwHc4r+EjsY8bkbaw6tq3EgGDqEMopAHpdpwWBRYbYIsPOTAZM8S
         k5BocTV2y2X5nn2xF17lgqLVQNHt5r+8RubK4tZB0OUDuYhWvdfIev0yC/UE+1mjJBPA
         z3bCrY8rC2PeOCCzN4QsxlQyD575JTIyoGOnEd4AVXK/YMrpfZDbGdvVFyql0S3HBh+T
         STiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775733742; x=1776338542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JV2oBXKgpg38zvLwL8wMTrLbvylol7tMVqZKACZUdLU=;
        b=Uc0IzJmBDMi3RkZUMMERHxDQkJcMkq/9jRk/19Jsh6JNBOE2yDnXfDs6H5TsTZkKdE
         h0xnGzeACRK6QGASjSktgG5TCaCEzPjgDglVirUGiuRN5cMW2BvsvbJam7DkLwOMF3AM
         aHzz8LQuRrikF/2muR+m0MMZ61QsMbZZ60r5GNnK9MGdRSSqklRHz3TvBe2kypKpOQ3S
         cE42FAsK4bnxTJjDAhHJcyO84jVvqjNSagXsuoufMmjX08n5uNwHTqc02uZFQpce3CXe
         hDGAeYBG3qtfSLSzLTqhiyxnLa0gTxX2rK/kOzGcnZZaHWFVxPa1r2Po+u6XYi/BNVe8
         JO3g==
X-Gm-Message-State: AOJu0Yw+Gz4IN/B32v0/JupKdA0TTGRMcCCgisOh/mi2Q+XxhO0iqDve
	YEuqlyp205c3Y1F8E5kiSEOPPlN709PZEAB21JpGGym4YN9m85Fpgj5R/uoHWHmN
X-Gm-Gg: AeBDieup5ouPFfduunDM+Y/7kYhU3BzRsIO0P5rJsEjm76IMjJffHUXxfbspK3PwSiH
	L8Kat7dM0E1OCeNOvQic/g+7xc2eZRDheluerYUiwK6C/jPrNbaazrG30N/Cpx+P/D6EIQGAoud
	5Hixj9w+E9y6AYL7TuI/bseceVdQhF6HugjCzrTr1Tn0Qv5R1MqUru7b61mGDhZg0pdHZG6X/BC
	OMpMUTxeXHYgMM2heAr3xsXGBi6F7dSZSvQRd7j9yRoq9wU4DU6Y2NhhgiNey5LNc4ytLmb0w2X
	6JAfI1Mmn7A9VcWxnzrN5VG+BHsHJMjJBzZokIl6okTb8+l/UzFVIwVi9Qc93j/BGq5vIYLp4ED
	dLAGTz0tDeBFDjemxXDoY7YK45ait4qeBKqtLrTSVh6lF5rntyk/SV0bErywdFpXQyczCZIi5Xh
	fgpr4H4pYlmbEq0IW26tBeEFqwhROSqODRPCo=
X-Received: by 2002:a05:6a00:4fc1:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82d0da3336amr25722143b3a.3.1775733741969;
        Thu, 09 Apr 2026 04:22:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm30046666b3a.19.2026.04.09.04.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:22:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/8] libvncserver: fix CVE-2026-32854
Date: Thu,  9 Apr 2026 23:22:02 +1200
Message-ID: <20260409112208.1119823-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
References: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 11:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126189

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32854

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libvncserver/CVE-2026-32854.patch         | 66 +++++++++++++++++++
 .../libvncserver/libvncserver_0.9.14.bb       |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch
new file mode 100644
index 0000000000..a89026951b
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch
@@ -0,0 +1,66 @@
+From df092d3a89460be3b14a2a07859493a7afafcd1d Mon Sep 17 00:00:00 2001
+From: Kazuma Matsumoto <269371721+y637F9QQ2x@users.noreply.github.com>
+Date: Thu, 19 Mar 2026 17:42:00 +0900
+Subject: [PATCH] libvncserver: fix NULL pointer dereferences in httpd proxy
+ handlers
+
+httpProcessInput() passes the return value of strchr() to atoi()
+and strncmp() without checking for NULL. If a CONNECT request
+contains no colon, or a GET request contains no slash, strchr()
+returns NULL, leading to a segmentation fault.
+
+Add NULL checks before using the strchr() return values.
+
+(cherry picked from commit dc78dee51a7e270e537a541a17befdf2073f5314)
+
+CVE: CVE-2026-32854
+Upstream-Status: Backport [https://github.com/LibVNC/libvncserver/commit/dc78dee51a7e270e537a541a17befdf2073f5314]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libvncserver/httpd.c | 24 ++++++++++++++----------
+ 1 file changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/libvncserver/httpd.c b/libvncserver/httpd.c
+index 96a6eb2b..c066de47 100644
+--- a/libvncserver/httpd.c
++++ b/libvncserver/httpd.c
+@@ -331,10 +331,11 @@ httpProcessInput(rfbScreenInfoPtr rfbScreen)
+ 
+ 
+     /* Process the request. */
+-    if(rfbScreen->httpEnableProxyConnect) {
++if(rfbScreen->httpEnableProxyConnect) {
+ 	const static char* PROXY_OK_STR = "HTTP/1.0 200 OK\r\nContent-Type: octet-stream\r\nPragma: no-cache\r\n\r\n";
+ 	if(!strncmp(buf, "CONNECT ", 8)) {
+-	    if(atoi(strchr(buf, ':')+1)!=rfbScreen->port) {
++	    char *colon = strchr(buf, ':');
++	    if(colon == NULL || atoi(colon+1)!=rfbScreen->port) {
+ 		rfbErr("httpd: CONNECT format invalid.\n");
+ 		rfbWriteExact(&cl,INVALID_REQUEST_STR, strlen(INVALID_REQUEST_STR));
+ 		httpCloseSock(rfbScreen);
+@@ -347,14 +348,17 @@ httpProcessInput(rfbScreenInfoPtr rfbScreen)
+ 	    rfbScreen->httpSock = RFB_INVALID_SOCKET;
+ 	    return;
+ 	}
+-	if (!strncmp(buf, "GET ",4) && !strncmp(strchr(buf,'/'),"/proxied.connection HTTP/1.", 27)) {
+-	    /* proxy connection */
+-	    rfbLog("httpd: client asked for /proxied.connection\n");
+-	    rfbWriteExact(&cl,PROXY_OK_STR,strlen(PROXY_OK_STR));
+-	    rfbNewClientConnection(rfbScreen,rfbScreen->httpSock);
+-	    rfbScreen->httpSock = RFB_INVALID_SOCKET;
+-	    return;
+-	}	   
++	if (!strncmp(buf, "GET ",4)) {
++	    char *slash = strchr(buf, '/');
++	    if (slash != NULL && !strncmp(slash,"/proxied.connection HTTP/1.", 27)) {
++		/* proxy connection */
++		rfbLog("httpd: client asked for /proxied.connection\n");
++		rfbWriteExact(&cl,PROXY_OK_STR,strlen(PROXY_OK_STR));
++		rfbNewClientConnection(rfbScreen,rfbScreen->httpSock);
++		rfbScreen->httpSock = RFB_INVALID_SOCKET;
++		return;
++	    }
++	}
+     }
+ 
+     if (strncmp(buf, "GET ", 4)) {
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
index 11efd7cc0f..6ef10b5037 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
@@ -46,6 +46,7 @@ inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https \
            file://CVE-2026-32853.patch \
+           file://CVE-2026-32854.patch \
 "
 SRCREV = "10e9eb75f73e973725dc75c373de5d89807af028"
 

