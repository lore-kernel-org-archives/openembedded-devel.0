Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E06D13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 11:19:50 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.45211.1730095921837032185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 23:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cmObDYk9;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e5ef7527deso40000777b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 23:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730095921; x=1730700721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Trwxbe/zs9LzyVCeyo0RNVQihbXzmnXDvBR4b3I4viI=;
        b=cmObDYk9Yv28Ajcrkzsk6SuO+0Qn3/RB9VhD5e/kXTbbXUxklKJnksQld1xU67asHq
         4KiE00PwnXMSbf5YcdplgE4zHbjKzqEpGlv6356eNxWBDfdHQZkpc0bXhlNbZkF4f9c6
         HtS+TaxLUyCUuXejtQOy/oEmgqyMdsgEY2xi0zPSfNBXoX0suFvNyxrl5ELYfVceVDue
         j3Du6OtdIvsW5DTkZfyFYYMMqvKscxpviPyXjUdJ8fj7xG43JZ0vVgtiU2Hfs9MCOI2h
         OYlvrkoeWghCJH9CFFq0iBwO3ZtjT1r7s7FAqqXaXY+XBSGjE2TQDtsIxdLkit7B4bhg
         7Hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730095921; x=1730700721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Trwxbe/zs9LzyVCeyo0RNVQihbXzmnXDvBR4b3I4viI=;
        b=oop8XrVGhNbkFz9+gm5J5kl59/jI0pX04t6A72c/AC44IwmRdpHpFannwyRbDqTliE
         2rFXzBuUmm47xTGBs3TMbUP1nADobq/03n/yDwVWsMK9OGd1q9MTOmtv+XJNnb8tAw+9
         5eu13OqxoWKmz7AM1hN8qkL82MoI/1ewmvWeepecNNQhxP7HcLezZYFlxEAPHnH1x3UD
         M8WBoPrsPMqtmdgNg5grUO7zLf4G2ZXZwES0BlUFOlbzA9Pm8lDYKGIVrwMdYO6clo4b
         vDymiiToJ1YomdNic8Rb6yh5LOWB8SIRezj3j5GS/mmx7txT4xuF+ewogqfwPCH2yGy5
         dpPQ==
X-Gm-Message-State: AOJu0YyNh8eb/wLcsPM5NeoSGEPvu7QFOih0Ep9oPegbPf8ZvrlPmut2
	MunhX8JGxNCoEsD9xkGNW1P0u9/XCJS9gGf1kau+CbNlMKN3n0iCCTr0Wg==
X-Google-Smtp-Source: AGHT+IHPPHHAQs7+4Esgz1c5mHPlp2GQFahuWsJSPHIXUBdYwNS9f9k4RWB4bdFIiCUuM0kzTSSXHw==
X-Received: by 2002:a05:690c:6408:b0:6e5:aaf7:68d0 with SMTP id 00721157ae682-6e9d8939f33mr66642287b3.18.1730095920344;
        Sun, 27 Oct 2024 23:12:00 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c77305sm12868947b3.90.2024.10.27.23.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 23:12:00 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ticotimo@gmail.com,
	Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 1/2] libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]
Date: Mon, 28 Oct 2024 02:07:47 -0400
Message-ID: <20241028061153.2165048-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028061153.2165048-1-schonm@gmail.com>
References: <20241028061153.2165048-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113258

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index f07019660..b9099fc57 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -6,7 +6,7 @@ libwww-perl distribution, but are now unbundled in order to facilitate \
 a separate development track."
 SECTION = "libs"
 
-HOMEPAGE = "https://metacpan.org/release/CJM/HTML-Tree-5.03/source/README"
+HOMEPAGE = "http://www.cpan.org/authors/id/C/CJ/CJM/HTML-Tree-${PV}.readme"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3eb57a8958cae73cb65e7d0c26339242"
@@ -25,6 +25,13 @@ export PERL_USE_UNSAFE_INC = "1"
 DEPENDS += "libmodule-build-perl-native \
 "
 
+do_install:append() {
+  sed -i \
+    -e 's|${TMPDIR}||g' \
+    `find ${D}/usr/share/doc/perl/html/site/lib/HTML/ -type f` \
+    `find ${D}/usr/lib/perl5 -type f -name .packlist`
+}
+
 RPROVIDES:${PN} = " libhtml-element-perl \
     libhtml-tree-assubs-perl \
     libhtml-tree-perl \
-- 
2.43.0


