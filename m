Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.10750.1593562073792697583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e7+j9qZX;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id b92so10230692pjc.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5OQtBAeBTXZPHxPVa4FR69lMJrIlUJGavFIqWjDDJZA=;
        b=e7+j9qZX0z+tlLgoT0p1vGRA5k638g/PAiZYcalnDFPa6Z1dC5g1EjBQ7PBtmLesBu
         OlBnKEHVmqEQePaQjDdTGoZvWuJ3taHbtL/dBC26SzrYVFcNoc/NRzr2SqpQXaXHoz0d
         gNd91Rlpz4QT4ga7iLrcVOV+hPkwGWtgvY///KzEjgqCy3YqwpNV5efpDvChCivqkWIC
         e6mv9Zc4PnP8C0NYYIzQYfDllQHfui82jJFBZdAfuHEoIy7ZZlv2pI3gd70VNpuEOg4S
         mygnjUZBfK0UWT4r5yDNgMVkQsTLU7gsZPCJvpEbHRMaX6VrUPTvGHwmqAAagCOeiPCB
         d6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5OQtBAeBTXZPHxPVa4FR69lMJrIlUJGavFIqWjDDJZA=;
        b=BxjovLmS9N4nstixovcRjDLQP4yBHJN1CHWvOPKGajjmuYPdA+dfBd4F5LCMK0Bk3T
         2qU9U6GGAZ0PrgQCgee740G8aPyMO3IYXv1+hM9crs30Gv3BGNq0syhjQHPGl0ithl0j
         X552Z2J7pG+3puoNCQU6RkHe79Y4UUKpLaX77jvRWkmYCarZFl/BS2HHTJhpxF1Nd/mv
         z3QBd/H7mXTb8XDQPZg15lFs3RhcF/vdAD2Vxg7KtUlb+CD/kE3MARktkB+33cEucYCe
         MCbUjtno6N+A5zfB1xksMy5gWW8R2r2ZSRFUf08TXc2CjRLonG6gWymaRo/AQmoF5L0b
         a8aQ==
X-Gm-Message-State: AOAM5312IukHqMI/GDPimUY6tbGmtrq7nm4kqOuuISrYW8SOw5KnGjDT
	ZUNaXE1248EtWibbvgXTd1gDQTiRfcs=
X-Google-Smtp-Source: ABdhPJw9+vyuJKaUmLPPhP0MfKW61BDr8X36cfdM7rFqhm0itRdWUfqh/kFva34OuoC5njEDz5hR0A==
X-Received: by 2002:a17:90b:3715:: with SMTP id mg21mr13228054pjb.113.1593562072813;
        Tue, 30 Jun 2020 17:07:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:51 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 27/32] libtalloc: fix upstream url
Date: Tue, 30 Jun 2020 17:07:12 -0700
Message-Id: <cdef98b923942bde03b687b1f689a19abe207af3.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

https://samba.org seems to be gone, switch to https://www.samba.org
Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9a85b925c51308f93475d7cc8e2ddda90dff30fd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
index 9f8ebcc410..59deb15b63 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
                     file://pytalloc.h;beginline=1;endline=18;md5=2c498cc6f2263672483237b20f46b43d"
 
 
-SRC_URI = "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
+SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://options-2.2.0.patch \
            file://0001-waf-add-support-of-cross_compile.patch \
 "
-- 
2.17.1

