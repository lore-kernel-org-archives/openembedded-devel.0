Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AC7C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:03:58 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.261.1659107029941791689
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dh0FTNU9;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id bf13so4212892pgb.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0j/rHyPUKQC97xBKAAgMDMgoH8ouuolGWpdxq1DZRxw=;
        b=dh0FTNU9ClqGtqriWy4ybNWkTSb5FWkGAjW+arcKYeltLuzWZvuXY9JEqhudZQsMzB
         nLzFvjCUB2DFVSUJjiYZGmDa5+jvnZisyjFkotlp1EMKd7Eu9bSz3l8z+WMyJP0HZ2ql
         EpBX69Hd5mrZOqq+xHOeaix3VzearZb0W7nxrZ2qcbm6IfocVr3npXR5J45sWKeFGhWC
         wJ4QSAR/Qevzc030DX7F8EofayrBtKlZAOfhk/S7C+DVj6rXusqM2nvmrUP2DyL3IqY+
         asMLIqf7yGMUmDZoNEp7nAzph1SktCviRBrFbjJPRncG7McG4phGEThlCI6zDn9Q36bq
         G3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0j/rHyPUKQC97xBKAAgMDMgoH8ouuolGWpdxq1DZRxw=;
        b=DOABrkQc2PAcMh+tAoXbx3lF9G8yvsHkVYKdA7EOLTSrgsOzxf2g01WPlOS3ZiPnqw
         NPk/vfkWqR9QK84ISJcUmBz4KUiJbht7QPIyAJVgvNQ6DgSMc1iak713ug9/fZPdYvN6
         zQv2W01gxa6+x9TV3ZxKhbob3EobpRVA8UuVKJ4r0MszXvILofbYkOAxzJlo0tTesFeI
         40mFlOINLV5z2yCmRKVj2dvSdfDDlhFgcHUsp43PD6F/3pocppDfFZUxLfOgUG5jWyzW
         5ZPKNopytf7KYtlk+MoIKS8mq409ay3Vqnx0SZ7g2RU7qH6fWXxZUu1Z9xmtRVZD8wQ2
         VAdg==
X-Gm-Message-State: AJIora8cjphC7npmFa5kw1hm4AUh+h9rHSscu/8mtcqk0uNMxcWijT7P
	saHEmmyAp3GrsG6FErgL/Hrop9VOAZg=
X-Google-Smtp-Source: 
 AGRyM1vyIOhTARYXetHpo6M8r8MALy0NHUb21E/worxmFyLZ1nqgyMYC97mqaStik9dYfvfUBhoD5w==
X-Received: by 2002:a05:6a00:893:b0:528:646f:528a with SMTP id
 q19-20020a056a00089300b00528646f528amr3849406pfj.21.1659107028974;
        Fri, 29 Jul 2022 08:03:48 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 x10-20020aa79aca000000b0051be16492basm2957080pfp.195.2022.07.29.08.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:03:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 5/5] tracker: upgrade 3.3.1 -> 3.3.2
Date: Fri, 29 Jul 2022 08:01:40 -0700
Message-Id: <20220729150140.104164-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729150140.104164-1-akuster808@gmail.com>
References: <20220729150140.104164-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 15:03:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98045

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
  * Avoid redundant queries in TrackerNotifiers proxied through
    an D-Bus connection
  * Do not attempt to rebuild non-existing FTS tables on parser
    updates
  * Convert values to the right type when propagating insertions
    over superproperties
  * Fix test to handle SQLite >= 3.39.0
  * Fix handling of nrl:modified after opening existing databases
  * Linking fixes to CLI executables

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a7f5d549e6152292e73e0039f4b7b0a2936a395c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tracker/{tracker_3.3.1.bb => tracker_3.3.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.3.1.bb => tracker_3.3.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb
index 42f44863ba..eaa0e065d1 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.3.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "5ad6f5bc97781ebf55ecd6947cd4ae7ff4192516580d10bd8380f1dd47196ed2"
+SRC_URI[archive.sha256sum] = "0ed2b98918956d6f16429c607dd8a14c84f4da0a48970fd2eb8c93aba3cf9913"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


