Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499DAD2A553
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:19 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.32579.1729107318588278729
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e8DlsZuI;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d4c482844so89927f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107317; x=1729712117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUWLf3qYyF7px0OosFRUUHmZWjxn2WLpQxiPblAn1qo=;
        b=e8DlsZuIguxeVx3luzYIkh5hl7BrpRJI0DZt49A0iJQ6al257IrrrGhuaMBeV3Q8Sq
         J5dY5D4oTrxpdeGV9P+TGwFaIMC2qnSiIopELPMEvwdgobtJSJW5MBt7O7bwuCrStMOS
         BKlOQD3yxsWKOrK3LJepHHHHe32huU3F19sCWo7MnPv03Ki9pUc7hnBb7OvMsj2CHwEg
         3pcZ4BrQ/mkM+lTU9rffsetWLPUGAu5XlKkjMXzlhOr7z0UPJz8gJw6Wnp4y3wtGkaLt
         yqy9ZUfB2QIJlgukGetYG6xK0fqKMMuNWGXx/1FtDdMEFjsYQY3TFkgHPeXfCm+gZGsc
         RF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107317; x=1729712117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUWLf3qYyF7px0OosFRUUHmZWjxn2WLpQxiPblAn1qo=;
        b=uuSBOJI57YWeBPttqKZbmDlFBUUhObobuQe7hig9c2y0nu1IqD5xtc22HxAOmpY1ox
         I0C97rlOSdrmOmRjOC3kqDhmLl9Xz2X+R4gFJEHHraV02mn0ya9McNPA2g1khl/lfDLe
         brJBEbpb1gvQuN47WPGVjyJbNps6DKTsYekVtBQ9nSF1WIMVbZINSo4zTMRR4TcORyW8
         zWRJTmEfUIL4orYlbcktc/dBjT1hgzDk63zfPcVWF0C8MoMulnX0Kximw+dwnT2ajEuP
         mgUoQFLzW0ayFI4IjDDmYE23KiFKk+fqF3N8GPs26y2D/ifnU4Q/uk7Yb5kV05n49S9V
         aX/Q==
X-Gm-Message-State: AOJu0YyYG80L8s/AQF3K6olJCEigruZPYFRCwUPlYIqkTh6Qq3g9L6bd
	3jsp9agAxodNo1yBZ4o58ZlV9LmkmsqE5D1T3AdVgNgr7FogH8QR+oSR4A==
X-Google-Smtp-Source: AGHT+IHr8zOmAVx8sOJxAwHIzpJayIbiZCilLxOJ/ecBJQ5UQxYxRvlxRQxFY5BaSqrsUnM7cQOWlw==
X-Received: by 2002:a05:6000:1869:b0:37d:4f1b:35d with SMTP id ffacd0b85a97d-37d86d69878mr4135250f8f.48.1729107316822;
        Wed, 16 Oct 2024 12:35:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/13] mraa: disable python bindings
Date: Wed, 16 Oct 2024 21:35:00 +0200
Message-Id: <20241016193505.3459828-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112949

Not compatible with python 3.13:
https://github.com/eclipse/mraa/issues/1135

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 4d3baf6ca..df487bd76 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -41,11 +41,11 @@ FILES:${PN}-utils = "${bindir}/"
 # will result in only the python bindings being built/packaged.
 # Note: 'nodejs' is disabled by default because the bindings
 # generation currently fails with nodejs (>v7.x).
-BINDINGS ??= "python"
+BINDINGS ??= ""
 
 # nodejs isn't available for armv4/armv5 architectures
-BINDINGS:armv4 ??= "python"
-BINDINGS:armv5 ??= "python"
+BINDINGS:armv4 ??= ""
+BINDINGS:armv5 ??= ""
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', 'python3-${PN}', 'python', '', d)}"
-- 
2.39.5


