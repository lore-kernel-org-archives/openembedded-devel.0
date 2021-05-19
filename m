Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.1398.1621468144111232351
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 16:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NF/r4X51;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621468141; i=@fujitsu.com;
	bh=mpuhEX9GZwESxveE9IRFVOVVAHuva1OS5AGmuW92FrE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NF/r4X515FDNBjLi6FGz5cA27JniCzyBQedfPEim6xjNUjpn0itEmghowa23QRevD
	 cf7Ee6NtTQ/y79JLJJZADA1NEwrmORq9HsFRN9FMQ2QY4U8JcOyB/yamSuSwnx7QjC
	 wZk0MBfi4I3dBWsJNDasOse38tUMabU/Z5sthX5pTq6OhRyLBzduXerkVyG2bsB+dQ
	 0DWQE0PLulwoj7dDD0o0xiv3+fCJfnxFgL6PjiIZ4bF9vYharjBzsIh/HKrFgZCKJ3
	 eQXG6JqVTYmardk9DjUEEdzYEHbESyjVnpFM3qYZ/hftcfT9dqYHg2DSEPFZoIlbnp
	 plOh4UAUibHAw==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 28/6F-15146-CE3A5A06; Wed, 19 May 2021 23:49:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRffN4qU
  JBttvSlhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBnXNh1kKTjNVtHz4QZzA+Mz1i5GLg4hgdlM
  Er2v/7N0MXICOScYJc7fYAex2QTUJKbfusEKYosI6Essnb2HGcRmFlCRePG7B6xGWMBO4tL2e
  UA1HBwsAqoSH26Yg4R5BZwk1qxsASuXEFCQmPLwPTNEXFDi5MwnLBBjJCQOvngBVaMoMftyMw
  uEXSHx+vAl5gmMvLOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqGBga6hobGuqa6RiaFeYpVukl5
  qqW5yal5JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMLxSClk/7mA89PqD3iFGSQ4mJVFes/uLEoT4
  kvJTKjMSizPii0pzUosPMcpwcChJ8IYuWpogJFiUmp5akZaZAwx1mLQEB4+SCK/GFKA0b3FBY
  m5xZjpE6hSjopQ4ry9InwBIIqM0D64NFl+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzLl
  8INIUnM68EbvoroMVMQIv/Ny4CWVySiJCSamCKks36MlOe+VakhO/GnsADc8oOr/bul0rXv1R
  9X6nP5qLUnqAlXv0Fib/Kw7fNCE/oEj4V2XabJYN7bqVw3sxPVxwL9lfv3Vf4lr/Vr33iv+uT
  ba+LcHQL8Xwpff9XzFymW/XrM40zjI/PTeJfcVN9a8BGJSlF7+CZ0yUz2Xct2s050z2eU2nX7
  46mYKePVheu7La9e1pKTr2qt/PcmocLj7q+8prwaeH9fZyz+WVfbfdae3Od6N8P9usmSOpdXd
  iuzLor4atR18kT8x9odnUeCvVi/2DaVmV/4+2f/LmCr169Fzi8ZRlz1HP/qAAGtucN86W//We
  cdfR3xfFApvQjYhqyfL3/Sk89S/bhyw5UYinOSDTUYi4qTgQA2IaoGyoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-248.messagelabs.com!1621468139!203688!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4572 invoked from network); 19 May 2021 23:49:00 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 May 2021 23:49:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14JNmr1P008744
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 00:48:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 00:48:51 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] trace-cmd: Conflict resolution
Date: Thu, 20 May 2021 07:48:39 +0800
Message-ID: <1621468119-21199-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

perf(oe-core) also uses the doc included in plugins/, so package it in own subdirs of trace-cmd.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
index d39afff8e..906ca2c1f 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}/git"
 
 do_install() {
        oe_runmake etcdir=${sysconfdir} DESTDIR=${D} install
+       mkdir -p ${D}${libdir}/traceevent/plugins/${BPN}
+       mv ${D}/${libdir}/traceevent/plugins/*.so ${D}${libdir}/traceevent/plugins/${BPN}/
 }
 
 FILES_${PN} += "${libdir}/traceevent/plugins"
-- 
2.25.1

