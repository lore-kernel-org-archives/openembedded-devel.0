Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6959EC433F5
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 12:28:56 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.9946.1634387335096854890
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=bqgwdZCb;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id y15so54046904lfk.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wp7y/thwwr2mr0x+ofewk4kH6Ddmedke+lp+NFzfxIw=;
        b=bqgwdZCbAhEl+zX/IzRW4sDx2i+WPqFFwSZAVX0tR+e8q5Qd85o4zy35+K5SHiUPz3
         UD99zaBeWsvpkHEWicAXDfWUeOACYfZ/afU2EvwCiv5gi6+4X9MoGLvWMOYCqlNr/v00
         G0TyVS7W/d2vwS4Zht79Vhsnga0kjhiciWtMlMdG/OSgjYLfaeh4XRjtncJjQH5jX/IV
         hjq4m4BVSMhCAhr9LntN9KlFltz+tD5Pc+XaOWIGf8rqSFYvL62CTJmT2jRtcuj5pQoS
         euolQTUHpSvU2OAgDjUN307ewGF2v9KrSUdC/1RZSsvjyjm4FRgdFiQORZKwqq23hiIW
         zVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wp7y/thwwr2mr0x+ofewk4kH6Ddmedke+lp+NFzfxIw=;
        b=Ec5TQnKEhxkYutBF3Ik3ZN+jceFCazkEBNpncGAtFLhC6cp4uaU+7rzMe0UccP6mod
         Tt+/UOz1J/+XRPQ4FVNePmglZj72HivmEX8kx3UC5Pw6TgTYbNYu4dLYZYLMBNVJJ0Jf
         yhkQe+G53PH2/rBJfqVV8h9Ug/bhPft3mP331vQlOAwfdwxGDq4idyfpdSWrGlZnTnoR
         1BZP8RnYSMGVrgKZQ3mdhg3tmK3MgGxRogZQfHBJsOzW52+/Fr1mTnhXThqL9XTb95Hr
         BKcqeVAsV25nztUe7FnfUwyujbw13ncdwxc+eK4DKFOdje7pmCj3svIJ1mcqzPbFiuXz
         0nEw==
X-Gm-Message-State: AOAM530YX8l9CRIUIWtWJZqEkHmua7fNu+/9BRB/mrlyxNsmeNH/Ghue
	xqt/fAIh8KIwyTbD0y0jRl1Cfzkp0CfmrjIs
X-Google-Smtp-Source: 
 ABdhPJyaN+A79Hzm5MbvBBSJKvDUFVYz4ltgU7xwtu9g11fBOnh2O2ApuZI17BbxJd1AMFx2Dunikg==
X-Received: by 2002:a05:6512:159d:: with SMTP id
 bp29mr16963765lfb.509.1634387333096;
        Sat, 16 Oct 2021 05:28:53 -0700 (PDT)
Received: from localhost.localdomain ([78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 l27sm834032lfk.53.2021.10.16.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 05:28:52 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nng: update to 1.4.0
Date: Sat, 16 Oct 2021 14:28:44 +0200
Message-Id: <20211016122844.3564915-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 12:28:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93395

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nanomsg/{nng_1.4.0.bb => nng_1.5.2.bb}                  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nng_1.4.0.bb => nng_1.5.2.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.4.0.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/nanomsg/nng_1.4.0.bb
rename to meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
index 49e201564..1ffd8918a 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.4.0.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
@@ -1,14 +1,12 @@
 SUMMARY = "nanomsg-next-generation -- light-weight brokerless messaging"
 DESCRIPTION = "NNG, like its predecessors nanomsg (and to some extent ZeroMQ), is a lightweight, broker-less library, offering a simple API to solve common recurring messaging problems, such as publish/subscribe, RPC-style request/reply, or service discovery."
 HOMEPAGE = "https://github.com/nanomsg/nng"
+SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SECTION = "libs/networking"
-
-SRCREV = "d020adda8f0348d094790618703b8341a26007a3"
-
 SRC_URI = "git://github.com/nanomsg/nng.git"
+SRCREV = "169221da8d53b2ca4fda76f894bee8505887a7c6"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


