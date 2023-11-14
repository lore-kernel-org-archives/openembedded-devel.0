Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6133DC4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 10:24:10 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9827.1699957441425142940
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 02:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=QW9uVkQK;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32deb2809daso3200850f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 02:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699957439; x=1700562239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaL9rlRnKuMHMmhO6tglxg91G9RdC4AH7S2tPFgMwC8=;
        b=QW9uVkQK8H8/J8DS2iFVaP6O5oSe46WnagdBp6L71uShGs1B9Hsh9UgkinazriVWMc
         OX0lzszu7qWVb31RU2ZbSs5VR65EM8kLgqS2asS8eNkZgCUcQFgtP/x+w43oXTPx0s8u
         jbfftZC5DJGxwfZtVlq0gW273ZGzTY5lRVr6CeRjn2nh4vo4QnAe4HQWDXMeRbLwvIVd
         SV4RVjrsmwXCGyz+hXqGpHISrmq5kLnMNaBQQWx31BqA3TOWiVJKsoyDUtQUsbxQ/GmN
         UOfoj5HUmMTk2U4QEajf6Bbg+Lop2Fi1MlfKqRTvwRfOCE0ffkbszHptAu28siSpEjmM
         E9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699957439; x=1700562239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaL9rlRnKuMHMmhO6tglxg91G9RdC4AH7S2tPFgMwC8=;
        b=MTr4QACylnQ1GRTdb2iX+TYJ7grJP1QpU53Gubx3fegXkWJbRuribQcn+mkLwnbwtJ
         +U1C0LdGy+gDgGdR/Zx6qrbXie14Uy9+ebGdIKXs1iIQbZjLQd4Tf+uCRf/Iexgwy04C
         Z7IRJmLKLPVsCtbhgkuVfHwjZnDTIkSfD/Nx1B9y5F/8WC3l/cEtsXiEcwcJnTaAhOd3
         is16Hu5zRuusJ1uHBrNvA6jPmGbUocLTnX7xNLRFVIIxeVoVEoM4TG+Zh6jweaLYz3xF
         9QjzZNbEsWlxlcFBKrMucygUvGLFm9ltaxXUPDhTQh36dCzpxoVzzUljc+1ibzfKx+L2
         /PHw==
X-Gm-Message-State: AOJu0Yx/JU68+36Qq1qtEN0G2gjNzWOpK+5Ji9RN+qnwycwPyhPO8m3x
	W9LC/TV6Ras6woGBAhJmYo1IxEqSvjrUfFSMi5s=
X-Google-Smtp-Source: AGHT+IE5aeLu93b+7N5J5w2d6uq6+yQekdqKPzg+pS9V1V+oIlbIE0twUiqcuOD8A5qTJbUhojG0xA==
X-Received: by 2002:a5d:64ab:0:b0:331:42b1:a1ed with SMTP id m11-20020a5d64ab000000b0033142b1a1edmr5251422wrp.51.1699957438834;
        Tue, 14 Nov 2023 02:23:58 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id d1-20020adfe841000000b0032dba85ea1bsm7475955wrn.75.2023.11.14.02.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:23:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][dunfell][PATCH 2/2] emlog: ignore inapplicable CVEs
Date: Tue, 14 Nov 2023 11:23:50 +0100
Message-Id: <20231114102350.3276837-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231114102350.3276837-1-yoann.congal@smile.fr>
References: <20231114102350.3276837-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 10:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106706

The CVEs:
 * CVE-2019-16868
 * CVE-2019-17073
 * CVE-2021-44584
 * CVE-2022-1526
 * CVE-2022-3968
 * CVE-2023-43291
... apply to the other "emlog" and can be safely ignored.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-core/emlog/emlog_git.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core/emlog/emlog_git.bb
index 387dd6712..a503ab82b 100644
--- a/meta-oe/recipes-core/emlog/emlog_git.bb
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -24,3 +24,16 @@ do_install() {
 }
 
 RRECOMMENDS_${PN} += "kernel-module-emlog"
+
+# The NVD database doesn't have a CPE for this product,
+# the name of this product is exactly the same as github.com/emlog/emlog
+# but it's not related in any way. The following CVEs are from that project
+# so they can be safely ignored
+CVE_CHECK_WHITELIST += "\
+    CVE-2019-16868 \
+    CVE-2019-17073 \
+    CVE-2021-44584 \
+    CVE-2022-1526 \
+    CVE-2022-3968 \
+    CVE-2023-43291 \
+"
-- 
2.30.2


