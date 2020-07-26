Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.27918.1595766290584401533
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 05:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Y7plxZ6N;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id d2so1884026lfj.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82oTMHkx4KUkNpiMGHF+bQZ+tX2SsXtZ3l3KIbak0a8=;
        b=Y7plxZ6N1pI7pvhHY9DepcfSI+zHJfq6MuPF8mP4co0HkQ+GgMnLBsJdfy/8e0I32P
         JQ+HeUWrHLlKf5IIjXDbrlNWasiLG7HHE8SOULGPB5Co8s11eQzlEOamgKA2N+rvWA+D
         KpkVpa5q16RzH7AG7HWjJ15v6PxPQXWF8OTWWbzlpkX1mvvIpSLQu12P/++t3kbHZtxs
         II1bFICCstnjskJwTZwizu99wg5YbIb/OFSIImw0r2FuG1vUrjYcN6bOO2kAZ00YcdGu
         Ug8ATGaVQpILZHsm6QNf1unfqpzFCUDDbpGjctHgF0n/KzPfEtKswL3xXmm6NSFpOEjp
         p28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82oTMHkx4KUkNpiMGHF+bQZ+tX2SsXtZ3l3KIbak0a8=;
        b=fEKqML4UpnhNWrb+sE+hc+6R1D/RzhJ/VRQoW8TzWGZ0LeBNICVfJ07+Iew3dcg0PB
         d3h5cgWFp11oXC+/Og9wYWc0H7LocmLwcpgrlI+uAs5M6Rkt38aImCFRAU8yy8eXsbu9
         6DrOlCDilLmPMEvq1yNBnMBxNb7xFHi3d2BxJJuYlVUn8/1ePfiS1A36/iCxi7XToSZO
         3nWbZ6q4jftzPmZcFZxjB8MOgvnZErHm1P1lxiZIkjVelfll3sLrA4lgAmKgfLOQ9Hbl
         PNe/rgLKHSUW1x3vvMwz2w4zN+2YsjmktNDtgoa7Mn7xzMZzSRRypRY4ilSZ0DDiGnFJ
         9qFQ==
X-Gm-Message-State: AOAM532T+Pmu4zVQ3xCWR50iJjbYXIfYSUV+qFu8RNAWN9C8serN0gJe
	C+EZyEsHkBKIGbvTKWXMuuCax/Gu50I=
X-Google-Smtp-Source: ABdhPJwA3It44UW7Ql8QIRuN1okUSW46mNWFBS5zkLbK9iHCH/YgmZbVD4bgwjTBPuJGxnX9Qx77Eg==
X-Received: by 2002:a19:8295:: with SMTP id e143mr9207832lfd.95.1595766288346;
        Sun, 26 Jul 2020 05:24:48 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id m26sm715584ljc.129.2020.07.26.05.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 05:24:47 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] keepalived: update to 2.1.5
Date: Sun, 26 Jul 2020 14:24:46 +0200
Message-Id: <20200726122446.31940-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed config argument does not exist anymore (see
@05443e1efa3569fcd39a).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{keepalived_2.0.20.bb => keepalived_2.1.5.bb}          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/keepalived/{keepalived_2.0.20.bb => keepalived_2.1.5.bb} (88%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.0.20.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.1.5.bb
similarity index 88%
rename from meta-networking/recipes-daemons/keepalived/keepalived_2.0.20.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_2.1.5.bb
index f3c33dcb80..1230fcaee2 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.0.20.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.1.5.bb
@@ -11,8 +11,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz"
-SRC_URI[md5sum] = "a5966e8433b60998709c4a922a407bac"
-SRC_URI[sha256sum] = "9670fbc5eb3dc113828be8b702549dc68ec9578cf83287520d935be76fc8f193"
+SRC_URI[md5sum] = "27e1cfff5b8dd95062ad415957e663e5"
+SRC_URI[sha256sum] = "d94d7ccbc5c95ab39c95a0e5ae89a25a224f39b6811f2930d3a1885a69732259"
+
+UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"
 
 DEPENDS = "libnfnetlink openssl"
 
@@ -25,7 +27,6 @@ PACKAGECONFIG[libnl] = "--enable-libnl,--disable-libnl,libnl"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
 PACKAGECONFIG[systemd] = "--with-init=systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--with-init=SYSV,systemd"
 
-EXTRA_OECONF = "--disable-libiptc"
 EXTRA_OEMAKE = "initdir=${sysconfdir}/init.d"
 
 do_install_append() {
-- 
2.25.1

