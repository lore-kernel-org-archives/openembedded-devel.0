Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A99EFCD71
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:36:22 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10102.1773048973580436321
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VvLLDXc9;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b9b1900bso5741970f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773048972; x=1773653772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYOXbFUQXjVECAMza9eEFn9+tz+ldbtaq0OS/ydajnA=;
        b=VvLLDXc9LMWZq+v3n7bOdu4lYc9AOoUrl+54eQXgQJfnHPFAYG82l03DMr9nesSUo0
         Gn8e1esLXDKioXu+MYCKoos/WMqew+qqUmAMjaVIx6wfJQu7oztosvH5smjawLJlCj8N
         3V1cdXPV++YobBvDbeW92xyKCSk45emRmjQcc9/XS428MxlHNmuDYb9KcSuxPkIVomUT
         4duzjG1JNbMAHGp6e+YXV/P0W5mWJ2MgUugSYOoHgOeNaec95dYg0rhOg2Vj/yr6HWY9
         LWdyc3ZrREOXDCPQAgnyrTGAb/SyUYhj4qq3wupc9Bz4tdRla62PFwmBcJQUfNXj+iET
         mwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773048972; x=1773653772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dYOXbFUQXjVECAMza9eEFn9+tz+ldbtaq0OS/ydajnA=;
        b=uFjfKDs0I6MNMrVMqNuLjdJbwri2QWfqLL6NjMpIM7AH4uIkI5DLpn1Z+KMCXT1HSH
         jqLDsIxnKhIoUi6Jskzc5Q0L1hgJgLWGSiWsl2/+Vpl1BAPfcHpP/fkwIY3rxhBx+/1Y
         Ak5ycKAutuHgfvSJPiVx4lDMG047j/049qE0xnYr3pOb99EmjeHvr+61IzPVnZX9oHLf
         v1XGzDj2P56JdZ1xuQG5mwKCuMBAm3b0FuRc748IUwh6DwCSVXeJ6W4sR7ev/rncB34V
         ADhjoPBM0he2blasvR+YMtqhesEKbwcRgYw+TM2Er16m0hLF/S/wIVses8onb0slgTJI
         k3/Q==
X-Gm-Message-State: AOJu0Yyvqw91hhPkXSeiyRg8kSB9+MbmzuNmcFafbAKt0oeRi8UPJqND
	H2TRAFgAIxG2nz7rV7vrIrE43aQuMMiZdZWPa+zUFaCRv6g1CNEuGY5gep/LzA==
X-Gm-Gg: ATEYQzyQhK63DYVJcFm2frp5pkuqnAiNmABUk9cLyS58vxSf5TU7UuClRfcPzerusG+
	4EAXybFqxVsik2A3aKJ69caC3jaJPpSpfIPHOat2MH/LGGjvXzoX1rrMKKtjBnJtZqRE+vG7H6p
	IKStaQn3uKQXpzYnPa0Om4aEzgBRIe97PAKPzpgjHG0RgAe0kXpp9VA1srXYylW/OJT2R8pEQkZ
	7g6TovfB4antP0fFYKxO2nsblNnP+QlfBDJOejWpBuOJco0hmQDtduZ4KUblhDIPP3kaG1I0ZEh
	yGKd62Vrib7xa4G2oZlVcGNMIu+01stclF/caFz28t1+b6vhsAJc3QoAVZBaCX1pYbGr9JNQS2z
	ZPdakjB8rT03D2egQBMvP/NOzTNL/EEPDJp2jnBiX5M1t4k1kD3sznA0JxvXlCmmTzEYR5iMtD+
	1V/mInsyV2d5quYzzeMw52
X-Received: by 2002:a05:6000:4313:b0:439:c122:4fd5 with SMTP id ffacd0b85a97d-439da65d6camr17796824f8f.15.1773048971821;
        Mon, 09 Mar 2026 02:36:11 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm26062120f8f.25.2026.03.09.02.36.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:36:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] zabbix: mark CVE-2026-23925 as patched
Date: Mon,  9 Mar 2026 10:36:09 +0100
Message-ID: <20260309093609.274988-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309093609.274988-1-skandigraun@gmail.com>
References: <20260309093609.274988-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 09:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124968

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-23925

The vulnerability has been fixed since 7.0.18[1], however NVD
tracks this CVE without version information.

[1]: https://github.com/zabbix/zabbix/commit/89dec866ec7f8230b25f06ac000575e3b7bd4025

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
index 0b066de282..1cbe9ed9b0 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
@@ -75,3 +75,5 @@ do_install:append() {
 FILES:${PN} += "${libdir}"
 
 RDEPENDS:${PN} = "logrotate"
+
+CVE_STATUS[CVE-2026-23925] = "fixed-version: fixed since 7.0.18"

