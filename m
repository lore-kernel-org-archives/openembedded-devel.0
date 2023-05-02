Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F32C7EE25
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:20:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.121808.1683008404390707606
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VPpt7lFs;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-63b60365f53so3987076b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008403; x=1685600403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2dgjN1hN5yBCpgWWVlM0lpd+zuBZrYRWDmXU7JRgUg=;
        b=VPpt7lFsOI5dDVbFkFEgtQpx7nVDylmPVBP5eZAWHCXVFfyNCl/zgTOHXLg0v/4V26
         wMqmPukYRJBtY11Uxo2eirpONGqWB9h8aha9AoqYjwZky7IItIBskowH4w+skKCUe1dZ
         IX43fVTz3RFUwwZ001PoLfIVjiZnVLiEC71JiPDlNZfoxUaMGbmx2/VfakU0YGbJWAgn
         gIbSqm1u2txdLvATY4EwS150XFRnun10qRKA9XkMjVs2lJlRIeVxqGi9UIpFhzuFZInh
         21iDEUp5LzFiVybYAJTEDSw5LyI79Dvcm6DudGY0PCzdO6A+J78PKn03JfEMsAhRJh/V
         RWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008403; x=1685600403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2dgjN1hN5yBCpgWWVlM0lpd+zuBZrYRWDmXU7JRgUg=;
        b=AFyvyIls3/Byg5G9SORfmVNIxVZynXp38hJbUCQ4OHCwTPHVRxkpxY8CfrfugzhpYl
         m3HssfUH9AbvKgwfcJptzxHC6xYYL5osE3pJhZYWE6CwXrsuo5TiKiNt9VAvQmLSDlth
         NqW9oxxXTe+Maql29ijqaLxPabWEL20803DIqt7IGZllwHR5/b3KdFB4ld/HfZiHqsvn
         xSP4oLK7eVFFEAaTJ8qYBD1DYUaTkQZekh8f86axR6zzqxCxGjJGOhWVHUjlIjUgleEl
         22/8bse5HGvt0cRwz7wU0XAMw8WdPv03rg4FkoXmD/LuZpLsCbcitiGtPB4DRns4uQlD
         Tr6A==
X-Gm-Message-State: AC+VfDyTy6UX3ypOrYImMkGDgK8uDjJRl/UfyKrG4SP6T8csbH/QQ4c3
	IftV/h+/NF+5AtQslwdFs0cjOznI0GPljg==
X-Google-Smtp-Source: ACHHUZ5LnWPJSoSjA1DjdoDVXl20MQlcvVGwz+l509NQvvsBNywrj49C4BADW/7A2re3s+mhwxoRhw==
X-Received: by 2002:a05:6a20:e188:b0:cc:5f27:d003 with SMTP id ks8-20020a056a20e18800b000cc5f27d003mr17383215pzb.56.1683008403313;
        Mon, 01 May 2023 23:20:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:20:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/11] nfacct: Update SRC_URI to point to valid URL
Date: Mon,  1 May 2023 23:19:54 -0700
Message-Id: <20230502061954.3782607-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502061954.3782607-1-raj.khem@gmail.com>
References: <20230502061954.3782607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102257

Update UPSTREAM_CHECK_URI accordingly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
index 20a84121ee..9b938beae3 100644
--- a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
+++ b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
@@ -3,12 +3,10 @@ HOMEPAGE = "http://netfilter.org/projects/nfacct/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-UPSTREAM_CHECK_URI = "ftp://ftp.netfilter.org/pub/nfacct/"
-
-SRC_URI = "ftp://ftp.netfilter.org/pub/${BPN}/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "94faafdaaed85ca9220c5692be8a408e"
+UPSTREAM_CHECK_URI = "https://www.netfilter.org/pub/nfacct"
+SRC_URI = "https://www.netfilter.org/pub/${BPN}/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "ecff2218754be318bce3c3a5d1775bab93bf4168b2c4aac465785de5655fbd69"
+
 DEPENDS = "libnfnetlink libmnl libnetfilter-acct"
 
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
-- 
2.40.1


