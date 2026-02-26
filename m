Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDDCFCE09C
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:46:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71624.1772117188019655133
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BYO5dxON;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48371119eacso11108265e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 06:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117186; x=1772721986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0n5Zm6xAaNpx93xvcy+tmEIoJD5gyfBXO8fx/+aWYUM=;
        b=BYO5dxONzmMUCh49jZfpUBQE2o9I6yUjVXjl6U3g4BWQ2BDbBmMaF4t06Jw5K0nE6J
         oxYpC5WqGDiqkCrLLoQ568tyXMabtE8hKCtABc1UQI+agfdrZc7BlfUR7FRUlMlCHK4k
         jRU7Z7b0r3BSxJS2Uvg9rgNqUft5fxK3BNsK1Bp8JFjKakxVsIKVItq/EEZjtsq5O60l
         ITjFI+PE1dayjhVX6/yZ7XNd+iFInkW3oOgV4pG7wXGyAV7OArepFqOgLVJYMN/ecg0e
         wBIyoqLaB/Ppv08wQQsWdhLiiVfBrfWMNrLAP3lBYaLjs8yv9n1urqzUsZfDIR7IhwB5
         MU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117186; x=1772721986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0n5Zm6xAaNpx93xvcy+tmEIoJD5gyfBXO8fx/+aWYUM=;
        b=aW3QypCjfjaIa/chf+RXQJiMnJGMorFk2f9X0Bi/49tug3SIy+oU+w0KBSrpSdzYHp
         RzAYwH5syLR12axhAak47Gz0Z8RuCI9hUBeQitI/GzmEbIEwdCrrMCCdmPDdXj0c+BOS
         mQsIJ/j0DRYCbl2NrDme/53xbPPLilUW0tj6ODEHybsQ6QJW3c/zIUCYzrPjr84gf5T5
         mGw9btZ4VgDENdT+be7Vel+sJnlO/cKMdygVUWvefDu9+Ag2IMAQGLHH/1nNQKGfqvsQ
         mowWTQsfpMwoSg6sPG6Fr+gCuw7OKprca5AITVEJ3wEvDGhnJXih8em5OEKgck0l2auk
         LYdQ==
X-Gm-Message-State: AOJu0YyyDszEYxhsOKCJfqlGnjr5ttEqjKjfHXenOmlDkydTMLX+f3gB
	8YH5O24ct2pp40SmDLilzglGlKEMhODTRCKi4bGkMiY3ifI7ZOQLpb4X7vOLHQ==
X-Gm-Gg: ATEYQzzbsuolwJAp9FbZ/8eZSFm7ayRD3ocy0aciUNR+/1aDfHvYBv4ZmGshcZhgYmQ
	yhXutXCPAd2ZdpXLIu4ILRg6aBC+ozC2eGaZxk6edYLMahnQhCWfIF/RQl8e6ChwLDgxjMS0jcq
	upPdZLSuF+rdgC2XMJVLAfmKq5liVgYkmT0//twX5eCUU+SiT2MdLBZHu6u6GQdrhmXrLjCb/3Z
	hzbvxxZ7syEvBDK/QwK6lWpCgcvs1BU8AcObN6XSuX34/3AugQS33kbdBkO7Uypu3bOoGAPU3TV
	n3my+5Igx5nZM0jmpSWINlvtKVTap+gInSvbiZMGOR3kO84Sth2nVULL4+pUvmBY0kVfUHBvClD
	ai2gu52MbVpQ7l2KkoAp5aTeUYn7L2TWW+ssKJ34VVCHSccZrkLs4IqDf52MwDAcHaQ9rEDEuaA
	xMRIM5poAaj0DEp+Yxb+IV
X-Received: by 2002:a05:600c:8b6c:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-483c3da0b6amr36090305e9.6.1772117186133;
        Thu, 26 Feb 2026 06:46:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbd781sm75913745e9.8.2026.02.26.06.46.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:46:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/7] dante: patch CVE-2024-54662
