Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD19FC79FB8
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:31:55 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6994.1788942715070674758
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ABKELcj3;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so5461203a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942714; x=1789547514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Slagt7ZkauVRnXIn4JMpfNJeCX304POspLpIpJGGAHY=;
        b=ABKELcj3vBdTinsuI2w23aL1cpWKktxl0eS6f0tLogSieY1I8utYKcpYkQyQL37O1o
         DL8biG7WOmghoA6Ho2PUZwoQlVsIQ5l/oZif2oOQFMJT5rnxDA5yMC0lwEoqg/twIRPB
         wrFoC4sCjKtOYUhGUmI5zkfiXOWUuGzWfEcV8aVBWlVLWhCguuOws2omctxiF8T233OT
         WkdUgHX944ObQSE9XfpCp3Vcck1oJO70K136GE+IQzvndonmQ762iT3Bwzhr/jTw6Wy5
         1p0v+avlzW+dD+fW/G2Wrg8V7IxOAv+ZTGjri7MwohUF6HCfCxi9sihisrsOB/nd3U44
         0tCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942714; x=1789547514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Slagt7ZkauVRnXIn4JMpfNJeCX304POspLpIpJGGAHY=;
        b=qpo1t5SDHkG1LpwOX2IkfDU9XiMeWHlW/juG8VEfPm4wfjOrO1m1zTmlzPRie0/06B
         ++lc2ykRv/rjHksXzX+C9fPiiCUS5XrEC2A/seaW0bwKudEQa0AizyrW9+GVW/kNtPqV
         9F3PTGV2gb8j6jGt8WDNX8ONhPrXOXoWt841y7bZ8Ff9XKj+JU3EO/Uv4crKhHBbxLXu
         K6ccF69tpBqLivU4A3SKhSycNjxecreIxUU1EKx9YZ3Y435SlkRndzFTbVtkS9H5G1DR
         Bs1v1RkK3iLbEV06dsHH/XZoO7vEZQLSBNBlxfIZrxt1nyxenPRgdh7YkY/DB+wJTCfl
         Jt4g==
X-Gm-Message-State: AFuF++mm5Ogmu/lLvJ3WOkf5RtKI1CtumqsQvvYubdvy+6TxXSB+mDQW
	ye4meMYUF+1WoOMePsw2+55zgNGev0q3S/8B06/zFj0SP52IKduO/muLZ1ooUw==
X-Gm-Gg: AYBFou3qcw2QlUzpB4o4smOwBAivhzuwOxzQDK5MrDVpjHUlOG1isGKWn275UnqlQHl
	XFoVaE8G4dIQu9X0W2jTDXdNOEO1ur5f3muga1TYivObjP0k9qG+VCqEnVUANMY2HVRenlNG2CY
	nJgZIDB/mwyNgg89Y58nV9pOH9kBjSQs1AMIGtq20PuBHOQTkHMPLwI1PV9KpctVotmNvawxLdL
	xoP4HmAtiNEt22cPly7JMLXbwnz/TD3sFZ1WOr7TiDsCAJAzfdq5AGzf98MB7OVNgAoeKH1Y/no
	cyW49UFHIcP6p5JLbTxgcvFocECaayDkRc+iPjZUmbYRLppN1JukdHSW3yvFGPi/7MLfkt1I/s3
	WrAO0i0ly8uyuoerlnxyIawjOuk29sszYa+IFj4f7+MS8qkS4njd/ChwQ60MhOtUC0tAE8aRU+Q
	7lKMz5WpNR+bpyFHXup2VUCrh+KZ3/FvwICYF0gAIaqCeHLA0Nr1ct0cbz7YOsqJZWqRwK1znjg
	w1YC188q67IjSs2Xa+n5Zk=
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr52331970a91.17.1788942714163;
        Wed, 09 Sep 2026 01:31:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/15] freerdp3: patch CVE-2026-40254
Date: Wed,  9 Sep 2026 20:31:26 +1200
Message-ID: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129872

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commits matching advisory[1] mentioned in the NVD.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-40254

[1]https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-3xpj-m4hx-8vmx

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-40254-1.patch   | 46 +++++++++++++++++++
 .../freerdp/freerdp3/CVE-2026-40254-2.patch   | 30 ++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  5 +-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-1.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-2.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-1.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-1.patch
