Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42F2CAC5B5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.11301.1758716923704250098
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=glwoB0D+;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso9705250a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716922; x=1759321722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JmSQWON5JturgKr95Bfs6LLaiMC/oGv9dMzmH/wIi8=;
        b=glwoB0D+YsEj0fBXrb9jAYqpsmrpgxN2oS36O+SNhDkxTV41+6wIS9ZVckXkhS0v6R
         oUPU0FuueolZyD/TtmOk5aJvoyfou4I9//dUU1gLPhV6tzztUxkqBilJBYcPW+J5Ipcr
         cTOToMCmsLKto7iZ+PbZRUaZmvdVHm9YBpx9mE3j2bdq9or3jtGtSfR4QScpfE2MQ1mg
         eUomKOTAqXundE0tmPHS2DTtjEEIDv+RCnnu+KdpF7ILPhu4BF5t+fJ5TwRol8154m1X
         vIecRJOUvckypY9JFvp48OC5C/JAEGEk1jiAfhPwhznNBwmgeD/QE9fbO0+VEOdJHTFS
         269A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716922; x=1759321722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JmSQWON5JturgKr95Bfs6LLaiMC/oGv9dMzmH/wIi8=;
        b=anflpPD6eAiB9WNm+mefe8GeIAegZRWJ7eAdxf3jztM05V2gz9uQxrSQ2AC2XOaa01
         x6n01p10R+a7eAImyLGLryfzWzWN5RahEuKszzG8G7Acn9CtqC3yvtrQ4ODZujbiK25w
         hr3rDwjeBxCv6sC0U1+Xob785zPTv1Loi/7y2MDrr7KsPEIZkfdfGAuzSAbyVUA0oFab
         Gaca+CMPZK6GOgly9UPabTuB4aT/d8btvIbcO/UhA4tFRQ9xIyHjUmRDiswn9gbOhN/W
         cTrkiRoSoKXYW/nKxr0VGuU9sHwwypGfUSnEJo7zi9U3f6ceRF9t2npXitFR+253ybag
         GEVQ==
X-Gm-Message-State: AOJu0YzgXN1IUSMFbda3E5LY8s7NB7+hHNR5hHp2r5RC2dPAExq2f0pD
	VE2vGbNhlkjlNF/We0aWboC0KNMMAezPksWfn0KhhTHleh9IQgU/F4KtmshYBA==
X-Gm-Gg: ASbGncsLMswmhjRctN1Tqui8SknweQ1Ujcxc5dVgLNaqnrHC+9yJXHGB5FKN/vS5Rx2
	015lceY/2sjpQo4Xa9o4c+5ZDEC5gDR7otMbjf1IVVK4hztj7Jd25pTwfF/fKOSoKbQ/lA1aq8s
	99x9zAsvXAzxFVHCb0jyLg4BLg0njVOJ3VZqySJq2U1zZPcjJ9XzMfMu+oOLlU1uAKGJddxLdNX
	uGY6Odjgv+7/Y7f1ksgbnMkuUvBDWEZ3mT8veV3ff54C58wqtD1JrNNDVSbAPCBE8NQ8O9Ab5iZ
	yD9I9f4FAa6di09rghPujpnNApI1D93re0vk4vXZP47IqKHp3E7q45+wYuXfm0SJ0cwKf4LSBqA
	ur7NC+EHb7HCnX0U1i8jv
X-Google-Smtp-Source: AGHT+IE53Ymbq+aArYqbJiP9R1JODetClEJkToPQmZsV6CPhcMJ9xeWdgsa0qchH20lWnPfK7raiGQ==
X-Received: by 2002:a05:6402:520a:b0:633:8c43:eff8 with SMTP id 4fb4d7f45d1cf-63467a15e4cmr5271981a12.36.1758716921952;
        Wed, 24 Sep 2025 05:28:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 01/20] gedit: upgrade 42.0 -> 42.1
Date: Wed, 24 Sep 2025 14:28:19 +0200
Message-ID: <20250924122839.4184719-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119804

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e0462bfb13d571e8ee55b5cff2d0fca7aee98393)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/{gedit_42.0.bb => gedit_42.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_42.0.bb => gedit_42.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
index 5bb5525d53..e2bbf1889f 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc val
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "a87991f42961eb4f6abcdbaabb784760c23aeaeefae6363d3e21a61e9c458437"
+SRC_URI[archive.sha256sum] = "7f1fd43df5110d4c37de6541993f41f0fbc3efc790900e92053479ba069920e9"
 
 # gobject-introspection is mandatory and cannot be configured
 # x11 is needed for tepl and gtksourceview4

