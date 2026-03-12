Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0BB106ACEC
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 20:52:44 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1484.1773339888441401116
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 11:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ujgw2qA0;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: aviv.daum@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b940a00415cso167883566b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773339886; x=1773944686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6k+dqMwSVCJyA7g2sMS6yfeSpIgcGCuTaNCzCw0BJxU=;
        b=Ujgw2qA02vSVvZa6jAI03b3jYmdETr/4w4LBkWldnWEOxGmYF8YOeG3JOTouGYhD2z
         WQL7xCXfiONhhWVLMNeln/6fTmfxhqQ5rZSopY0UQaIYZUNuE6+IS1Ml2LskULCw+1KQ
         s0NeqraIsU9bspEFB63sMOZ4++VM8kiIJIx83Jg73mx9hVvbRpzLSTk+bvugvBNde+Kz
         Ox+JeCTBlDMuJj5rTqHzA6clOsS0CSuq8opcx9pdiDBrqofcb1AgSCQidqDUEsXIHjRN
         Sf74fL8UCgK0WlM9XdNAoJIEA+DhPamojfVPlAYIkV+GgNneNTpImXS8T7/5zIklWWgL
         BCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773339886; x=1773944686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k+dqMwSVCJyA7g2sMS6yfeSpIgcGCuTaNCzCw0BJxU=;
        b=BiU70tMwUc+QF1canhtclhBtwaJGT2wsaWjGieIPZla1XvNbwCzQurmZt6rjagpPAX
         xdBKebWRgU1S/wuKBrHYLcRBv5rqG8dc0uRvIywkUhaaNB+chVJNpW82CvHhT0F6R2K4
         VSvkCzci6OTdbtkzuKWVS9TLqX5Y/tKrJtqLtS2a+9JRcH+TGgW74pFZaK5IbZmXCm3W
         TjY0GxBypF5fN3NeHA/yb19Jn4QQbKRlGMjXKncRkpuUM27Gfz4Ky3KdHzu3CHYKkePy
         V1zeAofIG/mU82l9JmnXDW6NpxDiqn2rk0hR0rTiXOMalSW7HssdcWXgT3HVt1Hvf1WB
         sSQg==
X-Gm-Message-State: AOJu0YyWGuCGzkDw3NPi1J9Q8SHF7OdoVlDarZW7Qp4il7lF/0n6Rzrb
	1boIMp/j3lxb9ex3VWe8VEcHpH2criW7pkGUYV78hodgLC4Qe/AL2yBtRhiLTA==
X-Gm-Gg: ATEYQzzh0NypzaappWjSUxdbxv6hsz7/51kceb1psq4U1KeLNHmClxbx+C/qYj5xJY0
	7LU9wfnYtj3yibC9VhwJ6aPGCqYWmjdOGq4iMHlPu0BaU6xzraN5CbnRqe/szWCC4sUgYh45UiM
	SFarvnm5E2sl7ICBTnVOgweRDjxWyrZ40KrsNWpyxhXSHgDMg0W1EAlCAw20CzHsAPN7DLu3g7T
	SRNgs+4vs1iVip/TGzqnkFWvkB6n8O5E9gf10+U7Pt+rt182Ol7OuEFYJWEavJrwlJG1PX6UtTw
	gRAtUZeGFvRDBro5vewrfegfj5zlTLKr2dmcd1sjnET40H4UbbPR29eT64Y9BAO0yhneZGPyI69
	R6UvMLkPh4gTT9ctlwhkyHTozsq9HKxkdZL+wCiTEyqMKnlEum2s2kJMRKpUxn7ArmgtDw2Y+9w
	0HGqqwDq6DLJtDjHCAxmbelHCXBdQZ97zyStA=
X-Received: by 2002:a05:600c:81c5:b0:485:3812:36da with SMTP id 5b1f17b1804b1-485566cf00bmr5012645e9.9.1773339469455;
        Thu, 12 Mar 2026 11:17:49 -0700 (PDT)
Received: from localhost.localdomain ([147.235.207.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19acc6sm10424790f8f.8.2026.03.12.11.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 11:17:49 -0700 (PDT)
From: Aviv Daum <aviv.daum@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Aviv Daum <aviv.daum@gmail.com>
Subject: [meta-networking][kirkstone][PATCH] lldpd: fix xml PACKAGECONFIG dependency
Date: Thu, 12 Mar 2026 20:17:16 +0200
Message-Id: <20260312181716.30512-1-aviv.daum@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 20:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125178

The xml PACKAGECONFIG entry uses libxm2, which is a typo and not a
valid dependency in OE.

Replace it with libxml2 so enabling PACKAGECONFIG:xml pulls in the
correct provider.

Signed-off-by: Aviv Daum <aviv.daum@gmail.com>
---
 meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
index 34cde7b929..9f168dbad5 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.8.bb
@@ -30,7 +30,7 @@ EXTRA_OECONF += "--without-embedded-libevent \
 "
 
 PACKAGECONFIG ??= "cdp fdp edp sonmp lldpmed dot1 dot3"
-PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxm2"
+PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxml2"
 PACKAGECONFIG[snmp] = "--with-snmp,--without-snmp,net-snmp"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[seccomp] = "--with-seccomp,--without-seccomp,libseccomp"
-- 
2.34.1


