Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE5C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 18:43:09 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.8040.1646505788912522688
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 10:43:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HvsWYqOW;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so10772334pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 10:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nt0UEgXiQXHjJo3fTCakiWnPdFLFvWXEEx7ojmgMSWs=;
        b=HvsWYqOWXICBq20sMT2WmWmRSowJADHaB/LTk4ZQP+byIM8LrfmPEBGUck3RrCZWA6
         ll/bxcOPPPn4Ktwh3rAryqHv3dKfcFlgy+Ox17HtnJij3Ii5rQkCTvbTnTlXr9QnfO+s
         FSRwtOVO+nRtcOBB+vyHuMwujEgZqNb38G2/jj1jNjsGgxTE2LFc4K3XLVdI+apvM5Cv
         nYMcRvhfAkZ65hwsFao76ALUo5uRbdH/ClJznMnuhr4L6hhTUoXWer/pKqItQ4HJnwpe
         udVe52Gw5TyJFmWsovCzc9cuDeQ/tKzb5GL4f9A+WiIQiAtyyUULXGD5frR8f7RPd6Bt
         soyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nt0UEgXiQXHjJo3fTCakiWnPdFLFvWXEEx7ojmgMSWs=;
        b=kpuB5imBFZZC4/Nkh99eBqsBiQ8+/7OJJj3iDkoG9chQcHvK2AyZCJkW0eqa81Q5S+
         x4FSUfdAvHeexcLImIk09lfmuxXfyYZbF4N5MWcFQEA9ExB2jT+Fa+j2gQeKWruMlLrY
         8oGl07zqOTTpyL0owSxaemb6qtMgnbNgzFQM7rSlw3vTc0oc6j3zZEdsNkzBVH0NQXA7
         r4SudnoeiZfNUGqmLfNTaNclNa11cNS5tNcGZ3ZcbpoH0fDl5KKLU2HUJpNFQQ0wH80T
         hqkXGfs+/pJtEexp+8XAX1blpG52TwlZqXDbRx4s9OLF6Q1Tcpb5nSKbA6xElotUWQ0e
         30dA==
X-Gm-Message-State: AOAM533J53umaAPvioQC8g3IzGoJdHnTMkJ1Z2bpX2vL3mSP8xw4YD6i
	5wCUQ1XEg8P9wZRoR1bXzxFxbjT5Mrw=
X-Google-Smtp-Source: 
 ABdhPJzusSl3bu89tG1tJOgI7chhPUfJXSM3yhTR14/H5k710CcLkG9ok9E0+e890nmTPU1wS4xxBg==
X-Received: by 2002:a17:90b:1d90:b0:1bf:2e8f:9bb5 with SMTP id
 pf16-20020a17090b1d9000b001bf2e8f9bb5mr8010159pjb.236.1646505788214;
        Sat, 05 Mar 2022 10:43:08 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:2999:fd67:72a5:6dc5])
        by smtp.gmail.com with ESMTPSA id
 lw18-20020a17090b181200b001bf057106ebsm9968686pjb.41.2022.03.05.10.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 10:43:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott][PATCH] pw-am.sh: update to new patcwork system
Date: Sat,  5 Mar 2022 10:43:06 -0800
Message-Id: <20220305184306.4010265-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 18:43:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95802

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


