Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F2DC433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 18:44:58 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.8062.1646505898091136964
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 10:44:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SLZKIMWO;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id p17so10480436plo.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 10:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nt0UEgXiQXHjJo3fTCakiWnPdFLFvWXEEx7ojmgMSWs=;
        b=SLZKIMWOQp+O4kke09u1Y/X4da9MS7X86oze9xBfEMAwki0k7hb/yUqoYjksIvL+Zr
         aYH9YovUdYGWlY55yGzDNZ34rw8/Kz2NpMz9e+qDkTmlbi3Xge0vMrNUoQer/uvTTcGw
         EGk3+t+5ZqjeIYFY8IgYzRHsQ0BoYl29FW6HzDrMXv6dNzmzifKFhFTbQ+BTmir79gZj
         Ma5rQ9ehrMQnxuPQH3iGgR3sFkUQ/zDGeFesaTjyq2Ywh1SUPjU/SC/LdHwlTavQG0tz
         ka1Lsa1/u8W+rQpLlBA9Sv4Zh5R+8PBnbf4PuMYWzxWVpKEthe3bWDQYcaQha7bDTNKy
         3X4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nt0UEgXiQXHjJo3fTCakiWnPdFLFvWXEEx7ojmgMSWs=;
        b=gddHXCxHoJb6IQpttJNamHxBY1ImyPnoPa+Vq/n9l++TrcMv9j2tS5vbKKvqyWUoU6
         ZDZH8UNozQnuJ88vEB9HUK1oR0kBnJxTvthYpIxXfmszjLSTneXrPr1l2jBQcyBAuAWj
         yTt/qJ/W5x/C8ig49HhKRK3g1THA6XbCdif+tny1yI8c2KE0HMV408r2Mn/7w3lfPGMB
         xNAN8Y1j+Onsk7RGRXBQidWn5ug2+66HKjUXBYhHC80yRRcL2uQICssM4I/9i5RDjreb
         R5Ks9sbo/edKPLy4GM0s6eGya7cn5FmPViq8dhZLKje5kjaeo7rKP5Io9Hxuy2bjRXXS
         vJ2Q==
X-Gm-Message-State: AOAM530iuOX2ny0swzX3I7Q1WkqZ9hPFbzerGxaeaB1cvnLv2VJl4HXg
	R9fAcoHZH1qd5hfaQrpzNv9N1ovoEOs=
X-Google-Smtp-Source: 
 ABdhPJxj57WWRkYQwWgT+uPwBdPQHeJR0Zh7QmedU21oeZLhYx37yMPqxJnI4AShs6JTR5NC4LSyug==
X-Received: by 2002:a17:902:e5d0:b0:151:cc18:9ebf with SMTP id
 u16-20020a170902e5d000b00151cc189ebfmr4785635plf.110.1646505897517;
        Sat, 05 Mar 2022 10:44:57 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:2999:fd67:72a5:6dc5])
        by smtp.gmail.com with ESMTPSA id
 j14-20020a056a00174e00b004f66ce6367bsm10914524pfc.147.2022.03.05.10.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 10:44:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] pw-am.sh: update to new patcwork system
Date: Sat,  5 Mar 2022 10:44:56 -0800
Message-Id: <20220305184456.4010458-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 18:44:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95803

Point to patchwork.yoctoproject.org

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8b8bfbcadf188cd5b234358590764e20d03d7861)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/pw-am.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/pw-am.sh b/contrib/pw-am.sh
index 8987eee8eb..d9d1187b0b 100755
--- a/contrib/pw-am.sh
+++ b/contrib/pw-am.sh
@@ -9,7 +9,7 @@
 
 for patchnumber in $@;
 do
-	wget -nv http://patches.openembedded.org/patch/$patchnumber/mbox/ -O pw-am-$patchnumber.patch
+	wget -nv http://patchwork.yoctoproject.org/patch/$patchnumber/mbox/ -O pw-am-$patchnumber.patch
 	git am -s pw-am-$patchnumber.patch
 	rm pw-am-$patchnumber.patch
 done
-- 
2.25.1


