Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B945C433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:46:10 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.395.1636825569198418310
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mrdslg7x;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id y7so11122558plp.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9r//mi1klmXqGpeRjLyhG0VMsyYdpIBFj0tnc/h35/c=;
        b=Mrdslg7x0Cw85TVPhjldekExNYRn+zP6bwN+/q8Hgs7Z1krMU2blaEW1iXNpzAqXxd
         AVEP+O2jIQf8H9afMpwWkfCfa9NkSAHBd8C8oDf0wSRCN+tShSqumeL9rJROGajEjRhb
         BVF/GGYJL8lnI/Z5kOFp2DT4lq8JrPlTGKRgyyb5TTgMT+SvJuxoaOWabTKTNVqlj9w6
         XBT9L49nnm07cvmYNM3CdeWQIgvE8wr+YpWzmWZUbigBIkxCrXpA/kjWNWZDYW8e+pUH
         fk8haNvm3VuF+EPHWFQpc9VZ7pA+lsEEtLcGuRgYXt+x+GqiFtsCYiDuD2XcuYpfh7UG
         VAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9r//mi1klmXqGpeRjLyhG0VMsyYdpIBFj0tnc/h35/c=;
        b=Z9LEtqSpfBLN4I67Ng76k3enSD3+3yemHYaaqKzfAzccdG7pAUHsAI4k1/Wbmr80PP
         IWguzyQ+0kW+TPXUUvGDmy1Yt9ynLZHNvc4/zf8gOVnEdhQv2PoRi8iZQj+b+2Yg5/ae
         flZiZYVDlONyqHF8e5MtU/4O5owBYppPgxc7P/XxG5OuZGTNOcV3DLMN7O05+ap6YbyB
         W8/XwlNCpqQJ2G4Bs3nwdvNqOLT1qXcq2nepRE+2Ee/y9gog6i1McLllp5xh8X4vQwgD
         bOsVXpdqnwR42pE1vvUW+ZEcn3MJaiMmWKKfE2qXA9VhBsfIQ/8+vk0aKd2zP+DND86Y
         Apsw==
X-Gm-Message-State: AOAM533B19zEpXO+ktCNUdpEuFMZuIdZjqWS/m5gFOFZmvBuuRBSmckq
	Gk8nbgWQuwWoOPTFxVFMYojtLecvzFg=
X-Google-Smtp-Source: 
 ABdhPJwLMcfMcEtxtw/bMBUSNnuCRo8B6ob69rW2z0Z74bPBIONZvhVcJu+Zuyi/6HqjovupGiUYwg==
X-Received: by 2002:a17:902:6b46:b0:142:8470:862e with SMTP id
 g6-20020a1709026b4600b001428470862emr18916455plt.49.1636825568285;
        Sat, 13 Nov 2021 09:46:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 d13sm10649107pfu.196.2021.11.13.09.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 09:46:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/9] tracker: introspection is not valid meson
 option
Date: Sat, 13 Nov 2021 09:45:58 -0800
Message-Id: <20211113174606.2044137-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Nov 2021 17:46:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93930

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb
index b16a5a2ea8..28193d8d27 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.1.1.bb
@@ -25,7 +25,7 @@ SRC_URI[archive.sha256sum] = "4376e2e98454066f44f7a242e45b99b3bfe4c03b67fab19abb
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
+GIR_MESON_OPTION = ""
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.33.1


