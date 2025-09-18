Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7E4CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:53:41 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.9926.1758189219463133983
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d///zyOg;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so1268591a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189218; x=1758794018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LrEfqGEuAvbSpnG+iJxgDNBpRzDOSX3w8YljUjRHiQ=;
        b=d///zyOg51yyKv9a1CHTzY6qO0bnSRE94n8g/TBTmmrG7s33I6encqG7QyrvZ7PbNA
         iuZbaWwiqvuEjjpqki/m6SwUo8vDXP5uuduxBMMSwoFTQo93WdFB2mBkrzWDqaHuQNNs
         Ky3cM/xlOsQzCGjdkVrt8YpBDXqSaz/exhOBu0B8ErMC9ZAEmKilBXUgCsyBbDJaZhKc
         XfOkC+3G8EGFtskXWBvo5PPZl8+DATy24lnUVEgSCeb6DXeQhUte+Wmrk3jA0ln4QR/X
         GzXdANdDRN969dB/e2/eHZwfw8iAHW0Pj3ihUEQFkeyIstzO/ldggK9ywtm2dLHe6OMy
         124g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189218; x=1758794018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LrEfqGEuAvbSpnG+iJxgDNBpRzDOSX3w8YljUjRHiQ=;
        b=p5uoq3KQxKM/SWR2mdwJTnIHsatI+dVU0YgPqln/be5kdCJktM5oImjeLxWBRiOcYC
         VV4h+09ypwMWUNbY/ZSMf6uolhxw6kFNnCG4P9kmpLBGwwQ3zXWpNOs6RB13iV68esLq
         ZUtHh2sMsUi8TbWXO/++dpaSGAq+orcflRMi1lTp9eDdEl5GDc4jLf5/7sk9u/Fe2K9g
         45bbAom7c3cRWxx7QtjVImIfnpe2sflrBufkZwGcBq6ZH2bHGAPXC36IjpUdYVTYSjUl
         c/Ipsnx4EO9nLAEiJT7RVG98Ea2jqZ3gii93PyGSyoxzzbF3fnx5xKQ1fQFGXDZPcvyr
         s8hw==
X-Gm-Message-State: AOJu0YyKRn8+WkwR4M01vEf0aN+ERLkwU1YljgsJxLfU6DgJO1PHbxbe
	fI9YzxJXzzo2nKJDM2HNXcKCPJx9qR71HPT0KDKqselK/EiFerHhkOl7dqkeqQ==
X-Gm-Gg: ASbGncs37Ap/Ts9Cjzs9fpA6uy4qTVJ2Xhqj9NWGHChD1Q5ZzdB7w0W58+OUpUogICJ
	F9R7mpVfiXPTXch71k52fTdpS+z3GgGCTQoDrS+sSyxDQlRQg0KfJjonM2qTVQCEk13S0jdT8lv
	VsW17TgDQMKJywTlKuAYfZM/M66UfRhA0FhS0QxV62XgpYXOUG1zEwtuMRTo8cza+zzfwkg+yl9
	ayF4h9bl+NoKVkcZgQDkOEkcAFboRY1PlSSrIWbkc91BPg0b0swWr6iCAKj+2maeB01bxOdliF3
	g9bLpq/7K2eFEUsvs5HnQlUd04Z6Or5TMASMlP2toXghvgBtRtOep32vUBLvM2Q6772ISqLK8OO
	U5lUSA15VKq+rZGaKr9EYtS5aT7ti52XbQ+aOo+Y=
X-Google-Smtp-Source: AGHT+IGA6PXCDGjDLAqDRupf1G5vK7Oy4STYcKRWGUATLhSDrLanAhd5kBH9eYW1fGku4ROp53QUwQ==
X-Received: by 2002:a05:6402:35cb:b0:61e:9307:705f with SMTP id 4fb4d7f45d1cf-62f842136a1mr5011945a12.7.1758189217668;
        Thu, 18 Sep 2025 02:53:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1168184a12.16.2025.09.18.02.53.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:53:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 07/10] cukinia: add libgpiod-tools to RRECOMMENDS
Date: Thu, 18 Sep 2025 11:53:29 +0200
Message-ID: <20250918095332.3369767-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918095332.3369767-1-skandigraun@gmail.com>
References: <20250918095332.3369767-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 09:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119548

From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

The cukinia statement `cukinia_gpio_libgpiod` requires the `gpioinfo`
command. Alternatively, the deprecated sysfs GPIO API can be used with
`cukinia_gpio_sysfs`.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit deaa4c111fd3cb12dd7d6cba0550316d71dd8b07)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
index 9ad6e6659e..e4ca142c81 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
@@ -15,6 +15,8 @@ S = "${WORKDIR}/git"
 
 inherit allarch
 
+RRECOMMENDS:${PN} = "libgpiod-tools"
+
 do_install () {
     install -d ${D}${sbindir}
     install -m 0755 ${S}/cukinia ${D}${sbindir}

