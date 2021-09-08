Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.12142.1631110809337556107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bqbEAxPb;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id i28so3600229wrb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Sep 2021 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QAZ7VeEZLdj5m3VaYAoino+8OUw2+WPDRduWrZIug24=;
        b=bqbEAxPb2Pi9ZTi+8gakn5e32LXZWLFCUul0XsUHNt+tZya5NnL36P4SHZxjgJlHl6
         8IV56cuC48FTGxnvmpTfJhw1ijXReX124+NCOxFhKhF7mBY9s3qtSJ8pg+7T/tfRnaP9
         SPa7vvvTQa31XjagS9LyxlA67HtzRtsQYyM0v2Ee47VWBWK69sdnT9i0/lauepf7tiEB
         PdvtveUdT5Dt1rOYXzxNxlYf+/Rwyw6ddo0aohCgAcD8P27Epoj7RuN98afHzJhkdpQS
         IYUHWvNHweToKmCgzRPDZpdODyOyfH8TZtGlWAvkrVDNtkSENwEdpw55LNfloTx+Is29
         edUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QAZ7VeEZLdj5m3VaYAoino+8OUw2+WPDRduWrZIug24=;
        b=heJ880q5dux28QsyrZRvn0+NO89htvhjd32YKnCoGbobc6IfuTHXhKSKXuyUJEwi0p
         +k1z1Bx8JFNFksd6Wj/T/3ixiPUHEPqNs2dOqOq0oPS1QIRTayKuV+c4C/GshndlWN31
         T3VfIbwBGYdPBWIhqMNrntYiATNxM1sj4HjRnW8a/9cPaR/3hihi0DdNf/W9FRpJ1L8T
         srlxwW4aW5fkrzjww/PIk0ESjYPZs0BRahWYDYncJ1FXujPFAFN+xzBgubrWZJ/0n2ft
         H2FIVyxiKOhGv75WG9jp3UR+TIhg2kG+RBKZDt1Eitpc1ibcjP/hfPG62Klu6h5hsVwu
         iFUw==
X-Gm-Message-State: AOAM531In3HY1CymKUf3kShBu8IW3X0hOacNifdMqlIOnRffuVFRZWV5
	dfwl2KLvBU3iXF9TWf9FCs1dKJEhuAI=
X-Google-Smtp-Source: ABdhPJxlQOrjsalDid7MLCCP/qo2hmHMT1WQrB8Ms67TZr9zCSgTl8dtMibcRXpj2Mt8hSNNB31O/A==
X-Received: by 2002:a5d:47cd:: with SMTP id o13mr4458921wrc.246.1631110807982;
        Wed, 08 Sep 2021 07:20:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id t7sm2553710wrq.90.2021.09.08.07.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 07:20:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] can-utils: rrecommend iproute2 to make it possible to configure can interfaces
Date: Wed,  8 Sep 2021 16:19:56 +0200
Message-Id: <20210908141958.866476-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908141958.866476-1-alex@linutronix.de>
References: <20210908141958.866476-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This replicates the fix from canutils.bb, for the same issue. See the link
in the comment for details.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index 8d63a10e5..1a2d33090 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -45,3 +45,8 @@ ALTERNATIVE:${PN} = "candump cansend cansequence"
 ALTERNATIVE_LINK_NAME[candump] = "${bindir}/candump"
 ALTERNATIVE_LINK_NAME[cansend] = "${bindir}/cansend"
 ALTERNATIVE_LINK_NAME[cansequence] = "${bindir}/cansequence"
+
+# busybox ip fails to configure can interfaces, so we need iproute2 to do so.
+# See details in http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver.
+RRECOMMENDS:${PN} += "iproute2"
+
-- 
2.20.1

