Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43190FA3730
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 11:29:08 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3569.1767353344903399449
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KCckq5mQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so9413339f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 03:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767353343; x=1767958143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+DqoPDHQsJKS5emE/lve77nYzwRY+MlDp0DmTiEDqU=;
        b=KCckq5mQIL83J8Emq4vTEpLg+g2ev4wlIy8DldGXyEs38qYXG7k+mVsg2utkQPW53Y
         LSm1YXG/j8hjucb2pWYfAdANP+hZ5v8rMD40FOQuWNoKGyXVTtExxjmTJ9nlvJVWAHrz
         pFmFresrs0+az3M8OHuwzxp2g8FTtvi8Wk6zzxA/1GUnGr8gEA/FScVR5Q7VCSOnNHZI
         NpbGojJYUwKmzVRLq1ogQqEx0ae+um4Z0bFsihc28lO7ECQqLMHwQVtXGGCw7i/XkxOd
         PdGovs9klBNulc4PP2W2cdx2u9ckxOopII4gdJfWNiDIiGSMTEl4W93ETH/CfhBRsZLC
         pw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767353343; x=1767958143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+DqoPDHQsJKS5emE/lve77nYzwRY+MlDp0DmTiEDqU=;
        b=ZHTavNio9GCJ72YErPhdH5mhXiMUXbuXYuyNwMz3JfyEIWD/TOBe8VEpjfRnxuh7zA
         p6jP4IeBSkv5gYEyQ0xaKmI3qGNYtWPJMSBfUQzZuootlZ/9IQ6KgcSpYqUCfuvblott
         8APbX8Ci0Z73R/FuPUJ7PMlSsGQOVC3yL35twMkRA/UVvDV/rbxbCjHqJT/uUEfICv3z
         jgn/FX/VkgDiDJchWCE85uKS4igO7VRmq2oNhsdbEvK+VsbqByb4GkLMfEKqEwcVc6aY
         L2/JREXG8KTBYa9Ogm9e35oqTOMObaBSAqgtGblOvcLEtk5BGesBM05Zu1jJD/2DnYsb
         gyTA==
X-Gm-Message-State: AOJu0YwshjvFM+O+vjUfLNLi7v7uS5EiJD/p9knI2H1YfJcxvT5bjp65
	jAAo9k75ju9zSQUCh0gRJ35sP9NcmuY7A/IMYbpzzlCyL+9AM75BA2yNa/EneA==
X-Gm-Gg: AY/fxX5VgSChAxyqtdqls73CO9MrV/InPcvI9Y+XdV0sd8cEN1YlnmV+xzpzP0gSPge
	jxq/G5Eokh77uR4KACiQiD+lHKKJxuFHhmtidE19P8YASPumw9PMsRIW0oizybl4Z+RDwuXtcC7
	kDxOUpDL1+UTP4AAo/XY/PW0NjnCrspfZiM/UGPCvQFei0wGX4kfl9ASZSeLBmyZkBinz4iZ9ox
	fCzjw/Xp9T9IZPeAfA+c0srHJYVMm3J4kVNhWy5hvZHF+MqL1FUf64xsWydr+jUpWy6MZlg9FCh
	iDPsAMuiQU73Ba/PR+TkvlIguhTbwewHtjAx30p/3YQOGVV2bYGWfgznjkkiP1pNyuiAsxc4c/y
	ypypjE8T62Ye58LkGQipaU8Bg0dockp+C81gN/o7YWNDA+zqRqapmux71iTL/ILS6QBnpEIeOsW
	vm/EUqiaNk
X-Google-Smtp-Source: AGHT+IEMdOoVXD20F/RXvtnAPsLn3UD4rXcY2B+wuyPum8VgC8aKKES03/XN45TOoUn3x3MPPb+cww==
X-Received: by 2002:a05:6000:4202:b0:430:f5ab:dc8e with SMTP id ffacd0b85a97d-4324e4c6338mr53826812f8f.13.1767353342567;
        Fri, 02 Jan 2026 03:29:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea22674sm85562757f8f.10.2026.01.02.03.29.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:29:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] fio: ignore CVE-2025-10824
Date: Fri,  2 Jan 2026 12:28:55 +0100
Message-ID: <20260102112900.1800006-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 11:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123090

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-10824

The upstream maintainer wasn't able to reproduce the issue[1],
and the related bug is closed without further action.

[1]: https://github.com/axboe/fio/issues/1981

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a275078cbeaa0fafcfa4eb60ca69f05a8fe3df99)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_STATUS)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.30.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.30.bb b/meta-oe/recipes-benchmark/fio/fio_3.30.bb
index 62b21339d0..8b864e24f2 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.30.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.30.bb
@@ -45,3 +45,6 @@ do_install() {
     install -d ${D}/${docdir}/${PN}
     cp -R --no-dereference --preserve=mode,links -v ${S}/examples ${D}/${docdir}/${PN}/
 }
+
+# disputed: Maintainer could not reproduce the issue, issue is closed without change.
+CVE_CHECK_IGNORE += "CVE-2025-10824"

