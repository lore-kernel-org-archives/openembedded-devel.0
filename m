Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C63D5B165
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 20:18:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12627.1765657103889424389
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Dec 2025 12:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYDazkTL;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbab737f5so828455f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 12:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765657102; x=1766261902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYfg14JC3IASQjRi56j+6/m6eceL3+FYsF3snNaZYyA=;
        b=TYDazkTLc5J/iGadAMBrIG1DxzIdLr+jFh1S0PQ2+hLDrHPYgnbJVhIhuYKnR/G91p
         1Mn6cZCRVngZAg/nlFXT+VjsOhtY6bZwB/HtJmppuF9EYNsq9l2a0BorWNfgpUJbRT8s
         DF21s9HXXR9Umn1G8+S/KI6LKMGg7bAJSpFinfaHgOY5/Gqb8lCzuMt45QVcsiyN3MgL
         g66pe200kf/7CrW3rP/bUAZgRFHR7ku8aYLBXcjml3XZW8/CLU8CPK357zkfIr8RxV84
         BJqejvuck2CCCySIZwJgiLoXN6p9UvHjiHLIYjAAJGM5GzVtxjUe5fKsZIkJ/0U7iCk7
         ne8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765657102; x=1766261902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYfg14JC3IASQjRi56j+6/m6eceL3+FYsF3snNaZYyA=;
        b=KMWnahFV0KALAYH2jSt4ZC6nENbLLUxWV0BEP0zsiK8UyhMQArKhPUTEjEyQn1p2gx
         zp/hgnWW53wDPxV2ByKEvgCGUol9AHYmdeuZR5555qgL7F1C2igmb9Kff8KsqjBiz3l4
         Q/Nim3pUXTkXheBbopu2SHD8v++bQrI5Mp+qCSG6V8X4WBjo5Ci/qdOGZJD9qRjqVbLM
         BtuEYJtavHvlAUfOmY5xmBGU1UD5+YRh8I4CfFXShxmO2TD7/mChRlCNvNwpP2Mtlbtn
         3L4NZsAEmlkYWVvj3q+f3BYOnB1QezutCqsSGcOaBlo3tgiqEFFlnOH0Av6G0wFOLKzC
         4l2w==
X-Gm-Message-State: AOJu0YzbzhQZJumSAUUTXiukB7CjEvTT8YdYDWI5DWmAk15Aq6PXX5uH
	lVAFgOIOF447EIPYRDn2kPCfae3NazBY75MH/W6waFB3hjEvXj5+pIcbP5Mcog==
X-Gm-Gg: AY/fxX6Oa8fYR8azRtwSNqCmUKciWQCaLg2U/iOBL3+1HaGT3pX4eNRgs4yMfyL4+s5
	rEGCJ3w+RJwr1InorP4rM7mv4YKTlQsKjsZNLKVVcTCHL+8t8QIdumjWVsO6pFRXGEEtaYPRcOM
	n6aub1iLq1rYzEnWl0gjm4gl3ZVkEdv8qjzWIZexTPjOF/TvK4HODs+YHc4Pnc1pgzFYi0HyB3Z
	lSQTLe0mG4AVAUkxZgEpBxqoHanIN6geydV2Vc3hbqk4A6KwG5Y+LAt2K5/7GSHTnZWnp0h3cJa
	5FFj8dRqZBWWUzOq4V5jY1kK0gojmPenTJ5+tV1Y8hEVOiSxwhDqOG5aHrkmcT9561dVtqJqUah
	eWNydt92w1iTcOh6iVLV3YjC/iv2X7xi0tkssgTRc5Aa4p8IQ7Z1bW88SqFBrN3DwsDnGWTG3Xd
	mIVPCMuFW+
X-Google-Smtp-Source: AGHT+IErAzujLIgOe0yH0THt7rNkKZH0katQuEt9Sx3L8xcqqV+VnqGKe1WeTnXZU/mxWj13uoFemw==
X-Received: by 2002:a05:6000:430d:b0:42f:8816:ee6d with SMTP id ffacd0b85a97d-42fb3efb7c8mr7725300f8f.31.1765657101916;
        Sat, 13 Dec 2025 12:18:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm4309160f8f.38.2025.12.13.12.18.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:18:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/4] znc: patch CVE-2024-39844