Date: Thu, 26 Feb 2026 15:46:19 +0100
Message-ID: <20260226144624.3743168-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226144624.3743168-1-skandigraun@gmail.com>
References: <20260226144624.3743168-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 14:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124679

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-54662

This backported patch was taken from upstream's website[1],
where they identify it as the solution for this vulnerability

[1]: https://www.inet.no/dante/ (bottom, "advisories" section)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dante/dante/CVE-2024-54662.patch          | 71 +++++++++++++++++++
 .../recipes-protocols/dante/dante_1.4.1.bb    |  3 +-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/dante/dante/CVE-2024-54662.patch

diff --git a/meta-networking/recipes-protocols/dante/dante/CVE-2024-54662.patch b/meta-networking/recipes-protocols/dante/dante/CVE-2024-54662.patch
new file mode 100644
index 0000000000..6ed7380410
--- /dev/null
+++ b/meta-networking/recipes-protocols/dante/dante/CVE-2024-54662.patch
@@ -0,0 +1,71 @@
+From afedc6d8e518e4675be55557322710136a9e17a4 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 26 Feb 2026 14:34:07 +0100
+Subject: [PATCH] fix CVE-2024-54662
+
+This patch fixes CVE-2024-54662.
+
+Description: Dante 1.4.0 through 1.4.3 (fixed in 1.4.4) has incorrect
+access control for some sockd.conf configurations involving socksmethod.
+
+CVE: CVE-2024-54662
+Upstream-Status: Backport [https://www.inet.no/dante/advisory-2024-12-16.patch]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ sockd/sockd_protocol.c | 29 +++++++++++++++++++++++++----
+ 1 file changed, 25 insertions(+), 4 deletions(-)
+
+diff --git a/sockd/sockd_protocol.c b/sockd/sockd_protocol.c
+index d7b9405..1ea973a 100644
+--- a/sockd/sockd_protocol.c
++++ b/sockd/sockd_protocol.c
+@@ -428,6 +428,7 @@ recv_v4req (s, request, state)
+    request_t *request;
+    negotiate_state_t *state;
+ {
++   rule_t *crule;
+ 
+    /*
+     * v4 request:
+@@ -440,6 +441,26 @@ recv_v4req (s, request, state)
+    /*
+     * No methods supported in v4.
+     */
++
++   SASSERTX(state->crule != NULL);
++
++   crule = (rule_t *)state->crule;
++
++   if (crule->state.smethodc > 0 
++   &&  crule->state.smethodv[0] != AUTHMETHOD_NONE) {
++      snprintf(state->emsg, sizeof(state->emsg),
++              "client-rule overrides prefered SOCKS authentication to use for "
++              "matching clients to be %s\"%s\", but connected client "
++              "is using SOCKS v4, which does not support any authentication",
++              crule->state.smethodc == 1 ? "" : "one of ",
++              methods2string(crule->state.smethodc, 
++                             crule->state.smethodv,
++                             NULL,
++                             0));
++
++      return NEGOTIATE_ERROR;
++   }
++
+    request->auth->method = AUTHMETHOD_NONE;
+ 
+    /* CD */
+@@ -555,10 +576,10 @@ recv_methods(s, request, state)
+       default: {
+          /*
+           * Socks-methods that can be decided for use before we receive
+-          * the actual request.  Normally only gssapi, but if the
+-          * rule has singleauth enabled and the client matches the
+-          * criteria for it, the socks-method will also have been
+-          * chosen already (should be NONE).
++          * the actual request.  Normally only gssapi, but if the rule has 
++          * singleauth enabled and the client matches the criteria for it, 
++          * the socks-method will also have been chosen already (should be 
++          * NONE).
+           */
+          size_t i;
+ 
diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
index 48f9708560..522411be4f 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
@@ -12,7 +12,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=221118dda731fe93a85d0ed973467249"
 
 SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
-          "
+           file://CVE-2024-54662.patch \
+           "
 SRC_URI[md5sum] = "68c2ce12119e12cea11a90c7a80efa8f"
 SRC_URI[sha256sum] = "b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d804b50b48f261c4f53"
 

