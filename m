Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B00CCA479
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 02:03:45 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.79425.1656986616459016227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 19:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aiTiQTP+;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id ay10so11874353qtb.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 19:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xLHWIkuJbuLWPHScYrmZF8OikxJtfuytSlsBuq0wCow=;
        b=aiTiQTP+qKV8QToZZp+K9WuX3cYrojh5hgGRZbRJlDv1Q4WS1vL/ad9mzy2SiYxBpM
         5/gHrmFoViPvCoS1lbp6UNfwvuU1u4K50SAprpjqU8t9QSSlr7RjUpqHLlxCdO2kLYPi
         PomEseWxwEcJNtJBu/i122LUSfTPzOzrAvXtGZgtg67Ce7CuoYDpkNjdTKVOaS4BI7sR
         Meme/+gBXUiVZ2l4ZivsHTIajKwDYz2g82YQS0abnDDYkxUUk716zxlTvhbysWtOHBHi
         UmkqbfBuEBwjnve7H58Q9fNdABdxj/OehonPqgV0E9RdAT91GgGESVSjpxyInAqc6lQX
         9eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xLHWIkuJbuLWPHScYrmZF8OikxJtfuytSlsBuq0wCow=;
        b=rqACVwbMoIDG+aUTt4lLTFM72TpwyYG/oWlptHJGnK32AMW50wZiTEo2V1yYAi8ZxF
         26Y0cOdtDp3/1iyCnnYST+aUEQhaI6KI9Qev5NQoz7i4FCic2EIjdbceyhePM9JK9PWb
         KARwhc+HHiyoPdsEc6kLdwvXuzl0X9g5psbbNT9fWPJ80NrD8+JtEgjRMHqbukGOybbF
         ncVJxeEFNyVrrKvjJCpOD+cXxOvrCPkvXDWYVKmi99oFRasm+xHlx5KJs8YlO47YjyBq
         NET5NoFsPlhZOZ/GaaNmjZWG6BsLW89Bce+VueWf3av9XH78LY1dQGyU8EtpcVYocK7J
         TqQw==
X-Gm-Message-State: AJIora+6vQmTRRfxPdfb56G4lXhAXXuCwuSSThTxV2oQFrifdkCy4LOu
	YkOizHRYTzYWpVC9IS0a7eYJNQQ+auk=
X-Google-Smtp-Source: 
 AGRyM1smWlLPGrJCoPlDZXCwGX8Z9Yl6PiIh1BB9Dxfx9ltsDlPNwsFBSMRnWxgKHihPTZNXkifv0Q==
X-Received: by 2002:ad4:4d88:0:b0:470:46d2:5653 with SMTP id
 cv8-20020ad44d88000000b0047046d25653mr29756291qvb.115.1656986615101;
        Mon, 04 Jul 2022 19:03:35 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:14b1:7390:8d3d:13ec:9f3e:a504])
        by smtp.gmail.com with ESMTPSA id
 br14-20020a05620a460e00b006a6ce613c7csm21725220qkb.89.2022.07.04.19.03.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 19:03:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 2/5] exo: upgrade 4.16.3 -> 4.16.4
Date: Mon,  4 Jul 2022 22:03:26 -0400
Message-Id: 
 <6ff027e8d33414fe03fa41ae80c065a54c0cb1ad.1656986538.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656986538.git.akuster808@gmail.com>
References: <cover.1656986538.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 02:03:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97697

From: Yue Tao <yue.tao@windriver.com>

To fix CVE-2022-32278

Upstream fix is:

https://gitlab.xfce.org/xfce/exo/-/commit/c71c04ff5882b2866a0d8506fb460d4ef796de9f

Signed-off-by: Yue Tao <yue.tao@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-xfce/exo/{exo_4.16.3.bb => exo_4.16.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/exo/{exo_4.16.3.bb => exo_4.16.4.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb b/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
rename to meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
index 2b164442f8..b97d9943f4 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
     file://configure.patch \
 "
 
-SRC_URI[sha256sum] = "722dff3c3fe23f0a65405e63889cf247c99d092d3f9fb16dec78d062cfb8fae6"
+SRC_URI[sha256sum] = "82a50c67e78f1e5c420b7615515bcca759b86eeab99224ab8eca4306b89d2eca"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
-- 
2.25.1


