Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC86CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 17:00:39 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.17991.1712336432871822944
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 10:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cZ2dLJc9;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7d03a6a11a2so106578539f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712336432; x=1712941232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5/RaSB3k+Avs3Ty70AobTIP4yeABubSTZFJrFFXVqk=;
        b=cZ2dLJc9ldZV1reSDEhX6WVqEicjlKvtQIGnIu9zdgoIAoW+d326qHXB3TQDbW7f13
         5l79ljIXusQYCcIsbDM4zTw3oboHCAYkmGFzIsT2ntc3SDdqvZXf3nDsj+VE5Ec8kfAR
         DpcYF6LtJj87iuZPRMOBFWddE9Em/Jr3vfr6JU1A22Usd9W7kKONnYW2gq2Xmv2ai1Tx
         86k6sNh0FOZOJtZj1/NOq26lR5/iD+YAnOWA9JaDWsx0nKLJibxGOLMN0pnq66qUBet3
         21hNu2uIboc85uVgpLGRJjZxbcd5kcW3tOoDTJQF4jrBv2AAf57jHd3V+xSr1UD3qOc7
         DoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712336432; x=1712941232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5/RaSB3k+Avs3Ty70AobTIP4yeABubSTZFJrFFXVqk=;
        b=iNViOakhulNKhJfAu4HUKxXyFdFhhEZu6vVYOZ476QN3muIlgnKWSEPIu97NkrjbFx
         0I6BNFbUdLNLDlKTTkwy3+BAmGr4lgo3OiVF6hkZIAfXuDg3NGizBtodrjkrPL5wEFI6
         XzRPfStmp0bKaDZ6xLCBX+bFcirZZL85TLqcYLgv1rKwKNgdwSmNxLGUJK2/GO8OHGJ3
         nUhHU/PE8I6cGlBNjB0BTkiBoz8WN3yLehWHwLZMegQKMPMdlWIxRftmkyyWPFkE9maS
         Pg6hUOeezAejaMGDmTmmvv/EoXLOOKkHEBkZqBDoZr2EXJ+fEXA+Ifg0KiGbIYjDIOP+
         iGHg==
X-Gm-Message-State: AOJu0YyxcqBZYc6H7IJu+iGEbun+p1xBeHxq5vc22DK7r1yypFetFN+X
	B0mzbkcGH1l7EHAK3diuoVdgOVjcOTWF7oZ1n8vaz7BVZPRDGqR80e91bo/UeLc=
X-Google-Smtp-Source: AGHT+IGlHL2h8p1E/6RPJb1wB6qnbjaQqtLJhPPsNjsk/2dmPjtbSeQSMJXDyXYo0I5tFXudoLcIyg==
X-Received: by 2002:a05:6e02:20e8:b0:369:f4bd:2df8 with SMTP id q8-20020a056e0220e800b00369f4bd2df8mr2384295ilv.10.1712336428271;
        Fri, 05 Apr 2024 10:00:28 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id o17-20020a056e02093100b003696b5f5662sm528549ilt.49.2024.04.05.10.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 10:00:27 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-oe][PATCH] dash: correct licence
Date: Fri,  5 Apr 2024 11:00:25 -0600
Message-ID: <20240405170025.3299913-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 17:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109826

From: Dan McGregor <dan.mcgregor@usask.ca>

According to its copyright file, dash is only BSD-3-Clause. It has
a build time tool from bash that's under the GPL, but only the
tool's output is used, not the tool itself. So all compiled artefacts
in dash appear to share the same licence.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-shells/dash/dash_0.5.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.12.bb b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
index 54389783b25..d562d383f0f 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.12.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small and fast POSIX-compliant shell"
 HOMEPAGE = "http://gondor.apana.org.au/~herbert/dash/"
 SECTION = "System Environment/Shells"
 
-LICENSE = "BSD-3-Clause & GPL-2.0-or-later"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 
 inherit autotools update-alternatives
-- 
2.41.0


