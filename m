Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4410.1793777517121927512
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 23:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=L0kZ21zb;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so286557f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 23:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793777515; x=1794382315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+7ivGlO64d00rQDIQSdmy4IbAu0Yrmb9VVgAjfD01M=;
        b=L0kZ21zbw4qaK7kk3qoXe4cSZN4nWml2EgL1XmVbRjI+XBMJ1HeUb8PIRHN9BSUTl7
         /XooFVyx0/LYhEB58na4G9U6tb17Lg8ycwbEPatgBSff4p/lvXziocSepQOaqvRDJeLs
         x6hbPUyj/Se+CjNDZDEiSO/duz+Efv9LSvs3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777515; x=1794382315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+7ivGlO64d00rQDIQSdmy4IbAu0Yrmb9VVgAjfD01M=;
        b=jqN/PnIO++F65FxZnxA7HT1gFrpU7A0rpRlMVl7ak0f3ndqBg64/XzXYDiQQmP51sn
         kbs738KPNaZT/ZsiADZT15xWwildOWj3rVE7unzYgWxamc71Oir43e88Dl7LuWD5/D/7
         Xx5loh62OlCVmVbjLYVD33zscpBlfuJNE8TMo+t7U+zfhunNXxUYrX4KXPspMMog2Bam
         jQtjQOj6iKRfIBb5n+7XKco1asQ6DkEjVQpA3I+fWr5ExfhWyswwFv0csZmee4g5zg6R
         K6/HxzXZCR6FsjKXAyLg2bZbxg90yWqLBPuUMbMaXfYCPoMiwDqAo6jOIli/JCPbxg6L
         1VUw==
X-Gm-Message-State: APuU4Z/W1gV+EeP6ZZy0VU4rKXrXNgVGHxSs9pHlBU4f/hEUnioxjdJK
	8qj4Joje6Si/uY3nEXYJUwVeLhdLLSoB8UCzaoRsNQN0muRwXm9KJ54F70tnmn+kiDVQLuqOHCV
	u/dW8
X-Gm-Gg: AYBFou1TwWPRjsXB8BOLaC8GbTDK+MKjObR9aTqZa+nEhjxcMCSCjrCmb9waUgH1+4H
	cHSVk5iOQuQ7qPwpmpOJC+VThh/JYAPyb1X1zYTVmOxjPU4HlXHiQ5XRgV0PGv7JVFzet1Uw0pT
	DzL8vKqm+N/loSlm4dagLjlj9iC98lomrYMnhuBTDOkS7EpV9R3DjtmAGaFkpmMetz7/2Cy3Wba
	XWdgUl0ymdi3fH5+u55+beu1Iv3uBDgzjE5cVOdSppXsrz8K6VECcO/GR9mW0Gz/OPkwKxNQqOJ
	KqHVh8NUhRCuXNRLpw4qbsHMPZpuGYUlHuSdRVjk98NeV7u8S4ZyE3PfoCVl4SJKkfhktfd1hQR
	QTXba0Qx6YvAv9PXTBfxdh78qGOQ0cC0XzgLtpl+erZnBO8Hgz/uC/6Hj0CObGPDDXFFy6eFR6k
	4WKSNFsufm37ahLMfBsNMmIQa/N79G26qZ0qjLdSklZ8nTaMm0w/V5WqsS3DHnTPDUWcKKDpMJZ
	NpIHBykIAkRMoiPS8GjNX+FssMcmUoni/gbO5u2jnbFrJ7UiKdypCEfvty105Tsu/i+YPrY8k92
	HEA9fMqFMAYAWS+ROoTka1rNh+ZLaV9u9/FTAGvV6jIMgCwDdz4+AoNoNOddcdIHZ4LZIH9JIo6
	pC9wfJMGaeQ3VBfflbxCn3/vKRq46se8dp2zeMHNS5jNkrJJeLJh9+Q==
X-Received: by 2002:a05:6000:290d:b0:48e:75f:477d with SMTP id ffacd0b85a97d-48e6e2dba63mr33221918f8f.7.1793777515124;
        Tue, 03 Nov 2026 23:31:55 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08536dsm2028200f8f.32.2026.11.03.23.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:31:54 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-filesystems][PATCHv2] overlayfs-tools: Upgrade 2025.01 -> 2026.10
Date: Wed,  4 Nov 2026 09:31:52 +0200
Message-ID: <20261104073152.3367657-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 07:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131834
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.10:

- meson: Disable tests build by default
- Define attr dependency
- Test if merged overlay is usable after mounting
- Remove trusted xattrs from upperdir metacopies before copying
  attributes
- Add Option To Use rsync for merge Operation
- Support merge metacopy file

Since version 2026.10, meson.build wraps the tests build in
"if get_option('tests')", so the tests are disabled by default and
do_configure:prepend is no longer needed. Keeping it also breaks
the build with:

ERROR: Expecting endif got eof.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...verlayfs-tools_2025.01.bb => overlayfs-tools_2026.10.bb} | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta-filesystems/recipes-utils/overlayfs/{overlayfs-tools_2025.01.bb => overlayfs-tools_2026.10.bb} (68%)

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.10.bb
similarity index 68%
rename from meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
rename to meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.10.bb
index 3b5963bb26..6a3d609567 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.10.bb
@@ -7,14 +7,10 @@ SRC_URI = "\
     git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master;tag=v${PV} \
 "
 
-SRCREV = "6e925bbbe747fbb58bc4a95a646907a2101741f6"
+SRCREV = "950d0cf35e4f917b6836565d76e38bcf7fcf2d5f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit meson pkgconfig
 
 DEPENDS:append:libc-musl = " fts"
-
-do_configure:prepend() {
-	sed -i '/Custom targets for testing overlay function/,/command : .*permanent...changes/ d' ${S}/meson.build
-}
-- 
2.47.3

