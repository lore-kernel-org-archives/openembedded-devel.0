Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.4884.1626768714605097660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 01:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O5nlhYn8;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: jainsaloni0918@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id b12so11059109plh.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 01:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GZ1rVmPTYxxYWS+93EB7aPAbAlDMdjGTIX48ues8UqU=;
        b=O5nlhYn8ShIbIwousBSnLmwqAwugk45FinufsH0p6ZiuGr9F+aHmrUoEecislCaaYJ
         odr+OOqaLNUwh37a6yP5Kle33Qp4QFSHH5aZrRkP+Qjjr8Gs/SOfriXsDOtmDsYAu/aq
         DYF3ovueFta89IHbiVmFaZb7i8CywPiJxNHXlNMEg5hVDCXrMLGRXRXZqKa7XZ/dfckT
         COi1a4YPlqhKBT68F0NCuU6ziNCXrmXGyvHpcoldxWa4g4cFEWL6lsjOgwLe7g2MW3dq
         ORI/IBdP43pyYreciMY/yz5Elf1D2gIJJGv4ijhYh2vc4Oec5W4gIcgnB8/nTdqRtiBl
         v17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GZ1rVmPTYxxYWS+93EB7aPAbAlDMdjGTIX48ues8UqU=;
        b=SO8p3eCRGs8JcrU+7seGhwMDOs/RG3w5xi+xui9uFLUy0SCPlvV7WE/H8GfN9ZJjOT
         4IzK3/BcGJNw2EYrY1/XIDwQcFrhPLd+V3sCvbP/Ac2N47BJjP1QG2/RsEux+8HrNzbu
         o1x2jsLbUYHYOgzTCfi78z8EgcjUgp2uE+IY6jGoiMEp+OLRpw4XJKOQLtFvi5DdG5hv
         hPHicvhUYctr/Z1bNCi3ONgEzQAQ7Kww6AnkQix0W50ohu/MwcGdZO+ZHQjluKrKJ3os
         EoMhBqlHCtDNy3bzB8HkawprFUs821QLfpsPCeEuCCZu3AA2P2JWOyMGKyIoTO1uN3jK
         NO4w==
X-Gm-Message-State: AOAM531OGmB/toW8pLuaUYdbXInQ2kxj7LvwgxC49a7cQB/0gCTqy/+q
	wrm3zounNShxV17u/KxYN0bL+B6ck7fdapLz0DU=
X-Google-Smtp-Source: ABdhPJweXfme4TUznHkhsarLIb1MTqCTjtb7hI1r0tMQNXe3hnsgSnonCpBuo399ZKk+Ewxq7LqDmA==
X-Received: by 2002:a17:902:b181:b029:fc:c069:865c with SMTP id s1-20020a170902b181b02900fcc069865cmr23053267plr.28.1626768713926;
        Tue, 20 Jul 2021 01:11:53 -0700 (PDT)
Return-Path: <jainsaloni0918@gmail.com>
Received: from localhost.localdomain ([106.76.73.48])
        by smtp.gmail.com with ESMTPSA id c68sm23930906pfa.171.2021.07.20.01.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 01:11:53 -0700 (PDT)
From: "Saloni Jain" <jainsaloni0918@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [meta-java][dunfell][PATCH] xerces-j: Whitelisted CVE-2018-2799
Date: Tue, 20 Jul 2021 04:11:40 -0400
Message-Id: <20210720081140.21159-1-jainsaloni0918@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Saloni Jain <Saloni.Jain@kpit.com>

Whitelisted below CVE:
CVE-2018-2799:
CVE only applies to some Oracle Java SE and Red Hat
Enterprise Linux versions which is already fixed with
updates and the issue is closed.
Link: https://access.redhat.com/security/cve/CVE-2018-2799
Link: https://bugzilla.redhat.com/show_bug.cgi?id=1567542
---
 recipes-core/xerces-j/xerces-j_2.11.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index 98ef32f..f2a4434 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -14,6 +14,12 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.tar.gz"
 
+# CVE only applies to some Oracle Java SE and Red Hat Enterprise Linux versions.
+# Already fixed with updates and closed.
+# https://access.redhat.com/security/cve/CVE-2018-2799
+# https://bugzilla.redhat.com/show_bug.cgi?id=1567542
+CVE_CHECK_WHITELIST += "CVE-2018-2799"
+
 S = "${WORKDIR}/xerces-2_11_0"
 
 inherit java-library
-- 
2.17.1

