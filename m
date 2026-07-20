Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7DAC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:12 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11283.1784590745947867726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p2+caTLn;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3583985b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590745; x=1785195545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJkUfxRXes555ZdQUxzsr5JK7EE4Sg4RVXAHvfJbbrc=;
        b=p2+caTLnhBRT8BfN4EVgFpE6env7+NqCB8Rj6g9SNUExV6TOochy2FL92SB5Nte3PP
         vaSXMK7qmeMpzxKe80NNWRLI24M9zxo6Ui1Pw2PtS5lnq/nAlDCig7gdiDMZ2itZchd3
         mXaHRpSXsQPwPNaxmZP3EuchY7fdsHiMxEfVLl/fUOLxZcp2EXgFMEyylz89NA8r7c+C
         KL2rBTYE1wgiO9RpQzE+F3u+dphfFUhsu5KMfBLwzdUHus/NP3LG1OMX/U2+syzD1KU2
         KzPCZ70b966oXcdBBnsqnpcPFl0Zgf4XmMtx1YQMGZndv4r8Au9rFNkpXOg2MrMkfUKT
         0cJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590745; x=1785195545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJkUfxRXes555ZdQUxzsr5JK7EE4Sg4RVXAHvfJbbrc=;
        b=kbhvdb8UiXuVKUbEhIfyx3czNpmmJw9kL+4VcTb2qXUF9lGfCAUhNDS4vzqPJTDUTr
         JVT4j3H1cXa4bQIDWjMQADs8H4N3Cxv6PG3uOI/BkIEUxZ8R2sGs0gVYA+dl0dRat5lf
         kW5vyC6qzDgPxw4Z82mVOudah7cHllLE0W6fpLtYhVKnzaqI8fROYTGFB/Vh8OB+Gzlx
         04rdkiXCZfIjkDEXye/WyAPsTimiGwepJ68Q5zvyuJk66kEdkDhq6iDBQU/s4bqAPiOp
         o7A/XdT7509oWOPFF/oGRV4fvzXa8SN2kyDcKvbT/qtZcrC9CE5LvZi0bSym/Ie7+jHM
         6zjw==
X-Gm-Message-State: AOJu0YwyqX/Wc8RTnyMWV/H3E0ossS+eOEPgrOMIRnFTZt+cZgXfX6Hj
	XkKxmwU6dJ43dXJFMFe/q1gp08OIU1D/V2RA/Pyx6bi7GRDqH1+K6XqtUFdF8Q==
X-Gm-Gg: AfdE7cltE/TkCCM5UzNW+eu0k5hcmyHepSk6cEhz9x7gq66dA0uMDX3cMqQYbMEmomK
	2SOKYJwd7wqPE7NB/VMRT46KsWBucE+GlFsRYg31boOHjhuWmvvAWMJdpK037/e+s0DO/cpj37t
	20c38155iQxKSXbQvfO3Mu+PcZVP1cURwEt4ijGRI21JWh3rBDVoxrWu6d8QnGMGAzW4SWIpDcM
	VOvHGDZVBluynNh55oDSwrtMvBVLEPLNiCSjajUTZhebGUlfWVvw+m1cN7y2GpVhheOrHCKht/N
	qxJ1peQyfZJdDGFgxwpNbx+Cpw3GvvCiPhb3oMpdPAksV6KKMF2F4FTJVm2CpoSuMma4Dd/noyD
	P7c14daq2ZbVeuxkGN63o5YMO0EnvcomaxPEkeH8Ae/uzBuZX4tefz4Q8ECJkOyFdUBWxy7cmjV
	656cV7cpZIdEHFyq0=
X-Received: by 2002:a05:6a21:6e97:b0:39b:bc11:9ec5 with SMTP id adf61e73a8af0-3c38d90d352mr21940355637.13.1784590745292;
        Mon, 20 Jul 2026 16:39:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 16/30] python3-socketio: upgrade 5.16.1 -> 5.16.2
Date: Tue, 21 Jul 2026 11:37:57 +1200
Message-ID: <20260720233811.2324493-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128317

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Prevent unnecessary resource allocations
- Add zizmor to CI builds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 9b8bf4de6ff4bc49a382e73dd43f3ff619334384)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-socketio_5.16.1.bb => python3-socketio_5.16.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.16.1.bb => python3-socketio_5.16.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.16.1.bb b/meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.16.1.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb
index 10372e83cc..97a378b879 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python_socketio"
 
-SRC_URI[sha256sum] = "f863f98eacce81ceea2e742f6388e10ca3cdd0764be21d30d5196470edf5ea89"
+SRC_URI[sha256sum] = "ad88c228d921646efa436c0a0df217e364ef30ec072df4041484e54d49c15989"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"

