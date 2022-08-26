Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C564EECAAD1
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:11:42 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.32707.1661479894251930342
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PERrMAaC;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 h11-20020a17090a470b00b001fbc5ba5224so206568pjg.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qz6gzjjw8DMD3w1rWhUEYsq0Qr6oM+ROOYItCqYHqJE=;
        b=PERrMAaCFWZ6/8YsdBFbmFE4rF+Jm05sPUvbgLpevDD/RIfAPMM5vhh8fs4yhEsXiy
         n7kq0g4GZ3s/cPZ3D0vSORx4nwUvI0UrBDih6AFCoiLAY0VubX47uQyC9d5h/N+8CW2l
         rVL4fK/Cn2yXUyd07pILhwH2fh744+R6swXCiVkx0/iIgLxSPTM1FWNbF/cLeuB0mMua
         6vhjGReR87FW0gtN0TQBiA3oLSdssaJPWIdMW+8HdYpGzjH5IirQh2mZusDjT4oI6GdX
         GBXD2e9eDDbH2+bRdtQ5SS7Ip0EYwsRMZ37ildzHMB9oLXhdCt+adKYuGmhQ1qGuzcVu
         7oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qz6gzjjw8DMD3w1rWhUEYsq0Qr6oM+ROOYItCqYHqJE=;
        b=v6Il1XzJI9TOAKSBmdtrO8GiwV2x/uCQVKMX/aHGplPrX39qzqsewVSbrbX3xBS3wa
         q6yNLB21JGunGpp46Ut26/tTDiVsFQJQAW5v76gOQG0N16p8680CLyiJe4XvnRyPxiAt
         XlY+nPjrCaIQNRnD6FXwCYnm1+UbKogw9V1nsltVP++6oe6nlVKwd6nJfop9/ywHPyci
         JqWXZNXkiUewheU2si/LCqtaLsnJcI+BQiHZClXBCfnAflPziJ6YXgESldhx/XrP+myL
         6m1HxuwfkGf+5MfBQnANktaDLdKqjAF/sJ9bph50rYvJpvyPfRdLrvLJ+zPNLIRopESb
         q0gQ==
X-Gm-Message-State: ACgBeo1r5/49YWenWGKfFCazEM48FJ6I41St9OhtNYa3inE68c4g21xr
	lbuujji4p1WIgtoQkMgT1tud1yg52q7yNg==
X-Google-Smtp-Source: 
 AA6agR6g1bnMb01AMR6Vyve4hiKnjn7pT7LElG6ofzHK++vvEcJBUA931YhwcxzJt3yXFMbUqcB3vQ==
X-Received: by 2002:a17:902:bb94:b0:172:8fd9:7438 with SMTP id
 m20-20020a170902bb9400b001728fd97438mr1605757pls.174.1661479893321;
        Thu, 25 Aug 2022 19:11:33 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 z75-20020a63334e000000b0041a67913d5bsm250180pgz.71.2022.08.25.19.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:11:32 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 6/7] usbmuxd: add usbmuxd_git.bb
Date: Fri, 26 Aug 2022 01:32:26 +0000
Message-Id: <20220826013227.181910-7-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220826013227.181910-1-potin.lai.pt@gmail.com>
References: <20220826013227.181910-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:11:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98447

Add usbmuxd_git.bb to point to latest commit on github

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../usbmuxd/usbmuxd_git.bb                    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
new file mode 100644
index 000000000..e9afaf571
--- /dev/null
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "This daemon is in charge of multiplexing connections over USB to an iPhone or iPod touch."
+HOMEPAGE = "https://github.com/libimobiledevice/usbmuxd"
+LICENSE = "GPL-3.0-only & GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=ebb5c50ab7cab4baeffba14977030c07 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "udev libusb1 libplist libimobiledevice-glue"
+
+inherit autotools pkgconfig gitpkgv systemd
+
+PKGV = "${GITPKGVTAG}"
+PV = "1.1.2+git${SRCPV}"
+
+SRCREV = "f50e52f3393a9149ac65fdda8f0d425109efc7fe"
+SRC_URI = "git://github.com/libimobiledevice/usbmuxd;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--without-preflight"
+
+FILES:${PN} += "${base_libdir}/udev/rules.d/"
+
+SYSTEMD_SERVICE:${PN} = "usbmuxd.service"
-- 
2.31.1


