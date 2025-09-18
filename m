Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D027DCAC5AA
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:24:02 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.11438.1758194636938793830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b2uqtwO6;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so121989966b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194635; x=1758799435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hyZM6GZJGCfQBi8sq+sCoxT1B1Qm7xG/j99fjs4abc=;
        b=b2uqtwO6HZ2trmDePLuXvVhNFc5x1FIkgBBZMfmJHLJGfkoe3qvu28dD42WhQEWMzQ
         7L8GF6ZV0GyAuV7+C+WgdEPixusctovTtcIS3ggII0W2i0D/17zVk05d/ADpesHT2AFW
         7IGhBbKZjrDTeBDOhS1t7/wMHFKvMfFz+e9YWd6sERJ9Vvgu30n7/mYhpCic/xIkd884
         AfnnNit2fALA8uK6t7OsGl9f/HSsenR67TdnuMkppji/5ZbAg3aU/ojgDYbbYrlh5+aI
         T8VSBO+Xlt7Bvleqqlij0THShbqCrh2GlD1d26oZ4/lZT2ojL64Q0ynDfOeWbAcZhlvV
         /uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194635; x=1758799435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hyZM6GZJGCfQBi8sq+sCoxT1B1Qm7xG/j99fjs4abc=;
        b=ORIe2TozujuN/wp34UAEvu0UjXSYtfo27/nFtgJ2qs/5BI/vDiCby25XefdbE26zOg
         3Nww7U034ye2a2AIS1M3fD+i1XFrR/a7IZzapzUfHf88Mt6aEiJYSK+RIrzNwt09nVgK
         dXU3mmJmOcu9qrozw/158hhFTz4BlUgLNydRGmGCIb8Uqyz5FhKF2Mfw1tbPUHcpcrQY
         irrzwQpRJIhiWtIU/WJcbarkwIrlnelCH2oEbF33I0/ojvUDGEGjDkgJx+e9TLzAxH3f
         MQxnuXWlb9SmhfmbaWCkipDX2pDEFhT6DbU1pPrSotlUgDFIX7sQaVacIXI9MTOTFy0i
         +ucg==
X-Gm-Message-State: AOJu0YxspDlW+j5pu9srSEZpyyGSFNXrrt2EdEa5y31kcTukiEIqmgKW
	XvYOewPU90q7z6EOb6QBaT18sCRLPhmj+D614HbCzWMwT8eTQ7ciR16e8XCVHQ==
X-Gm-Gg: ASbGncvdIeUmEFz0yjXGe4gWDtIDmYudd+b6NbR7L760H6tF7C9Ivp9Ia5rkryvBUon
	o7NMbKoNMPmu0al9favkonHn6EDJrPiFagLGyczzdkG28Weuz74rzcbEfNdJv1mwIt3TnC2MUeh
	PMB2jeDODKpbVQNPcDzVSIgV6/JE0bbNg+eA5szUk3RSPqF3FnVdzvuXTL1t7d6kJH1Vdxe9Cvo
	rA26koDzEFS6RX+2gyLb5LvY9DoqKJdWdibwe+q3bB/NcfMXjyu++PKtfoR3F3EmUpb5ka3wiUn
	Uf0DROSmGTCpnu1+cvHMKoH9EMqU7SV1PBDvq7ciArpny852q7EWA/5xO05weCfda+j2DG4pHWv
	ZKI7H6JHmGAEhzjbMVWUwbEo4r+oE0wmVQwGBrZjiLagOO03SPw==
X-Google-Smtp-Source: AGHT+IFi2NxqnA63w4PAj+OJkKibsa32RjVkd9/zaCilTYhofuYU0eNkE0Su3CzHtiubAFcqTmMbsA==
X-Received: by 2002:a17:907:7f0d:b0:b04:ae68:afdf with SMTP id a640c23a62f3a-b1bb35bb75emr605286766b.28.1758194635184;
        Thu, 18 Sep 2025 04:23:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc75ac5e1sm180410366b.43.2025.09.18.04.23.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:23:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 10/10] bdwgc: Fix typo in EXTRA_OECONF and remove unneeded extra CFLAGS
Date: Thu, 18 Sep 2025 13:23:44 +0200
Message-ID: <20250918112347.1331393-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918112347.1331393-1-skandigraun@gmail.com>
References: <20250918112347.1331393-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119569

From: Ivan Maidanski <ivmai@mail.ru>

* fix typo in "--enable-cplusplus"
* "-D_GNU_SOURCE -DNO_GETCONTEXT -DSEARCH_FOR_DATA_START -DUSE_MMAP -DHAVE_DL_ITERATE_PHDR" not needed any more

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d7d0d550d0874a5002e63a23804811a766f7a07b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
index 7ee63b1332..f065246363 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
@@ -30,9 +30,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF += "--enable-cpluscplus"
-
-CFLAGS:append:libc-musl = " -D_GNU_SOURCE -DNO_GETCONTEXT -DSEARCH_FOR_DATA_START -DUSE_MMAP -DHAVE_DL_ITERATE_PHDR"
+EXTRA_OECONF += "--enable-cplusplus"
 
 FILES:${PN}-doc = "${datadir}"
 

