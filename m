Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA0FD40CE0
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.30368.1730838872679265278
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hnCg400/;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e29327636f3so5155410276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838872; x=1731443672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nb7BbaXNBhbEwOEIBb58Gz0Ysu0aGgQKGUs+2IBWcHc=;
        b=hnCg400/1V54dIhwEqROvDaX5lj8LgHh9OJ3n3ucve7N/ktNLCPON2sC8SFRVK32Yp
         KO5Sa6XPSke3uo0uqnZMvI94FElB9qRpo93HOG3I+xREA2hg+q422Xl8spbnBlDQUy64
         Adz65X+0yG62f6ou/0YuJ8ckvHlwDy83EywHwoLqihH7XjkUZ6/yiz8S/tZ3dkJCK0JG
         jQ+m9z61kAi8FSeiTm1vNAp+dL+Zsq/qECmcWETUDyPmJ8qg4ltOF31Mf/Er7TFTbBS8
         35u2UicKV88VdMJVAPZcAZagscQGpceObcrHgN9UI4DFOcTaMOpBeuDt4Q7QDskqix5m
         KpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838872; x=1731443672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nb7BbaXNBhbEwOEIBb58Gz0Ysu0aGgQKGUs+2IBWcHc=;
        b=Wq664PWi1rhe4VlnouLUNUN2Gg8+kZ/gMF7m+Pla2gSQMATmoV4/w35TjcY/+6I7Yk
         UIMzClG/eefUU1lZHlpvmRR+D+z9NKhcr3CT4CqmI0vVdNWFfP83QS303Dix40lKD+Xb
         5gOdBZ9hOfA2pUlX5Zj+qeaV0geYUX76D01ZY/vVMlpgmKmBxjFEJNEjs5FU+44GBayY
         RFu5Gk0wYxuEwFyuNugoVa++93ihu7K5r3XpZ/cztFAbJ4CK7wEPwDn4npQoi4A9dvMh
         v5PcgIyHN5+sOHMP8CltqlbSREXhjcJCnwJS+5k1kXCLvxUjPYn15v94T3YFK11UM2Nz
         crvg==
X-Gm-Message-State: AOJu0Yxyu9JQ8iBsNCLShmFcrFCfxMQ8S47v/IUZKx4Rw4AvZe3HDIBB
	aa46L9ZsdnPnf5u3jUFByiPnLOahTW2tTk7PFXahgu/0ubdixyp+1wjwYvTr
X-Google-Smtp-Source: AGHT+IG8oABLfZBVkR8qTlzEbl8WWwJfCMLRRdCUttMbU3xjKsLgECyuSFmSgiV4CQwfHGtk6jIJ5Q==
X-Received: by 2002:a05:690c:7448:b0:6e2:2c72:3aaf with SMTP id 00721157ae682-6ea64bdcd0emr177186527b3.31.1730838871389;
        Tue, 05 Nov 2024 12:34:31 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:34:31 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 121/161] dhex: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:46 -0500
Message-ID: <20241105202827.3104-121-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113638

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/dhex/dhex_0.69.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/dhex/dhex_0.69.bb b/meta-oe/recipes-support/dhex/dhex_0.69.bb
index 3cc870481..e0026f92d 100644
--- a/meta-oe/recipes-support/dhex/dhex_0.69.bb
+++ b/meta-oe/recipes-support/dhex/dhex_0.69.bb
@@ -8,7 +8,6 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://README.txt;beginline=229;endline=241;md5=6f252a421b65bcecf624382ba3c899da"
 
 SRC_URI = "http://www.dettus.net/dhex/dhex_0.69.tar.gz"
-SRC_URI[md5sum] = "64d557437fe110c19f23ed3e9bbcdd54"
 SRC_URI[sha256sum] = "52730bcd1cf16bd4dae0de42531be9a4057535ec61ca38c0804eb8246ea6c41b"
 
 S = "${WORKDIR}/dhex_${PV}"
-- 
2.43.0


