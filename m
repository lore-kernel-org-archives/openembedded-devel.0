Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.8594.1612035478444932587
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+UQNWTK;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id w18so8797337pfu.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mbjYNcmMF5VwMmtbLi7QhVM+P7cUw/lPcq6omM+QhV8=;
        b=m+UQNWTK4pdvhE/OVJv1S/zV1SoJt8tf5h7pN9azqBr8DQJhCDGh4GUOp6VAQT/Fk3
         Pmbf2FXuO0Bi6X+6LK2/dn3cvGvG1F6P3xfb1QUtjJQEJuMp5jBB0Y/c136AafmnpiDQ
         CKvtXSdZ7fiVxUVzD/8lDaoh6Ks8j559wbdZ9CdLRG3UOtPSH2EGd4nX4O8oap0ru2au
         pIUsQYazdLuyCZK/kJygBXQPABCSCG3OF4RWG+Nn9hV7UiBJggN+WBMvAk67PwyIDYas
         3pQATPxicMPoOuaYu9wQ0TFriz0ch1uqfFqFv3IWVmlSEer7QQRmSFSHyVd8uqfgxLT7
         /lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mbjYNcmMF5VwMmtbLi7QhVM+P7cUw/lPcq6omM+QhV8=;
        b=B8/3ApRCXZKoAT3Y3kC00cQWnTdnNmmWLY3UYs68k7mTDsiuTGAQbyPHGjYleKK6HG
         otASoo8yucxoxXNsPIKpah+qOLgWWBRYlUas4aovHg9y+oOWuRZIxs9LBqNn72psLhgX
         F81POnjBoguEw78gIv1GtkQmchWdulW31GQvU76oYajjS08HT9E/N0pFE3YvlVkxSUSU
         /xvVmzmOJ9ZZCOHJms6XlMWjENzyj/MkHJ2Lo0N7y5iN/W/OYKSPyuwPAYOMFk49Sgsv
         g8kCOBPx4tHugFqOj5RFUrDqzcwCegB1nX31TtV2/VS9+5wx20y+wD3lNAK0YQ0nM2Yy
         qt1Q==
X-Gm-Message-State: AOAM5319goOZmtQb5pl37L57PL8kefZD2uFCObCWrfobRXJPqfwaoT2d
	2buQFln6cXvlOMDVio0117rS6XSf7f+h3Q==
X-Google-Smtp-Source: ABdhPJyXLOKrZDrIU71H88hZKnB64tZMWgxmbkAK6EVjdUXJQf2UQOb5avMkYqBvsp28tO6Dkr7gqA==
X-Received: by 2002:a63:3c3:: with SMTP id 186mr9997253pgd.107.1612035477853;
        Sat, 30 Jan 2021 11:37:57 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:57 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 12/13] networkd-dispatcher: use git fetcher
Date: Sat, 30 Jan 2021 11:37:37 -0800
Message-Id: <f9f3bacac75a7aaebfb5de89adfb4c9f640bb03f.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* now the gitlab QA check was backported to dunfell as well in:
  https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=72f2c45880afbba1745e5e0cbd841d7fd666f374
  and this started failing with:
  ERROR: networkd-dispatcher-2.0.1-r0 do_package_qa: QA Issue: networkd-dispatcher: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol [src-uri-bad]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../networkd-dispatcher/networkd-dispatcher_2.0.1.bb       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
index 6b73506c2a..61d656b7ca 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
@@ -12,9 +12,10 @@ inherit features_check systemd
 RDEPENDS_${PN} = "python3-pygobject python3-dbus"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/${PV}/networkd-dispatcher-${PV}.tar.bz2"
-SRC_URI[md5sum] = "304d7dcc21331ea295e207f8493cb8d8"
-SRC_URI[sha256sum] = "21f84c3646a043329dc64787e4e58dfce592b2559b0e3069af82c469805660c2"
+SRCREV = "333ef1ed1d7c7c17264fcf7629e5c2f78ab4112c"
+SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=https"
+
+S = "${WORKDIR}/git"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "networkd-dispatcher.service"
-- 
2.17.1

