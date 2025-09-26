Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4962CCCA470
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:32 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.18544.1758896367496728386
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a2eVDOKO;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so4422256a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896366; x=1759501166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icHS+oadD/YZ8ck7aCZEYQI+H+jkG/hi28GujCnWO4I=;
        b=a2eVDOKOCNpAS7sQ1+UAZoa7qeXSfd+dLxk382wtMAwr57fhbezjUjTv3JMmjNA4oc
         94zGBX9OdINrlRtO0DZFxrRIAoesv6uCHX7JJYYeXVfSNqMEzavWRsr/48vjJRU7IvFH
         V3tppmYXWTbky6w5w2ZLC6TVefEURrMG97gV6L569CrH1QFVs/ha28kJbT83aNteFhG1
         OzRJcBT/ipH/245FolJC2l1mycBPYyMS06a0/oJ8UMYTBnBQOEgor0cMqDyO9Uc776pK
         UAIlK0nv6+AcpERXYkvUs5mrRHOva9Tkya0IWtxBwqieBG2YwXXvHaRwnGcBVIcHHtwA
         Gbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896366; x=1759501166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icHS+oadD/YZ8ck7aCZEYQI+H+jkG/hi28GujCnWO4I=;
        b=nwRHCddrWGjZvMqBmygQkO9OxgO5/QYswe/aIVdVXrrvkDLTLp0kqetCTk2aBR0A5y
         WQr8jKyKGhk+esfI+KIZwbmIi/AdcXD52X96wG+j+MIjMV1Y81uOhR1xSuCxl9vAnXOI
         dqyj2fpGcZza42BqW3dt5WV1UMkTQbnrgXs5o24StYGSpCui5mr0VEKC+9DoaJ4WQxFB
         E7wdnzf7UJXBTPW6UURcGFGIku+qgQSeF/YhjeEn2GgoL2PfMljKl3oatnSMy75qJPSR
         zM8GiOgDeFW0pi/tp9eriR2F6Yud4sFklOk0HFcLyy+P4y9hGecJDpIatJJ/u5mewoqd
         Ynyg==
X-Gm-Message-State: AOJu0YwF2ex/4IDQOA0ePxr5CsIw/Ym7Qnfx75eG28dJ8MzZUwVGP/Bu
	sAYKG6YI96pRen1ihBWW4LyOa3tZWY2tmvjDsDyV98yyrl18TuskRU/ft96SAA==
X-Gm-Gg: ASbGncvazVbeyAzs7L41/SHN/fi6cnnfeESIrJJE3LvBFlXBErjljp4gfF90vhDl/yL
	laKb2YTibKxd/779HTVKNewm3HtEAHOMoSvUPMYyk70MGSbOs5Df49MD9XlmqNepdXe5bw/ez8y
	hfrLDhfQ0xeuId2arVVP4lVQW/1cB2w7OUyOSMQ3CNW6EnW/n6bYQjn6pGZRbW2LA9jLilm7YXV
	P6Tz3faClf0cFOrPb6BGcMV7H2GOofNZm0mTNNWNcmWJi0K6qyIjlLBK0L29wbGN54poj5YL2sx
	ttbdRQqfB8gtTPM8EfazhQkeA2EANgHPPURYbgNiq+7RR53nRlG5qB5T3cn8CMgJmBycJIHTIBe
	C5ANAuDz3wLBnrFGML3La
X-Google-Smtp-Source: AGHT+IE3ZjpRWLTFdbWuB7vVuybaUFthC5sVMJ1JANr/y20iKp3W9vS/ldX9npdU8FNJeUFpqEI25Q==
X-Received: by 2002:a05:6402:13d2:b0:634:ab36:3c74 with SMTP id 4fb4d7f45d1cf-634ab363ee7mr4678646a12.9.1758896365685;
        Fri, 26 Sep 2025 07:19:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 04/20] ot-br-posix: Add dep to ipset as used by firewall
Date: Fri, 26 Sep 2025 16:19:03 +0200
Message-ID: <20250926141919.2010846-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119913

From: Philippe Coval <philippe.coval.ext@huawei.com>

ipset is used by firewall module of ot-br-posix:

   third_party/openthread/repo/src/posix/platform/firewall.cpp:\
   return ExecuteCommand("%s add %s %s -exist", kIpsetCommand, aSetName, aAddress);

Related observed issue looked like:

```
oniro@oniro-linux-blueprint-gateway-raspberrypi4-64:~$ sudo journalctl -u otbr-agent.service
Apr 28 17:42:32 oniro-linux-blueprint-gateway-raspberrypi4-64 systemd[1]: Started OpenThread Border Router Agent.
Apr 28 17:42:38 oniro-linux-blueprint-gateway-raspberrypi4-64 otbr-agent[330]: sh: ipset: not found
```

Relate-to: https://gitlab.eclipse.org/eclipse/oniro-blueprints/transparent-gateway/meta-oniro-blueprints-gateway/-/issues/6
Cc: Stefan Schmidt <stefan.schmidt@huawei.com>
Forwarded: https://github.com/openembedded/meta-openembedded/pull/611
Signed-off-by: Philippe Coval <philippe.coval.ext@huawei.com>
(cherry picked from commit fc8209e8bc2c45d241561e75c4f2b99c23c5689e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/openthread/ot-br-posix_git.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index a16b77849e..e7c835d3c0 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -53,7 +53,7 @@ EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DOT_DHCP6_SERVER=ON \
                  "
 
-RDEPENDS:${PN} = "iproute2 avahi-daemon"
+RDEPENDS:${PN} = "iproute2 ipset avahi-daemon"
 
 RCONFLICTS:${PN} = "ot-daemon"
 

