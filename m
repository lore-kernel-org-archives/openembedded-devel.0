Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68C3C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 15:50:14 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.19472.1715701805127671633
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 08:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cF6t0v2L;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-572d2461001so382744a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715701803; x=1716306603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gv+131uf/+zTE0wvk5WanILYGEeVB6wCC2mJCrbVRkE=;
        b=cF6t0v2L1r5HkC39NhbJWp/2UVMk8UzYrxywcw+0nP9Gb7CsbHMJhFXWvtaVPuXE27
         LHwj00p+p5c6/yoxxYE2GuQUeTbXcU89FxkfJxlysRJFle5Yn87VHQzhtncO7fyzHUzm
         nj5SpoQHZ46w1nGWzr/Xr/9qUS6YDUtEQ2fQWVVxWqSRxpwnTg6OF5lVep5cG7HNX/X8
         zZBi/0oyQW6i6ntFQ02udTtJMWLnu0AY2AdH0U493EuWxoOU1VonCrOe5CqIPdB19eEJ
         iQZNoP4/zqY9uq+lpSiBeVaa0DMHNFSzIErGnGgpf670EtN0O86brkBX3KMXuTcRVbyv
         +8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715701803; x=1716306603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gv+131uf/+zTE0wvk5WanILYGEeVB6wCC2mJCrbVRkE=;
        b=LnzKW9Cv6PxMZvL4A4TS/kXKOf8TC7VXsHViOLvEDd3hW8lJ9LD88lJyR4DNVNoXRU
         eqzdWkjdn0oybAQ2RHhvkD4gGd02hGghkSZrlEtUp+q6wY4gMXPdOBJ7/5d16vIsuJ0c
         k+f/tOgWtoMgDNATFMWIH15fjBop01vFTtKm6qNEKxOrbgLq+llhj2QcqwLY/nlYOt/K
         MM465OGqJppu5CCRVHivFCmCY66/zVfpfZ4S/51O/EPh9K/FI4v1bFNrWDubQlG2cHFy
         JOy6CwOPI129cNucG8PpkC+fpO6mNxWSXlShSqfjKdYb7WKpKYeBQXYHgqymlBzExN9R
         yfuA==
X-Gm-Message-State: AOJu0Yw5hkd/oMIkiQO9geK7ooLtUBIPFFj45zw5mINZNtUBDgKAv7ib
	4bkQxrFcShX/J0EHo4r9KuPxZmT+TojdJJefKd6oTurjpxheHKhUCj50yg==
X-Google-Smtp-Source: AGHT+IGoswypq/IGvqwYE6wgUWcclgsXxoZLuoUyaLhTorgmfLtW7N0jTqzYI6cj1T0zxI9YNwIUuw==
X-Received: by 2002:a17:906:d8cd:b0:a5a:5985:706c with SMTP id a640c23a62f3a-a5a598586f0mr630790166b.36.1715701803028;
        Tue, 14 May 2024 08:50:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b1771bsm729890766b.215.2024.05.14.08.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 08:50:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2] freerdp: fix build with gcc-14
Date: Tue, 14 May 2024 17:49:58 +0200
Message-ID: <20240514154958.1175925-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 15:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110398

* bump SRCREV to get more gcc-14 fixes already merged upstream:

$ git log --oneline 2.11.7..origin/stable-2.0
efa899d3d (HEAD -> stable-2.0, origin/stable-2.0) Merge pull request #10172 from AlessandroBono/wip/abono/incompatible-pointer
7894a7dfc redirection: Fix incompatible pointer type
f3ed1f1ac redirection: Fix incompatible pointer type
4f411197d info: Fix incompatible pointer type
a383740a2 next-dev-2.11.8-dev

