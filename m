Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D564C433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 15:41:25 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.6915.1645890084442864717
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UELJe7j4;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so7474296pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aVdVe0ZrIQMvkIipSoE7zf9Qm0a4JungDDpH9nl0qzM=;
        b=UELJe7j40adkKNrDS6Qp81ZspSNZFdo8vK43sdLh+jW/tZ/y1nzL7y28Cc9xzNxU0f
         qHkPFtcLrpJlpiV52jydUK7vZpkM4EP+NUIW/RFg3lbHH/TRVzi//iIYAlOIBT/jiGaj
         chbV/hzBcRrCIQOscKPTaKCF+SQMWmgs67SR33sH+WlXcf2tzv2lPJ6DzM0nR+d91FWp
         rmjvtEhk0YW4BmhSz8bZYZ1lkfL786/80gC/irgBoatolEF/yjI0k9JZ9SdbuyleEnJF
         iTxhnd1hIs1XT7iYJEgAGppEwtk9biohXyGvjpSdrTLFl/aWLvoWSoKJVGzXLceIOIiq
         jfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aVdVe0ZrIQMvkIipSoE7zf9Qm0a4JungDDpH9nl0qzM=;
        b=yWot/fLhDJW0QgmB2lThq5VOH0fBa+IV3i4g1qx9aInwRA+2J7kLWGczML7wwAdff1
         AO0sUf2srTbdEyduErg1tRinON9TyXSZoronGCxBtlcP6fT/C3CklkW4yYFCeHUg66L4
         vQaQWNnSe4nP+M6K0i7WWyL+pgN9VKwyKbwSfkvXybu6lAOdln0D40rA1i0UWlYmo07y
         rjfkt3ansBKIoytWw6ElmUCwFvpc7MKVI8De7CHi9mKso0dcXlTB3Czl2+FZctbrKAEg
         d4oBC6rXhPZYo6ecgWO1/M5v60WNBGseImI708HqjI1jlxTHkxWxotZ4UnJFXwWf+Zo3
         AGWg==
X-Gm-Message-State: AOAM53029xTTmjrG35Py6Hf98S6gRasnM+3gQPjOErS9S7d3MequfkcW
	I/y4c00cU7B30we6ODenS+w2ss/BXxA=
X-Google-Smtp-Source: 
 ABdhPJyDUsp7VhhtGQyjbc27saeBq4KvaQ+czGwrm1WvOJs/VXhtG1z2RGM4pyBdXtt6SKfTQWfdZg==
X-Received: by 2002:a17:903:2c7:b0:14f:fc47:5a2f with SMTP id
 s7-20020a17090302c700b0014ffc475a2fmr12454614plk.112.1645890083656;
        Sat, 26 Feb 2022 07:41:23 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:5954:439:c7aa:7238])
        by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004e136d54a15sm7676075pfv.105.2022.02.26.07.41.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 07:41:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 0/5] Patch review Feb 26th
Date: Sat, 26 Feb 2022 07:41:14 -0800
Message-Id: <cover.1645890015.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 15:41:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95544

Please have comments back by Monday

The following changes since commit ec978232732edbdd875ac367b5a9c04b881f2e19:

  nodejs: Fix for CVE-2021-44532 (2022-02-06 11:01:44 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Christian Eggers (1):
  graphviz: native: create /usr/lib/graphviz/config6 in populate_sysroot

Kristian Klausen (1):
  cryptsetup: Add runtime dependency on lvm2-udevrules for udev

Ranjitsinh Rathod (2):
  strongswan: Add fix of CVE-2021-45079
  nss: Add fix for CVE-2022-22747

Sana Kazi (1):
  protobuf: Fix CVE-2021-22570

 .../strongswan/files/CVE-2021-45079.patch     | 156 ++++++++++++++++++
 .../strongswan/strongswan_5.8.4.bb            |   1 +
 .../cryptsetup/cryptsetup_2.3.2.bb            |   2 +-
 .../protobuf/protobuf/CVE-2021-22570.patch    |  64 +++++++
 .../protobuf/protobuf_3.11.4.bb               |   1 +
 .../graphviz/graphviz_2.40.1.bb               |  11 ++
 .../nss/nss/CVE-2022-22747.patch              |  63 +++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |   1 +
 8 files changed, 298 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2021-45079.patch
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2022-22747.patch

-- 
2.25.1


