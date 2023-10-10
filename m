Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD060CD691B
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:39:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.87078.1696930793894659534
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=V5m2IasO;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32ccafde8e0so428465f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696930792; x=1697535592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMZY4KLV8nhdJmooczmjn6lxJR6KYIDMlc0BxdkbQAs=;
        b=V5m2IasOlJ5owcYETVTsRKCUjHcjSyfeoT7hAEDehYkdJvhn8vyMNtrmIlkCNNswJo
         k4mdPvw6zYO6vTaMSY6bLThdYyrFd7m13yr6ZNeAvJ2qbv8j6DY0nG9AvKDtW391edXm
         y6bc6VXAU73FU8VSz7SGK1djB71xJrbnuJasu2KJafGAEJCKCihHzYvzJU50XAGmFXoJ
         Cg3bluuRX2TSnhGpFVqt52ViEhe614sCsz154veK6Ud3hJvklIJ2h9mo35oeySwJpiiY
         yrlBWMA772DaY+Eos3ymnqvi8g6jRiOnTQzle9hjNToABGZheVo65C2ARzwAaQvmxc3N
         wJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930792; x=1697535592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMZY4KLV8nhdJmooczmjn6lxJR6KYIDMlc0BxdkbQAs=;
        b=i0fq6BVQZaw9uH8IK7F2yvxTGZTscuNNmDWeNDKDj/6ju4UONjbBCKUEjdz8NezFtK
         8nWtCnGqvvn0kGS5q/ufgUBEdRew+OKI9mqVBBEkc8n58/T7gmq3VvfDKBoxLG1VY9w4
         vETyDZrN0RBuvOzBu1yQLF+vnsmva3500s2J0ANZATd8Sg5fc9NdbWmoSyoU73UZN7xH
         WT+cVwJITUMVRvHCxOUth8jN53Pw/T6E9bzZsymBvp/uQ7l728hmxg6n2J17rlD81p0b
         94DDNWR0v3/eWCCiHKfp5J80CSBzXZpSVRRi48BWtFsa1TSw9YCGUMzeWeFA2U9z63yI
         isrw==
X-Gm-Message-State: AOJu0YxkKJkrMijppdd+KP8R8V0aWJmgVnvzyOyqNlp5oE85auV22Tkk
	F3MkOm/V4T6NseN+1iLYL1LJ5UmwA1oSuFzQ8yE=
X-Google-Smtp-Source: AGHT+IEMyYIQ/McTSDYWkVBgicpR+suQrrC2y4e/UZZ0xYU0CpJp3U+Udw8MLGISoiFC88m4RhDxkg==
X-Received: by 2002:adf:f290:0:b0:321:8181:601e with SMTP id k16-20020adff290000000b003218181601emr15783131wro.8.1696930792214;
        Tue, 10 Oct 2023 02:39:52 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e00ad7461ecf2f04d44.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:ad74:61ec:f2f0:4d44])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm12150639wrw.108.2023.10.10.02.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:39:52 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 5/7] Add static-passwd and static-group files
Date: Tue, 10 Oct 2023 11:39:38 +0200
Message-Id: <20231010093940.75037-5-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010093940.75037-1-fabien.thomas@smile.fr>
References: <20231010093940.75037-1-fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105401

In order to pass reproducible tests, recipes that use the
useradd class must have static ids configured.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/files/static-group-meta-oe  |  8 ++++++++
 meta-oe/files/static-passwd-meta-oe | 11 +++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/files/static-group-meta-oe
 create mode 100644 meta-oe/files/static-passwd-meta-oe

diff --git a/meta-oe/files/static-group-meta-oe b/meta-oe/files/static-group-meta-oe
new file mode 100644
index 000000000..79c9bb6e1
--- /dev/null
+++ b/meta-oe/files/static-group-meta-oe
@@ -0,0 +1,8 @@
+redis:x:600:
+xrdp:x:601:
+sanlock:x:602:
+mysql:x:603:
+postgres:x:604:
+zabbix:x:605:
+mail:x:606:
+nogroup:x:607:
\ No newline at end of file
diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-passwd-meta-oe
new file mode 100644
index 000000000..4c312b7b1
--- /dev/null
+++ b/meta-oe/files/static-passwd-meta-oe
@@ -0,0 +1,11 @@
+redis:x:600:600::/:/bin/nologin
+xrdp:x:601:601::/:/bin/nologin
+sanlock:x:602:602::/:/bin/nologin
+mysql:x:603:603::/:/bin/nologin
+postgres:x:604:604::/:/bin/nologin
+zabbix:x:605:605::/:/bin/nologin
+cyrus:x:606:nogroup::/:/bin/nologin
+pcp:x:620:nogroup::/:/bin/nologin
+pcpqa:x:621:nogroup::/:/bin/nologin
+influxdb:x:622:nogroup::/:/bin/nologin
+mongodb:x:623:nogroup::/:/bin/nologin
\ No newline at end of file
-- 
2.34.1


