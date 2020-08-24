Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.190064.1598250149145422362
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2020 23:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=C8189Dvu;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=498d700d9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598250149; x=1629786149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FVGx4I7GcQtKpJ4xVglwtvoVYpvBu8aKpuVYLWO/AZI=;
  b=C8189DvuyY4RKPUmvx2L1tpAhqh7E+bemF37Xqa8Z9A580t0Bwe4fCa/
   CtHaqjs/Hr+flgYiwkns/KGL1yFMXDJz3bdM+XmrXPc95Arx6G+01GGr+
   JRLl3mBAEacL3bDO6zsJB+ovkfitIQy+v/a1mR8WkkOKihELuGRmRrmCV
   jkf7uo+RwPYLb87Tn45sXWs3VIKJZ+SBPG4BTT1fctQFQi3Es1IWkGsyd
   fBzvevn2uMtuQAAPmCbhGm9p5kaEd4XbuxZwesTVtsN/UZPATBO0p8yGz
   +uZDnK1tFXJl9rATCcVIAEGDpnlVj7u1P9FQuRwGFjGEcQNh65hfdFnR8
   g==;
IronPort-SDR: z/90b0AFq3czz62KnWyfZm2IvX+vgJBOoaKw1x4jA+JP3WtyoK2qXRNm9lPGMwaq8xmG2FKtdF
 Jzxjc6hBSNVKpRpNBbdoCvJGo4RuhCC34Jqhbh6M2rf0GSSZDdy3V5EG6LvcauLWonAjRtixHg
 MkZUOwMrjIX7a2Fw1/spyLTBHDBrQEieFu4Nd36Au7lewVGglzFdJOPoot5qzlysTiA5ENKuMZ
 tTf36QyhwJnXvtNIKWtkfo5k2hsOwu3ytYPTg39LxsNOGYSUPwPxCSV5GUXSdxjpnrHD2MkwQF
 lB4=
X-IronPort-AV: E=Sophos;i="5.76,347,1592863200"; 
   d="scan'208";a="26327128"
Date: Mon, 24 Aug 2020 08:22:25 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <jpuhlman@mvista.com>,
	<Vyacheslav.Yurkov@bruker.com>, <fabio.berton@ossystems.com.br>,
	<robert.berger@reliableembeddedsystems.com>
Subject: [meta-java] Changes from master-next merged to master
Message-ID: <20200824062225.GD65616@pcleri>
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
this is a note to let you know that I've just merged the following
changes from master-next to master:


Alexander Kanavin (1):
      openjdk-8: add a glibc 2.32 compatibility patch

Fabio Berton (2):
      openjdk-8-native: Add libxtst-native to x11 packageconfig
      openjdk-8-native: Build cups-native when using cups packageconfig

Jeremy Puhlman (1):
      icedtea7-native: set ALT_CUPS_HEADERS_PATH to staging

Richard Leitner (2):
      openjdk-8: refresh patches
      cacao: update to latest git version
      openjdk-8: update to latest ga version 265

Robert Berger (2):
      icedtea7-native: host gcc-9, extra CFLAGS needed
      WORKDIR and ARCHIVER_WORKDIR support

Vyacheslav Yurkov (2):
      jlex: set unique file name for download
      icedtea7-native: set unique download file names


If you want to see any of those changes backported to stable branches
please just reply to this mail or send a patch.

The patch "icedtea7-native: set ALT_CUPS_HEADERS_PATH to staging" by
Jeremy is already scheduled for dunfell as mentioned in the patch.

regards;rl
