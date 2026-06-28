Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7013C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:54 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14725.1782634313865010475
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dg5A1XyD;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so250797eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634313; x=1783239113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3FeQPggJJv6oW4ydePOstrQ9sshE+o7RkiV40OhTv4=;
        b=dg5A1XyDymD4dzdqi0PBJENvw5xhxYOxxJJZyVzu3wf9Fbc1oACrsTHBVHhgnh8clQ
         L9oiHA6D9/IEmg0Z1DN5Q6Eq1kJ+fogG65v5Cx/wn4d2yO9oC/oyixtpk+BU+8H2jSdu
         FtT4/cTObi89Np0fCwNjn1bI2Us8FdV70D7+r0LPjoOo2qPKqbb8SyJtFGYIHSTTNuSE
         ZsZobx62DGziprVnXy+3bM1cEkcGEIs+n+Ak59CwBrlOcHWe49D0nNjEu3ai27FhbvPd
         ve+9HhAXF+EOKlLcBpuXhpiuvMmYm8fLHbad8qmYcUyaz3BQJdJTY7CORiYPBxUNrQ7C
         g6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634313; x=1783239113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A3FeQPggJJv6oW4ydePOstrQ9sshE+o7RkiV40OhTv4=;
        b=gnOLjn1ncZlxyLUCYfiXCeq4JirGim+PDn9sfjQqq22jlfpVmol4OQ8dpqkQXmmRqo
         b2Kjqs1vIyIoqg40mVIwgbT71rucR5LHAnjNmhTYhLwpuxtAZr1hCQ7Lo6U0u56xOW+8
         z4E0DHUr5hfEs310BzsMDlRhqkFpAph6HIAtNJ9gzyHj/9yXBU3nw/+tjv6W0MCg2PMo
         kAX7+yL8npmzOqjUvDOqFPjIu9SYwDNdLde3/co++1Q8GZH0EOrbbkbecFcU9Aglqz1X
         FlzXhOh0PVHlNqDMxQPp26fckJtcBxpXmb52gatI89Ax+taOv/HRTxRJDWCCDnBi0QAT
         v07Q==
X-Gm-Message-State: AOJu0YyTuf08ZraVCyrf/3OrD8zHEIzdUliwu46tLwkYVDGhLgYcC9UI
	B+R+pi4qh2nTwQTnt2crxr797cHUKhYkBVl13Yz41hmN35Px7hZCCGGNEouQSDpjfKTScQ==
X-Gm-Gg: AfdE7ck0Ld2aKzKoQ9whahmUKGbAmdTF7mghpPXpMqDz9GPORl9c2G1XYZ1Yj41LUK0
	0AFNrWqOqIvJgK2JhkP7Yxro8lsErtlzT73JIuL/De5lpzKyZ9fMMGUVyzMgt/1P8nkr41TS+7K
	p0zCiNWkOxS6HLGaENrkOGgyhRi9d+bVVo5rd5+6mjT9sswycwG6x2gsdPl2MtoQtO9F1wdb6k+
	3zUrNmLQb/FoFEBSNvveMkgcfKfd2T6YJNKrTF+KnX+M6OLve7hhqgRq05/qNjv+FA52uxgMQEy
	5DUoAvU1A2MXgR5zCMmZyv2iFqHZPyvYLYkzOFwsHn1ppbt1JgSfUVOsoF+P37V+W0z5aErQ9W2
	s1tekv5u0wOkNP0mp+KpRcTu6H4Eu7RdnPYWbhn71un89IwzS6AhqhDOicGvWQyVff6T3awQE2h
	GPRil3rVofe1Qw26lS6+beXtYN22fk6FYFBT/LJz+dWiNMeP6H56nvhrIdk/OaVcjxnwZDQSJPf
	Nkbb6hxIww7ZtrMwFpljBjBHcHpHrgFi51jvn6eAViYCENZnFomknycdMhlAqZENKgE9WCnJzIM
	n94zcwO4RUZNYcM4jZxfAx/UUAAEug==
X-Received: by 2002:a05:7300:fb87:b0:30c:ab4d:3822 with SMTP id 5a478bee46e88-30cab4d3b9emr5822872eec.36.1782634313107;
        Sun, 28 Jun 2026 01:11:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 030/128] samba: upgrade 4.23.5 -> 4.23.8
Date: Sun, 28 Jun 2026 01:09:41 -0700
Message-ID: <20260628081122.178348-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127840

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../samba/{samba_4.23.5.bb => samba_4.23.8.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.23.5.bb => samba_4.23.8.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.23.5.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
index ec3149562a..fb00dd2ec1 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
@@ -39,7 +39,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f"
+SRC_URI[sha256sum] = "976129847456dc5b78c00f8ffb79dc605c49d6aaca8b2aa772fd22dbb69fae01"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 

