Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D75EE0AF7
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 00:12:05 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16766.1770509520590711710
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 16:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oy1WwcZc;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8871718b00so308466066b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 16:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770509518; x=1771114318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVovGjF7J668Rob8fsmFd8Nnw4CG8g/ddmAmieYHbPE=;
        b=Oy1WwcZcbbyeF4IsII6+tA9/qJjbJsLttfh2/1Ze6O/E2aH2fab5BpyALFVrFRdNg3
         rp6+zD+t9Hc75OHnNolk9bn+xPJOIO4nemdMJUMJtDO4aK8+iH7rzH//DEqZjKgZZLT/
         eU7WKZdVrhp2il1umEVA1OhZTJDIwG4QHgLzFSdEHfvbRlcsxnZ9dTaYK7Bq0KV5XLTp
         IGAMp98pfdV7Ec+bHpZfXnc9OG0JIe1zHKSEMhSTslm/Zyh8ajgu34K1McmNh496VSVO
         QhHGJz29T4GogNOzeEmWNHwXd/dHIh4v1+MUBhg1FK7evJiR7sgavoJMK7qnJ8W1NTo/
         roPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770509518; x=1771114318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVovGjF7J668Rob8fsmFd8Nnw4CG8g/ddmAmieYHbPE=;
        b=FZ4DAR9Fk3jmIjAZlU3lsfMKO5QXoVcVnNv7au7MvljqiCWX7ADltVTDKgJWhZZnCK
         1TDIwbq2An47qXCFGT8SxFQMa0dKyU2hZhsYHeJ6BXqN7aZZM41Gi+zR5Tz8kE/+0zEI
         A594nggBqXkTEG8Umvwms++E+ZG26YGAlPPGrp4xtZNAjtYp050VeUS4T3rpWN4F4Gda
         EH40EBzup3a7bF5aCSut1IMOz95NwLQSxeYb2MfTeKqMaf+r3l2R2IypsgAem9kME8O7
         BWNEQ4166fAB7KilOMMGmOyzaT8RMSAG1fpFoAJKlXhWjiFCNeKnr+pgqe6ZvL5RO0E3
         +J/Q==
X-Gm-Message-State: AOJu0YxEwDRoVkv10qfY9QdQhj1Rnw4dBwzLYhZv0kbXDRr4kwGov7l4
	bG9GosnQRoOS1XqOYbVM7YO7MJCFMETWtdeDEZDytCH+Dp+3G8EAoh9oq4E+uQ==
X-Gm-Gg: AZuq6aKsT3BB1h5MuFdqRenMP5UOO05+kJ1/5sULdKnVHbU1BDqeNbQr+hqbpgDhoHw
	nmJk23CJJA2XMZs2brprOfBopF6SfJouHWcnW7UiEjPAqR2PTmoSWR2gpuK689EmweBYOqIt8CX
	YkNmpt4Ai3uEQUySXbbztnUgHR42tPGGFlG5YjtvBYEEPLMTN+elNlCjcV5shDPxAJt+8ln0tSI
	5//7N/PD99GyrwbpSImelEEBaCaiAx0yvYaWghr0dB7ojB27tGQuXBhpbyK7Bg07r1KXqzIC98B
	HREfGfoTY8UKvh1j04BTlCj6j20TOdo3z3mxVqMMp46lElRdsArZpmf5x2qKAkc6DoDDn21igB8
	NoeNsafjH/uSNALHxH3FBvFen32PzT2oU61PFkqukOa3E3ru3nfRfEeHJo8/rK0sWtdY5YDreUI
	DxzMQeOL474L2G/3fBuwUzreuuiWosmLg7EJSD+wRw3sqvY25RLdbYiehGsdAx/rpYpA8DXouP7
	p8=
X-Received: by 2002:a17:907:9723:b0:b87:225f:2e74 with SMTP id a640c23a62f3a-b8edf19d5a6mr399529566b.14.1770509518441;
        Sat, 07 Feb 2026 16:11:58 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb18aesm227247666b.41.2026.02.07.16.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 16:11:58 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-mypy: when checking the package in an image `pip check` reports python3-pathspec as a missing dependency
Date: Sun,  8 Feb 2026 01:11:38 +0100
Message-ID: <20260208001139.1767114-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 00:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124272

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
index 94aaabde4e..419de2570a 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
@@ -20,5 +20,6 @@ DEPENDS += " \
 RDEPENDS:${PN} += " \
     python3-modules \
     python3-mypy-extensions \
+    python3-pathspec \
     python3-typing-extensions \
 "
-- 
2.43.0


