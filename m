Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FF0C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 01:42:13 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.12575.1701393605985095408
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 17:20:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LKprXCmB;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40b4a8db314so16135325e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 17:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701393604; x=1701998404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/XE4YV0hV8gaAx37wnRs65Mzt6qU7MEImQINt+XRvI=;
        b=LKprXCmBCAHIJ4fP/d0jxfkrNHBzzFXp2N7WORCt4YTeUoRa0zeiYIGnabOqcxbZat
         Hj09+W84NZlhLbG84SzVOcaBmSOxagVNRV506i4KJrJyByncyab6sNduuXtXMSfExlrC
         PJgoOfM/AITJVIC3dh+pjLZaKTJKUW1UVbFOMUw+Tn5Jg4lr1Gnt0WUiwVnYnlh1ONGM
         liKSzMxpAaRkZPq8j0jNjwPSbipdsS866KpVSLLPNmEOIl1hSnAr9Ai0JUaFaxuHLHyo
         AdtvimFuTYS/Cx7xmvaukIP/1k/V/90AHjMUnLLvccJKwqcQD6D1t8UObwFQQz3UG/74
         Kayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701393604; x=1701998404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/XE4YV0hV8gaAx37wnRs65Mzt6qU7MEImQINt+XRvI=;
        b=FIood1GMv9ZDZwESO6WXp4v7u0F1twuslqeF9C+a6Z0ePa8CFFDZ3yZxS+z51ZqxBD
         PB5yqKWsMhzNo6lAk+pegxVGH17AtvCzmLHvJVBNA1JoF3LgfssxZAckQcY0y4WTJLpH
         fVsoKLEsGn+Eylvcp2xKK2ywwMW+OjDJ3QC64ZCxrUxOjwNMIhKimLspft1zsQn9qMgr
         +ANONa1UE19/5KKc+c4iV0FSDU8jrkSVU+ISKeaW1yzD5FdHsP8y7lTZ5fdT85sCRVyT
         bwfTRD97qoouhjyWmeTwJpOviIUaTkS79CMMwNU2E9/m0kZoyIs9GZi8Al+iQGBjVwi7
         DOxw==
X-Gm-Message-State: AOJu0Yw3fTggjaWDay0TdynWkLbvmqt7Z41pE2dmkXi6kR5qy//fc/n3
	z8mRst+7ylFxag4YmrYns6TYs2dfLiw=
X-Google-Smtp-Source: AGHT+IEsKowzQLhU72t6se30EJvT7GgYl1vhXXc1MSd82yMVgcZppCSiWUgnUwqBz3KEUMhEpIh5YA==
X-Received: by 2002:a05:600c:45d0:b0:40a:4a7d:606b with SMTP id s16-20020a05600c45d000b0040a4a7d606bmr117027wmo.40.1701393603199;
        Thu, 30 Nov 2023 17:20:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:8440:d20f:725:81a3:348f:7a7a:fb9a])
        by smtp.gmail.com with ESMTPSA id z7-20020a1c4c07000000b0040b2ab2b352sm2753931wmf.1.2023.11.30.17.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 17:20:02 -0800 (PST)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-devel@lists.openembedded.org
Cc: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [PATCH] monocypher: add crypto library recipe
Date: Fri,  1 Dec 2023 02:19:58 +0100
Message-Id: <20231201011958.45912-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 01:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107183

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

Adds monocypher, an easy to use, easy to deploy, auditable crypto library written in portable C. It approaches the size of TweetNaCl and the speed of libsodium

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 .../monocypher/monocypher_4.0.2.bb            | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb

diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
new file mode 100644
index 000000000..899638161
--- /dev/null
+++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Monocypher is an easy-to-use crypto library"
+DESCRIPTION = "Monocypher is an easy to use, easy to deploy, \
+auditable crypto library written in portable C. It approaches the size of TweetNaCl and the speed of libsodium."
+HOMEPAGE = "https://monocypher.org/"
+SECTION = "libs"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6a251155d943c8531e01a139f3fc531a"
+
+SRC_URI = "git://github.com/LoupVaillant/Monocypher.git;protocol=https;branch=master"
+SRCREV = "0d85f98c9d9b0227e42cf795cb527dff372b40a4"
+
+S = "${WORKDIR}/git"
+
+CFLAGS+="-pedantic -Wall -Wextra -O3"
+EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'CFLAGS=${CFLAGS}'"
+
+do_compile() {
+    oe_runmake library
+}
+
+do_install() {
+    oe_runmake install-lib
+    oe_runmake install-pc
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


