Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DF7ECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:11:32 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.32483.1661479892468079939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l2lL4er5;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id g189so189698pgc.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=e6nMM7MrYQVcV617Imy/OqRQPNEHb2Niy1ZODr69h/E=;
        b=l2lL4er5SM4Ws+yXUzggWlrCh0lBjHayv9MVPLTzeCIrHQPOqcVI5AB1FZBtNcAyO1
         aS339pq6TO98fiKgyV6avBWOgcsesCC4v2xnLKEJmj388M1DEIPeiZQRsujkTIEmGgXh
         HRRGjP/BKTdcHiuQJOktcH9Jh9P9AiwVEnK2QbncJqMl9j4n8c72BAp3XaCNOvbI8Hcl
         rWYzPgKQX4uRj0O/AhbDuqyEXp2Wa2nXsXazZi6QbOCqy5LMOBdREz1IOjkcBdBTYOvy
         dbqteSqU8H4in61YZh+Ch9mzROAX9nI2Rhsb9L8XnYGMqEt4encHptJ/1ONSNBgEMAvk
         JDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=e6nMM7MrYQVcV617Imy/OqRQPNEHb2Niy1ZODr69h/E=;
        b=X5mbjYvuH6CqT8GSghWMYy7mLkGpyG8nODY82oxpmIzaY1B59eDIaZYrgrPpNVIbpe
         9dt0VJYtXFnrLVu+T2v1WHUalLIiwjARG/su26ncyu4XRCnwCpNMoq4VOHih1HjAEexO
         cXSM7y83G7hRKzhnpfd4lwPsjArc/hboj6gO4qPex5Iy4PNsM789w4JEh81jH59D6v4Y
         51T1OzjPooAmvvBaSDSIlV0l9xBTmMZWuO9dNO9ZUJFJBJ+EhAdHa9V7e4GJnGfFSvCl
         sT4cJubYUoPFnSeRQQUWYqUydwuNoP8JSbqEdLlS7k0cLde6Ujh4qMr7FcSc3pKyOG7/
         LMEg==
X-Gm-Message-State: ACgBeo1D3Rs5bWVNoxeyrlQiskzo0UA1lxG/lefarEbGFaS5pE6Qk9Pz
	IArRMp5Qwk0o8JmW6fA59FVJaQzegizu6g==
X-Google-Smtp-Source: 
 AA6agR7R1VCD7gBp0Q/yao2luSXmX1PzO8opYrZl7eKFpIHrgA2Zd5HjJGV59lk46i2REtWM692MuA==
X-Received: by 2002:a63:5fc2:0:b0:429:fe35:1bd6 with SMTP id
 t185-20020a635fc2000000b00429fe351bd6mr1498683pgb.315.1661479891408;
        Thu, 25 Aug 2022 19:11:31 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 z75-20020a63334e000000b0041a67913d5bsm250180pgz.71.2022.08.25.19.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:11:30 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 5/7] libusbmuxd: add libusbmuxd_git.bb
Date: Fri, 26 Aug 2022 01:32:25 +0000
Message-Id: <20220826013227.181910-6-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220826013227.181910-1-potin.lai.pt@gmail.com>
References: <20220826013227.181910-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:11:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98446

Add libusbmuxd_git.bb to point to latest commit on github

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../libimobiledevice/libusbmuxd_git.bb          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb

diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
new file mode 100644
index 000000000..91a9b4af2
--- /dev/null
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "This daemon is in charge of multiplexing connections over USB to an iPhone or iPod touch."
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
+
+DEPENDS = "udev libusb1 libplist libimobiledevice-glue"
+
+inherit autotools pkgconfig gitpkgv
+
+PKGV = "${GITPKGVTAG}"
+PV = "2.0.2+git${SRCPV}"
+
+SRCREV = "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
+SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+
+FILES:${PN} += "${base_libdir}/udev/rules.d/"
-- 
2.31.1


