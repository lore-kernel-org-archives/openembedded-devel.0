Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D2DCA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:04:08 +0000 (UTC)
Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3439.1790823845166749775
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GxtB6pJU;
 spf=pass (domain: gmail.com, ip: 74.125.228.36, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-88884f63ba1so38972b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823844; x=1791428644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LL/ov5f8rMr0yL/6PAthFYrCEapcjxOEtrqS/5LZxJM=;
        b=GxtB6pJUtUUXKHTKrW9k+qH5YEbHWBSmyzdevpuxgphC49XWXpL9zSCT9sFwF7HBBP
         1O7BkLXteDopEfLVqJporRqalAzbKPsK72w/KvLAU/2oaaU5sErMbw5SMcvu6i3F9Vda
         7CGyZX8C1szhOyvhCvFmLl1KOGZ8GFsPQ6fgKPNj2xGs8gFUMXbZQbPhtyqw+5A4aLao
         dtIBxUsaQeJyENBio3fJ7LDyhonAv8llwaNIeBpzpaw8bZ+cg8A8r4InhRh0DbYEpPFb
         UtwfmIWtNdg/sz2gY2zrz5GD0X1p5Yi6M9zLosYe0muvK3n3h1fK37aLj3Z9Ju+/J1tQ
         jMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823844; x=1791428644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LL/ov5f8rMr0yL/6PAthFYrCEapcjxOEtrqS/5LZxJM=;
        b=Z5JExHJCL+HJPP9gcecesA3tWKGur/C4uTmXBD7EMXSE/zEWRitw7qENNsfZZ3G91W
         Bm3rw+4I4RxDZ26+sqfW3BdDd6iWXhRsRkMpC4IcDnCmDn9XB2SRtOHtoyp8QQq8Nh96
         RheuYF8CRxkLBM3y8IYHyw0uxOhmz8WE5CV/aByEJSTJ3ICYJ1UyTGYhyv1CwfbV+Iva
         n5RShAWsxxNNutI89HfPznak0XgD3TsLUFuu5VAITuQI6xh83IbhX8snPNmsVr2zomQB
         vD10VgqLyB6TIVGhD8nJ6rJwNcmHIeWZN0/ojc0yOXGK7gJRVDzY5zpxnKOvP1D0HfhF
         TzdQ==
X-Gm-Message-State: AFuF++kl1fZIlF3oVBLxr8g6TUjA3RbUTbnirdCCNI5Yp70zQ4ugw6Sc
	D6tukCfQ+jGbQuqxolqRkA8938jI8w8tlIiZOQRYIxOwOMDBL7YIYjfINnKmSQ==
X-Gm-Gg: AYBFou06Dw8RT+N7ihVMH4h1t6B7bh0VL9YZMMXaenxBx+i9Urxd/YbBCr2Sxtplipx
	BnrVXDGiUFip2fYy2mu32JodAa2qKRfxx9JRfwCJoCE+5eLG7X/rGdSlp15WC6HpDNuDNlvYPzw
	P1HlGpjcaMw+Ws29GOQ8m+5SPYRx2vre/X24dOVDeAVjruBSXx8iyiGrKpAlYwzUR78Dbb4M7o1
	coA+GKf4GIH5U0TDfJIO4u1WEITunlpsFi7FP51bBUsdeOUJaeLPnPU38brXf9acrXLUwToTBEI
	jDrqRHSNdSuroD3LkLdBAKkEcrmnRifxW3v8ZlTfbySA16PFkBmdgnWZojziGtxOfKcMNcZctF8
	UVfhSoWjRnEIh7qr6CxgdtzMO55VGWHaoG4FA/qIkVFIg2EVjrTybLAJt0c1dorzf5MiPXbOYJa
	5ZmM2ASjfb45F8ZX0gqca4H1GGsEwiYdmfLJeSmI5JvYxOsXeP6RwZR8+QedML+y6GDhwZDmr0Y
	OMKqLGnHPnXKcanRp6cY7I=
X-Received: by 2002:a05:6a00:2e2a:b0:874:705d:f63e with SMTP id d2e1a72fcca58-8874b737e85mr2879793b3a.32.1790823844409;
        Wed, 30 Sep 2026 20:04:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:04:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 14/17] iperf3: upgrade 3.21 -> 3.22
Date: Thu,  1 Oct 2026 16:03:26 +1300
Message-ID: <20261001030331.1581021-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130563

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Notable user-visible changes:
- Attempting to set zero parallel streams is no longer allowed.
- Zerocopy and rx-copy are now allowed in the case of reverse
  direction tests and the server (sending side) supports these
  features but the client (receiving side) does not.
- The limit on GSO_MAX_DG_IN_BF was fixed to limit the number of segments
  to the maximum allowed. This change unbreaks GSO for small message sizes.

Changelog:
https://github.com/esnet/iperf/releases/tag/3.22

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-benchmark/iperf3/{iperf3_3.21.bb => iperf3_3.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.21.bb => iperf3_3.22.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.21.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.21.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb
index de266551ae..31da6f52b9 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.21.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.22.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https;tag=${P
            file://0001-configure.ac-check-for-CPP-prog.patch \
           "
 
-SRCREV = "d39cf41526626b4e5a130f115d931cd6cbdffc19"
+SRCREV = "926bd905501b792bd082d2200d1d1a84aa543e3a"
 
 RDEPENDS:${PN} = "libgcc"
 

