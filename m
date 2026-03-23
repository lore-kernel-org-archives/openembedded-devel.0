Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F75EC01C6
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:37:41 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14072.1774262258849430382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 03:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ANiWpX/C;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ad21f437eeso35645135ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774262258; x=1774867058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEBI7E1vtEa2Bi6mxTyVFfvwGqOKsldKZx29NQ3UtHk=;
        b=ANiWpX/Cs0sUBy5lzBO2fqXQdRf54DvHIxKxyVGBKArokyXD9/ilUXVY03mJ93H9eF
         GkrHknqx5nJNqQ5hNsh1dra0EsaaMCFBRb4+NNv5E0POJ8s5rlM/Cy44ShqYk3xSHv4B
         3kbkH7MBU+IzvBlIlM2dOAvDbVpwEuEQUR9RGdCoUSVXLcXELhDz6VJQiuDL0POKarrF
         uY+XDPEQnlZ1P2z5U2ujJw2YqzJNf7ILQnCgSxV/8+pKw961cBC/MrNqoeFLugzNO0tu
         xVNzoMnK8aKLKKvDVnJ7nNo7ED0/iJG+X7fF8vjL8JGV/dH82FRNmgcfnUoE5OV0g9/j
         SYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262258; x=1774867058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEBI7E1vtEa2Bi6mxTyVFfvwGqOKsldKZx29NQ3UtHk=;
        b=ev2ItfPpkfS5lkx6ly5r4xAm20q4l8KxY17JH1dAGFQGXW5wWxeSDWauGOuO+CcX+t
         DYoEDmHMTQy5LX1ylQVZ0DWfdtnXxYu5R9AkeaNtTE7VjzkqRuRCfquKfN/qi56tRuO+
         sK9dv6JbBWPFT3keauXTUAymhtgswQGBT18OzCKCgLQZwsBCBOesUuki/6R3epcY+Ibz
         MTQO9+BzfOt80kk46FHrfa8Jw5XfcBgj2jqBxnOnJ1RGdqft0PoMF4tHngDoiQn5ckV3
         rc4oQZFub9Mwp4r6eSLnX6hGrwvjNjkApVx+c5fZQE1tljpq4BvSf1nQmYB/YrLJvd5d
         YQUw==
X-Gm-Message-State: AOJu0Yx/zbl5UJrTivb3NlgL/RUQs85dA2MgN8Xx54Y0M3EfEj47QLoN
	VD37HqGa55cDegaOaW/MC4avTRE+ADyTrxHcjsfknIKbxAXTfSsUhDTqq67jog==
X-Gm-Gg: ATEYQzzkjFRMS8nutGLH7Oa1OKappH80TSupfv3ZjKMh6wtKKEXk+L5pZ323c4t5GgO
	5646hQvBtrpDlSSMs10k1+KunhqwZs9FDpx5dZUyK7+J7kRsIxdFPFOiVKbxfsQ3xvR2GHxWv2u
	y8KBrW5qrt/EzgAJP5HLzDItQ1GuSPmi6UvWeU7BL21+VBsrLRqhhLXirk/YT5lA3gS4ZA0RSrY
	3eZ9V0PcxWu24cHrvlsX8Z1+B0hMCi0do37rqphuVu3iQHC4qQWvbtsSaTHEVCXtYsIKTZ0pfME
	dHt1sGw0KhGTxrMxlEheDo2GJ0dqfsyO1dJVIJANNgXPFX0wY5HHeCiF+uZ+JnO13uGP5NTOjx7
	aVOseMPKLBL64/1saEw6MHv80vAepZtUCgXIlrCrPjWjBHqKHQ/V5S9w1erdAIvwiITG7xHihn2
	Qq/xOjVeRkRt6C9ZjuSpy5w6rA1Cy2EgAQQ0tXgUse08Y4HA==
X-Received: by 2002:a17:903:1aa7:b0:2b0:62cf:3537 with SMTP id d9443c01a7336-2b08271e2f9mr100026255ad.6.1774262257962;
        Mon, 23 Mar 2026 03:37:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835551c3sm102792665ad.35.2026.03.23.03.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:37:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Aviv Daum <aviv.daum@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 1/3] lldpd: fix xml PACKAGECONFIG dependency
Date: Mon, 23 Mar 2026 23:37:22 +1300
Message-ID: <20260323103724.2341742-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 10:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125499

From: Aviv Daum <aviv.daum@gmail.com>

The xml PACKAGECONFIG entry uses libxm2, which is a typo and not a
valid dependency in OE.

Replace it with libxml2 so enabling PACKAGECONFIG:xml pulls in the
correct provider.

Signed-off-by: Aviv Daum <aviv.daum@gmail.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
index 044f1e0745..b7224d0f3d 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
@@ -29,7 +29,7 @@ EXTRA_OECONF += "--without-embedded-libevent \
 "
 
 PACKAGECONFIG ??= "cdp fdp edp sonmp lldpmed dot1 dot3"
-PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxm2"
+PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxml2"
 PACKAGECONFIG[snmp] = "--with-snmp,--without-snmp,net-snmp"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[seccomp] = "--with-seccomp,--without-seccomp,libseccomp"

