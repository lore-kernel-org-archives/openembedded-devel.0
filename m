Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173F2FF4935
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 03:19:23 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42495.1774840759392465525
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 20:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aqxrFH6M;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65009bfdcfdso2253528d50.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 20:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774840758; x=1775445558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HnEBlh8JGtrkgLbk5y9T4nLU1g1v68LNTJ4IHS/UFeE=;
        b=aqxrFH6MteT7KeR9rgN+Nh0u6faXy+EnXyph1PhKXjEkiDbFQ68eCgM0an2ODuMjcK
         MEQL8ESYevZhTNWD2jwnkVMEGDzAOoHGNqkStmwPj4lXsATxmLUURFhdsHa3WQt3RbF1
         Zs7VukO2t88ruQpDJtknXFdEZPY20UV1i3Wm5WdKcXcuTtBm4N0J9K0hDrskmt4cB+Vx
         NFCXwCD1YWutU1+UcguNkZU0n2SASC/mdAXYdch77nfLiDmR6t9FxVfF8LMt3+y7hFFQ
         UzbFSgsMS5ArBDlvnuYqVrUtNdfwKlMXbRj+calw+bo4CMazO3NIK2WJOJ87cdkymnTx
         n0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774840758; x=1775445558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnEBlh8JGtrkgLbk5y9T4nLU1g1v68LNTJ4IHS/UFeE=;
        b=XlOzVtPXlv4fCkyvtqpIw+g1+PCC1SAgOQ5r1neJRD4dd0Gig8Ja2D3HcCt7vFloVx
         NxtmxeSkPRRH3FFFaEGR2FWi1Q5nYG+PBT/afX31lZVGvYxKUVq6XmadMZjlzguTc/G1
         jvXB6a0Ms3eNCFLKk/m42q+J2wPankswDzwUbOUaaS3YLWrBTVE7kx9CH+CjC2z+BLs6
         CH8SmRCdOkto8rHin151cYKkZWJ2DDnuTFek4fRAci5d58ZEWOlD6Hmop14Y7+9ZR5fH
         F4Ohj+Gj0DtOPzlImrxCKfRh12GTVTj9JCcDZGbDKh73rqA4fjZr0XOTYjOGRnZX2n6f
         RiIw==
X-Gm-Message-State: AOJu0YwXuANWvzhhBWvkwuk1As3gzTt7rTGAdi8PUO0p1XAdHSRpoHDj
	ceF10ldBWVG+VRdqS3lcKDgalrigu4xwf0CDeZXdCArivJGo+NGdU1W6zliR9JJS
X-Gm-Gg: ATEYQzydVQVKU5VeMWN3h4ajZefZiCrxCaiWojOfU30kUYfq0eKcp5+ypfTpxRwKBA/
	bPM8f18GmkmwxM11Qm40rZSmh4yESn7JKG/pP8XB+itjgrTRHdQvZ0OowJsB1fcnAX72eyQJHMM
	TEa0yhYeBLiqBOlz2nHzca99KL8TA2TYE7UZNER0xoeE6e7jAgtkHe9P+zMtm+snu/61ONmc4/s
	oyjwH3c3sjRX3yMzVr+KkO9qPNiQu1lkWPxrgk8mkpSprDScW9RJ27XeAaK0loS06gwRybIPtaE
	ykCogMDD97LSn9MH7UGJcCEBsWam+GlUbA4wP0dVbFjsoAHMXEvsn0L1ZKeHPVq5xY69kT/J9c8
	4zVihxpopfFiSY6M/cCCAeC2Fsz8FSgHVi3fuzbvJpxH5PD5J9Mvub/8qSBu9fVmQsuVmdp35Wh
	8Imu9m3DZGoW2CIpzS9zqeo1WB2757O97Hu4LpfmcfLMAXSjLGkJPg1Kx9gG7fU2iSSTW1jtAA9
	XrQxhSo9SuBmIk+YuonHmTaYgXPYgaV16uBE4QyJDiXfeQ1mqgP
X-Received: by 2002:a05:690c:112:b0:79a:dc28:fbf6 with SMTP id 00721157ae682-79bde0188a2mr102113227b3.29.1774840758086;
        Sun, 29 Mar 2026 20:19:18 -0700 (PDT)
Received: from localhost.localdomain ([67.233.60.136])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cba47147bsm29691767b3.41.2026.03.29.20.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 20:19:17 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] thunar-shares-plugin: add missing HOMEPAGE
Date: Sun, 29 Mar 2026 23:19:12 -0400
Message-ID: <20260330031912.699785-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125823

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
index 3b4f38da02..b270ad0838 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Quickly share a folder using Samba from Thunar"
+HOMEPAGE = "https://docs.xfce.org/xfce/thunar/thunar-shares-plugin"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-- 
2.43.0


