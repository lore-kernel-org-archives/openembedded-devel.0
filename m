Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDCACEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 14:52:44 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11270.1763391156271217034
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 06:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpTtCJlJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7869deffb47so40320207b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 06:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763391155; x=1763995955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI+7Ont1Z8bgKOEVo49DIAGPA4p3ODXUzGj7DW0+3Z4=;
        b=dpTtCJlJBXQ3XUm8HYqqaT7dNGsIB8y69w7GKJKdsUKK7cvjCtsroth44SObVIZwIx
         emawl1ylGelHF8M42gs32zs04PNY8T7VzA9bUFdTi/UpFB1MuKPMyMvn0eaAdOURoiil
         V5bF2IS3pvO/fop7U48rxhC1u4ujfHA77nGPW8Ya5VdzlVzzbEJB76fNH0FBncY9KbbI
         JG2YB7x8c2+U47bA2QzaIrG1RnaTglq9fh52YPI2+hXdYlo121YkIQVQaeg5MPtXAI/x
         /7xR5VXEdoEVjqbckIC9XFrx7SY+h+67IR9hSUYlO6yLA92X33d8SAC4sd7WtAIXRZpo
         ld8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391155; x=1763995955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gI+7Ont1Z8bgKOEVo49DIAGPA4p3ODXUzGj7DW0+3Z4=;
        b=c9ewE4wYH+DGmaSgsVHahetfXNXmEhJTrMgNuffhMBnWlBGr+5BnAgPihGG22oqomB
         gX9GTEnbeB4dch3gVF0xGgjcRyzOC0JwWyupnlGzBet2zIBzJTI2m+0TLKZrPWOjM6mm
         hsy++ygIpF9BKCQVDQAVQxbjTge2Hp0b7Zr69V7zU8BJ5fxG1vyaDHTTYHt8OeI2eR/U
         bR9cNR3UV/ZIeqkgU+iM4XmfNz/9hbaF56xVVu7p0jlk8q6OWQy+FvY5OFT31h6BTEJV
         IVAYbSQquIWLXAel02n+05YFgUnV0K8BJ6a2RbdFWNYuBdc4t7FKhF/YMtt+pf7ibOQC
         O1/A==
X-Gm-Message-State: AOJu0Yzt4K6F82uHIXPBIzPzY01MPEpfYfI/8lmBJU7q6XH3Jm16Uf/M
	qrAuc4S8+8uEMURvyx5oGUVTgZrHhT+F1y0gp+snbcdHRHTOBpCUe9SpZkFKuuF4
X-Gm-Gg: ASbGncvnn+JkDF/4K3N6Zam6AWvK11cF1Oi/L4hmXZCp021A3s8U5727ixu7t2OtV0z
	8E7erwLbfSGxbtdBZbZ2SCZc+s5BZMqmh+kqB/vVzBDv+h3pCS+eij1hrflWzO5QhXhE/eRLZkx
	NkFlJAYN2e2HavhqiayjhjqWGDUApL8obd66aixqSdmB9wsnfrXqAx4leVXQ9e1Eg/RiD7qTdli
	yC0lqZDmfkRJ6i2poLolU1PcWE7b6IeBh50gn+/b6e/r2cA2E9KM5VP+qtZmAc/ENOp0dDuOzh5
	N5xGAQSsCulgZBOZoONwZxkEhzWQw3FPHwJqm3FiAeCdvkjePibojXGIG+mtgz/ybP4yG4JA6sP
	pRVihZRy3RhLe5Acc0qhOt8JWpofxmHVXI7uyd/k3EiEhEwyDOaSJiMYQnoxd9CO9EHon++wPeQ
	zFVlDqRtCuY2JJEhyj3/ks/h6rd381n4aWQg==
X-Google-Smtp-Source: AGHT+IGuoWpOLqZUIy6I6ZoXZF73BUm1W3zN0TNWR/dtSpbl1MapIa2M8K8JZZoblYkLQDwlWPhqRA==
X-Received: by 2002:a05:690c:6108:b0:786:5712:46c0 with SMTP id 00721157ae682-78929e4e2f9mr112959667b3.17.1763391155006;
        Mon, 17 Nov 2025 06:52:35 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78821de2bcesm42904227b3.6.2025.11.17.06.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:52:34 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 5/5] xfce4-screenshooter: upgrade 1.11.2 -> 1.11.3
Date: Mon, 17 Nov 2025 09:51:35 -0500
Message-ID: <20251117145136.132886-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117145136.132886-1-schonm@gmail.com>
References: <20251117145136.132886-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 14:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121783

Changelog: https://gitlab.xfce.org/apps/xfce4-screenshooter/-/tags/xfce4-screenshooter-1.11.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-screenshooter_1.11.2.bb => xfce4-screenshooter_1.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.11.2.bb => xfce4-screenshooter_1.11.3.bb} (91%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.2.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.3.bb
similarity index 91%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.2.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.3.bb
index a55931b9c6..1dff925a0b 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.3.bb
@@ -10,7 +10,7 @@ inherit xfce-app perlnative mime-xdg
 XFCEBASEBUILDCLASS = "meson"
 XFCE_COMPRESS_TYPE = "xz"
 
-SRC_URI[sha256sum] = "6ae5bc4823d43e770b3a11700d048d56bdcaafdef37de7deacb8970b55fc1565"
+SRC_URI[sha256sum] = "1f6a14f7d1b0c440f31e24a8cc4fe2996185357fa786f0c2cdfe564ef673a710"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
 PACKAGECONFIG[wayland] = "-Dwayland=enabled, -Dwayland=disabled, wayland-native wayland"
-- 
2.43.0


