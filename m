Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.14198.1589552221230236395
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=RIIei7zu;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.194, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f194.google.com with SMTP id s1so2626887qkf.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RXVI/WLJLRyEqZ2NLcHaE42ra9KLITm64THCkZ5TCqg=;
        b=RIIei7zu7T4Z6l1l+pomSGggLs81Z7foMeNnVQHQXD8sUMitU4hLjAKc91mQCDzVrE
         qLOBtrTf9jI5b0bslThPVojGNp3ImeJ3PomVoNzW/GpoA4eeWW5lvhhM+WFO1KHiBwKa
         BumDuRDHKIpkuklu1wT1ZgI6/bS2iNQekbNWBZE0GliJimaWHpoWDmi3icYmtFNL2YwL
         BrCCSj+zqr2bETLrvkGRK5FH+HH6WPUak0Z0M3Yhnkg2LwBJ3TsTKCXJtjTibnBNMyZ+
         SgT8jBxwv5YvJboiuyO6SojeY5xCgl0JKaoL97easPR9e0cfI3vu8CVRlvCiAKfrWRtT
         /LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RXVI/WLJLRyEqZ2NLcHaE42ra9KLITm64THCkZ5TCqg=;
        b=NoA3MqdxksLqbrGW0TOIcVOCRWMIBcjukCc+tvam1VlzHeSJa3JUQgt6wdofWwbRSR
         a8dMBjeJHJUsN9z46h3beNTBcHG65Q6p18HHhuLrNrq7JVbzt6CUuFJxIp/bv6WVXwfP
         Fg2CZFSbZP66k75Vm+/OVZHZbbcoARueepnYy7YsTaBNVdqsXwEvN3ec3z1uUNeAA+Hf
         wne5DXPpl72n5Vy1/bkIfO+/Mq5S2XZG+qKZ2ObGs9YjudiXWOYTXNkfEtI4VoU7Yf/B
         MJcPKYRMcIA9qG96VPhRluTyKNuqlnMjkIpSWHMV3NlOo5i5BzcFS7frm92wMrvxCLi1
         LNbg==
X-Gm-Message-State: AOAM5324DAg+BxV4NZZ+QmpuBQIP2caysJjkOwZqkxaGmU1NAgi42R1i
	pN08MfiAYQqhTdnnA94nMwiVin1Tp2Y=
X-Google-Smtp-Source: ABdhPJw57DX5iZq86cPcUPKT0pNe5CqcVdWQoJRno68mgSFERDYcY4ffFFClkCI2h9REp8DqiCz2ug==
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr3639739qkg.347.1589552220275;
        Fri, 15 May 2020 07:17:00 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:16:59 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 09/11] python3-xmodem: Add recipe version 0.4.6
Date: Fri, 15 May 2020 11:16:28 -0300
Message-Id: <20200515141630.27789-9-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
References: <20200515141630.27789-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-xmodem_0.4.6.bb                 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb b/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb
new file mode 100644
index 000000000..3fdd3e58c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "XMODEM protocol implementation"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[sha256sum] = "089737298f5738eabc43f2519efdc80b402693768f16383f7013b9e6f8f279d7"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

