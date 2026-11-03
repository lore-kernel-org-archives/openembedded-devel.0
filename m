Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13032.1793717618389934038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Vt42rWFs;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so36489595e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 06:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793717617; x=1794322417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCv5bvzN7VBS2DAGpttmvSYeQ/aVtHT9+RJzVWdknWY=;
        b=Vt42rWFsCRrNzf8217XNNTDmw8FknrORErJtshn/6vS6e0fyrpfbBbm3kOwoUHHaAb
         5Kc2/CCkEbxngYel4k4iWZe1A7qKkHlcel5H6RBepdZ6AwicdsgRE8pU8nB1iNEQmCLv
         YZp4rF/7LcdEGPHrXFtvvCLOfc5cVUXuzN1MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717617; x=1794322417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCv5bvzN7VBS2DAGpttmvSYeQ/aVtHT9+RJzVWdknWY=;
        b=HNfO+43c08StT4s7vRInafGpLN4s0AjBki6pb9lpwKrAZNE9N6Gnr1l5YI1JVRrbm2
         f0F2Qok2fhCeA1zSWJM/L4quH8yZdWuPLCd/H4qSZPWv45bvpA9lNXnrCmJ0QZvouQ5i
         A1QkvUCxBXO+QMM7CDvwOv+R0JqGezYBMdNmWQ4huVi3syHcxPDWCJs6BPdy2yZRHJM9
         dWcedC69zdB86JBX1StUZeQsf/oG9hfqLxcLIxt2plOvk6GE3YPxqu1JlNJFSOmPPtgo
         mjcGV5qV9kLiXacihasX3/GiYE4sT27SA9zZIknSSPvUSYbs215YbfxdPAiCuOaIn0BK
         UPAg==
X-Gm-Message-State: APuU4Z/AqNGuOLS4FK2Z7lucrhl91ZdH8Tf2tmOTeG6gHz9Ecaij4vE+
	WP/A/g/BREqJG8KE1kraxyonx0HejY+8RysYEX9wtUfqYOGSy/fCVlhD2AwxxDD6hUEbL5N/0UP
	P1S8E
X-Gm-Gg: AYBFou0JPZc1HGkxtVmBnCw7qLMABa/z/nXkUQjvfxQ/kfRoK24Wrj/448La7X9C9NN
	d484+PdR/5lmDQF+IPSDOx+JP5By+GHumxo+G15Bxpp5coBT3fYVFglboV+p08MEFrCYWNB+R0a
	K/yCzW/NhVxTwAdE+ugSs1Sq5nZSm5CM2l+NAqi1wD08IBXoTnBU87Ni9Q9gpwvfbzScni+kknV
	dCaKFXrReD5zCLBEzXgXGN5AMK6uih+JbIjn0FZQ6K5SUbyN5xVaDg+gyfrRVJ049/WVLF5NK80
	E9J37jznUy/BAxAsYQjrMOxtBboHqn4q4n/SK5thgE2mI+RWGmkbdeMx7hBdcJE5J7mYjkgPYC3
	hd3Y9zNyOs097gA52rtPAbuUy1oj07vG5pHv6MgARV/8emJrgHHzxuH+5PAwhdc8PLxWPv3E9w9
	f9lkpPr+9vod9kCRWpGcAtgC7rVYnjTizTpylJcK7/keRrtVFsBXF5rsKh/y8gm0gVFEOGtZvJ9
	ESp1Ee1mFqB1Pvnm5XKFNuwcGtQ0i9yiuoGSzjVpiw1EWcf7kWGRWFwK1bfdh1QuEOzFALF3ft0
	dlFSXzZ4Dopf5x5SY6PXeD1njr6IxtW7c905mjcVlZPTvzqxF1G7abpliwH1IgXiYCqLRwkfU7x
	YLhqphsBc2+ldK+HczGYRGWCbwr8GtmjtVqBYE20ZBydUGm12X+IBng==
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr300508785e9.2.1793717616732;
        Tue, 03 Nov 2026 06:53:36 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm94336685e9.15.2026.11.03.06.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:53:36 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-filesystems][PATCH 3/3] overlayfs-tools: Upgrade 2025.01 -> 2026.10
Date: Tue,  3 Nov 2026 16:53:28 +0200
Message-ID: <20261103145328.1973965-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103145328.1973965-1-leon.anavi@konsulko.com>
References: <20261103145328.1973965-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 14:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131793
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.10:

- meson: Disable tests build by default
- Define attr dependency
- Test if merged overlay is usable after mounting
- Remove trusted xattrs from upperdir metacopies before copying
  attributes
- Add Option To Use rsync for merge Operation
- Support merge metacopy file

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

