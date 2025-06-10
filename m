Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41786C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 14:43:17 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.88436.1749566596278735931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 07:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YWDkBIl4;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70f147b5a52so33568917b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 07:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749566595; x=1750171395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJWa+dTM5Lx9R/6j37XYBYu5bdJV6KJzR1WwPMhLiRM=;
        b=YWDkBIl4H8ydEVqQw0zgxFsF9R39NvpTCnCIc1ZNfkvhvhkTGPe0Q0isSGQUZ1POFI
         v4xIYrMrB4GGx+aiz9YzZ5rPOFcXTanE6C9QahDSrABQ2k1TvoVdwYjHaP4lt+OPNWky
         cnf3aWZvjGsyKPuM0W4Vjkpkti/I2fS3Tv8GPd9KlbnH2h0kBCnAicPbH67JwdwI90KC
         eLXnYwDIHnlq5suseNNc9GiEagFYXSCMMRLUxsuwee7/G+7hw0+4D0eTmboM/G5ewhVQ
         OV+hIJSQkiP7bIunQ3+uAxYpq5TM+vlnDDnAZ9NlSmiqDHknIgY1BSYnHUpSQJr47Ob8
         jmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566595; x=1750171395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJWa+dTM5Lx9R/6j37XYBYu5bdJV6KJzR1WwPMhLiRM=;
        b=knaw9xMkIq7X3uf11KWcfkLzLq/0KfUeAGSK1A8wKz+MaNyPjFWZv5Jscyx4xXIc+f
         xmMOJpo6zxDAJDUMr/Ex4JzVj947RFyV0aKizCvRoIA1zvUqdO5m65Vcg1revy4HRxdg
         dPiN/KMfgbmHCfxP1VESdj/duQqxn1FDBKfR9JtXfmyCkTg1iY41WdDumOkVI6k6O5DQ
         YXjSVIvBnwKq5OOyCZSH+PNyUcI1z9Wt0Sa93j8TMhp6DZyVY17lGIt5yCgiBqj3w2RS
         W9eTMrHY7nqeLedzKkc2V6kEDSFx87xJ3AFdUaOIoF0Cd0Zv8lzbpzX3uNaXWPHFzOE1
         UjZg==
X-Gm-Message-State: AOJu0Yy5EAGCgEqIM9U2/tzqPJdYQQYPhwBzhLvegdn7+2rjf1sLSqE1
	vsda/a89muQFm2HrXbNt+BgaK4VVcPGLa+TioJKXRaElHU7ryaXeA94MuoWtScjI
X-Gm-Gg: ASbGncu2nJaAJD+xpHkj7X/9O3m8m7dgH6dz6UIAd5jHf2ElpsCJBJefjMaaakGCmyy
	daEp90JaGmc15ZE761lcz5kAoBNRr4FzplBiEVv6Hc6Tn6z8ziA+w5wjSq81ptikf/LNRzq2fXk
	GmIs+9guWGCr0uE2EA7QUvtg04ub4cQNYpX5mKb7vgv//7Mhbt05hiorHFTk2nLCzxzZrKjINHi
	h14cnynZVxEMCA9GeVlqDt921jipSY9jtTnMfBjFupkG5inuqX+PD5oKOYQXB+3HWBJNz6HKxur
	sKWtMRYT7uyU6knk59/upkbhGmDh+k3zC/TDrbvMb4xyK50XINphvLFQDi1QjQt8odnZX1Nvtwh
	xXBA0sgljdUyOrXkycL5m
X-Google-Smtp-Source: AGHT+IFDGq7jJRkorCImJg21oubEeWjTzvnMzsL+XglCSRUVMF9HrPF2yup83TtQBrSCkVKnqyVa0Q==
X-Received: by 2002:a05:690c:6405:b0:70e:719e:75e with SMTP id 00721157ae682-710f764c725mr239707957b3.9.1749566594796;
        Tue, 10 Jun 2025 07:43:14 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a0fc34sm16379947b3.97.2025.06.10.07.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:43:14 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 3/6] xfce4-terminal: upgrade 1.0.4 -> 1.1.0
Date: Tue, 10 Jun 2025 10:42:51 -0400
Message-ID: <20250610144254.884143-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610144254.884143-1-schonm@gmail.com>
References: <20250610144254.884143-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 14:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117867

Changelog: https://gitlab.xfce.org/apps/xfce4-terminal/-/tags/xfce4-terminal-1.1.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-terminal_1.0.4.bb => xfce4-terminal_1.1.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_1.0.4.bb => xfce4-terminal_1.1.0.bb} (80%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.0.4.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.0.bb
similarity index 80%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.0.4.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.0.bb
index edb0c614ec..718e684d88 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.0.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.0.bb
@@ -10,6 +10,6 @@ FILES:${PN} += " \
     ${datadir}/gnome-control-center \
 "
 
-SRC_URI[sha256sum] = "78e55957af7c6fc1f283e90be33988661593a4da98383da1b0b54fdf6554baf4"
+SRC_URI[sha256sum] = "40823377242b9b09749f5d4a550f41d465153c235c31f34052f804d3453ad4a3"
 
 RRECOMMENDS:${PN} += "vte-prompt"
-- 
2.43.0


