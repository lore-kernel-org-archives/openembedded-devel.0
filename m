Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.5829.1626055721055165177
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nSE+pGFf;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: jatedev@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id 9so16508046qkf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jul 2021 19:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+YrWbhXlIu7ZQI/JFYmbADtHoDzWKlRgiRhTLA9DrD4=;
        b=nSE+pGFfFTqv1+BMgBhc+6GiMUbOhBsIh3MT3qFn5Vj9AEDQDFl5KVo11ZGaHcHy/l
         ntmWN17wYwfJtyx0XH703ojbMMfploitOZ2cyPZWICtvVK1BWYobvuWYcg8ofzIglTJC
         /mx3CkHpcces13YoPKUnRPoEIMLgaozdxcWPXVCVHoxOG7y4zDLbp2feuF3+xni6hU6s
         loz/9/Xhk0q+96dV+/C6ifZX+HbskE3VBO5M3cCStqOhCsuhYYi/1D99cvarwoJyiwyz
         8gUDxlinOEnkZk0238UO8Wcxs4FD4gv3qJC2g2tgLUrDZGd1lO7qAfzLAM2IDgpq5C66
         otrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YrWbhXlIu7ZQI/JFYmbADtHoDzWKlRgiRhTLA9DrD4=;
        b=B6YqmfX1lMOCpbi+PjbT5W+RmppHxzttZEYp4xr3avKLObaLQV1LOHNqtTzLkSnxu9
         eZ/zwK4/QKeZCTcZWm/ENQHICtR2ErHUv6joofXGvTq6ZDjIINZnoAJwhn0JDwoEg6jh
         8vl7RJhSPl+RYN9U3XvGq4W33vI46eUecMRBR5va++9oYNHt0EeGzdZ6veR7gupIbFbE
         V8/XOJ8WW7FjZUSFCBpL6VaW6dlMVBODhZGSgiOrrWT4iZ/9tL00IjUPn3gd6FHluyqo
         jILFqTpNZRZUsJQgwzX60dhHBs/2gX0puWHqc/LjIUpybnloyBpAecRQweTxmCpT1cj8
         9NYw==
X-Gm-Message-State: AOAM533qoFBsFPWDp3WMgucaKSkvImbExDH4XsBTUq2+aCkdsP0dv4V8
	FD2c6Zr8hW8+vBRONuWudGvnIYrKsBc=
X-Google-Smtp-Source: ABdhPJwSE0YXEzg8ty8wqpzRQ3Vzw/74NdktV7LIQq4JRz9QDhkJAAWbix2JCDrmLCwwqbv+V3DMqw==
X-Received: by 2002:a37:9a88:: with SMTP id c130mr28180502qke.375.1626055720090;
        Sun, 11 Jul 2021 19:08:40 -0700 (PDT)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id u12sm2906419qke.58.2021.07.11.19.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 19:08:39 -0700 (PDT)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Subject: [meta-networking][dunfell][PATCH 2/2] ufw: update RRECOMMENDS for linux-yocto 5.4
Date: Mon, 12 Jul 2021 02:08:19 +0000
Message-Id: <39f17204f94c55ea327d4d5c1450b1fa83222cc9.1626055148.git.jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626055148.git.jatedev@gmail.com>
References: <cover.1626055148.git.jatedev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cataloged modules by running check-requirements

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 .../recipes-connectivity/ufw/ufw_0.36.bb      | 32 ++++++++++++++++---
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.bb
index 8e35dc01e..5631abcf0 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.bb
@@ -29,16 +29,38 @@ RDEPENDS_${PN} = " \
 
 RRECOMMENDS_${PN} = " \
                      kernel-module-ipv6 \
-                     kernel-module-nf-conntrack-ipv6 \
+                     kernel-module-ipt-reject \
+                     kernel-module-iptable-mangle \
+                     kernel-module-iptable-raw \
+                     kernel-module-ip6table-raw \
+                     kernel-module-ip6t-reject \
+                     kernel-module-ip6t-rt \
+                     kernel-module-ip6table-mangle \
+                     kernel-module-nf-conntrack \
                      kernel-module-nf-log-common \
+                     kernel-module-nf-conntrack-broadcast \
+                     kernel-module-nf-conntrack-ftp \
+                     kernel-module-nf-conntrack-netbios-ns \
                      kernel-module-nf-log-ipv4 \
                      kernel-module-nf-log-ipv6 \
-                     kernel-module-nf-addrtype \
-                     kernel-module-nf-limit \
-                     kernel-module-nf-log \
-                     kernel-module-nf-recent \
+                     kernel-module-nf-log-ipv4 \
+                     kernel-module-nf-log-ipv6 \
+                     kernel-module-nf-nat-ftp \
+                     kernel-module-xt-addrtype \
+                     kernel-module-xt-comment \
+                     kernel-module-xt-conntrack \
+                     kernel-module-xt-hashlimit \
+                     kernel-module-xt-hl \
+                     kernel-module-xt-multiport \
+                     kernel-module-xt-ratetest \
+                     kernel-module-xt-socket \
+                     kernel-module-xt-tcpudp \
+                     kernel-module-xt-limit \
+                     kernel-module-xt-log \
+                     kernel-module-xt-recent \
 "
 
+
 do_install_append() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/doc/systemd.example ${D}${systemd_unitdir}/system/ufw.service
-- 
2.25.1

