Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3273CD13D3
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:36 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27191.1762704027595153020
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lqY3nmfG;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477770019e4so10377065e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704026; x=1763308826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zdZ/FJhWFKl5N5gwpv3vfEksxF6gQiUevnSda1UmPM=;
        b=lqY3nmfGwkO4nwXXcyBezakauXBEak2heX/5RPzMLW3e9+CgUTMjOXYXb2Lmes4+89
         zP4vaLyB9RJpMgQy9WSBjCXkC0rkdIa9qEhj3KNO+PPez8Id7XsOPm5LyAIgZT9P9lwM
         ukOJ0HPgEpWUQpB3Kpwbez497gt21SLFLmJBDyMBMD48sIq8nNFs90Dq2dVfUicA5vY3
         XLcp+9NheA9QDzQXOSV8OIPY/lEd7Qui/nt+FZYBpBXlm7hjofO+m7h5IXsSU+CycFA2
         QucHDnUj1pWIrJFBFNr2z+TUvhyQYn78sPIikNoapT1/FDzHqB0K7REyBsvsvCNVTsbh
         qsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704026; x=1763308826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zdZ/FJhWFKl5N5gwpv3vfEksxF6gQiUevnSda1UmPM=;
        b=KACZdP8DTZvOFaSpUfgDwhjKbi2leFOSfiDfQY5z7gG7DOUh8aZy5heWJWpjA87W85
         UZsImYqq/v70184MBXAfIFA6LUcg97VugZCsmi4AkzLjXeyE7Y9W0tvasOHjQNtBQwnX
         +zlIRavBM6MbKbPV8e11D38giwwRaLp7TOiw31Qlnv15POd6nu3ICLYOlnPHHf6Je0Wm
         NocwdzXE4XgmIVRJv0/0WcJ567USgk7Qxo7jHfjqHJrCp1gzpBjsKXpmpiW53PnDdf7d
         BO3cSc6EJujYmYF3ElWN5EK4xbXITs7T1KGOLFGZaB1ILPESJ0l2jBZ5MSLncMpMpHTU
         rnnw==
X-Gm-Message-State: AOJu0YxwyIvhCP2LPjkkCWduPgVpMM6JjJkHFRDcZeZ8K4UHSbp7VXro
	uyWCmJLvP6sZUsfineWsldixnaq0Hqj6qBiNhtgNyoNgXH5T5GgGiVKB07ROGonv
X-Gm-Gg: ASbGnct0sISH/aDT/BOPsaLyAelIeLvEFWNPEz4pL7U4CWmhGziX0L2oDUDeBaNg+rS
	PGzt8kCazIkY0EkHcMZ7nSVxRD6hs615jH0/edWQRgEPNpMa5RG2A0IEfR0916i8Tu1zHH1yB4o
	4Vbwy+tYCI2H3Mu4BlkT50DthFXOPLEFUCWhGM/OTdTORvCHBQY86Hucpo1MCrzOdooZ/3lKdlC
	gxT0uE+a3lJHOtmoTgPL0AtXpR6hS7cyTpK0A6AQRyRTwI4NwpxF8yAWTljcVQL3puz506wNWIp
	RN7MGs6XnUhox0oKRdjzGzQpT0HNxcBPR06ZQe9k3L4yUyfTprMHWApHrsrmDHXGJXWdMQSq4up
	Mk0oC51O7DNfrVsJoZ4lM05J8MoNTLSy7NRQo4sWC3Goh6HLRBpZiKk8PDwHpqHufD4DvhPnznQ
	==
X-Google-Smtp-Source: AGHT+IG9vs4vClWqhha7ffZMBPTbOU1+f9ylcJYDpJlwl7on7TxwXdZ6U9JOeQUJtFCYCFOFi70jbw==
X-Received: by 2002:a5d:5f87:0:b0:425:8bc2:9c43 with SMTP id ffacd0b85a97d-42b2dc12867mr4406246f8f.1.1762704025850;
        Sun, 09 Nov 2025 08:00:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 05/27] zabbix: fix SRC_URI
Date: Sun,  9 Nov 2025 16:59:57 +0100
Message-ID: <20251109160020.2522353-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121421

The folder has changed, causing fetching failures.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
index 8708852ce7..df29d4a9e7 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
@@ -23,7 +23,7 @@ DEPENDS  = "libevent libpcre openldap virtual/libiconv zlib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.2/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://cdn.zabbix.com/zabbix/sources/oldstable/6.2/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://0001-initialize-msghdr-portably.patch \
     file://zabbix-agent.service \

