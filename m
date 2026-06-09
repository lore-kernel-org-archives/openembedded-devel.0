Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11160CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:25:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75497.1780997145675420037
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nOk9yo5x;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c35980c6so10944625ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780997145; x=1781601945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uvyfpl4yTZ6kX8YrhNL3zznQuqSnD324PUNXAHSVVUo=;
        b=nOk9yo5xErmePVwIm2s3BMuBXQZBPfLAxlgN9nMGw90/SIcEXxq61rG24YLpV7LV6F
         ny8fwZwoBCNISW+QKbVuENyahlUq4w0RAIXjfxin4RscoSeREZF5Z5PKGc2zW/PPrjVg
         lXSnwRME2arnZRUu7jYryXRO7ZB/I6f1c9x78MayRb8d8XIs60pYK864OLyyfBnYBbkX
         jMg8QgmaEOHmAFfUOnH3gvBUH0ZDmvf1wf/ThKqfvkS8PKQaNvLlBFAlR7NqX41VpmVu
         E/M7PmjoQipktK4DmyKNMKQzkMsbggrYkWnqiHh7KEzP8nmSo57aN15gK+1YUAlVZ+yj
         CXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997145; x=1781601945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uvyfpl4yTZ6kX8YrhNL3zznQuqSnD324PUNXAHSVVUo=;
        b=Nfk/yT0Kwec6wx1SdIOWnb5bum54p8EWpxyylPWKFbJ2NeRwO2DOPv64lHGj753dgC
         NujH7cF6GgbrqAIlqjukXsBou7CiWGbEA2n+NZaRzlBv5I3B3UrJ34Pjh46oNjOZYDLE
         v+zxIp3L3z3pNN8Ve6/VavWaSBWIiSj5rGtgxjlJOW0LWgs/IVS5oUWdccDIy/cnNMS1
         NG8oAGURh5IMkgYDiXr9PSYMlXiWXdxCMNwG0xXrohHNWkWb0vpTfAw+LbOnu5k7LALX
         Msxp8Qy9UwQvSvhJ5ZTXBAP2KHpKAHYzaUlXSDy2hLGEg4w4WQdMcVTMcYOpqqEgTY1x
         KTMA==
X-Gm-Message-State: AOJu0Yz52eJg3yanFyKPkV5279kURwE00xjn47PAD4HIXwbyqgSK/KTn
	5yzqe/79UPoyBGKWwcEY6RzWMWjPdzNHp/dD05IRChCATpn6/UI4zyCjMWAWvOTrrUcFFA==
X-Gm-Gg: Acq92OFejbj5VVv7m8rJcR6RC+j3JsZkva0lKb1t3ZLj1okatk53Eo/8PGWoK5RFho1
	JbfhP5pNfmdWpFicnR2ui0BDBGQsktvMWUQXMNpldyeq9n89x7GqXiwrZHKrpcWHIIGN4N4rM0C
	c4taP/Pd5CJccFALkzOYnzFO/z1OjZIRGUFy2Hn2gsvvNvR5ID77YsVqx5P61cETg/EJPXAmmpM
	0tSTsFW2xlL/5oAErF0MEOYt46qwUNLtRqh4xD4i2YBA+vBNS0Xda1+nW/JMDgOmSBnoVZy7ysP
	G2BNNSPp2phqDlj7sQFZtAlqpW02SiSjVHcWSE9vF58eZJSWbwIfz8MJBI2D+4hFq3HDwffgxlB
	dQ8Trcgk3I2t09BnTHzo9Y1eB34IYZ+d7pjEizNW4TlBkOGh68HQ554kntv3mSV6OXpWtnxJTul
	71nmVgbRDHIwpbO53yYOjQ6yr82DSSovwp3j7Xv11gv8i2ArG8BDChFYhoWnEkLEpnZ2FtVMvK
X-Received: by 2002:a05:6a21:9d84:b0:3b4:7b2a:6a0b with SMTP id adf61e73a8af0-3b53ba967f1mr1413540637.7.1780997145033;
        Tue, 09 Jun 2026 02:25:45 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm16496633a12.8.2026.06.09.02.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:25:44 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH V2 6/6] strongswan: Fix CVE-2026-35333
Date: Tue,  9 Jun 2026 14:54:07 +0530
Message-Id: <20260609092407.893299-6-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
References: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 09:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127451

Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/e067d24293953cff56011a1ea6989872bdd98fcd]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...-undersized-attributes-in-enumerator.patch | 41 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/libradius-Reject-undersized-attributes-in-enumerator.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/libradius-Reject-undersized-attributes-in-enumerator.patch b/meta-networking/recipes-support/strongswan/strongswan/libradius-Reject-undersized-attributes-in-enumerator.patch
new file mode 100644
index 0000000000..27cdb485e7
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/libradius-Reject-undersized-attributes-in-enumerator.patch
@@ -0,0 +1,41 @@
+From: =?utf-8?q?Lukas_Johannes_M=C3=B6ller?= <research@johannes-moeller.dev>
+Date: Thu, 12 Mar 2026 10:24:45 +0000
+Subject: libradius: Reject undersized attributes in enumerator
+MIME-Version: 1.0
+Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 8bit
+
+attribute_enumerate() accepts RADIUS attributes whose length byte is
+smaller than sizeof(rattr_t) (2).  For length == 0, the iterator never
+advances and traps callers — including verify() — in a non-advancing
+loop.  For length == 1, misaligned packed-struct reads occur.
+
+Add a separate check for this->next->length < sizeof(rattr_t) after
+the existing truncation guard.  This mirrors radius_message_parse(),
+which already distinguishes invalid length from truncation.
+
+Signed-off-by: Lukas Johannes Möller <research@johannes-moeller.dev>
+
+Fixes: 4a6b84a93461 ("reintegrated eap-radius branch into trunk")
+Fixes: CVE-2026-35333
+
+CVE: CVE-2026-35333
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/e067d24293953cff56011a1ea6989872bdd98fcd]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/src/libradius/radius_message.c b/src/libradius/radius_message.c
+index 8e2db0c..2bbbb48 100644
+--- a/src/libradius/radius_message.c
++++ b/src/libradius/radius_message.c
+@@ -261,6 +261,11 @@ METHOD(enumerator_t, attribute_enumerate, bool,
+ 		DBG1(DBG_IKE, "RADIUS message truncated");
+ 		return FALSE;
+ 	}
++	if (this->next->length < sizeof(rattr_t))
++	{
++                DBG1(DBG_IKE, "RADIUS attribute has invalid length");
++                return FALSE;
++       }
+ 	*type = this->next->type;
+ 	data->ptr = this->next->value;
+ 	data->len = this->next->length - sizeof(rattr_t);
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index f65a94dd73..661727e501 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes.patch \
            file://constraints-Case-insensitive-matching-and-reject-exc.patch \
            file://tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch \
+           file://libradius-Reject-undersized-attributes-in-enumerator.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.34.1


