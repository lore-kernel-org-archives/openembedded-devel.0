Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655E9CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:39:19 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.6632.1760474352204977919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d1OoD/no;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-791c287c10dso4914080b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760474351; x=1761079151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbSHY8zV8X07WfZIcPpka/9601yZuMsS/60qGcA79iI=;
        b=d1OoD/novzjpS++EFk9UMvDonVQmiSfVacRlRm4M26KDD9UqOOWyTIO7NmS1Ka+0vu
         zToXO8w6fYYNg97vHrpSUFJDgL/FHzSntSZDIzUXFCxloJkbHGLxxtDSrNin35TGVni+
         2ej4xzbt9xK+KWYhhcIyJn7ZAZ5qxNU0QKRG9FINssyvJ8T+084JRY0qqzNlWWej/EMG
         uKygN8znFR59y2xQi8i6NGh5HxPkmO+IGLiXNjGgbT9QQp0WE3zyW+xFzo/WjJxAof84
         2rg4jAwY9W5h3jllXSbwj0qjwCdkdEssohIi7BJbS3VWun7Sbha0uGBKZkzqrmyacCcJ
         2pQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760474351; x=1761079151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbSHY8zV8X07WfZIcPpka/9601yZuMsS/60qGcA79iI=;
        b=l53jtqeHKdpWbwepO0N0q1OBenXRNLhpGHBa8UfBlUt/imWNXPixK40t2ekj+9fp44
         RB1VmVcl8HRHW0HZuAoQg3ceU2TGJHQxLikSDWjBRHqx0VrXAKh+J8dnVstIrlpxKcpB
         TNwDceE0V+YQl068tOjoC2dTiFM3jOnV7MLf32EwALFo04SayWYqgvR+XZAwd4fXAY/K
         JfncA9HDXnH1rBFnlyGN/nW69yhdUqezZDE5V+pdo6WVMq5t7w9gkILFnZJ4W+Bs/rUM
         SQfmXGU80iRpUSsa8krw5BkD7ipBO5yaED5uMrqAZsXZB0ozzsonxI6k3zCVrEBgIhSI
         cTjw==
X-Gm-Message-State: AOJu0YyWvnfFXPMbpFhQra8eiPwAWQiijJ3GQvgSASMS8afKO9AMtyv4
	JQYsN85Qv0P9RGl4ATDZMv+er91bk9vKVsxI0CdBsYK1EXxYPE1FR/g3RSXWcQ==
X-Gm-Gg: ASbGncsz3cFhwlMEXCYDnMW/7j5Cij/ZC3b0RqjkbL69tTkfF0rMONZrgOAop0jNWE0
	a/2q6g8sbyrN6AYmejgTA3wHvsXAllz2sifjCSfBX5qesM/hl6trCK0jCaVDXuxEkzG+ltwfR1F
	lL5NzhzGZgDXL9k39RNcgVNf2w/+fi1It6e40T6iIWQyOhGYivoLVMiFncjSNfytiFR6PULPa7e
	C7OzcyM+2hIXEvTJLJPWlFOogzM97qdjsJZSUxcKb3tORpxrpTwZwfCa8U2ZLDkj4dxrQQXvdfX
	a+Qgy16yVArg6/DGv4SklstwymGo4pue8c/42bqe1OGMtLYf/0i1ughBKSqH2UdhO5hbG+vTpCl
	nrg6pXwOXQ9Rd8/MtlthbekXVa8eawUg8x6uRWIE7B8yS8NlSyDQBSe8=
X-Google-Smtp-Source: AGHT+IEExUQILMLoM6jg9ft8NRcZ/nou+tHddOtbL6VWGKkSZwpU3SEH6pKrFos3TIQzV1U8byx59Q==
X-Received: by 2002:a05:6a00:2e0d:b0:772:3b9d:70fb with SMTP id d2e1a72fcca58-793883db1a7mr31514577b3a.31.1760474351295;
        Tue, 14 Oct 2025 13:39:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b733355sm16009495b3a.26.2025.10.14.13.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:39:10 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/6] corosync: reproducibility issue
Date: Wed, 15 Oct 2025 09:38:56 +1300
Message-ID: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120626

From: Christos Gavros <gavrosc@yahoo.com>

Corosync is not reproducible due to change of value
in NETSNMP_SYS_CONTACT which is set in net-snmp:
NETSNMP_SYS_CONTACT = "$ME@$LOC"
$ME = whoami
$LOC assigned domain name from /etc/resolv.conf

Use build in'--with-sys-contact' to overwrite it

https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/30/steps/28/logs/stdio

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bb138b9f6b0ae7a77b5be468356a9ed0d7787c88)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 395b02df00..f9572a1869 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -53,6 +53,8 @@ PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable
 PACKAGECONFIG[smux] = ""
 PACKAGECONFIG[systemd] = "--with-systemd, --without-systemd"
 
+SYSCONTACT_DISTRO ?= "no-contact-set@example.com"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --disable-manuals \
@@ -61,6 +63,7 @@ EXTRA_OECONF = " \
     --with-persistent-directory=${localstatedir}/lib/net-snmp \
     --with-endianness=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
     --with-mib-modules='${MIB_MODULES}' \
+    --with-sys-contact='${SYSCONTACT_DISTRO}' \
 "
 
 MIB_MODULES = ""

