Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A823C5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:42 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24413.1786747655610967828
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=StaHZmxX;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848643382fcso1528441b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747655; x=1787352455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m35+aDtjtDskhvAVDv5uSN59jMX2C7mZsKr2TGvVkp4=;
        b=StaHZmxXf35YCMaLDto5cpLtH6CDVayzHfWx3P+LBQOQOJfscZJp45IpU7JBkzQemi
         bPw9SYvpMzsWI/0ni9viL+4nBrt2kl8t07nb7kRqIbwj0d3v73Uy4PwWatmhvlmYZz2l
         cdI9Tj1MmRmdQ4yKV7DVD4zZOobpwUMrRcQfm9OZVmoagoihpZfEJ5gC+rcpkQGx8nfz
         1T/8Iw1dbNJlDoapR3JxkRGw7v/YaDGewlQXYgOXrHZ6hyvepaIEuU7Sm1u4dZjBZN+K
         j/zllXKVqBXf/X3fEkacAwvLuJ1GYafMSElyigPErBoT/6zxqbhgLpVeFPrU0yY2/j64
         JBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747655; x=1787352455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m35+aDtjtDskhvAVDv5uSN59jMX2C7mZsKr2TGvVkp4=;
        b=kwuX6ksFuw5E48pmHFv7HPALdHsPTHA5+nu41eLmIjn54oTb/k45igHOddfAuexFVO
         v+Gq7jGSY0nTaRva4M9oKA6u9Et4JKiCywX0+W8xztmNIKFyTTkS7wv1e5Lvwxrqhy0L
         HpzAep6UCIKb6fGoYGB1TUH5/vvlYtJyFh9pnXfkkOOGodjqQtRp02XWP/Xh+YRHmSFz
         AkCucRNW2f+BQLHOHAtNBYO43Ap/ADs1a+842BPKrC0aM5NV+KKm7dT493knu1dwz1Mq
         YpNAya6AjfJfZNFnd7rwAj7qzxNHEcsVuS1G9gWbLgafcAHn2ncz1prKHlM3POSJ43+g
         OCMQ==
X-Gm-Message-State: AOJu0YxYj797uqK5sKG8sJI00DsNgxKBH7VEa0DQeufEc763ySnDyTkR
	3ZX3BrnrPctHguYR0RKaXvOa3AJU7TkEV5Z+UoIRPfokFt1zqYiF1diaOBt0K1jE
X-Gm-Gg: AR+sD122+O8lm4uhldLCrNGeinQGcXwidCSY4zTKHCCa07nXU+rLTPcK2bi6i7EyVNP
	EMa9eTsNf0hTOP8DSTK5vOqVqzjG7dwMQBsTe2gyDoBx5+ZkFoiqLjg3l0l1RIYbWulVW+M/xEY
	pwpGTNs3z+nonL69v3SqND74QGM/a66l1Gl8y8/Sqlhtq3S6/93ySRn0bB1dF/iLuUoDzaOisOT
	WGhizu5nQHCNZ8Kbk9UtII+OD6sM9lBD8WZ7x1jPTRM8XA8rCLxEOGVk5gJSUSsEwHAy8NsqMe6
	S7OYkve8KlhQ8oah1aSWBGg8Bip+4uQspZ1d+EKtVdknpixomw6+dU+XFtm4HwMFuTFvK1CWcbv
	E3szQCD/hkpgcWBDbMgrTZj5m3cLJgmBxn4nplw3p/8CwxRpaer0aturYo2c2/ao7jzSD8Ue32r
	KgdMbyhgq3N/+KaONs7PGAcuexgjmJr1tMbHBNcDOvSjzOXtjZG5/ZmI6PWlRJMMca70dN86CWe
	8mz6TzAnrHuw+67VgqY38fgGnKVpK0WPv48+5s06Bwae9MEZIbmJ2AVfY0ctFtdSO/Uwz1xFY+p
	P2StS/WlTn2LPCMPvAkPjARtKVDThdcVON/GI75ysTx5jpOCtibDQedSRNeNN2BnzBv19WrLUGG
	YlDmatGWBqjjuOkt9gRb0yWhxu4qEHKHLZZ4R1nYz3QKifkWf90Uq0U35
X-Received: by 2002:a05:6a21:4d02:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3cc71b36d51mr11204283637.13.1786747654979;
        Fri, 14 Aug 2026 15:47:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 095/109] rdma-core: upgrade 62.0 -> 64.0
Date: Fri, 14 Aug 2026 15:45:21 -0700
Message-ID: <20260814224539.1523174-95-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129159

0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch still
applies (with a minor line-offset shift) and is still needed: upstream
v64.0's CMakeLists.txt still unconditionally calls find_program() for
SYSTEMCTL_BIN without honoring a pre-set value.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../rdma-core/{rdma-core_62.0.bb => rdma-core_64.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_62.0.bb => rdma-core_64.0.bb} (96%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_62.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_64.0.bb
similarity index 96%
rename from meta-networking/recipes-support/rdma-core/rdma-core_62.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_64.0.bb
index cf66a3fc70..d4faca1727 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_62.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_64.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN} = "bash perl"
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch \
 "
-SRCREV = "31af04ec84378724cb6256814d4ffde359a7123b"
+SRCREV = "f272237493ef309984036f7b85655e11104c61c8"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
 LICENSE = "BSD-2-Clause OR GPL-2.0-only"

