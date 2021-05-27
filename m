Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.2780.1622091033101003814
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 21:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Camq1yr7;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id t21so1736466plo.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 21:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LtH602YLhFJISCFelLz+80XvUSV9RZv1UF2giTm3CN4=;
        b=Camq1yr7iUGAfQSY/JaBy9ra6eLTGgkIWvn1tkSjOqtrd170qZ2p/ii2+BtfHMPZxT
         +3h8Uqa5kCdovhqyCQ2iV3gGs5A45YFQpQlmCBtdUMaSrMzRSC3fgaqfs5Nhb6VBvDuS
         Ib/1fZih6084aoIgiByvlfgVjXLJeZ7hVAN1kHw2MA717HGRAAeKXg8AzWqn/UYem76v
         iG05odMTNYtZQVL2a2yFTaAVtWf6p2LY/oEz2vS5bs2XMIvWL6n6h2R1+L5YT/dInxFP
         G7NZK/ILSeHV5eCfryVwHRvSX6274XB3qJa8TbkTR335ZoJjx03HPuWRmlZwNmCs7Y47
         kNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LtH602YLhFJISCFelLz+80XvUSV9RZv1UF2giTm3CN4=;
        b=thmZ2btm9GvivM7NScZlctHmMfXwkNKSUYiBqOOZ7/VNXJoQzD8aivtt97lDpXOv0N
         TC/Dq/IVkUK86Zaklj99TQQVRnepWQ1P3v11ZfTa6QnM7ZORPBaD4UlcvPRFSy7fD/pU
         Yo5d2zPpOOxXRZNaBz2/6CWunGP+PWGFxs/VE62iQ+v9EWe1Bq5WKRYgTczIxMakXsfF
         649BtBbjBISIrYTNwLfgi+73wKQx7ezvtgx+OdutYA4+ICkN0TlXUPSt/Gaor61G/XFF
         d2Tp7S3tYpHaB2MR3LuP2KBR+Ki8MD5TjY6Yue6UcgTCQWbkrL4lTQ8AcHzZOmIvV/eo
         M+fA==
X-Gm-Message-State: AOAM533YHi2itm2o4tP852fg3uwOys+51UD1y+9DGIIQhTc6nDwjjY5K
	JD74ORTp5Ns5s2xRFMxg6bMwjIYq2k8EGA==
X-Google-Smtp-Source: ABdhPJyXI7shLNpUsrREY6fXAT5i/sA0J6jpYbpl5IDtSz4YCQVaTsSgHzvUUkaa25EIhDKIXJricA==
X-Received: by 2002:a17:90b:1d8f:: with SMTP id pf15mr1820872pjb.36.1622091032174;
        Wed, 26 May 2021 21:50:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e64f])
        by smtp.gmail.com with ESMTPSA id z11sm182268pjp.0.2021.05.26.21.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 21:50:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Yi Zhao <yi.zhao@windriver.com>
Subject: [meta-networking][PATCH] dhcp-relay: Use recent config.guess and config.sub for bind
Date: Wed, 26 May 2021 21:50:29 -0700
Message-Id: <20210527045029.1366384-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vendored version of bind is quite old which does not have all newer
architecture info like riscv in gnu-config files captured in the bind
tarball, therefore update these files before configuring bundled bind

Fixes build on rv32/rv64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
index bd816106c5..2af41b217a 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
@@ -43,6 +43,12 @@ EXTRA_OECONF = "--enable-paranoia \
 do_configure_prepend () {
     cp configure.ac+lt configure.ac
 }
+do_compile_prepend() {
+    rm -rf ${S}/bind/bind-9.11.14/
+    tar xf ${S}/bind/bind.tar.gz -C ${S}/bind
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/bind/bind-9.11.14/
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/bind/bind-9.11.14/
+}
 
 do_install_append () {
     install -d ${D}${sysconfdir}/default
-- 
2.31.1

