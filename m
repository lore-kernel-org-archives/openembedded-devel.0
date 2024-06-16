Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE00C2BA15
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 15:34:28 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.36047.1718552057949707293
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 08:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aqJh22YC;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35f1e35156cso3195752f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 08:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1718552056; x=1719156856; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E+tTf6dapVtpM2C77v7SFQ5Q2i3+9dAnpZdBVtBB0Yk=;
        b=aqJh22YC+oh3UsbaAbPL9aHBJ3n5YkaPCrC9DoVq1s6rYoXMXfQDDBFUlcChp3HuEd
         oVfvtXkLDE46k+LWc8FGgTs/fMYuTzerjFbw5jHqtBuE1Jjy5hwcpOTC3h69mJcxFKgb
         OFYPqFTuUVwO8oDtv/hjgcmvv9h05O8i27QGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718552056; x=1719156856;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+tTf6dapVtpM2C77v7SFQ5Q2i3+9dAnpZdBVtBB0Yk=;
        b=NEzDOlFyrlSS5i1V6iuvO4lfDBAy3JAfQji3vAg06gRMgH6t5vj6p19QqNs+soUH+Z
         9gChJ2i35FzMGDZN072FCSRYr6t8J67kbRSs52h7KZ+JyQs2/b9DEdUt6tNhqpv6xuep
         JFOz9Jk5GhLlWR0arPl19qYRpe52R+9LfXeXhKOzoYxlR6fzyCHQiMpTmcfuyEnmwYHC
         ObrKMGaUSYrJ5Wsc6sSKeuXI9fxehLEGbt+1SnZl6M02bNkYe7OQTArR2qM+B4lIp2Tj
         yS8SGvlXkf90p5lRfVn/N4SQK5A2bzPNTjXp8qNCr/X4vfXCm9B9+6cZMWYvXyehaV82
         1uSQ==
X-Gm-Message-State: AOJu0YxveuAy6zve/kEFcy+1wDANqvPH6q7j/vp9BtGUP6YmdMaowMlV
	K89kk4W4GdznqRzM5l9uZnikf98tInHTeSysDQfAPXReE9gbVh43/lpQik31HfTFeA8fjrz09yZ
	ICgwL6JnCASOBnDZ1KrSNkqhSNJqzxuxd75YcT1IkZWHGpS5G
X-Google-Smtp-Source: AGHT+IE29pd5mKkQOSDStPp1sb87IeG3IFhjiZqFm929FY/9JTqhJ3g84+qXYA47YfPen+VeDsEQVzlujlGMKKEkEIQ=
X-Received: by 2002:a5d:4247:0:b0:35f:1753:7159 with SMTP id
 ffacd0b85a97d-3607a7b60admr4925147f8f.19.1718552055908; Sun, 16 Jun 2024
 08:34:15 -0700 (PDT)
Received: from 234945705956 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Jun 2024 15:34:15 +0000
From: Yoann Congal <yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Date: Sun, 16 Jun 2024 15:34:15 +0000
Message-ID: <CAMSfU+6nyrjcRKsD=K-okKXmFRGpGfouPVse1FvH7PQZfZcOpA@mail.gmail.com>
Subject: [meta-oe][scarthgap][PATCH] libfido2: remove non-functional native
 and nativesdk BBCLASSEXTEND
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>, Dan McGregor <dan.mcgregor@usask.ca>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 15:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110920

libfido2 depends on udev and libcbor which do not exist for native and
nativesdk targets.
Remove native & nativesdk from BBCLASSEXTEND to avoid hitting these in
world/universe builds.

Fixes these warnings (as seen on AB[0]):
  WARNING: Nothing PROVIDES 'nativesdk-udev' (but
virtual:nativesdk:[...]/libfido2_1.14.0.bb DEPENDS on or otherwise
requires it). Close matches:
  WARNING: Nothing PROVIDES 'nativesdk-libcbor' (but
virtual:nativesdk:[...]/libfido2_1.14.0.bb DEPENDS on or otherwise
requires it). Close matches:
  WARNING: Nothing PROVIDES 'libcbor-native' (but
virtual:native:[...]/libfido2_1.14.0.bb DEPENDS on or otherwise
requires it). Close matches:
  WARNING: Nothing PROVIDES 'udev-native' (but
virtual:native:[...]/libfido2_1.14.0.bb DEPENDS on or otherwise
requires it). Close matches:
  WARNING: Nothing RPROVIDES 'nativesdk-libfido2-dev' (but
virtual:nativesdk:[...]/libfido2_1.14.0.bb RDEPENDS on or otherwise
requires it)
  WARNING: Nothing RPROVIDES 'nativesdk-libfido2' (but
virtual:nativesdk:[...]/libfido2_1.14.0.bb RDEPENDS on or otherwise
requires it)

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/367/steps/12/logs/warnings

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1a3d194eb3552eb948ca61dffcb9dbe2710f516b)
---
 meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
b/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
index 08d3f4e84d..d453d0ab97 100644
--- a/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
+++ b/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
@@ -21,5 +21,3 @@ EXTRA_OECMAKE =
"-DUDEV_RULES_DIR=${nonarch_base_libdir}/udev/rules.d -DBUILD_EX
 PACKAGE_BEFORE_PN = "${PN}-tools"

 FILES:${PN}-tools = "${bindir}/fido2-*"
-
-BBCLASSEXTEND = "native nativesdk"

