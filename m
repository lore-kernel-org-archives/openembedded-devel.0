Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2D4C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:59 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.85.1752180894307606439
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 13:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ddlRYbul;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e767ce72eso14395427b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 13:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752180893; x=1752785693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywC7fm8uSzN6KTe/S6b02mNYPu1VB9RuPXQDM4Rsk1Y=;
        b=ddlRYbulBVwiAmlE9HKiHkZYFwWeI+GBAPt/IZdPXmiCk3rlomv3FFeBRyjNwXANBZ
         FWYsYrI++WOKgP7Z0OqG8jNj5oqiyuZzGGqGT0NTCqUW4a2ZoJLX5b3NBSUGdwSmRL6w
         GMINhXKcM6FpffWM+xMzekJ2fjMwh6p9p2YgvrBsheWiByoDb355BhkKtid20xODtr3k
         AjNPB8pNw3KaB/utGxi+EgGWk9bzqGOVwHZCH1dG9irjaH1VAc/6ZSfC3wEFXReMxJfV
         gVqnm9LHpWnLziMH04EJ9aegK2Pd3TpA14C4VjTVbHXRS42HFb/0Rs7UeVhARYrw0eZc
         J6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752180893; x=1752785693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywC7fm8uSzN6KTe/S6b02mNYPu1VB9RuPXQDM4Rsk1Y=;
        b=eW6MIuTLo19vjuy+xROOYW15ltjGSGj48Eq9Gasnt/BdBKaMCHXjInaRRuw0ZX+aet
         Y6v2QeZfgYehf+DIAzmLVe9znXlmeOh0P1jcsld4oPrmsETc1uX9AEDiaU1tjt+9/uJS
         vhxYUv3joQ9WnZ05e8pjQnPYwMbuuOcV7xTa+QCqYJlcVWFBfnPYWV+bb6LgU5h3UDFy
         zB2S3IJki+h/T6r1YHWCC05N6CQXggxl5mVxVzX5l3qQ5jFttwDlTBIN/6UpLWRh4ywX
         STbbJ9XOcj0r3wPemBmAee74uI/Z4knsBHmc2hpCrGOLFNNs6B6DXTFD9fMLv2YCYtbQ
         htyQ==
X-Gm-Message-State: AOJu0YwtdyTA3SQRDv3M51GBpfgdjPPmJ0mkjUbE4rfXc+caFwflbjOC
	N/T/UbXupWK8mUftjKgZq1y5SoTGUn6W9rPv+pxJ1qFCsDJM6YfBzHztPpa2HIUk
X-Gm-Gg: ASbGncs8BvgIGNCMP52u1O5jK/iJKT1X7f2RS+ylpfGeZnwuRTdqxDais5PZFhLshgk
	gVtOMiL2EwTJPLLj3Zxwk6WolyjRp1T38X+ZaMl6c1H+2Cvd5x6ZM0b7EvKAtdfgHeBymj/KHO8
	6hKKcDb4jy9cbjtHhF5tdMPY3t+/PPzG3GFEoA3U6HXBEZ2So22QAu+aMLTZZNwgkz8yAcnThHO
	wpKz/Meyo4Oz+czG8A9aaVjkyGZMQjOyPCvO0bhSu7kTLHvj6dxjq5iX/ozpfe/bIyeb++iysn3
	WnvPHYaNJEcugStwzG3qHjK/MaR08ngVzBU8Qvf7R8npkTqNHobRmI+RIU223576GZhqT4YqOFB
	4UC8AUgnwXSkrO0tCbiOh508+qLNqKVaVjfdX56qqW0Pxk8GAiOUX3uJ9
X-Google-Smtp-Source: AGHT+IE0DsuESv7CrK8HZznqOtFXtbRKanN2BnLBnSAGRDA7yu3xoH9SYCoSo8nYpdE9IY8JYRg2LA==
X-Received: by 2002:a05:690c:4911:b0:710:ead5:8a95 with SMTP id 00721157ae682-717d5bcbf47mr18556537b3.14.1752180892895;
        Thu, 10 Jul 2025 13:54:52 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61b4cf6sm4515407b3.68.2025.07.10.13.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:54:52 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 3/3] xfce4-cpugraph-plugin: upgrade 1.2.8 -> 1.2.11
Date: Thu, 10 Jul 2025 16:54:12 -0400
Message-ID: <20250710205412.788186-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710205412.788186-1-schonm@gmail.com>
References: <20250710205412.788186-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 20:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118425

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-cpugraph-plugin/-/tags/xfce4-cpugraph-plugin-1.2.11

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-cpugraph-plugin/-/tags/xfce4-cpugraph-plugin-1.2.10

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-cpugraph-plugin/-/tags/xfce4-cpugraph-plugin-1.2.9

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...cpugraph-plugin_1.2.8.bb => xfce4-cpugraph-plugin_1.2.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.2.8.bb => xfce4-cpugraph-plugin_1.2.11.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.8.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.11.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.8.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.11.bb
index b240eaad5e..052046b0c5 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.8.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.11.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "bfb438ce21f37d57241b2596d72aa4bf47587cd5a8833fc30a9599616f75d4bf"
+SRC_URI[sha256sum] = "58aa31df1934afc2a352744754a730a3d796b1246e12c7a5e86f7b6a403ca20d"
-- 
2.43.0


