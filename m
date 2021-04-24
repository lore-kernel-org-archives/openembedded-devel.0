Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web09.1563.1619229033217256944
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 18:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mJK3+Ugk;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso45016905otb.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 18:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=w9F8ttwuUaKYT+/9ClK8rskheZw4Cz0aoQKXVKoyS7U=;
        b=mJK3+Ugkdx3a0HAhSuCvAkmH88r9BsXwoKob10jVgxTOR8D5Ovow4210cV3pMQ/RlV
         mFewvvir7st41JXztdifBPC4MeYwcUz6EimHjzCt0eLb3nrng6QiapaWcBI3IAXn31W+
         WtVdUcQi5nOCdAnlL6G8NcV/QO8M3zjLc8RQn23lwViWzGj+9vr2LdH8ToLfEAa7JCiq
         mV3XUC0HBOv4J801BXbimww/+nVF3RaO5JKMgEiDGa4d5j+rTwAMVEFcSDL997HRB7oT
         Qsi7RdsN9U2wzGz4R1Bo0I2gfxKSEKKsaekBzjB2aSkuPYSjACoSEbRRBmfDhNQgNXkJ
         HraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=w9F8ttwuUaKYT+/9ClK8rskheZw4Cz0aoQKXVKoyS7U=;
        b=CfpCsaBPaBc2d/eX5nNgFnPysu3ae6oXJ8DkQs6JP2apHRM4TgJvddFPN37BC/e/qj
         nipr354inHDqq+MB1SN4B8govyAwlDnoXunzS+4opnrYk1hUOsZDGOzfBe+yh109XDwx
         JUPkuF4APs2z8BOMuL8kloH/QxtHUi2RGN0B9rHaUdtvVqFFIr2+vdWPdSQ5pUPhFrUk
         AAMO0ZS9khv6mHSsKqPL3t6c1811C15rvsA2viBPtirzPlmrtw51P2XYeujqpNKa8MoU
         l82JkV5o4ow28itFj/HquGhZd8yWoFRyOT3je5oEAaBCdV1JSJJ7YAOYLYzD4+ISBi4t
         /40A==
X-Gm-Message-State: AOAM5319MJsreNTmeu4ODqrSJ32hYGfjvUqALpFkrXgZSZSK/Oli0npR
	c9abn+bkZtwfVCldPmERAH+XLrOwoaq2pw==
X-Google-Smtp-Source: ABdhPJxjtXjSiXh/TCHA2aPeUYTQ6E8w1EpVRrxnsgMb0DI+3KpI/MIMjmiQKKWUamv4Qt3KU8spEQ==
X-Received: by 2002:a9d:6a83:: with SMTP id l3mr5391908otq.85.1619229032333;
        Fri, 23 Apr 2021 18:50:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id s19sm1748075otq.6.2021.04.23.18.50.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 18:50:31 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 0/6] Dunfell patch review April 23rd
Date: Fri, 23 Apr 2021 18:50:22 -0700
Message-Id: <cover.1619228936.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please have comments back by Sunday.

The following changes since commit 430ef96fe65f62d8da995f446d5b9b093544f031:

  wireguard: fix build issue with updated 5.4 kernel (2021-04-07 08:55:15 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Martin Jansa (3):
  uml-utilities: fix installed-vs-shipped with usrmerge
  telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
  libyui: switch to libyui-old repo which still has this SRCREV

Mingli Yu (2):
  hostapd: fix CVE-2019-5061
  hostapd: fix CVE-2021-0326 and CVE-2021-27803

Stefan Ghinea (1):
  hostapd: fix CVE-2021-30004

 .../hostapd/hostapd/CVE-2019-5061.patch       | 854 ++++++++++++++++++
 .../hostapd/hostapd/CVE-2021-0326.patch       |  43 +
 .../hostapd/hostapd/CVE-2021-27803.patch      |  54 ++
 .../hostapd/hostapd/CVE-2021-30004.patch      | 123 +++
 .../hostapd/hostapd_2.9.bb                    |   4 +
 .../telepathy/telepathy-glib_0.24.1.bb        |   4 +-
 .../uml-utilities/uml-utilities_20040406.bb   |   5 +-
 .../recipes-graphics/libyui/libyui_3.6.0.bb   |   2 +-
 8 files changed, 1084 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-5061.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch

-- 
2.17.1

