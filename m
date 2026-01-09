Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9577D167E6
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:16 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6700.1767950953437624266
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TZjnglpA;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a110548cdeso30837705ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950952; x=1768555752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=De8mEBknrViMR15fiRNFcb3vcE4qmlm5OwVm3+BWGkw=;
        b=TZjnglpAns2MC39izhTAkEnuP5bVC9XXNzEoz2MOkDis5wAKKYiKfkUKKMac6z3wd+
         qZYEkFv0K/YfosY6+hqpJUWSDcVEM/dG9OPe8IO7QW6j7d9TNjr4ts2C1Ha/uQwUfMO8
         IUhqzIu21sVWygX/7/ZMEnsIPyQ2fUlHLNEjJRWgHbtAPJ6lxZA3zoI3lASDGrAylfBy
         aU2/L33KEu8/4wK1IFZ7eU7ZWjZ+hLmhXCwP6Yjd7qJ3Sf37zINsxKJog1xrHsgZCasv
         I7OTSW0a0cVIPbs0D5xbKOJ9jTadUiqZ6Z0CmAoS3UhWBT2/NSpW0Do2Lx9kfqAPKAfW
         fk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950952; x=1768555752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=De8mEBknrViMR15fiRNFcb3vcE4qmlm5OwVm3+BWGkw=;
        b=SsdxTHHyGziritwza+soqYx7BcE4+BpukyXjXSftdDBGAP9kWuVkrjzk9D1zQ3+kif
         YseBzYKM+W4eitvXfVYtHf2FauhTesoECPReEuHvNXgQevWu2RsMR+j6Xkawvqd5twC5
         j5GsliPk5wMHyckhAnyC8Ng2AWSak3iVCfzKqQj10ObUwpYr+wROjZPm+R4NKT1K9PT7
         AW+n23YV+FYPzDmuGRXVQW/6NTB9OKhBx6E7wNBSNGkJ5FziqMMW1Rpbieb6lQHHhZi6
         6egwp3RqELME76pxSr2oMbqxlkN7Uw6PN/hzMQXF6XiTB7eR1ukUU0d7eSzoB2s3eiOP
         Yn1Q==
X-Gm-Message-State: AOJu0YwczihI7Cu/7+J5oMBSH8a0oK5IZ7BEhTV/5pDI2lODlava45zl
	pNF+bVlDDwg3RB+Avmgu4RGOBGOXo6J1YCiOvGRS0nUmQfsZl/AZNQCx/arEdA==
X-Gm-Gg: AY/fxX7YK5pMl2qHyitoDENoz9glSeIoi8SnS3p9HB6psml2L+kLn4L8wTottLEV0Px
	Am35FSspapUjfIcLTW1HdmLRdlyUKLKcj9pJ2LmFRfuhf6MfK4J93uE1KjFIcm2eG2luuQvJuIc
	aFLxHh9gWgeDp1KRP/ImasqD/yaUD2gaY3hiS5a8NmYGSTlhYg+9DAeq3gqt5YWElERJS0hfYhD
	/gqgruzB6h1U+OmfcXHOoFAhKvf2U5T66XOgQXBQkzNkUKFrnN4qCwzDAT8DtglNaIQUMfuAjg+
	G/mFXP6m0Sm5+QYovXwDA1S5UAedfRu59UnTyLfzqVVw6siun4uJNSwsunxuX5lEieSNpAgUvIl
	lhmP0ePHTaHkTp55Y1hSVs0w4ZRSdSde8CHXcJgFBHqgP8jQALj1BOsxJIJy53BAD72FaSgwyqy
	16rsRmqOaXXznFKTnZRetphIs=
X-Google-Smtp-Source: AGHT+IFNj10V72DpZMc0B40eF3n1OljLqJsoEhwWZJr/67TGk8LbgKfNc+7h//OIc5ayju7L0rlZgw==
X-Received: by 2002:a17:903:17c6:b0:297:cf96:45bd with SMTP id d9443c01a7336-2a3ee45d830mr85092555ad.19.1767950952493;
        Fri, 09 Jan 2026 01:29:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 09/12] znc: patch CVE-2024-39844
Date: Fri,  9 Jan 2026 22:28:39 +1300
Message-ID: <20260109092843.1924568-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123287

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-39844

Backport commit[1] from https://github.com/znc/znc/releases/tag/znc-1.9.1
[1] https://github.com/znc/znc/commit/8cbf8d628174ddf23da680f3f117dc54da0eb06e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-irc/znc/znc/CVE-2024-39844.patch  | 62 +++++++++++++++++++
 meta-networking/recipes-irc/znc/znc_1.8.2.bb  |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-networking/recipes-irc/znc/znc/CVE-2024-39844.patch

diff --git a/meta-networking/recipes-irc/znc/znc/CVE-2024-39844.patch b/meta-networking/recipes-irc/znc/znc/CVE-2024-39844.patch
new file mode 100644
index 0000000000..cf9486791c
--- /dev/null
+++ b/meta-networking/recipes-irc/znc/znc/CVE-2024-39844.patch
@@ -0,0 +1,62 @@
+From d3867e667ec813a448a0845087a8d87bad58402d Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 8cbf8d628174ddf23da680f3f117dc54da0eb06e)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
index 68dd0702f7..9901344601 100644
--- a/meta-networking/recipes-irc/znc/znc_1.8.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.8.2.bb
@@ -7,6 +7,7 @@ DEPENDS = "openssl zlib icu"
 
 SRC_URI = "git://github.com/znc/znc.git;name=znc;branch=master;protocol=https \
            git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket;branch=master;protocol=https \
+           file://CVE-2024-39844.patch \
           "
 SRCREV_znc = "bf253640d33d03331310778e001fb6f5aba2989e"
 SRCREV_Csocket = "e8d9e0bb248c521c2c7fa01e1c6a116d929c41b4"