* fixes:
  http://errors.yoctoproject.org/Errors/Details/766906/
  freerdp/2.11.2/git/libfreerdp/core/redirection.c:91:31: error: passing argument 1 of 'redirection_free_data' from incompatible pointer type [-Wincompatible-pointer-types]
  freerdp/2.11.2/git/libfreerdp/core/redirection.c:112:31: error: assignment to 'BYTE **' {aka 'unsigned char **'} from incompatible pointer type 'char **' [-Wincompatible-pointer-types]
  freerdp/2.11.2/git/libfreerdp/core/redirection.c:139:38: error: passing argument 1 of 'redirection_copy_data' from incompatible pointer type [-Wincompatible-pointer-types]
  freerdp/2.11.2/git/libfreerdp/core/info.c:88:39: error: initialization of 'const WCHAR *' {aka 'const short unsigned int *'} from incompatible pointer type 'BYTE *' {aka 'unsigned char *'} [-Wincompatible-pointer-types]

  and backport one commit from master to fix:
  git/channels/ainput/server/ainput_main.c:225:83: error: passing argument 3 of 'WTSVirtualChannelQuery' from incompatible pointer type [-Wincompatible-pointer-types]
  git/channels/ainput/server/ainput_main.c:419:36: error: passing argument 1 of 'ainput_server_context_free' from incompatible pointer type [-Wincompatible-pointer-types]
  git/channels/ainput/server/ainput_main.c:542:100: error: passing argument 3 of 'WTSVirtualChannelQuery' from incompatible pointer type [-Wincompatible-pointer-types]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...mpilation-warnings-in-ainput-channel.patch | 72 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.11.7.bb |  3 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings-in-ainput-channel.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings-in-ainput-channel.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings-in-ainput-channel.patch
new file mode 100644
index 0000000000..62600cddab
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings-in-ainput-channel.patch
@@ -0,0 +1,72 @@
+From 130094de3244d5039e463e1142e1ec487c1104ef Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Tue, 22 Feb 2022 12:05:08 +0100
+Subject: [PATCH] Fixed compilation warnings in ainput channel
+
+Upstream-Status: Backport [130094de3 Fixed compilation warnings in ainput channel]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ channels/ainput/server/ainput_main.c | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/channels/ainput/server/ainput_main.c b/channels/ainput/server/ainput_main.c
+index bc1737ee1..17d2ec681 100644
+--- a/channels/ainput/server/ainput_main.c
++++ b/channels/ainput/server/ainput_main.c
+@@ -192,7 +192,7 @@ static UINT ainput_server_recv_mouse_event(ainput_server* ainput, wStream* s)
+ 
+ static HANDLE ainput_server_get_channel_handle(ainput_server* ainput)
+ {
+-	BYTE* buffer = NULL;
++	void* buffer = NULL;
+ 	DWORD BytesReturned = 0;
+ 	HANDLE ChannelEvent = NULL;
+ 
+@@ -389,7 +389,7 @@ ainput_server_context* ainput_server_context_new(HANDLE vcm)
+ 		goto fail;
+ 	return &ainput->context;
+ fail:
+-	ainput_server_context_free(ainput);
++	ainput_server_context_free(&ainput->context);
+ 	return NULL;
+ }
+ 
+@@ -496,17 +496,23 @@ UINT ainput_server_context_poll_int(ainput_server_context* context)
+ 			break;
+ 		case AINPUT_OPENED:
+ 		{
+-			BYTE* buffer = NULL;
++			union
++			{
++				BYTE* pb;
++				void* pv;
++			} buffer;
+ 			DWORD BytesReturned = 0;
+ 
+-			if (WTSVirtualChannelQuery(ainput->ainput_channel, WTSVirtualChannelReady, &buffer,
++			buffer.pv = NULL;
++
++			if (WTSVirtualChannelQuery(ainput->ainput_channel, WTSVirtualChannelReady, &buffer.pv,
+ 			                           &BytesReturned) != TRUE)
+ 			{
+ 				WLog_ERR(TAG, "WTSVirtualChannelReady failed,");
+ 			}
+ 			else
+ 			{
+-				if (*buffer != 0)
++				if (*buffer.pb != 0)
+ 				{
+ 					error = ainput_server_send_version(ainput);
+ 					if (error)
+@@ -518,7 +524,7 @@ UINT ainput_server_context_poll_int(ainput_server_context* context)
+ 				else
+ 					error = CHANNEL_RC_OK;
+ 			}
+-			WTSFreeMemory(buffer);
++			WTSFreeMemory(buffer.pv);
+ 		}
+ 		break;
+ 		case AINPUT_VERSION_SENT:
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 37a28bfecf..ee4d4530d6 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -13,12 +13,13 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "7f6cc93c21d7f0faad6daacca06f494f29ce882c"
+SRCREV = "efa899d3deb8595a29fabb2a2251722f9d7e0d7f"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://winpr-makecert-Build-with-install-RPATH.patch \
            file://0001-Fixed-compilation-warnings.patch \
            file://0001-Fix-const-qualifier-error.patch \
            file://0002-Do-not-install-tools-a-CMake-targets.patch \
+           file://0001-Fixed-compilation-warnings-in-ainput-channel.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.45.0


