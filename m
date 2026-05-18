Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F56CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 00:05:08 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6998.1779062639428848728
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 17:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ruKs8J85;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: ethan.twardy@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-910bb291688so224041385a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 17:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779062638; x=1779667438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=680ZpIucz17NtdApT5N7lZZ8ZxkEdxF5PC/gRwyAR3o=;
        b=ruKs8J85K0Gv0RoYylh4sI4dhPPG1DRl8Ew5nQc64uZkUfMvPdfehGtbyTEBRgWiFT
         leahbwnWS4RZ4XEXHPzeyW62XOJlD/PY5NcteJbrAn8rxlEDXgbYJSLfiGsPaK0VuBGw
         b5jn7VF5YnKYjT+LcnBtKJKD1nCnTyJf1mCVYrF8J0NSy/1UNW1QK59R/AXFKHC1b7Ex
         SUdlL4rwSRd1Wx+N5OibsU3YuK8X9eMUU6FddvVorQkymhqPe09Ls4K3sYuAqsks1gjv
         h5FiITnXzg7ajOzOVhUDI4J85GQjP8bauOuknJ+zASIOKHu7z5ns/etVWS43y8d1lnE1
         FlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779062638; x=1779667438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=680ZpIucz17NtdApT5N7lZZ8ZxkEdxF5PC/gRwyAR3o=;
        b=b1JR8sWHnFwySAkCmcsc6zWeivdDdCa94YSFOSl8ZIJC4h+3EUgg7e3JHf1BK1PNkU
         B5HzqCr3OC/J03Ky4y40BnvNYf6NP3Sy4WjqglaABxgqEXAt2d71Tbt15xnxL886TvOd
         DesZ6hregPN5H6jWi0L8C/TbLY1qI5x8Rm+r+7MV6lsiEJa7/mvlATs8tbb/dKMcazIC
         SEQ5a7zVHW/VmWsdWOLxAdVJgPDLWB6NSomOX0HuG0VutpAbnhqIOI5ToafgDmqrZTWd
         9s5CFzw7Ke5X76J/jeAuJDAwGW6fWQz/vaw/Y/fDfIXXPzE95DWWAXGHML72Yd223o/Q
         fd+Q==
X-Gm-Message-State: AOJu0YwggLvv9ew3VaNb7CJa4t1miGNUG8xw8oUptND5P2jKxHnVZQ6h
	9FWLjvH2GridhGpH0IHhC7XWYKuOJX8fsgWW+a4choc8MUtnuT0djGHDE82mcQ==
X-Gm-Gg: Acq92OH0smNFaRBIV0aOFSR4E9cw838FRLJrT2VmB6GX0M06rNQWD/FnM9oH638QlhT
	asuAOYYQSzW9SNXZCefK+1h2JFuZtXJ15cxvNvu8Gqbuu8fyCFNsg0oRV74c8zWawofboSk1Nut
	+Skd0m4io5QPG5H459xnjhPbm5eTghNNla91RizVm0vITQnCUMurGmcU6/F6zH3B9ulrONr1E9H
	T+xECXV+yn3q2rBpYxcfC521jxumVRcCWFuvTrtDrjzPo4e24TMCKdVw6aUpdiDMU/OvkYbPGao
	oYO25e2T6Kv53PNI/nWPIIXCM9sAkz+ngcxkGnRCVRoqUgSoYwQMgP5O/v4Ne511x/jJ8elHgoD
	NWElZkOK6v6mKVqz8L5R7iH78s+wr7yE4TAeZ0LB/X/ncAIDcbymfPzYKeOyRd0BSUoGdHoK2gS
	ykRluARiWiOpbVtEXO2IXabdi2oM/XaUGuTeHEcog3goegmzKWyg==
X-Received: by 2002:a05:620a:4449:b0:910:d4ca:4a8c with SMTP id af79cd13be357-911cf7e7f86mr1806679485a.60.1779062638092;
        Sun, 17 May 2026 17:03:58 -0700 (PDT)
Received: from server.ethantwardy.com ([89.187.180.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91433530506sm211755785a.44.2026.05.17.17.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 17:03:57 -0700 (PDT)
From: "AmateurECE" <ethan.twardy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Subject: [meta-oe][PATCH] rsyslog: Fix missing runtime dependency on procps
Date: Sun, 17 May 2026 19:03:43 -0500
Message-ID: <20260518000343.4136127-1-ethan.twardy@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 00:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127045

The logrorate configuration installed by this recipe uses pkill(1),
which is available in the procps recipe. Add this recipe to RDEPENDS to
ensure that it's installed.

Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
index 186e1ccf24..107fee692a 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
@@ -178,7 +178,7 @@ RREPLACES:${PN} += "${PN}-systemd"
 RCONFLICTS:${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
-RDEPENDS:${PN} += "logrotate"
+RDEPENDS:${PN} += "logrotate procps"
 
 # for rsyslog-ptest
 VALGRIND = "valgrind"
-- 
2.53.0


