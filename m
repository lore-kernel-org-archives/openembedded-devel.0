Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7568.1792575042054909728
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NRLn0PKr;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-17bc533fda3so634476c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575041; x=1793179841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7IcKFN+mRbxB0Jt7GDfhFlCKIprJx/reEIRujSdvTg=;
        b=NRLn0PKrQPWceNBqt/qmgdbzbg66yhIgF0XHXn2I2uXJliGlE1xn5RLdNJfMUJgans
         DHTWINCTWu8tGSCIugwV9jnEoXfrQERGhX3FSqig6d+/urhjX4dbt8XcM2rENMU+Ahl4
         fCa3U3gnA0ZmJBEnvceNaJ/vTYeBXuAkEnoPyWhCfR1YRqg0Aw25YLbPTNeWy/PLBUXy
         rBul40qNDnThVQ2lszyIgrALP3JDj0+DmxA7HHMFuTNlR/k7ac8J/sAhUx8GBpBkzVUq
         8D9JiUWQLNN0IG9QBKpWwzsBHWOd/p1SAQpYnUPF4cGELOvmKzJYt4BRiEziGl2wqHbV
         O6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575041; x=1793179841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I7IcKFN+mRbxB0Jt7GDfhFlCKIprJx/reEIRujSdvTg=;
        b=TkGlINPcpyBIWW89Mu6JJcm3jjjDX1YnXDLiDPtkpHIRb1Pr/uEY7HZn+e/myOWQi3
         3tT67dFg0RjXhQHrNKsVW655sLkl3DLQPRdClLhEBeCDKoTVULQbz+lOUOppjqFJmvlB
         WUdwsHsEalAMdYvIRQ9w03uj4V3JQM54PVXw6mnecxvVo032aDD5YlGjVzndW8wDkQ0J
         oiOgXzFMi47r6oQrIWfieUCvAvgcNfVQdxa5SEsdqXB7jbtGL2N68v5dpS5iHa+Ylej1
         6fmscOuGMcjtA/Dg2F8HasR5g/DphMN+jdYBSalu0PRcP8UaRyDfQi1CreUJ40DZ/pYH
         3u+A==
X-Gm-Message-State: AFq9FYIum8xRQEe5HC5yR0joJ+FVEaWx6UCY3Rdp/8a5/hyDgmWxnUuI
	PjRG7uOYh53sPZM9z3ASfZzjkBYPiTkETHgptjt8T0QqiyaUTybuRBjHIs/SlQ==
X-Gm-Gg: AYBFou19yv9ggX7xoHUfrFD3A7kPOqIarIzQJ+sbxj2JWClmD8pqkLuvll4hKynB84u
	x1kBuVz7fejnEpPJFIduxdnkf8k+lY63D0N+rEpdNVCIc5yvNvCTyHfIqfQC6GidlGi+FSD7Lsn
	bYMNgzrhtXgA4xGkO5vS5iv2M/pG1ArVkWomrkb3aewsRrmaewjBQmM4PZMswj40LDAuLsN0Ctd
	JhJmUDojrrs2fH4b03g9Na0WhAnCEaBQi2sdV6zs+uFvfWyIAR2gTciaTusYCHyJBHniWu7Wvly
	pRSjGwacBDqOCChPiAPR7n3ysv5vjYqdz2mlwLfgpwz+IMHdvXKUAd9f+A479qC+7n9wlonz/k2
	aLganbQyjeNWjNK0zZpbwLr0o/QVqBxN+9Bjx2ZunFSBK/A7Bt/6+CuaBVZ3GYSERJdVTV1BhKF
	M7PA75d9MBxnSCe6mUszgSkSseL50mKRkdeRtLiER1er8/+iVq+QgHVoieqm5ysBc2KksOJFpfp
	4Ha+wfPj5DJpqihMOmjSAZLNBII/lgKXb53qNRTejeKSO7LgKWi1hFO4DdRz5hyoFDrqwz/inHF
	R+SxezbDByYllYaOJxy8LTGfZgKgQwE=
X-Received: by 2002:a05:7022:92a:b0:188:88b3:abda with SMTP id a92af1059eb24-190a7196006mr2551295c88.30.1792575041166;
        Wed, 21 Oct 2026 02:30:41 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 41/44] libvncserver: patch CVE-2026-32854
Date: Wed, 21 Oct 2026 22:28:54 +1300
Message-ID: <20261021092857.3585453-41-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131228
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
 
