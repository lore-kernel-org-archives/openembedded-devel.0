Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C746C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:45:50 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.10652.1677159940731879965
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 05:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YdXjDIvi;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id f13so41716066edz.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 05:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6/febhLPdjxZGUZka+SGJbvEjfKuaiGiqPuneqNrYw=;
        b=YdXjDIvitO56TpiBadrHWfh8ycUu69a3UYcpI0hIQlQUf2rWv6VGMyvqmM9N9JXBls
         t5lOJEH+XvRrxAtBmOvkx6MOX5hNK/rwYt0lmOf9gIIFHL4ugIvM3Ur1dwUg9WfMPUnC
         Z4CxyF4PdrFzb36rS1CKBz5Adn0tFdLxlW2FD9z4ZQNsu+r63j8KGz5+yLm++kPO8pvN
         NJam+an2zHMffyFxHizGg2Ntb/7PYPQgTNgJfW/wwLUHiOJC3yt+UvnTUi9i/HOkyUUT
         Lpykx8N7GlbqQXdj/IeGiBZtjSZ+44Gpqca3VIBhZN9cVLCNDiRSaSC7kFg+g6d+SraR
         +fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6/febhLPdjxZGUZka+SGJbvEjfKuaiGiqPuneqNrYw=;
        b=27gUFpKtDuGKzH/VwtJY4C5ORROzzqSzt4Wc/ypm5W47PM3ZLORhheIaj/5XRYbCxd
         /jsYfdI/CaeIseagbFbH//bnqQEkUV5baGSsLlwZu1HA6tgTTvPEs3oQUQLpv3ZY3AvU
         FAT2z3JCBA45AheqEaA+Z6qF8FGYNOHkOEucnNbEcTF6jkc/dMXYNE94uPiGrsiVYzj9
         9dzYl5PYXYMKAF81vxC/uJup2d1HTbKMrrL1lZAMS7hR06Sf3DYP9eUsm0LlQZ2mMpHV
         ui2y685TuCAerojFtXK8bamkvOQewWos3jkqPs3zTcoJt2sQ6HknOmrnQpTSRigGPLIv
         B3eg==
X-Gm-Message-State: AO0yUKU3gR492gegAQc1RT6TTn3DmNM2Zpuzkq4TqBfVoHOUuIhCyPaQ
	y0TH/yreLPuQLtI+Mje9euyYgruhjm0=
X-Google-Smtp-Source: AK7set+vqE3nl8wdL7Gd/mvd+4oSDusBAeIqGC1F4hZghGYuRym8AMH57LOh+dZGzwn3Epjh9Ur4lA==
X-Received: by 2002:a17:906:3615:b0:8ae:f19f:609e with SMTP id q21-20020a170906361500b008aef19f609emr20143173ejb.66.1677159939196;
        Thu, 23 Feb 2023 05:45:39 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id kw24-20020a170907771800b008cd1f773754sm5750018ejc.5.2023.02.23.05.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:45:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] openhpi, uw-imag, python3-m2crypto: replace Unknown Upstream-Status with Pending
Date: Thu, 23 Feb 2023 14:45:30 +0100
Message-Id: <20230223134530.3981942-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134530.3981942-1-Martin.Jansa@gmail.com>
References: <20230223134530.3981942-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 13:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101229

---
 .../recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch       | 2 +-
 .../uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch              | 2 +-
 .../0001-setup.py-link-in-sysroot-not-in-host-directories.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch
index ca522bcc67..68f972fc51 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-3.6.1-ssl.patch
@@ -6,7 +6,7 @@ Taken from Fedora
 https://src.fedoraproject.org/rpms/openhpi/c/be77f5484b0206f8946a85b29424ea10bf863063
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Unknown
+Upstream-Status: Pending [Unknown]
 
 diff -up openhpi-3.6.1/ssl/Makefile.am.than openhpi-3.6.1/ssl/Makefile.am
 --- openhpi-3.6.1/ssl/Makefile.am.than	2017-02-21 12:21:12.114814698 -0500
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch
index d5610bbcd5..e9c80fa3af 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Support-OpenSSL-1.1.patch
@@ -8,7 +8,7 @@ When building with OpenSSL 1.1 and newer, use the new built-in
  structs having been made opaque.
 Bug-Debian: https://bugs.debian.org/828589
 
-Upstream-Status: Unknown
+Upstream-Status: Pending [Unknown]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
index 85423a3fec..0baadfcaa5 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] setup.py: link in sysroot, not in host directories
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
-Upstream-Status: Unknown
+Upstream-Status: Pending [Unknown]
 ---
  setup.py | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
-- 
2.39.2


