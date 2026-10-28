Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36069.1793161544062618088
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gcJZEdS+;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so452838a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161543; x=1793766343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7IcKFN+mRbxB0Jt7GDfhFlCKIprJx/reEIRujSdvTg=;
        b=gcJZEdS+LCSFoBKFLDXado4Ljcc2amLbQe6FK2TGvRRP61xRLCxoUu0Cu1L9GHsKeH
         bnxxKWwxSMsnwN+VhGnu+dWrzG8feoHJs1vbHhDU/CN/UFJM2eAiZAcrEnJ0rZaSDZCs
         brdkIrYprJ8OWm+KXrBBZxIxHqyQPEVRhqgOoT8SlPC9xRXk25eOwqgNYfSGOAfO+MFf
         9VzJp8kPl+EhWL7ylcWOBKX7N3Rpoh7o361gCeybBu4J9gO0rSFWFI+BvDdk/Uxgaw5N
         /D2s3UfR56eoSWAnuCmPGqvN9H8WCRmEMW4ALjhcY9gSp0DUy3Nvqb6TK4IrsEc1ubDC
         52KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161543; x=1793766343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I7IcKFN+mRbxB0Jt7GDfhFlCKIprJx/reEIRujSdvTg=;
        b=PIO9pHTt43aKp4xHdZPV9svxtoSV/eDqzclLaKGJ96ZrG4mrZal2clwV7idBpq33cO
         k/H9HS+13NnXOM22EomRxAmH38Sg0O4mgwniAlPDj/yhBH+/iNgjcos+1uwZP60KSFi3
         b0XhwLGnBif4vO4Iymx5LjczahJNVgGcbOfHyP9WuUyzNpoc4gw4PxsXenqUTL9j+y11
         jLRCBWmwnNye8TZ+YAZqXV40ouNdpsR0w3ekMKyoldiwXf0w8TtSLwjAi6TDuMovPnr1
         QeX9ij8XLksvOTOAmN1LMa0maezNenUlcvxfp8yZaNusFj0644mbKlsrWVD9MS+417TI
         3YGg==
X-Gm-Message-State: AFq9FYJmWE9dunU2Nw3/yJtxsrpGYYl+XLjrk4NB73/8YTXDEHkY/6Bu
	TxJijNBtIsxHlZgEv9rVttKY66viSE1c1qixlL+lNypT20hJt0iiSwUkRT9qyQ==
X-Gm-Gg: AYBFou2mFMdCF9Ay8nDH3FW7elzvg/6C7vCuKXNAhmjzfiash2S2P8qbbl2B4qpmkoD
	KXvOuFpDwQu+r8lEf6mfq18h/p+KtLInA/CJvE62dqbDnvY3h6xqqRi9wCBUlNVvtOOM9+arzMW
	5GsuUhiLNspkjw5rBgpgMUei2ATG+5jodnN1OvXWnyK6VW8SPmxpc1iqmMjiRSMM2k8ZoPYNWbI
	28yNpnS2T76lXiIZXrICkSoT1qRlbTuCTapoC8Qnh42UMAWsPQLyy0xkPtaaVXFpLFm6SpM2E6z
	qIUemQcTCleWQZiNbd8pt4AG4x4B/YsbzFvRTJN6mXOCop05wDgodWpPax5aHAVEv0Vwsco/Eok
	dX+Bn/4e+GPfVWU2xS6jnkqImn7RqPI15gzg8B2xR0wma8rjUclBfhnR0N5BOHH+K0KvTrQwmei
	nRO19UDEai5V9vPS2WptG1rvqSydR07RW2pr6WIHspAnjKTSQhpdQBIYx15YEZjk2BU/j/do9Yi
	AvlrWE/DaIsbe6PYsaZ1cW9O3ecg7Zri4vfVEnHTxgyLGbduKUg/6IyuzicdMmX45A2TzmkZB+K
	tTPO5aUc8CIjapc5yvElymUgQXCW5EFh4202X1dizDrWs3wuF+ffUJmu77JbKA==
X-Received: by 2002:a17:90b:582e:b0:3a8:878:ebab with SMTP id 98e67ed59e1d1-3ae580a0835mr872287a91.35.1793161543365;
        Tue, 27 Oct 2026 21:25:43 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 41/60] libvncserver: patch CVE-2026-32854
Date: Wed, 28 Oct 2026 17:23:39 +1300
Message-ID: <3f2eb98cd85e201fb921e969be9a73f3a143eb6e.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131593
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
 
