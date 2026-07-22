Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEACC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:18:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44515.1784715507017367521
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BQjrNXHe;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so11556948a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 03:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784715506; x=1785320306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/cKMPcBVg7g9PHZm9I2zOXe6wOLtk67q2mKqsxzwm4=;
        b=BQjrNXHelLqAo0zblMhSlhoAws0C8NED7zkXIaRzEtAM2TgSZDdjQyS2tUo/JBF68T
         2KXPo/KzRDg/kb86alBVBrc38fnv0rh2o/7UobQtUQNgYBQ04D8Ny+MgADYaiR5n8Oxa
         XagYsWk7rwzBNRAymC/Hq2DYizxGgzANpn8X/YkdufV1aF7vul4JmGGegFwXg2a98alX
         weQ51prUURkfcgRbZl2Jt8espgYEIBmhXtzqBq/1X3TNc45Mf4kqIkEPPyk+d5Uh1TkY
         tLfCzII2QAZO6l7PfRjX5IAUXzlDKzEBPwYfFFSh2er4lverYcUeW+cfMYx8nZGJX2YC
         kZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715506; x=1785320306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/cKMPcBVg7g9PHZm9I2zOXe6wOLtk67q2mKqsxzwm4=;
        b=JTAs82VWiw/bMqc7Ut21CJjvfx/lnoyAIpWNLM4NEGS3WO/KqTopZ8IH66R64hgpLZ
         pKJnHFe0Qb6PCMkiHxeTEOZqqwCpHTE6Axz07il+/sL8gh3Sz+Xyx2H8gUGeUkrW33o6
         fK7qzG5pxZr/+8RtxIG2y/mbSkr0w+nKonieyGko1m5cwkkOz92kNXz97A2fUxpmviLl
         QRC6GK54wTZ2f7FKc0TnfK9sgnLykhHGprxJhbwwZfw4//9Vtk0wteAOpHQAzLyZDZOb
         +U/+hMk31LvSyRwTlnuF5RYl+EpUf9eqoMlvS0S2432FzlrxlJNxmYunAFdfu+qeB9Jo
         VUTw==
X-Gm-Message-State: AOJu0YwBI6lNoVwlFvaC88XLvLaNgPvel4Ccd/bGvOZP8fo8w8JBJb0m
	wH/xOKbgyUsfzuX+PsA+sEAbt2YrOKIcFjO38j9fqbWI1hEGogcQnT1+tu45BWxQ
X-Gm-Gg: AR+sD13vA9xjuzPVzWCmz1Og7xuc2LnyaCqvRYJRfySLVGyld5PJ3Ghw0CCHs06vCAq
	WfqKDTqyqZMX4GwC1LOZwslZi+CMPnWasWq0rkFvFq3hrTr6hyeepnc8pE7MS6yVeErtlQBuJW2
	EJOzQeCdqmDJerfSW8u1c50sCUZH0g+2r2kond5D6evtg5DUhKvKh7FFSS8nm3Pe4BoD+bg+5MK
	+4AvOXSvcNzMt+B4jraDUaxIrBShYOs7SnMAZqqZ9zJx8On8s+43TDLI04HdV1EW5FeG5Zj46Zc
	+2NRmA43+g1vL/fSn3jun4rLAX4+xn3Sknmck3BTmqj1mHf42ra3uXBqd0TPGcIOSF3IC+QtHVc
	7/+smkR3+qroJOr9sFJzIdsbYSavAlOp/mBQcFKWFZaIJQ9YV09BbXVOlltMIMUWmvAlNgezt3p
	H3bh+orxbEXFjf/Ak=
X-Received: by 2002:a05:6a21:7008:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3c3ad7a3d10mr25614409637.23.1784715506337;
        Wed, 22 Jul 2026 03:18:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9d932sm7808659eec.12.2026.07.22.03.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:18:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/4] haveged: upgrade 1.9.22 -> 1.9.23
Date: Wed, 22 Jul 2026 22:18:10 +1200
Message-ID: <20260722101812.625240-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722101812.625240-1-ankur.tyagi85@gmail.com>
References: <20260722101812.625240-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128368

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/jirka-h/haveged/releases/tag/v1.9.23

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../haveged/{haveged_1.9.22.bb => haveged_1.9.23.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.22.bb => haveged_1.9.23.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.23.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.23.bb
index 3fb6e2ca39..d977653ef2 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.23.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "21bad00a09233855fbea14ac062bc72b5eabc9a6"
+SRCREV = "99d5b8de8339ba7725e3cff005e2f77ccf699582"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
 "
 S = "${WORKDIR}/git"

