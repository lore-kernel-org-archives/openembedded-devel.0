Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F95CCD19F
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 06:34:22 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.5197.1761028458869202878
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 23:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xzp35sDs;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27ee41e074dso61534175ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 23:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761028458; x=1761633258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jgUyQ5RcuAzUL5TERfKVxPqOMF1sNZgZnhlw0LVnTXQ=;
        b=Xzp35sDsxJs29CJokYKKgaO9vfRRr5IOwNprdfTBJu6K1nnWTM4tJ90wpOXs1nnPWM
         jJEmLucReEeFjD/FmurxuTFeMHwt3Za2CicE3Fsru7rTV5zRUfqj+AScSqRYJ9LjMMoK
         Y5omUhhV8lB54GLiNaGYAAUrsjfbUw0G1yCJ7ul+0CVRbqWnt69hNFKmzvtRJgd27whM
         pc2bHAWRSxwAJrFdk3cMtbqhd8ju/Sgh+A5N1O82+CL6TIGtTZ9fKPel1tKDKs7LTy3S
         c5gHtt2dBZ9gf9knc/vbbPCY6uHQDmGew5nTQaQqH6v0tXoWu5adx+2c+uoAuGED0WUy
         cY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761028458; x=1761633258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgUyQ5RcuAzUL5TERfKVxPqOMF1sNZgZnhlw0LVnTXQ=;
        b=kVUqUy4GUF61rw9EJd9hSW9HLSO1yqmFGygFYrzdKd/LzQuEgBVFoOxZb2rghPVYyJ
         LlJFkz5gP96Do6fSx/+xbTTzIjrO/SfAVQCS9y2Cq3ikfzMhORj8ZJZi3bfr4O1ek1wI
         IrKEgD1j2mwl+Ebi6eS3p4HbPwTYpN/WafR58uKbFJRDJ4EArVD+t/GJhkU4toJuYur+
         q+JaEoy6SsjHCMt0FirgUK6XFsW9fe+M9C4k0cz1XByx+n4VPBU6TI/qh2/ftD1gIiej
         JBQhEFUr04EhcU53nsKOkKvnkXieorQpbhzrSnTnEvICIiMKuiOBiAn2m68xackR7J+h
         guUw==
X-Gm-Message-State: AOJu0YxjNrrpY7O1S3y1QIxxce3lqIyJzpAzFACdAC/QDtW/MmpgokDF
	mqE6W1MOYlJXz47gw/a3UIfFhnVKxratofB7/ithnFuTtNH+rWgXIpCq8HnwUw==
X-Gm-Gg: ASbGncvyNT6kEo3whUl6zBE0aIAAHOgwuVsV0Hc/BQafmRjKwOY5y5PLBSHGE3en2xo
	DCkl9fKfUNdRtggeRdDjQ5RanGBAm5wMgvx48FetdOG3Uqhsb6D4N91UXm+H2myE7Ttz4KB0I9v
	rVMJFYsM7EClTxw17s/3dFBZZPWY68RKHY+bfGNDA4NKmndMLCxa8bQ42IGfD1p95V5MJ818v0D
	1KBfWBkjS08PyOJdghixQr+xs7MRltjZFi6OYESkTiXMRqm7WqFRbe6dzOwIRSOvX0df7sY5POv
	zXO6tgsRZt6/7pm9EPF9DcDGbvyWpkwpqLrYIXeH20T4EEL/9RXrNMpzIMeE/L71qj44dIY7pjU
	Ig5ppC5QMZlcXqtXrO5RR1poyBUkLVn2RZOhE6bwbD2TNncCQCwYpwH4nyVC3MuvPhj5X4g7aMi
	REhDs5J8LCakOPZTYgkfN8RtAS
X-Google-Smtp-Source: AGHT+IH2YSKwuNjju6v28lZ2mX6qvZoRzYkEcc+irRC5X14+FcSnhZV84yqeADaqM1mB324k9bCeBw==
X-Received: by 2002:a17:902:da88:b0:24c:9a51:9a33 with SMTP id d9443c01a7336-290c9cbc119mr196533335ad.22.1761028458008;
        Mon, 20 Oct 2025 23:34:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471da2f9sm99609595ad.62.2025.10.20.23.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 23:34:17 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/5] libiec61850: upgrade 1.5.1 -> 1.5.3
Date: Tue, 21 Oct 2025 19:34:02 +1300
Message-ID: <20251021063407.232340-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 06:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120827

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- config file parser dynamically allocates linebuffer to allow multithreaded applications
- parse time values in model configuration file
- config file generator: added missing code for GSEControl
- Config file generator: support multiple access points for GOOSE and SMV control blocks
- config file generator: added code to add SMVCBs to config files
- IED server: added code to create SMVCBs with the dynamic model API
- MMS server: added support for write access with component alternate access
- MMS client: added function MmsConnection_writeVariableComponent to write to variables with alternate component access
- make write access to RCB elements configurable according to ReportSettings
- Added function IedConnection_setLocalAddress to define local IP address and optionally local port of a client connection
- IED server: added ControlAction_getSynchroCheck and ControlAction_getInterlockCheck functions
- fixed - IEC 61580 server: dataset is not released when RCB.Datset is set to empty string by client
- PAL: fixed wrong order of function arguments for fread and fwrite functions
- MMS client: parsing of servicecsSupported in MMS init response is off by one
- fixed - potential memory leaks in goose publisher code
- fixed - server sends dchg report when only dupd is enabled in RCB
- GOOSE subscriber: fixed - possible heap corruption in parseAllData due to missing validity check in bit-string handling
- IED server: fixed problem with implicit ResvTms setting when reserved with RptEna
- IED server: fixed - segmentation fault when compiled with CONFIG_MMS_THREADLESS_STACK
- fixed - MMS server: messages can be corrupted when TCP buffer is full
- fixed - .NET: IedConenction.WriteDataSetValues throws a NullReferenceException
- fixed - server send invalid response- when client uses wrong ctlModel
- fixed - IedConnection_setRCBValuesAsync crashes when RCB is already reserved by other client
- fixed - outstanding call not released in IedConnection_getDataSetDirectoryAsync

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1b0f933f5b079c60e03a9e73fc5f4957792b911a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/{libiec61850_1.5.1.bb => libiec61850_1.5.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.5.1.bb => libiec61850_1.5.3.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
index 63476d3495..0e1f50164a 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -13,7 +13,7 @@ SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "swig-native python3"
-SRCREV = "210cf30897631fe2006ac50483caf8fd616622a2"
+SRCREV = "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
 
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
            file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \

