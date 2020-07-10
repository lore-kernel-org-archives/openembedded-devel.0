Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.3888.1594353673195181829
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 21:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UtE6c/QQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id p3so1935891pgh.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 21:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=EfZkXJ+H3K32EHwX6IT87k7IyCaYSJJwG1qWyay0tl0=;
        b=UtE6c/QQRl99oII5N8vRlqcn02QvSJZWTyYHGQELFJIIj/PcMWDllIQT8+M1i4C4kk
         oX2kE2WOkeGYOZA5KaesH7STslP+qJXCkZqkCvJhmtn2xRbyaCICzCpK0FnDBGDIMvOT
         pMmvjIrFm6zSZbZ4sUfzJdGA0wbV/+kVcp6/VUh9gw1OxqM69ql3l9vin0mQjuaG/2m/
         i3Mn4Ixt4M0Hy8PjCgdyyFV20zJIggdm5SMm+n8WraAqFJb8vzEk/vVpID8QfsNgJtOt
         zaX5QAq9QcfsAr+TolUDHeQzLTZ7r4h5BNoT2amCtULSHYxWFZQjzLz1XwtoQKJTMYoD
         OiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=EfZkXJ+H3K32EHwX6IT87k7IyCaYSJJwG1qWyay0tl0=;
        b=QnFRgh//lDFIL0f74zNF2MQcPyZqhJZ35vuy+9NmaZRGeEJ+Lm2umbhh6pZXLD0KP1
         e57n5z9UbgynbNkkUZTCMn+YRSLx11R2rrcXwvRSJDd0xOUku3ofwBN2EOnju8lMoCII
         I2iGR7BEtKPvWrx2x7JcHC22W81AoPm1Hp5ao1542N3dHtxzZTXALrDmyJyBzS1lHWFr
         E1dgDTd8IwmYXAVh8G4fKP+bcQbfygkdKEvqvAjS6GiiwCFV/Jt5xyAYdr8swsVFeOO3
         w3dxQeXG9prTHrNevJpGPfEJJAy3VK7qKYOklrnVnx/pZAZw+fuDQXCkTsPspZ5Bpo8u
         Zn+A==
X-Gm-Message-State: AOAM533UHi3opHcqYeTt5zI1QNSAiTfXWd5ppMyMWBIV9dOB/aKtxPPI
	42jz7jeqQfdk1tyMPZPcJ/A9JfCkMYw=
X-Google-Smtp-Source: ABdhPJw5SzCersfxQgLt+c6sjETBS8XjEkSxWkWc/Gn9I/0Lf8/YxnZpsNLEctBpTGvxn3+F/+W68w==
X-Received: by 2002:a62:ab15:: with SMTP id p21mr61559675pff.146.1594353672178;
        Thu, 09 Jul 2020 21:01:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:396f:c9d9:1d67:d8dc])
        by smtp.gmail.com with ESMTPSA id b21sm4101405pfp.172.2020.07.09.21.01.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 21:01:11 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/4] fixed needed for python3-croniter rdep issue
Date: Thu,  9 Jul 2020 21:01:05 -0700
Message-Id: <20200710040109.22600-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

This fixes an rdeps on natsort required in the last update of python3-croniter.

Armin Kuster (4):
  python3-fastnumbers: Add new package
  python3-icu: add new package
  python3-natsort: add new package
  python3-croniter: Fix missing rdep

 .../python/python3-croniter_0.3.34.bb         |  2 +-
 .../python/python3-fastnumbers_3.0.0.bb       |  9 ++++++
 .../python/python3-icu/fix_host_include.patch | 30 +++++++++++++++++++
 .../python/python3-icu_2.5.bb                 | 13 ++++++++
 .../python/python3-natsort_7.0.1.bb           | 11 +++++++
 5 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-icu_2.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb

-- 
2.17.1

