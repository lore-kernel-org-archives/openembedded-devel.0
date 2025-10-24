Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEE3CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 21:18:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.4309.1761340687531526742
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 14:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HXfJJQbg;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso2257905e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 14:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761340686; x=1761945486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zvEVO1Mx+0/ODMW4+wBeRIUQ9NIZgv/k6zD5ZA+2hs8=;
        b=HXfJJQbgS/Qfg4FgUchmYuxlNhdfKnqvox52Fvva8TFYoC0r0TYR73230BjjaT1R7l
         OISurs5bBMkM1G8Fhy2oY9Zl0LuL0FjVsSDsDVGEpGvW9rdbAK4fI6E/W1NrgabXT4++
         tPbz2m/jAMiyoIsMjgAtK6gq4xDOdC4An6lWV/byTnP/H28uZ0Bzqd5gvbmEJaiBhpty
         avatRQ/rDotTZu2ymavHCAd2n3dt7OxE5EnH8FpaORBRF/7rW+k6OyR5fjby/jILPAPs
         myrkRVIp7ezB2whuz14o2ie5oXDXxMAiTXOhijWiU30z8jjLKYt0O/GHnFKSEooTjoed
         wMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761340686; x=1761945486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvEVO1Mx+0/ODMW4+wBeRIUQ9NIZgv/k6zD5ZA+2hs8=;
        b=O0I24rFdJ7aQxKEMR1bxqasvj+2bH3coQxR+9mp5FsKD8DO+gQW3rfBuKb3jS2ed5C
         M40IqCWNF0uPgno1c4TXguE2ZDRYRJ5EjSZhecsFj3XpQXwcdR028ayj5l7d9BM5zQQx
         vd48oqnUuJyLNwzPXdUFsntTcP97Cf8a3Haa8T9LQV4obVwTo9yX+1HLIN0BSaqkhONi
         1ZIuwg6GogPQ7pjbiYYBdxbyuf0jjgGZc+MuRB8OO+sK1yTJuGfOZWaZyc/jwe1Kb/aK
         HShetprJX/CN8Lr/3NCaKu0ZJRUquOuiUycPlEK6JrnF+oQiSonWB4wOe/VG1JEFdnxc
         tfNw==
X-Gm-Message-State: AOJu0YxbyyAHgexT0GrjvW7+OVHJAJHo27iimHjWCaCi8Jsn+oaEvSGE
	SBcOemn32FjKIRg4D2C9fmnzZzE65M0SWgXMtsDvgMUc1A6qGoetygFkFo2Ung==
X-Gm-Gg: ASbGncuBvk5DNq4sRuR32q4DPSu8z0IMx8DqHmhijqfn4VbXLmM1AkHe+I2nrTf64LW
	fTi+buoMyx1SCQqvxGt2BcPfG/fgxHFEtz9jHiMTXT2GxTt56dLU9gvC8qN5qpl7tgFpnby7jO3
	rGr+InSyJ99nWgA2LXi7z/5EqAeHwkA9gAliMXuBmhqJvBn5C6iq+xGyty0NDl6VeaM4HBDZzEk
	1KPHHALXjvrrETsJ0TfjMur8Lm3+EaTUcS2z3an7/VNyRnPYTrsr1dMM6/0fnO7XxHGQOqw1U/H
	ZLBDfwY+UlKo5wPdYi3f+hHQmPXPu5pmJARYslFUHBQBAn0Izargqcd4qusLLBKfv8yTsmFxAr+
	F43irxRbmYqC0lH3I9fb6/SrtU/WuHZAH8BoShvP3grbNLKPbR4S9DCJ9dyrtmg3lEOh9BcZfCg
	==
X-Google-Smtp-Source: AGHT+IHC/eOKlNw0ufag072SCZz9qNrxvfGFdffTYgZf/eD/vtYpX6Z3MJ3XaTjJqQajARdh9TDPWA==
X-Received: by 2002:a05:600c:34d0:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-471179122aamr227458975e9.25.1761340685689;
        Fri, 24 Oct 2025 14:18:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47793fsm1689865e9.3.2025.10.24.14.18.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 14:18:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH] libtest-harness-perl: fix ptests
Date: Fri, 24 Oct 2025 23:18:04 +0200
Message-ID: <20251024211804.819531-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 21:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120975

Add required dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-perl.inc    |  2 +-
 .../libtest/libtest-harness-perl_3.50.bb             | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index c77880041c..fff99cab2b 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -30,6 +30,7 @@ PTESTS_FAST_META_PERL = "\
     libsub-uplevel-perl \
     libterm-readkey-perl \
     libtest-deep-perl \
+    libtest-harness-perl \
     libtest-nowarnings-perl \
     libtest-warn-perl \
     libtext-diff-perl \
@@ -48,7 +49,6 @@ PTESTS_PROBLEMS_META_PERL = "\
     libnet-dns-perl \
     libnet-dns-sec-perl \
     libnet-ssleay-perl \
-    libtest-harness-perl \
     libunix-statgrab \
     libxml-libxml-perl \
 "
diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
index 0af38719c7..c4749095a3 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.50.bb
@@ -38,6 +38,18 @@ RDEPENDS:${PN} += "\
     perl-module-benchmark \
 "
 
+RDEPENDS:${PN}-ptest += "\
+    perl-module-carp \
+    perl-module-file-find \
+    perl-module-file-glob \
+    perl-module-file-spec-functions \
+    perl-module-getopt-long \
+    perl-module-io-select \
+    perl-module-ipc-open3 \
+    perl-module-lib \
+    perl-module-test-more \
+    perl-module-text-parsewords"
+
 RPROVIDES:${PN} += "libapp-prove-perl \
                     libapp-prove-state-perl \
                     libapp-prove-state-result-perl \

