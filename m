Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B9EC77B61
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:26 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.87292.1682921121742560227
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gsp/uQk2;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-63b35789313so1477206b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921121; x=1685513121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQrGo6HjCug6PPnbGx2M5KIb9Nd5/q6yilR1EI4pNN0=;
        b=gsp/uQk2ald9YjkndPEwMr2AjH+UvVJpBHFxc3KwbKhfFd2cS5eQLZZpUxKzOE7GxO
         jZpjSHM2Pmst3U5RI6PYtEu5V374qmE2WJ3lW0vhyVmdqfAV9hUyCnUuAetX0ZKW3VCH
         tpeNvq6cCH0i851BBeHV/jDzX9KhJhHPaP7RefX1pMuB/zbVZHb9+QYRqYyJJU3vhXf3
         107mzvtqMylEw7QUxQz9o9yQo4oJQ9GhV8X4LXpOAOUYH6BrO/wWKS3PLL6ArpaJh8tQ
         FfGWIVhqJXzVUsbQ2qRLv3UWQj4SI9Sk3FSavAa0KGrClQSVwHiCEBwNxZjyoFR5vZjq
         E1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921121; x=1685513121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQrGo6HjCug6PPnbGx2M5KIb9Nd5/q6yilR1EI4pNN0=;
        b=d+DjmyFB70HHyjNJdfWS5ALqdWD2etBAqZe1K+wee7wmu05daUeQBGBC1dkEBvTj/i
         QxPj8klKaXjpgPWABXaKQo4c5wuCIivtAMUCn7L58vgrVsP5Q4X9Uma1Ll3ZR5MGdRY+
         0uZaNo01bSuvVIg1EVTDGGgc4+YbmXW/eL0Im0nEdQQgZ8JKT+m2zsuVsDxVWNnOpTdp
         ytFWdw+LTx85QRu+2V1SBdCzPss1yVrL8LlAXwBNgF2MKWGet8LPPMzSKqmlXjBkrJvd
         x+wSDqxNgua3ovL/Ld1VZq98RPELrn6lRfUEhSnbqM1GVU7YOm56xdnrinHbJXV1yNYb
         9Dhw==
X-Gm-Message-State: AC+VfDybro5HBkcqddVNPx9X9lHl3bdqOdm9T377hTYeY0N5zTYlkj/d
	+A0Z3/AU7wPptwhDIKgs/elB4wa6OQm10A==
X-Google-Smtp-Source: ACHHUZ4sYf3DXvThNrmh6vgMagFkkPyFKPYn8/Ju9uakg17ITmKYVKA26NLZAZ6PltirwX0gBc1sCw==
X-Received: by 2002:a05:6a21:1647:b0:dd:e6f5:a798 with SMTP id no7-20020a056a21164700b000dde6f5a798mr12521056pzb.6.1682921120525;
        Sun, 30 Apr 2023 23:05:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/13] unixODBC: Update SRC_URI to use updated location of tarball
Date: Sun, 30 Apr 2023 23:05:06 -0700
Message-Id: <20230501060518.3505068-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102230

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
index 39112587ed..3a9e390a2b 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7b37bf80a3df5a65b355433ae36d206"
 
 DEPENDS = "libtool readline"
 
-SRC_URI = "http://ftp.unixodbc.org/unixODBC-${PV}.tar.gz \
+SRC_URI = "https://www.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
 "
 SRC_URI[sha256sum] = "d9e55c8e7118347e3c66c87338856dad1516b490fb7c756c1562a2c267c73b5c"
-- 
2.40.1


