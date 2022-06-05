Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969DFC43334
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 09:46:56 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.19091.1654422412261703611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jun 2022 02:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KXD6OFxh;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id x5so10109140edi.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jun 2022 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dcx8FR2LzwTawSpPxKfOKzlI/B5kCX6UpicBN4l1bcg=;
        b=KXD6OFxhNOfzs6bzkrpXt8CRH9enQBN/VoFOImUN5WekHoUXi8B8sAwxiMCl/iavi3
         e21+/074gH2a+4MqeDoX9AHbsiNVXa/y9Cr3+KiTQRZ+80bFtqlBMGzFhYGQXqBJOOIL
         +A36H0aoa0D+tJPkbGXt5jJ+x8FryTKA40Cy3so0Dr7R+OUbrwUzeqH//FsgWesmAQpR
         Lfn2G9PScISJDepdLH6508CIhumG57rbP2foh3r39MEB1uS8T52/iE6juRutPo1rYYW2
         wUPGxq4in6AB8XdhPRQq6yrMziPfbXLJdv4OwRtoVmQ9g9tTWGA1X5twYu3b9xpTPP5T
         GB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dcx8FR2LzwTawSpPxKfOKzlI/B5kCX6UpicBN4l1bcg=;
        b=t4qnXm+Jg14KGILTRDJGqg5hHLMnXQiAQpUwVEhXx1N+U2FAbReOGJ33bPEFjpotYM
         n306ZP8fZkZIGhivT+ou55fpoVE6Mmy1T9EBDWVpML5G3m8Dft7ZzlDzqWB1Jf9zJXhx
         EeRAPkI5mQT6qWD9lAuFbj7OVUOHWnVtkXjURXuuYJs227+86V3GuYc1rwg4Ec51R3jO
         ioYFcHYmZwNqDe3U3Mmrp95GtvzA30QhaTCI1IKQ1zZuy1AhpMNwMmLeViHcE2xc+6ep
         /G3xW6T0GZBx7G6eyNHNRPxk8/SKF8XWtFlnb8DDW2RUd3ivtzD7pTl53yztqO3rHdQY
         J45A==
X-Gm-Message-State: AOAM530W4lKimwT2mvwd2D/mFmtc9s2gsOi8/sCtWwhoJZ82/pvvg46n
	R0FYghW6yYcLvqfDfZjv+SFY9t5QqKU=
X-Google-Smtp-Source: 
 ABdhPJwvl/ZjbUGyqQkSL68+PM+Zfs5HPwJR4YCm5rd4j3z12raBHnf9352kagebHzxQDUubBOVxQw==
X-Received: by 2002:a05:6402:160b:b0:431:35df:63c0 with SMTP id
 f11-20020a056402160b00b0043135df63c0mr5506384edv.124.1654422410120;
        Sun, 05 Jun 2022 02:46:50 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:230:9439:c99c:5ab4:c8e9:1c0a])
        by smtp.gmail.com with ESMTPSA id
 h4-20020a17090791c400b007109b15c109sm1813708ejz.66.2022.06.05.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 02:46:49 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-multimedia] [PATCH V2 0/1] bluealsa: uprev to 4.0.0
Date: Sun,  5 Jun 2022 11:46:44 +0200
Message-Id: <20220605094645.190874-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jun 2022 09:46:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97414

From: Ming Liu <liu.ming50@gmail.com>

Changes in V2:

1 Drop a deprecated bluealsa.service

Ming Liu (1):
  bluealsa: uprev to 4.0.0

 .../bluealsa/bluealsa/bluealsa.service        | 11 ---
 .../bluealsa/bluealsa_git.bb                  | 71 +++++++++++++------
 2 files changed, 49 insertions(+), 33 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/bluealsa/bluealsa/bluealsa.service

-- 
2.25.1


