Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1952.1795113483240883212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JXcITtTd;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a05b210703so84590b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113482; x=1795718282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+W+3ebitfH7Z2kx9Dq0ky1ws67GrYQknPDAcWL2i/bE=;
        b=JXcITtTdG8jluT4ADs6crKM5lZRIvkVu+mV7pxDc+BvK/2SCNZqxH15GmMdxcE8gQi
         Jnd4hASJMcMYiEm/AUMu54thlMvliP55p+oggNfd9INhvL2VNagYXsiCuVFp09aN8or+
         FqU2rb4KSEwKrEIWpHJ27KobliIFc+GOnRM7bG6TX6BwPAP0+oVPensBJvsIywgIshE6
         e6nQxtuVSs7boi1X5FP7zQwL9nLSOV/d1uDfieCoNYvd0mQWn17/1L4BJ8PLSGzyM5ht
         ev2a9zaN2CcE3dfz8IsjrC8bmfNrhmBW0CzoxdSLfnH+yg5DvN//N8qKNhvh+cwnkbV2
         vOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113482; x=1795718282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+W+3ebitfH7Z2kx9Dq0ky1ws67GrYQknPDAcWL2i/bE=;
        b=ZkEb9cArJjMlo+B0wzajRGRcCazDNLMQSn2wihrFwEiuICik2UADMGgpVSLYnzH2E7
         zDjS/vnxjyfufqzsQpvY5UYN5DFz8yoo5O6s++/rIK28GZanHO+AK/zjG1skXpTUSS1f
         wH2lEEPgtgZmFXoLi74yASOvUDD0xU7qQGyxIC93N8/Wc0Wc8p3LrHJUt+4VCynEadRT
         Td0XpvtcnWyJT3LBQ/zM4GVHCyUNAFjlMIJYcsYO8ZEVTkhvosRR5LOzVp81KaILY+R5
         6jb89yhuqQphNiJR97UTKezVRIyIkDYYZqLifjTJh78c3yYP/HB8dJYTsrgLbk8PRxyP
         RZVg==
X-Gm-Message-State: APuU4Z+ld8H+enWjXs5rGLKMMUt5K+42jesVtvCfRZrzDCk2rTNkDGhs
	7F9VydNk6nwZ24+hg3Fe8oSexluS4B8VPyJ7PbE2u/aMNQr9UwkgZDxpRf+bBg==
X-Gm-Gg: AYBFou3P93wCb8+43SpMFS1N1REwN+uU15qlH+zjA5V6OjK44RSzrruRwmwwauw+7Hz
	weYv/b3hNKf6L1Yo2V9qf7twn4IMXCW4e3tBcCjq+f66EY/VQrwnSrwaGLChV4d0kaemQFYz3aE
	QtT3LsF5asNlGIUoUhOYuhuJapoiB9WmVnoWWaY6Eq/KXxDjZtyJ1JySd+Ci5k98mk0RjdQv9Uv
	jkw7tBV54s4qdhClolKohfH0GV6pO818Cnu7qGAOToqmIEdvlM4pD3Ruu5pDEYhlv/ojtqGosAf
	m+FkqailbDnKBpU7Xvs4hz/2mfpn0mMj224wDdP49jGR5kuROHUP1psDhN9WMbdcCs0B/Wr/qhf
	kA9FGLeXxD1J9eli9lNAgDs3xcLWjMPCZD7IYwW3NrFsSZsSJX3IRj8euBPzAcrbuWE4T/FtjuG
	EZlTMdy4+HtL9scgfmLwQmoSRQTw0BFtEfs3YiknGElLcOWAMjKFGI7CBaNL+1kTrSugGlbKJ9Q
	FB/2cpgi5WTVuUvUp6E8Ufjk2aoTuDyLdrBMDFbR8MykIG99ALSXhPlAB8+AuU5nme8CpRFePHs
	nRdcr6jQdtYim5ajppE8duRedikX3NaKI7HOxvH7abNyaaQRs5R70yiWk05DDw==
X-Received: by 2002:a05:6a00:14c3:b0:8bb:1a7b:bb8 with SMTP id d2e1a72fcca58-8c8792b690fmr518634b3a.3.1795113482497;
        Thu, 19 Nov 2026 10:38:02 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 51/64] python3-filelock: upgrade 4.0.4 -> 4.0.12
Date: Fri, 20 Nov 2026 07:33:19 +1300
Message-ID: <89c4b589ef10fd32741a8424357c440df41f70f9.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132741
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-5
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-6
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-7
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-8
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-9
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-10
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-11
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-12

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-filelock_4.0.4.bb => python3-filelock_4.0.12.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_4.0.4.bb => python3-filelock_4.0.12.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb b/meta-python/recipes-devtools/python/python3-filelock_4.0.12.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb
rename to meta-python/recipes-devtools/python/python3-filelock_4.0.12.bb
index 23cc4484c8..cfb84f1c7e 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.0.12.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "90999ed63a26ccf86b93b959ab10cf1017f422d816be454ed54cbed263e71ab5"
+SRC_URI[sha256sum] = "cf42711a7ac791818b299fab0332a088c65aeeefa36290de98db92c434303b0c"
 
 BBCLASSEXTEND = "native nativesdk"
 
