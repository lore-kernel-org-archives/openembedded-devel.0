Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.1387.1632245376972502209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Sep 2021 10:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eyzhrDIc;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id w14so179031pfu.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YKA4yh3jI0AEhcBcQ4F1JioUM9AZMqu3vEYjwPUk4Bo=;
        b=eyzhrDIcyVfqztPcqh8gJKNR+L9IxnCQwb3sbytWPw7L5QySJrFPQsVPRjct5gOIbZ
         rhRsvPykHNtAd14DzCIfHhq/ynuAA8r2TJr9MsRReOtfDO6pGsDcrCVpKEVKQvkHFSHM
         UNZUXVg4oLKeORFCp39Fw4HIFKP9d/AzDKX5AzKjyEoosOgfpDNcK+tPR5ueO4CdzqU7
         3IbK3zRvr9ki1C/k+q1rMQu79+1abH9GRAVQytylj5+lBnKkg6QjaNW+xz40A19/eCvm
         CLPPFHqARtmCHg4vWEkflYFhWCJoPAAFetDNuYR9k9H6a3E+2fz8tSQq4BNDx0uiBctM
         PLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YKA4yh3jI0AEhcBcQ4F1JioUM9AZMqu3vEYjwPUk4Bo=;
        b=X4d/ajXSxz7GmmLSbOjYD8RS5CHFor/GANAJj6iQBR3cKQ3rSq31hqXYP9Pmo4nPoL
         D8TeFBuTX63LQ4J4AT0pArIls+7riiraOyqud3bhbZ+DRYGFiA3t3Ci+ipQfegrx0K08
         nKiOr0+PRuoHqfwWaLRRiOFqWlqSxjDyWZ8k3HS1pgk0yMUi5nG5Ut53YaOhQGaJK81e
         uesmPs5IgAlFQQcxvoRxFmqXLm17gblYqOPKe8k/DpW/R0J3QgKaJpPivyhF/mVT/IRd
         9spk9DmZh4Crkw4g/wTefKYPmvYyW1inIJFBXmuZVOFgJnPzV4DoxqMfM8o1psdtniDH
         LHOA==
X-Gm-Message-State: AOAM5328E2iZRZX+5x+kfKwo82+zSJwifgRRJHtQjs2hSORPMKL7i71k
	ETid4fg1MfZi5JwdvcerdpRhZ8rufBDPqw==
X-Google-Smtp-Source: ABdhPJw1eFm8U8ggUfqvKbcbJ+ViVnZjMtLrSQdAE+rywYUJF2eNKhQuPGIxcSoYAI+DkO1ASFAc3Q==
X-Received: by 2002:a63:1d63:: with SMTP id d35mr28735904pgm.238.1632245375984;
        Tue, 21 Sep 2021 10:29:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id r193sm6578530pfc.197.2021.09.21.10.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:29:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] rp-pppoe: Add configure cached variable via recipe
Date: Tue, 21 Sep 2021 10:29:30 -0700
Message-Id: <20210921172931.3132388-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These site files are only there for single recipe, move the data to
recipe and use SITEINFO_ENDIANNESS to choose right option and pass it
to configure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb | 2 ++
 meta-networking/site/endian-big                             | 2 --
 meta-networking/site/endian-little                          | 2 --
 3 files changed, 2 insertions(+), 4 deletions(-)
 delete mode 100644 meta-networking/site/endian-big
 delete mode 100644 meta-networking/site/endian-little

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
index 344aa33dec..61e90225de 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
@@ -26,6 +26,8 @@ SRC_URI[sha256sum] = "8cd6bc71ba46bd5f6eb4daf60220ccdcd991a8525111dee466501b1b97
 
 inherit autotools-brokensep update-rc.d systemd
 
+EXTRA_OECONF:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', 'rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=normal}', 'rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}', d)}"
+
 do_install:append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/pppoe-server.service ${D}${systemd_unitdir}/system
diff --git a/meta-networking/site/endian-big b/meta-networking/site/endian-big
deleted file mode 100644
index 3a968e3267..0000000000
--- a/meta-networking/site/endian-big
+++ /dev/null
@@ -1,2 +0,0 @@
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=normal}
diff --git a/meta-networking/site/endian-little b/meta-networking/site/endian-little
deleted file mode 100644
index 0bcd966ea8..0000000000
--- a/meta-networking/site/endian-little
+++ /dev/null
@@ -1,2 +0,0 @@
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-- 
2.33.0

