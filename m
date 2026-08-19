Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6D2C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:21 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.835.1787117833765110698
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lgNXyBqM;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d0407aedd6so6151435ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117833; x=1787722633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krr9WrxKJggabD0wxrwBzG11Ow5JLR2En9PatGAfIYI=;
        b=lgNXyBqMTr44Qr8a8Swup1DgL+6RunFRn8TBMZD6VOKi8IWig8v8r0ONfrnbNlkCPw
         H9r0y5Pu7nSFNShb2M8ZM8x/K/8AAOSkFYxazyAA+2j8ntJbmy+wruH2HuhymbKCnTuG
         sYJ2UeGzEJbahZedTIJeMyIBBBE4gFWk0u9q4jfPML+afrJvtbwuztiEE9drKFsHRtjx
         iTfsxvmR+UZ5HmgCjSCp7gw7PNe4p4n4iFi+b/MqoBvjXF5s2opkox4qv49VLBAWRWaA
         IzMF2xGUl+D3SUJTmnb2XNuqW4cK1jmE/LBUrYAPDu0jjsZIhRLdIf4nzcMKPJieRdr0
         HyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117833; x=1787722633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=krr9WrxKJggabD0wxrwBzG11Ow5JLR2En9PatGAfIYI=;
        b=R0Y6Xpbld/ipcqNqIrHkwUfDTKEhKMx9HHY1ZUIEdh6B4CiKpAXcYrxe5wJS3cBfgu
         snE3cNB7AlfjeS4pObHwxgq2nNDBDJ3Z587gQy/75vIoGgCOpQ8Z3xrnr8V2CvE2y0FA
         e3LxoqrapaMyv/AdxOOGpVVpFwj1JuwKX+pyvjhjrrUhrA/QCGM5fbRrhRalNISR484n
         pezxBhNw6dfkaFFkKSyd8OSa4iqfoi1OCyy/ODee1WWqFbhVlDCqeZBIMl/kEkA6NGCh
         LIKzAwEuUu1wuBnP5aOIEpGJmf3D6yHN0EmJ0GUz4oEv3xGlDAn/NZ19R/yxklpNQgMw
         TVaw==
X-Gm-Message-State: AOJu0YxcI+yirNSkfV0gXmfoifzCKylmhc2KBNXOwO6w/eUC30iInrR8
	RH7imLMs+CP8HDrHhVeyNOPjCgtwaaIGaeb3tZ6P7pau9O+NSCa4rOsc6j9CmQ==
X-Gm-Gg: AR+sD12CPUe6ClYcckOzNM3aAbPBDZgtNIJ1gpntKy6NC0kXJeTlEV7X4gCzripwlVO
	GepTZjB9m9LOtnIVn6Rp57Dq+4gUKEeRgEj7NCzU6BNuBOaP3cH7SZTi7ZKbNLXnkJldBzA8BjC
	2qm+Tqk7LsxJ+2b/9qgJMoshmecCHewbRbjGwfP4VR3nf5+ihdvPEd1kELP35xPjveHIuP/onyB
	I8X+VxNRWso/ItSxdHc2v7qH3nTKfiH/UyRWvGgpfQViLzHozYfqN9WkArgqtFuVcTj/q1znduB
	vIuT3AQWPjNpLvEM5icUCQ6oNqIuMnfdEhZcL0hNfEjSjKZBDxsHZGHTCkTL6Y08lxX6iRFdw2A
	46dfl5FwlTKZ3uhUA3QxDUP/BgxFJZE74xQNvxQpY/mR6Dcn3z7Zh6FL4eUP6YfvurbNjfJL8tC
	C/dsgiOA4r7NZTH//4lXIMU3TZdCGv1VTwOUJvcVBvq0L0pyNkq7oVsNTuIuzKetOXRwlrTXDgj
	A==
X-Received: by 2002:a17:90b:380e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39581212176mr3958373a91.9.1787117833166;
        Tue, 18 Aug 2026 22:37:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 15/25] wrk2: ad UPSTREAM_CHECK_COMMITS
Date: Wed, 19 Aug 2026 17:36:19 +1200
Message-ID: <20260819053629.391864-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129259

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version wrk2
...
INFO: Current version: git
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-benchmark/wrk2/wrk2_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/wrk2/wrk2_git.bb b/meta-oe/recipes-benchmark/wrk2/wrk2_git.bb
index 98a45583e9..38d1aa0e7f 100644
--- a/meta-oe/recipes-benchmark/wrk2/wrk2_git.bb
+++ b/meta-oe/recipes-benchmark/wrk2/wrk2_git.bb
@@ -9,6 +9,8 @@ SRC_URI = "git://github.com/AmpereTravis/wrk2-aarch64.git;protocol=https;branch=
            file://0001-load-wrk-lua-from-filesystem.patch"
 SRCREV = "59c09ad4442329ade4343e1ade683c4d12b0b370"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 do_configure() {
     sed -i \
     -e 's|LIBS := -lluajit|LIBS := -lluajit-5.1|' \

