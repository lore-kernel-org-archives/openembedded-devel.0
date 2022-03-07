Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E18CC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 03:22:33 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.22770.1646623352213360661
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 19:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VtcOjr07;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id p17so12576460plo.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 19:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Q0huzA7XcOJdUenNS1c9E+9AIKU4jXZGrNzZ51QVOY=;
        b=VtcOjr07PcXMDHPej546mhR4PXYRxiU3FouNPrGP6klK/+EMlwp86PIa+f97+oaB9t
         EKkLWREPSrYWNchsho3QOythwErTR967e+vI7vd41FPcVQatx0+BPWVuXK9sCU+5x/n/
         H4FkcQX8UqcoyZ6XKIHRr7fgfJgHK2ZQ8GNoLjV8R6kh9RYELrase3q124MiK5lkGE/S
         ms1RQByLzKSLfj9Q7WUbStmD1erV95XkOVoFPTmPrSnGH5GYyeKm0ww1+SrorOEeltNg
         JuI9AaX9o9s5y0NRtwP+jSe9tOQzbb9ZN0iXIl1gbyACiPuL7XvLpM9gUPBEKxzhjkhg
         US8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Q0huzA7XcOJdUenNS1c9E+9AIKU4jXZGrNzZ51QVOY=;
        b=D8EezPnIIsNXiaXKCNzv5TPjlZG4XX1zNt2tWljv1Cveg12ILuSu4MM6Z/riNEHFje
         t4VDGiLAgJu1jtghUQzOL4+LJvuGD6KIy/OjC0pYYThNBU+ZkDe1b+BGBgbpOP/9rLO+
         FsAxspKrdYgYerUNr4AXUu5cK+vQeKCnHpHdd/KsLH5XYQ/rmXCJ+iNjpxatveKDlkQD
         ua4W2oQCik0Km+eFmcFgBzdOTW+9u87f8hM7yFhBZ8XlIRoZ2STi4CZmx0qQm3ou3XA0
         IcJM7P7Rwk9Gnyqc5J0YDYd8uGHig9fytk2dXbSCCrb1H2WU/MTnFVLZL26+8hYlKnEQ
         QO9Q==
X-Gm-Message-State: AOAM530AMH0GuHeoJ11pmNUUaa87zw/RDTdyhH6i1BtXDP7DYuX1geqO
	XBtWNS2wQaS37m2nopFf0en248w4RTd0WA==
X-Google-Smtp-Source: 
 ABdhPJxNSW9v5Du50az1bAdhBof0tqF0Z4/2q6mq+7jFmcHnOTz6cNKLdWlbhLZ/7LeDQxq1O6H3TQ==
X-Received: by 2002:a17:902:a713:b0:151:efb5:76f with SMTP id
 w19-20020a170902a71300b00151efb5076fmr1259663plq.117.1646623351424;
        Sun, 06 Mar 2022 19:22:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm13509606pfh.46.2022.03.06.19.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 19:22:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH v2 2/3] geary: Check for x11 in distro features
Date: Sun,  6 Mar 2022 19:22:27 -0800
Message-Id: <20220307032228.3555244-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307032228.3555244-1-raj.khem@gmail.com>
References: <20220307032228.3555244-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 03:22:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95829

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add to REQUIRED_DISTRO_FEATURES instead of assigning

 meta-gnome/recipes-connectivity/geary/geary_40.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
index 5821122759..9b671eeab4 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
@@ -30,7 +30,7 @@ DEPENDS = " \
 
 RDEPENDS:${PN} = "gnome-keyring"
 
-inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala
+inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala features_check
 
 SRC_URI = " \
 	git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
@@ -39,7 +39,8 @@ SRC_URI = " \
 S = "${WORKDIR}/git"
 SRCREV = "e561775c1580a9f60a726355b2b897bfc9cb3382"
 
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+# for gnome-online-accounts
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
 
 GIR_MESON_OPTION = ""
 EXTRA_OEMESON = "-Dprofile=release"
-- 
2.35.1


