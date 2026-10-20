Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4899.1792494250653269779
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 04:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XWD6g/Fj;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso2001561a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 04:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792494250; x=1793099050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7IcKFN+mRbxB0Jt7GDfhFlCKIprJx/reEIRujSdvTg=;
        b=XWD6g/Fjy4T7JzxAfnqVGM8J+a4VWmZmpMKm4Imir1k7Kr28C9G5h46/Nl548lPDKT
         w3xyKRBmGXlgoXuXFtLcyofIBVowCikI96mVJBNd9e+jcrUE/zXP21t87u5r2xDXhTii
         tMO2CSWe7mxdjG0lQC7HLomyGHvdbaCXGVpkLKSYGNb+UKUt0YJ8rSuHX/oQ/89OGo5w
         uNv/T3ecvIiuzaQ1XiF/LfF8VqQ35J879fto5Xebi5jkd71vQXJa0b+5GEH8x5X7ttgz
         JGIx41FS2gsxZTN2PPaDJJFyvbmCe1bIjv1wQm38qJ5pUr3L66LCghHckDnAvLrS8zUS
         nbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494250; x=1793099050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I7IcKFN+mRbxB0Jt7GDfhFlCKIprJx/reEIRujSdvTg=;
        b=cEHx49SNNd/uILrhH3z4aXbhbuTLjfO4ZF/Ay7VibB2vpHGcDN+RtvdnJWL1cU/GIR
         M7kHgE+l8ZbQBa+1pKbh++WMC/oosBjDL12D1ArkFdiZNIOGD/kMFeI5TBEryeHS3Yg+
         2Fwp4yqRyL/av0SsW11xIQLy3ijxIsuMZQkYZDtQucrY23vGXzMlxXSwCt/MufiBWT/F
         C4UIwOi8FOarSDaK9tHN1gCe7YocWzqQCWIr+VdoTHmURIYnsNcIIbTyZhMREF2rkZn2
         xRZ4oZPy2lOXtAtFIXQ8tFXfFYYdAtIapiwbLJxMhJXFoAsKYhH5RsL9SIHuPYLQ4Z+T
         irZA==
X-Gm-Message-State: AFq9FYIiSt0lA/JRma5TnLUVT5cmfYs2jzagAuDJOXk2uJN8kYyNrMcM
	lMXtgTEYL6F95XTkI5AjjuiUIjKYZftz/4HghB9+cj8rT6rLTLD8VSAX6SSPpg==
X-Gm-Gg: AYBFou1JhSy59iCklSgWRmssEruWgvh6H4Ur1Yzl2f7eCHK3mAubJGNynppP5wz/IcY
	/hZ0ycrMa7zu74CuwFi+Eq+nDUduXrFMAGJWqXrYgAHTxDYvzHuftniYdkbXWM++tGKXGSSkdom
	nJnUi+2SCEO2A+ZVNRAcHUhMj2YA0d9V7Y2yeSP81hWUOtpvQ0lnbmemJh/qgzfJTK9DmPUI13P
	qfHwpYNCksETkq2PyQTEZwNvTMlDX3CbmvDZts0tztCTfRfzpTChMJylkJHgDD31kDBMfUMKqKB
	difkFGdbMtasKsUDpFDf5KGlG/Mz9XPlGAPg6uTqi7y1CK28JiaGVE4LcS8mCs2ibykkUvL+Wvw
	dtXJ8HYG9gFLQCzBLXhwIlSRygLM+yUMiacuIONPW+A3DZ9Op8Od9pzY5pLWjyCEtYagfZNZVaw
	1FXMJ+/6XAMKjATQJEDa500CT6ZoUXkpwQiXD641rglYko8c5K6fIPyuMMz92RJmeWXQDQTl5iv
	meyRSgey0NCKjM+VcL3TxVb9XtHlRhXNqSSVSv0HcrLLXU1TnrGcdDx/xJttXknbm86QGvNyBhw
	5mbAD1JCumXI3fAzhPJ+Kj+pReGxWczae75V0cWBopON4d2X36YG
X-Received: by 2002:a17:90b:3b8e:b0:3ac:a7ee:6766 with SMTP id 98e67ed59e1d1-3acef0e4f2cmr8750392a91.36.1792494249697;
        Tue, 20 Oct 2026 04:04:09 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f2c785sm3046683a91.7.2026.10.20.04.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:04:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/4] libvncserver: patch CVE-2026-32854
Date: Wed, 21 Oct 2026 00:03:55 +1300
Message-ID: <20261020110357.1995120-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020110357.1995120-1-ankur.tyagi85@gmail.com>
References: <20261020110357.1995120-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 11:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131156
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-32854

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libvncserver/CVE-2026-32854.patch         | 66 +++++++++++++++++++
 .../libvncserver/libvncserver_0.9.15.bb       |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch
new file mode 100644
index 0000000000..85adf3eba2
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch
@@ -0,0 +1,66 @@
+From bf01ccc67bc8181568af2d1f6e1f6f6888b51bde Mon Sep 17 00:00:00 2001
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
+ src/libvncserver/httpd.c | 24 ++++++++++++++----------
+ 1 file changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/src/libvncserver/httpd.c b/src/libvncserver/httpd.c
+index 2186ae54..604e5bf9 100644
+--- a/src/libvncserver/httpd.c
++++ b/src/libvncserver/httpd.c
+@@ -337,10 +337,11 @@ httpProcessInput(rfbScreenInfoPtr rfbScreen)
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
+@@ -353,14 +354,17 @@ httpProcessInput(rfbScreenInfoPtr rfbScreen)
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
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
index 47e42cd094..9fbec58c72 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
@@ -47,6 +47,7 @@ inherit cmake pkgconfig
 SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https;tag=LibVNCServer-${PV} \
            file://0001-CMake-require-at-least-CMake-3.5.patch \
            file://CVE-2026-44988.patch \
+           file://CVE-2026-32854.patch \
 "
 SRCREV = "9b54b1ec32731bd23158ca014dc18014db4194c3"
 
