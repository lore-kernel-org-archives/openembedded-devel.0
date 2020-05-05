Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.9602.1588690718211155611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2020 07:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=inxXCGRS;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: wickbergster@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id j14so1601241lfg.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2020 07:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t53bNRtcU6DBx8iVSjMIQDzodoAPAjLvPk1jpfE+Jhw=;
        b=inxXCGRSId9bn7HVl1M6Mg6mpGUgoeYNKvCTXJn29NwpcEhKbS/oTnvY9dNUgOGteL
         Bdo1MOVuxEv0YOhLtFvCKzJHCwcTm4fUDeHx1rtJznBw87g42+C9F2wXwGJkWwtSI3Qz
         lpwI0pq7Xc0Xam556+OEsCoH00vfYCNZwrkgqf0n55/H4+sTmm1nyAdjWqbCGOojS+9H
         YIA4pAAYGiVlSEajicQN80UHlxpEF35CYACCQgQseTGR8PwQ9G1XF51pnDJWPfU3p+yE
         T3S6r++7mR4+mnVM6KoDhf+YL9iEs+NcBNmE8N6ssA2nJYhL2PJ+qY+uKgRHJWPrFAo4
         18Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t53bNRtcU6DBx8iVSjMIQDzodoAPAjLvPk1jpfE+Jhw=;
        b=DPRGoFdgGzh7PJNTrKUJg0xd7S7BidlNdZ6YZIkjVsWjKlh7pwPZKjmNJ0ONoY7pFB
         qtZ7COKrhEI7zumwinphixeLE/fXBy3oX+0s9QzaFog32yvHB7JIlyAuIAZPzBdLz4dM
         JcmM75dU73LSvASVmV+wmT4dfSvtJh/v6MzAjPlWiy6eUzcqEB/x33IIkKoM6pU+ufKY
         1Ch5TmIIN2MmbxzBchexZB/GvkH7ePCjy7XzblzrZvhr9lWUYeEl6y1ttMRV46+rTTzi
         cMPVjgGzH3LgoXZAfTqtmfzJznm0c2r5JzJYTooQr9V/YYYFMXf7nLBn5My0aVb5463e
         2aKg==
X-Gm-Message-State: AGi0PuZXuRyeK5/RInCbsw6jNJJFWAjyz2F2NxEm7zkUJCGXGbd7ZSbv
	byKSkEC6HvP123FXm2BKppRNtNrep+w=
X-Google-Smtp-Source: APiQypKEiS3gOwziXnEOMrX5gkq1fTO48ibxSARUshzwRvyLFLzHEsB00hbr91IA1T+HA6YkgSwBFA==
X-Received: by 2002:ac2:4466:: with SMTP id y6mr1963855lfl.125.1588690716194;
        Tue, 05 May 2020 07:58:36 -0700 (PDT)
Return-Path: <wickbergster@gmail.com>
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id c4sm1557738lfi.13.2020.05.05.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 07:58:35 -0700 (PDT)
From: "Alexander Vickberg" <wickbergster@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-oe][PATCH v2] iperf3: Add OpenSSL build option to PACKAGECONFIG
Date: Tue,  5 May 2020 16:57:58 +0200
Message-Id: <20200505145757.2478494-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make building with OpenSSL optional but enabled by default as today.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
Changes in v2: No changes. Resend with git send-email.

 meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
index 98d2faabf..c7ad91b24 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
@@ -11,8 +11,6 @@ AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9088fe7ffdccd042f7645f1012d7f70"
 
-DEPENDS = "openssl"
-
 SRC_URI = "git://github.com/esnet/iperf.git \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            "
@@ -23,8 +21,9 @@ S = "${WORKDIR}/git"
 
 inherit autotools
 
+PACKAGECONFIG ?= "openssl"
+
 PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sctp_h=no,lksctp-tools"
+PACKAGECONFIG[openssl] = "--with-openssl=${RECIPE_SYSROOT}${prefix},--without-openssl,openssl"
 
 CFLAGS += "-D_GNU_SOURCE"
-
-EXTRA_OECONF = "--with-openssl=${RECIPE_SYSROOT}${prefix}"
-- 
2.25.1

