Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.9175.1621347300892417458
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 07:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S1ZrjgYA;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id f22so6159438pgb.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K2N96tQcSDBGlXMjpBVgvWXIVvh3SPkGb1Si/SIeOzk=;
        b=S1ZrjgYAE7Yrz56r0nUZMJLp3Yc0fOKOTGXR6F7e2oe2XN2ptzKL7k3IJi0u/BswvH
         xtUvu55lry6kal+ZYGDv4/5qIJctF0UgbULJzxRJl5gNsCaD4P68+q3hqIN22V8TEiBB
         L1X4lfFwC7L2xmPT3+fE72/Qu0IElPscbgvacOf0ufecj8SR38OB3hR4FzKxgWGNyaCD
         ltVl659+iUtiQ2Wu6XSOcG5a9UUfAR7zvf4b/nfTIskUEN8/x5Blwcjl1qh8i0YThMP+
         8sZsALSW3DXurqSyKMNmHLaS0et04wa1p7cumBQaCCPNve/+3br7uMUIYtqqS/lQQkB7
         mu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K2N96tQcSDBGlXMjpBVgvWXIVvh3SPkGb1Si/SIeOzk=;
        b=gD9ABt4vzm5GeMPAnadp8WurvpAbRXhsRW1bHuTHc4flmYBkUEnxqXNdMn4l+0K1qa
         8N33XhdP9wFUEkeAlKM/ofDSSNTRUmyxIFRu0063JkGNmyrrP+xhJGvPmy9xrzZqJ1Ec
         MZZfnervHZJgGwUf1SK8OK0Cq59ZdILBY2GFGE4rVc3W+7I8IuSaZyYdSKYrT8LyK8px
         WcOI3xVHOPcJhHbLnEmfCdNO0aNRrFcAAWFZyx7f7MAPwWObgzAqPpaqaqFXfpUJssbB
         xmfEaMcG9QgpYMtb0YwDztDu07q34X9f+S71q07xcxmwBa9a4togoMzcbOvX+cM2RMbl
         hJlA==
X-Gm-Message-State: AOAM533Ajtpb0ZKPCQ0fWmnVxmz+0k/QvvjqU32sn0xf+GVK3v+wg3OP
	zfJOQ5GASf0TR8ZmFWdomEYiiSZi0yY=
X-Google-Smtp-Source: ABdhPJxRDt0HB2KNwglG1ITcvGVUEU/u9fg0om3KuCi7OsKg6ayDaLI3nuDxkINuEsPHxxzVpFRK3g==
X-Received: by 2002:a65:50c5:: with SMTP id s5mr5299375pgp.138.1621347300059;
        Tue, 18 May 2021 07:15:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7050:e80a:30c5:274])
        by smtp.gmail.com with ESMTPSA id f5sm2103563pjp.37.2021.05.18.07.14.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:14:59 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 0/6] Patch review May 16th
Date: Tue, 18 May 2021 07:14:51 -0700
Message-Id: <cover.1621347202.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please have comments back by Thursday

The following changes since commit 2915810edbb6599051e30efb3b7f805665ddcc23:

  ostree: switch from default master branch to main to fix do_fetch failure (2021-05-13 21:52:34 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Armin Kuster (2):
  nostromo: Blacklist and exclude from world builds
  packagegroup-meta-webserver: remove nostromo from pkg grp

Clément Péron (1):
  nodejs: 12.20.2 -> 12.21.0

Khem Raj (1):
  linuxptp: Fix cross build

Saloni Jain (1):
  fuse: Whitelisted CVE-2019-14860

Sean Nyekjaer (1):
  nodejs: 12.20.1 -> 12.20.2

 .../recipes-support/fuse/fuse_2.9.9.bb        |  5 ++++
 .../linuxptp/Use-cross-cpp-in-incdefs.patch   | 26 +++++++++++++++++
 .../no-incdefs-using-host-headers.patch       | 29 -------------------
 .../linuxptp/linuxptp_2.0.bb                  |  7 +++--
 .../{nodejs_12.20.1.bb => nodejs_12.21.0.bb}  |  2 +-
 .../packagegroup-meta-webserver.bb            |  2 +-
 .../recipes-httpd/nostromo/nostromo_1.9.7.bb  |  3 ++
 7 files changed, 40 insertions(+), 34 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb => nodejs_12.21.0.bb} (98%)

-- 
2.17.1

