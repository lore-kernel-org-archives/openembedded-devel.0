Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FC2E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 17:11:16 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.110690.1734541874590817120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Dec 2024 09:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVYVE2VF;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so4538993a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Dec 2024 09:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734541874; x=1735146674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOMIeA76kFyrMl+xTCPz/J2PnJ4So1kYZ3R5hvbeBo8=;
        b=kVYVE2VFScMoHgeTDQ7EYEYxsWLQ3U1qptrSQdvfSh3SoH0cmN2jkNhGG1tOq8kG7b
         J+WGorQAhwbh73jtyOWOHG7rTT4jJeHU3DgZRCPZJ+h2LYk7NpgdNKWNetgJsrv+fGKM
         LsGuzoHiX10vBYFb4Gl36a1OBwhQay1orm7gc/b3zaumiOqokvRNrQoxhuMuHLzuhJeg
         uOqLuUsOQaE6oT+Ib62QVTXcEnTDF6Cs70pevyEaVaReYUDlcss0BflyG0TAN0Y/9B82
         N7PpMWxOJrSgpM2dPhq8IFLuzpGaEHHnmT3Alk9V/mTwGkXTzWLEUNhDe32hAUJ09x8g
         dhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734541874; x=1735146674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOMIeA76kFyrMl+xTCPz/J2PnJ4So1kYZ3R5hvbeBo8=;
        b=hXWYSfgPxkVaVi3WBollJUZvrX1515Lu7OhLDUx8kfbskOYUo5RapHWzEwcBF+TTmB
         O903zWwp4BIhSTKTgiAvpwaU/uGktLv6zaMeX+6FzOXiWCe3C/LlHthPrxXNSfdidbxU
         K9+g04IKzlQW/I4I3+HBY5LxQU4J79IYfpn78VP3Tat+CgsZtG6z7stvqaC+5csCgmUg
         MrhE+OfhfytLj1ZT9WIGFlOM+guXLK0HE5i5Vwoh3LQz19xR1cPfGIvJxZmEVotzWZqZ
         kMyvpeN2vxUGfxrloUkK5tGVUmjUiTlUdsQM+9V6unwsOGkwkh8cGR0QtXK/YuIBUwwV
         xHrw==
X-Gm-Message-State: AOJu0Yxy+psnPJp9+BTh5RKGNsYOr37GRf2nuBrHax0ZlpaviXfDgTYZ
	9MlahiyBK0lYX+o79kVG6xVHBtR/iSil9KqfNv6OIFjiSvrL57x0Jh5Y3S+7
X-Gm-Gg: ASbGnctDo04ZIqBFgOHG5lBFZeoyPPYuv+m9FTtncEeoKwTOC8kHAuGoivMocOZfTPh
	6EQKRAXF8Ky0W2cklRm4TxNXRVNH0za728m+rDNrHGymWBcd/jNHioGPskzAIsvSTkrIyfGG2IS
	BFr4TxzQDQX3LiHEYI5echAfR4CB2SBj4CLSptyQ9UKrcrhEQUos79daNSg95QfUMTtJIhAciXI
	nq5Z2RWhruldoEBbMdUC0wY2YicDX1Q9aDOvfF6If1f7WcP2VYIiO2EZhA=
X-Google-Smtp-Source: AGHT+IFDlbd1MnGBXUZB5U5IJasAzeOYRVq0ibXb9F6MFvC0zBzVeTjlEBf+Pa3Xlj//qvOlPf0Ipw==
X-Received: by 2002:a17:90b:5404:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-2f443bd58admr1859a91.8.1734541873673;
        Wed, 18 Dec 2024 09:11:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::5877])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee06dd77sm1816697a91.33.2024.12.18.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 09:11:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] lua-lgi: Disable on architecture without luajit port
Date: Wed, 18 Dec 2024 09:11:10 -0800
Message-ID: <20241218171110.680112-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218171110.680112-1-raj.khem@gmail.com>
References: <20241218171110.680112-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Dec 2024 17:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114375

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb b/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb
index 1584a931c7..8b436668dc 100644
--- a/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb
+++ b/meta-oe/recipes-support/lgi/lua-lgi_0.9.2.bb
@@ -22,3 +22,9 @@ inherit meson pkgconfig
 EXTRA_OEMESON += "--buildtype release -Dtests=false"
 
 FILES:${PN} = "${libdir} ${datadir}"
+
+# ppc64/riscv64/riscv32 is not supported on luajit
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST:powerpc64 = "null"
+COMPATIBLE_HOST:powerpc64le = "null"