Date: Sat, 13 Dec 2025 21:18:17 +0100
Message-ID: <20251213201820.3214133-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 20:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122642

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-39844

Pick the patch that is mentioned in the oss-security[1] advisory

[1]: https://www.openwall.com/lists/oss-security/2024/07/03/9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-irc/znc/znc/CVE-2024-39844.patch  | 61 +++++++++++++++++++
 meta-networking/recipes-irc/znc/znc_1.8.2.bb  |  4 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-irc/znc/znc/CVE-2024-39844.patch

diff --git a/meta-networking/recipes-irc/znc/znc/CVE-2024-39844.patch b/meta-networking/recipes-irc/znc/znc/CVE-2024-39844.patch
new file mode 100644
index 0000000000..de0d8c5541
--- /dev/null
+++ b/meta-networking/recipes-irc/znc/znc/CVE-2024-39844.patch
@@ -0,0 +1,61 @@
+From 5f6c872e44830d41d4d242e241af7b096a62a7c3 Mon Sep 17 00:00:00 2001
+From: Alexey Sokolov <alexey+znc@asokolov.org>
+Date: Mon, 1 Jul 2024 09:59:16 +0100
+Subject: [PATCH] Fix RCE vulnerability in modtcl
+
+Remote attacker could execute arbitrary code embedded into the kick
+reason while kicking someone on a channel.
+
+To mitigate this for existing installations, simply unload the modtcl
+module for every user, if it's loaded.
+Note that only users with admin rights can load modtcl at all.
+
+While at it, also escape the channel name.
+
+Discovered by Johannes Kuhn (DasBrain)
+
+Patch by https://github.com/glguy
+
+CVE-2024-39844
+
+CVE: CVE-2024-39844
+Upstream-Status: Backport [https://github.com/znc/znc/commit/8cbf8d628174ddf23da680f3f117dc54da0eb06e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ modules/modtcl.cpp | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/modules/modtcl.cpp b/modules/modtcl.cpp
+index c64bc43f..58e68f51 100644
+--- a/modules/modtcl.cpp
++++ b/modules/modtcl.cpp
+@@ -248,8 +248,9 @@ class CModTcl : public CModule {
+         // chan specific
+         unsigned int nLength = vChans.size();
+         for (unsigned int n = 0; n < nLength; n++) {
++            CString sChannel = TclEscape(CString(vChans[n]->GetName()));
+             sCommand = "Binds::ProcessNick {" + sOldNick + "} {" + sHost +
+-                       "} - {" + vChans[n]->GetName() + "} {" + sNewNickTmp +
++                       "} - {" + sChannel + "} {" + sNewNickTmp +
+                        "}";
+             int i = Tcl_Eval(interp, sCommand.c_str());
+             if (i != TCL_OK) {
+@@ -260,14 +261,16 @@ class CModTcl : public CModule {
+ 
+     void OnKick(const CNick& OpNick, const CString& sKickedNick, CChan& Channel,
+                 const CString& sMessage) override {
++        CString sMes = TclEscape(sMessage);
+         CString sOpNick = TclEscape(CString(OpNick.GetNick()));
+         CString sNick = TclEscape(sKickedNick);
+         CString sOpHost =
+             TclEscape(CString(OpNick.GetIdent() + "@" + OpNick.GetHost()));
++        CString sChannel = TclEscape(Channel.GetName());
+ 
+         CString sCommand = "Binds::ProcessKick {" + sOpNick + "} {" + sOpHost +
+-                           "} - {" + Channel.GetName() + "} {" + sNick + "} {" +
+-                           sMessage + "}";
++                           "} - {" + sChannel + "} {" + sNick + "} {" +
++                           sMes + "}";
+         int i = Tcl_Eval(interp, sCommand.c_str());
+         if (i != TCL_OK) {
+             PutModule(Tcl_GetStringResult(interp));
diff --git a/meta-networking/recipes-irc/znc/znc_1.8.2.bb b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
index a50431982e..f7a99c876f 100644
--- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl zlib icu"
 
-SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https"
+SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https \
+           file://CVE-2024-39844.patch \
+           "
 
 SRCREV = "bf253640d33d03331310778e001fb6f5aba2989e"
 

