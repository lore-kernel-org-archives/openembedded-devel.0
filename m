Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BC3C55175
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:05:08 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22328.1785672303220508234
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eFFBhI6A;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1924729a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672302; x=1786277102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=It+9TCplql0YblllWpH/VDlNs2rlFx9F8UlqStIXLZA=;
        b=eFFBhI6AWiWKnwgAz5GnGAhNd0ApOIenW1YJsqibMqzUvJhGdzQLwYGzD6/zzl2dlt
         I7hsURSz1lOEjNefNQreOyr5NJauqLCNnDwQd2QyU8zSQ2z6BU5CMiNQHfKIcDmT6oHu
         FOEEFx8FmCIxmwJ+BxLTuEIOnx6c9IvyZcJKRAiZP8TR/0Pf0Kse7zYqPrCAeJ58kZig
         X/r/P7HqIc+eYYTwAl/UWLpbsY38Cosx3oL97Qnxz10MTDjrVkNJS+XTy7oyj1iJrvpc
         DBlongsfjl6siv43rJlraqD15BHu/Zy79m40NMUoU9xkf54+XHr7Rf3otHya6GWG7GmK
         nQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672302; x=1786277102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=It+9TCplql0YblllWpH/VDlNs2rlFx9F8UlqStIXLZA=;
        b=qQcyWCDTX8jKgqY/UkyyiT2A6tpiOYqTyLVrq7Era1eTxgfxwhJn5G8epjPb4bgR81
         0jAF5RipcrXqvljYmxFmWtl753t0l3AWDcSQvoCG0iP0DYHr6fyzxLlA1CRLY35aWWvp
         P7f6qDHqes+mWpgjNaDbVOelvGwf73jbhYgtUGTpt7jOOCCfjbqzecDVNXs4KrIyBYQ8
         tSlGpKel8mLflgXLgk2lZLEOT4/+piNrQb2RllV3JUpk07WuxCG+MbssU33pHyj/XwHc
         e5diyZOeEGL8a+gXFQpEpUipI7+L+cJ2dFhdX6JyGPlo9aLAHQeYSxGBFzYtHGfzK4DK
         TjCg==
X-Gm-Message-State: AOJu0YyA1imuaFFVvpP0VMibm0VC6+2M/061dX+gj82KRsyEimJw5mPL
	5Pgofq2usljdm4c8JyOBUhHySANiJDjKMUGpuHu1HdFkJgGzMDWfOSqELwoqCg==
X-Gm-Gg: AR+sD10rgmyW3wW0Ub5YTcpG/+JcO+M/YVlLnaIVOTVrrSWQFbgoNhokKqf2XA66wmc
	nz5Gm91mWZinhAHiQprW7vFW2T2H4+KjouzqRq57J4Pg9dYKiR6VRSK8a20+ZxKUO9p9OYmgIqc
	/rmqx8ed709wieI3UgpCo/vFWQE4sUqmpJscKVfklsNZOkUL3EAvqEs8TaaRlg4DPHrRbneq1lN
	1uqTXFbKhzshRidik65Wh109WF6mb8LHXkv6fFTYwmVsSIH+fjLZcB2xAU+5kntlXHkeryAUx1B
	GRrSUvSgGZskTND8mbf3KHHiOzgLejNpWGi1MbxyX88qHYr1k/PPwm0jU8qSX2GD+1JTBH0XHG2
	ZZ4HfAxxRM1JKpB163EQths+xICb401f3Heh6Ties2TqpM1kRdHH4uUdq/2t6dVQmN9Qx1fev2D
	x051SM3I1XWBZ9eP+BsPWmLfjLbD0nVhk/TOijiOIFKv0kNtjJxZ8P8HauSuULuW2TClnsoM6Si
	g==
X-Received: by 2002:a05:6a21:6194:b0:3b4:85db:1bed with SMTP id adf61e73a8af0-3c92a89caf9mr5584850637.45.1785672302352;
        Sun, 02 Aug 2026 05:05:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:05:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][master-next][PATCH 3/11] cifs-utils: upgrade 7.4 -> 7.7
Date: Mon,  3 Aug 2026 00:04:34 +1200
Message-ID: <20260802120444.2973561-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
References: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128658

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
cifs-utils: bump version to 7.7
cifs.upcall: fix regression with krb5 + creduid
cifs.upcall: Avoid int overflow after year 2038
mount.cifs: fix const correctness in parse_options
cifs.upcall: fix compiler warning with -Wvla
smbinfo: parse action and filename from change notifications
cifs-utils: bump version to 7.6
cifs.upcall: remove getpwuid() dependency
smbinfo: update notify subcommand
smbinfo: add filecompressioninfo subcommand
cifs.upcall: Adjust log level
docs: Enable debug logs
cifs.upcall: add option to enable debug logs
cifs.upcall: Retry krb5 TGS request with uppercase service name
mount.cifs: remove runtime pass_length calculation
mount.cifs: adjust get_password_from_file() buf size
build_assert: add ccan build_assert.h header
mount.cifs: fix buffer overrun in set_password
smbinfo: fix decimated subseconds in smbinfo filebasicinfo timestamp output
smbinfo: add notify subcommand
docs: update username= option to drop invalid examples
cifs.upcall: fix calloc() argument order in main()
cifs-utils: bump version to 7.5
docs: update echo_interval description
cifscreds: fix parsing of commands and parameters
cifs-utils: Fix documentation for character remappings.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cifs/{cifs-utils_7.4.bb => cifs-utils_7.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_7.4.bb => cifs-utils_7.7.bb} (97%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb b/meta-networking/recipes-support/cifs/cifs-utils_7.7.bb
similarity index 97%
rename from meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_7.7.bb
index 23a08cb350..51475bae77 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_7.7.bb
@@ -4,7 +4,7 @@ SECTION = "otherosfs"
 LICENSE = "GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "edac7178bec9520fb57d14946e67f5dd33b82d43"
+SRCREV = "3a7dc396306654aa225c35767e56ac1fb239922e"
 SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master;tag=${BP}"
 
 DEPENDS += "libtalloc"

