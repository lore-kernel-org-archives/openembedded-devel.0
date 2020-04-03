Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.4838.1585887814057853502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2020 21:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CxJDEi2l;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id ay1so2226088plb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2020 21:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qByTy+tRUc86clzNkKyhB16v18278Bksjc/w1dd6Zpk=;
        b=CxJDEi2lMn2XQz3/eeDjSEwQeJjqLryI+DMSPrTFihUWbpE9kJohp0YRJQRbf3Q2j/
         Un8mVXoYtTINtdgILrlJVtdJpEC+7Dkt2Mzi11NT7bxar/tqZjVXqn6h5zsMycGAGxlj
         GyxOWzMVpKsEOepSaWeMA8d4t7q4s0NsBr+D2bxd4GHsV95qAMqDGaHz4hrdzCpKbiGJ
         minAAUSGgRcRBbtSP8OuAJMeeRqVpCHjvJ6+cMBqMhMkpkrerlGUtY9qHhLHvytBqkW0
         +jm9/7yaj+WDDljMAl7CjVNnmCupJAhDBVJrhKh+/jbwn/R4yOSi6+hB1UwYVevO4/yv
         ob7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qByTy+tRUc86clzNkKyhB16v18278Bksjc/w1dd6Zpk=;
        b=m2B9CUVG5eM/1g1GBLmmDm1mt9yn3+M+iFG34Fde2QL5jiHnJmgbHebulI519UXXrV
         K8EQEmeMQqYQ5ZCr/G7iQPqgXIFVsA9JcPPWWR5iAXRvU7Pb58pZuRlgEeheh8p/I9aS
         6OEUvf4yXyOhtX4JxdXKjzNyJwFip605v5/W5hqjPj3YJbEobBenFJ5WslQ09+c0D7RO
         d36wi1nuO3zmQa2CGPBRW9YOV/IuAGQb+1xfB8AJehdPNN/UBKMYxkGPu0LIC9SuLdQ5
         RppF50CuHnjAiToqvhSRaqcpn8WCV0w8Blr+7KPCVuAPjjXpUcm77QnZ+NTvXa8PMCOQ
         /E7w==
X-Gm-Message-State: AGi0PuYI3oMglErB716gc3tElQ/LiX52mApUSnKpl5Jbt5NlsEV0qKBL
	Wma4+uyVuAEPdATISgydZCx4HLYmlsQ=
X-Google-Smtp-Source: APiQypK3wmgy5rVjXlaAT9OQFAfJhTkAlfLRTLgOQ6ItGnCGGJ1LqojgTdNcWekpg3KxsBfIxFhMVA==
X-Received: by 2002:a17:902:8c94:: with SMTP id t20mr5973873plo.336.1585887812973;
        Thu, 02 Apr 2020 21:23:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id e9sm4858413pfl.179.2020.04.02.21.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 21:23:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vinothkumar <vinothkumar_baskaran@comcast.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] miniupnpd: Package miniupnpd_functions.sh
Date: Thu,  2 Apr 2020 21:23:46 -0700
Message-Id: <20200403042346.1234574-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vinothkumar <vinothkumar_baskaran@comcast.com>

Currently miniupnpd.service fails to start
without miniupnpd_functions.sh in rootfs

Signed-off-by: Vinothkumar <vinothkumar_baskaran@comcast.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
index 81bfe66a9e..a630d27b9c 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
@@ -37,6 +37,7 @@ do_install() {
     install ${S}/netfilter/iptables_init.sh ${D}/${sysconfdir}/${BPN}
     install ${S}/netfilter/iptables_removeall.sh ${D}/${sysconfdir}/${BPN}
     install ${S}/netfilter/ip6tables_init.sh ${D}/${sysconfdir}/${BPN}
+    install ${S}/netfilter/miniupnpd_functions.sh ${D}/${sysconfdir}/${BPN}
     install ${S}/netfilter/ip6tables_removeall.sh ${D}/${sysconfdir}/${BPN}
     install -m 0644 -b ${S}/miniupnpd.conf ${D}/${sysconfdir}/${BPN}
     install -d ${D}/${sysconfdir}/init.d
-- 
2.26.0

