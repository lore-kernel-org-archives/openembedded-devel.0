Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C86DCC6B27
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 08:36:50 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8750.1791967002513799892
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 01:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fmLA+voZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2364041f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 01:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791967001; x=1792571801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAiWHwhihcuJzwNPc/AVqFkAhhalZvwwYgRGqoA51T0=;
        b=fmLA+voZVzOixLrZwb4jBTbMFE14Jcq+yOQaS8T6+clNVopHfk0RIn7W+FJ/YOyieX
         zHGO0VS1z8bBPgOSi/CsMyDDboZlFtDxTCi+VIuYWsbQVz2/YOd+zgMDrQUge4bs0Yvy
         klT57Jy8hc6KBrkNOrqDoDfr7mEwmAMxcfuqytZYtOZgqNUnO3j4Ry5abU7hCQYA3kLz
         PJtRBY3GbsVB4QE+j4hTm3l1Speqt8U9jTKU0I74iwhJb3HJADHoy+rRNyeD0qkfC7bU
         eJT9kZ4eRuOAmCqTm7DWZXjtqSqti3hlza0R7syioGMghkBYm/gendH7nATFe3N78Vl9
         GbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967001; x=1792571801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAiWHwhihcuJzwNPc/AVqFkAhhalZvwwYgRGqoA51T0=;
        b=DP0L2hgVTivMf3hBzsOfuTrfMWgPV/E/kZLLb1hzN4ZAyvSCG9a8vc3Ocfl5FFp0H1
         It3Ysmj/JzSHvfT67jOwhMSPlXH70SKD4EnIjFNTngqFGwabSIV6eKsfqM2h1/acIAjf
         6tb8ruFVIPNv139yfVHj3GQEc4CkEpLsixgBg4w6DJuRp7wLJ51HpnSF9r44aj85wFZF
         fz5rprx9NXz8haM9GFGA1MCQWMZCPyWmfh7n7qy1CEFxUUq0JynBBYnoo4X01/JGSt5K
         Wb12hqPZN68PBvNj7IOO0A4WjHNSSS944pjNOYQKtrXsnNvsk7f1aNH/nbJ9YU07T2dh
         HebA==
X-Gm-Message-State: AFq9FYKalevb3wPzf2T9IT/wLdWxe6d2fYiyjRd5UGEm1eMBzP+/lZE5
	Sa5rvnq2x7OMNYkkcuzKwU3kv35y2ZyoOuOUw6P4ST395Txpol9yEc0oiDQAkw==
X-Gm-Gg: AYBFou3rI4qYT3R4Hrao07MmZsowaUy7VqdlDinTO+Dmmx0dlEGPNs4lvtdQQehj3Uh
	uiCpZJXgLX/3hj+Ha+qjQmBcZy0o44kCmD7T+xAjn66q1y8KV5mBy0t6m+4bprca8VoYyALOd5D
	tYx39NQBfouSSvHR734Ejy5lmjs0UDiz8LPa4EVwrV48RQYp0v84JGSrWZtexY3LXSqrgdDqvr0
	57muqwmv1QpZlUW179jJ58Sl4hjF0KJyt1d5+fjTqq/33CK6iM3To5DlVdmZOW1hmTVjz5tGwoK
	Aaf+JBOgrOH8/TpEtXUVMaN0wGiVJRIiAOLq121obAqotDUp68vDKCmAGcykerXRY+jhrP5WfDV
	/XtnXQ8q9EgwGoBMNMqzgX56dfYDYhS7JQWG8w+ge27wGe9lKQCzaUrmWfuFxta5zV9C/8GYQ72
	gmUppTfGzmxs0W3pQh9P/0OMYBw5+14Uwk35/1AVYR1DjSiWwndyaAT6kDcWef0IUcRNF7Y+Tlr
	s/qo6nm36WkJRMOe/acTu+SLnTP/USHL9LGUscahrwOBnfK9s0RmzAjGkE=
X-Received: by 2002:a05:6000:4541:b0:48c:7161:43e3 with SMTP id ffacd0b85a97d-48dbacfa612mr17905257f8f.54.1791967000404;
        Wed, 14 Oct 2026 01:36:40 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac35dfsm10576925f8f.33.2026.10.14.01.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:36:37 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] wireshark: Break dumpcap into its own package
Date: Wed, 14 Oct 2026 09:36:24 +0100
Message-ID: <20261014083623.2773200-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 08:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130868

dumpcap is a lightweight capture tool which carries no dependencies on
wireshark. Break it into its own package, with an RDEPENDS back to
wireshark.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../recipes-support/wireshark/wireshark_4.6.9.bb          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
index 1a10eb08e850..fec2345b0638 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
@@ -106,12 +106,14 @@ do_install:append:class-target() {
     rm -fr ${D}${usrlib}/${BPN}/cmake
 }
 
-PACKAGE_BEFORE_PN += "tshark"
+PACKAGE_BEFORE_PN += "dumpcap tshark"
+
+FILES:dumpcap = "${bindir}/dumpcap ${mandir}/man1/dumpcap.*"
 
 FILES:tshark = "${bindir}/tshark ${mandir}/man1/tshark.*"
+RDEPENDS:tshark = "wireshark"
 
 FILES:${PN} += "${datadir}*"
-
-RDEPENDS:tshark = "wireshark"
+RDEPENDS:${PN} += "dumpcap"
 
 BBCLASSEXTEND = "native"

