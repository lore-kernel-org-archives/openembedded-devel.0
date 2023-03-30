Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6663C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:43:11 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.25631.1680183789509050618
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SF1E2Nww;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id b20so76695195edd.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 06:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680183788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uaYuOwk8z4FBd1owt8raRQgk0ZjVTY8obW9ZKSRFYuA=;
        b=SF1E2Nwwa0iwM9+Q1IH8qBtHg6nguvOmdP7LJi3SdOfFJX4JqFmgj8ZzilnbrO0bX2
         e7nKhR9n+hcMH/+/ledBXTyYhDXqgKlrdhtEOq6up0+h+U75LURuzwTArLnefB6br+rS
         B85skllIl1B3TlXHYFRVQjhpeVFlS2ZnW/NbB6ZofQnqlrhEQFbKVIOBYqL08mSmXY+a
         NPgm/rqVNB3wVYSUPWcJdOyvhBzu41TZHO737J/UrcYu5FAWdCLGgEL6Diat8w7v9psr
         GmJHR3derG9XqRFClnw/Y7LwJI9/9nzO15irQsCbVEo+iq0ylSfVHMcFzHQksicjiQ+8
         BT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680183788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uaYuOwk8z4FBd1owt8raRQgk0ZjVTY8obW9ZKSRFYuA=;
        b=Yyz8Mab5ZvGIiJ9D/URabaf+8EH2AIJZrNB/8L1ue3S5GQvZ6MhOF23BRHYzaXECBf
         VUYMCOh/dqrb9XxRe2nvdv9SnbtuzH11Paa/yuOs181nJ7yUbilS5kyygBbZV/CZKb2S
         x/CSwMSGqJWaxeAsgaGfOeiAFsADbHxEwAuzXbsCNHuzzVDLzfO6AKRLcbQclX+XMwx+
         RGFhVCSUm6BW9azdu6wSATHiqtVlfOt5dP0qJUYbmYORzRUck9aNZB9jo3UkNzc/Nmb9
         zr9hfZf1U6OMJYJ0oaLagFVZ6vDwmL5yxixDEwD8nfiv0LnSn6bA2Mr1I+g+okPAuOVZ
         VN3w==
X-Gm-Message-State: AAQBX9dkZVPNPZ7oceePKJ3tVrhseaGw0v+18F7Z+5GdaLA7pIhqDI/l
	2fD9h/vo6s8OVdIORlwb1hD8kuLghAQ=
X-Google-Smtp-Source: AKy350Y5EPMIwshAg8zZMJZXlRId4UbVdDYCHPQk0QCGodtMx1gGu9OhSF0JsYUk6uETYDe8uEE+Ow==
X-Received: by 2002:a17:906:a399:b0:930:9385:ce51 with SMTP id k25-20020a170906a39900b009309385ce51mr23591248ejz.68.1680183787430;
        Thu, 30 Mar 2023 06:43:07 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id h5-20020a50c385000000b004f9e6495f94sm18388784edf.50.2023.03.30.06.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 06:43:07 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 1/3] libgusb: Allow building in native mode
Date: Thu, 30 Mar 2023 15:43:00 +0200
Message-Id: <20230330134302.2789448-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 13:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101835

Dependency of libfprint-native.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
index c208a2090..491b6a7a1 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
@@ -6,9 +6,13 @@ DEPENDS = "glib-2.0 libusb"
 
 inherit meson gobject-introspection gtk-doc gettext vala
 
-PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)}"
+PACKAGECONFIG:class-target ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)}"
 PACKAGECONFIG[vapi] = "-Dvapi=true,-Dvapi=false"
 
+EXTRA_OEMESON:append:class-native = " -Dtests=false -Dintrospection=false"
+
 SRC_URI = "git://github.com/hughsie/libgusb.git;branch=main;protocol=https"
 SRCREV = "332d5b987ffecb824426e88518e05547faf2b520"
 S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
-- 
2.39.2