new file mode 100644
index 0000000000..b758877882
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-1.patch
@@ -0,0 +1,46 @@
+From 11b850f6181cb607c7fa4ac7a4fa09d203e0aaf6 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Fri, 10 Apr 2026 08:45:55 +0200
+Subject: [PATCH] [channels,drive] refine bounds checks
+
+* better logging, fix wrong path component printed
+* ensure path does not end with path/..
+
+(cherry picked from commit f502dbb8462597fbe5b97f890359dfdecb525bf7)
+
+CVE: CVE-2026-40254
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/f502dbb8462597fbe5b97f890359dfdecb525bf7]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/drive/client/drive_file.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/channels/drive/client/drive_file.c b/channels/drive/client/drive_file.c
+index 8ea7552a7..3d87d8e6b 100644
+--- a/channels/drive/client/drive_file.c
++++ b/channels/drive/client/drive_file.c
+@@ -113,6 +113,8 @@ static BOOL contains_dotdot(const WCHAR* path, size_t base_length, size_t path_l
+ 				if ((tst[2] == '/') || (tst[2] == '\\'))
+ 					return TRUE;
+ 			}
++			else
++				return TRUE;
+ 		}
+ 		tst += 2;
+ 	} while (TRUE);
+@@ -147,11 +149,10 @@ static WCHAR* drive_file_combine_fullpath(const WCHAR* base_path, const WCHAR* p
+ 		/* Ensure the path does not contain sequences like '..' */
+ 		if (contains_dotdot(&fullpath[base_path_length], base_path_length, PathWCharLength))
+ 		{
+-			char abuffer[MAX_PATH] = WINPR_C_ARRAY_INIT;
+-			(void)ConvertWCharToUtf8(&fullpath[base_path_length], abuffer, ARRAYSIZE(abuffer));
+-
++			char* abuffer = ConvertWCharToUtf8Alloc(&fullpath[base_path_length], nullptr);
+ 			WLog_WARN(TAG, "[rdpdr] received invalid file path '%s' from server, aborting!",
+-			          &abuffer[base_path_length]);
++			          abuffer);
++			free(abuffer);
+ 			goto fail;
+ 		}
+ 	}
diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-2.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-2.patch
new file mode 100644
index 0000000000..ac727b5235
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-2.patch
@@ -0,0 +1,30 @@
+From 3b1f9e5690d60c6a070e40587c5b23e56b172684 Mon Sep 17 00:00:00 2001
+From: Sayed Kaif <metsw24@gmail.com>
+Date: Sun, 28 Jun 2026 16:55:01 +0530
+Subject: [PATCH] [channels,drive] reject trailing '..' in contains_dotdot
+
+The trailing '..' check never fired because PathLength counts the NUL terminator, leaving path_length one WCHAR longer than the string; treat '\0' as a component terminator so a final '..' is rejected like '../'.
+
+(cherry picked from commit 17543c9ae0a72a5413e19741cf0203ab519fb3fd)
+
+CVE: CVE-2026-40254
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/17543c9ae0a72a5413e19741cf0203ab519fb3fd]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/drive/client/drive_file.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/channels/drive/client/drive_file.c b/channels/drive/client/drive_file.c
+index 3d87d8e6b..fa93946e2 100644
+--- a/channels/drive/client/drive_file.c
++++ b/channels/drive/client/drive_file.c
+@@ -110,7 +110,7 @@ static BOOL contains_dotdot(const WCHAR* path, size_t base_length, size_t path_l
+ 		{
+ 			if (tst + 2 < path + path_length)
+ 			{
+-				if ((tst[2] == '/') || (tst[2] == '\\'))
++				if ((tst[2] == '/') || (tst[2] == '\\') || (tst[2] == '\0'))
+ 					return TRUE;
+ 			}
+ 			else
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index a4561495cf..7164a81e9d 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -10,7 +10,10 @@ inherit pkgconfig cmake ptest
 
 SRCREV = "3028b706908f81767d9b9c744a90778c28f57d61"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
-           file://run-ptest"
+           file://run-ptest \
+           file://CVE-2026-40254-1.patch \
+           file://CVE-2026-40254-2.patch \
+"
 
 
 CVE_PRODUCT = "freerdp"

