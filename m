Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB09C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:32 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11286.1784590763643370937
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DsIPU5vI;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso7446846a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590763; x=1785195563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stwvgDW3h1cSn+VR0NERO+6c2OdJmewGLLbAkVm4BEU=;
        b=DsIPU5vIVwWdJUeECsCnTLDr8acclDB+esh6hYxYFvBquuWBDJeKld1WCtcKMP5yy8
         R27inbKZCet91JoqefesAon7zAXFStOM8HwSvt4gC9CPDuXrL+fwCs2bQOJdgTWTV8GX
         AHpnkCWuikHXQ3ZiqrltgkVzuOA80fY5LmEnUUMVISpNCEy59CDkc/zLZSuLRViRjo3A
         Fv2y4YvAWyn3xTIdVBHKoHhcJ2mlxeSjUq17OUqSxE6qW23jK6PmJyBU4gjTVtzMTfGF
         w+3cIeIXVJTkfivkxYHy/P0tgFNZz3p941IM7jE1JVNno/Ar4emujaa1BravgAy+04D9
         srkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590763; x=1785195563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=stwvgDW3h1cSn+VR0NERO+6c2OdJmewGLLbAkVm4BEU=;
        b=lRrEB3/kckfdQIlinthAXiiraDNB0VdlOcbx1QY7A7hI6SW1F3pyvpTF7LeN1lBscL
         Z0EvkVJlMMXGx3A0eXu1k25v2Gzz5tSVn31pUDuUS9KV210YX+U7mUVc8ubcGbQF/+04
         BQ8CZLJMo8U3dk69YnAkMr4g87P64mTBAvFrTmP66xF9NzjNSDIYT+J8DUCpFpSnp+dv
         lRE+OnX+g7E9hH3hFkE9ieHVrwN/Crq7VmLOaGH3dvyEASpMDP5MHYtylErorfaaoxeH
         hgqs1adRuKj4ouUfR5AWXQfAGmvgKBGEwGLvDTQ3XM5u5wlw7OefAiWZVRFJmQOsTZWz
         1dUg==
X-Gm-Message-State: AOJu0YySshJWJZZZ29Ft/RSZhhOUlMQLjliDwaUvYZod7rpzyXuhFCLx
	ldj/j/5717c5I/SJD1mg+RtZW1rLXfed02T78pogWoRDhdi+AByD/g7pR2Y49w==
X-Gm-Gg: AfdE7cnKlDV7vtUEDvdkC7nI4ybN2t6fOc7AJyChS/4bQ89gfiCtnXXj+Toon+X9trh
	qTL5xXmQtuqLX4r8bpJ6ePZzt2p94FqnkZQW2XT2FFd0Kjdn41XPtJeOyRW2OOunPjRXuoQFTB/
	+W8LUk4vuBrZ9DSdoLFh11Ejt2i9QuboipCAqGyZWkp/8LCB1PMZ1vLKfQf76UZqHFwmp9rXaNM
	zJu0gkDutmAJo4TdlOghvPq+0lhCtumlEOEuLseEUxMNQ0yXzvuXRLM3+lyPvQos2HeuQmidYNM
	b1rvwrNY5t6jzLU4IfKmAoGoCPY2VEgId6dMuWhljdv8uqXET0+4rVJUYdeo3VJEGNDuCk6yGti
	Qtc2smQ4LA4Px+sW8l/1C6W6jw2+Z+jAXE1wMaU715XVtbXCq1pAHzLcMBisA36eslXz9H4aYPU
	/HnMMmsOO66Lj7xsfSnMyYpf4h5g==
X-Received: by 2002:a05:6a20:7484:b0:3c3:a1e6:a626 with SMTP id adf61e73a8af0-3c3ad78cc8emr16805537637.32.1784590762999;
        Mon, 20 Jul 2026 16:39:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 23/30] proftpd: upgrade 1.3.9b -> 1.3.9c
Date: Tue, 21 Jul 2026 11:38:04 +1200
Message-ID: <20260720233811.2324493-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128324

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Issue 2135 - ExecEnviron values not passed due to regression since 1.3.8.d.
- Issue 2146 - Stack buffer overflow in MLSD/MLST handling for long path names.
- Issue 2158 - MaxTransfersPerUser no longer enforces configured limits.
- Issue 2163 - AdminControlsACLs for config, get actions not honored as they
  should be.
- Issue 2166 - Memcached/Redis-cached JSON TLS session/OCSP entries decoded
  into fixed buffers without bounds checking.
- Issue 2173 - RewriteMap unescape builtin use causes one-byte out-of-bounds
  write, fails to reject illegal characters.
- Issue 2188 - SQL group name lookup concatenates client-provided group names
  without escaping.
- Issue 2190 - Authenticated SFTP sessions can overflow the SFTP packet buffer.
- Issue 2210 - Default Controls socket ACLs unintentionally allow all users
  access for sending Controls requests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c13b1c4115da51af2e802b63c0c8698246ca7100)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../proftpd/{proftpd_1.3.9b.bb => proftpd_1.3.9c.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9b.bb => proftpd_1.3.9c.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.9b.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
index 3da67c9e1c..95c9f3919c 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "390b21555268bbc64b66d2dfa7ae40476419b80f"
+SRCREV = "78a1bea439969913d7002bfb16ee7f0f60e262b4"
 BRANCH = "1.3.9"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \

