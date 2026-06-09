Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C16CD8CBF
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:17 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80823.1781014872262804630
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZPjUa2Jq;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-307d0405e07so1091916eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014872; x=1781619672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDpg4eXsBtOztctdX1ZssgHZEFhkUNEDCLqeT6AW2cM=;
        b=ZPjUa2JqJFyQlIEOhQgWSWvNhOudImS6f9JQNZdDuzUkKFBhS6Xu9pEQQ6QGOWJPAP
         NASUghvJ+bbIH+nrCNcffPbll/6BSYQzt/FDS3N0A1QC/GxuZHoK36eIg60Vs7mjZ7Xt
         cPBv/IJsGIYMMMBWPRzKyrk4VzDFZxow5SmHsqs/PELXIf7RMFl10Gw3VsRmu4CNrkOg
         mT4Mx5MrrCVMSa3JHjML+/3QYA3B3OXUItt+JrC534pJ6VPgYAMhOm/159Si/NOrMY3j
         XDq7atp2NUDzaQwlm07S2Jfq05qXLfrcHPD7sL8noJ96Z6PwjEXv5nHD6fIVoSs0GX08
         +qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014872; x=1781619672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RDpg4eXsBtOztctdX1ZssgHZEFhkUNEDCLqeT6AW2cM=;
        b=Spcd4ChTsQDOzNZC25AvotAmDXvICn9EDUW+aPvO/LNbHrSeHK/0ZZoH5ci0oTEB9B
         jUhcxUUWxqm3Z0Hh77sQsiwTzvWwGwzpIgQ7pm+AUxIfY8QTEuvnQI3rHzyujc22azFG
         8AXX0P0FpYlZOmyr5htoZkhEkZzjaZcxIQm6m1efihsiyMVWIIakdSKtoJsEkYI/kd17
         PFOzuA+9LoiXWFP+9hwoRn8rWPP8IpY3HQbWRzXLoXm77ILZ1f2mBgSHWNU8GQOkSIg0
         o2v4GchLvmwDfxo6Grg8mh0CigF7hRRmyjhyzVme4ojQC3Dl065h1vfCuCtOhgzbJIDX
         9V4g==
X-Gm-Message-State: AOJu0YzAEE96NEwuzhnsoU5NfZ+8sAoPnUMYsQUn7NJpAaUj289JJOyw
	DyPuLORdH7JXBnzvFZ9PP/fFF2xGIapesfWXCQmVgc4x1GnfUXpMyd7UKFTvDGDhBQ5zew==
X-Gm-Gg: Acq92OEns/up9nVef9SphuRvT6KfdmqxLxTJmxdN0rrpqfyZo+KsPZDjcfF3UNwRaqT
	kVXLNIN/YvGzf7QEUUmeYfTeCOpCmzSdzjLSUf52i/kNyMAQfouycoHMBzSnQ4lUcIH/A7yTCFm
	cvslPx6+7kh9373W0OLHLX1xOyB+CI7udc5j2yHvCT0JB+iLC5eT0MTNb2DdB8qzgcH0Vh8D5Qe
	6clgNaDqY7wTDuATnZ/JGulMZixIRYs6/ClaPnt/7X3kunolcket42Cw2/Mey9ayBH54oxVx9i/
	ZppEz5rZIBQBC6hSEmF07l4Sq1pvhSNqZ/jTEWC66sE3lf/Fy/QIYuBsR5m2Xw44nBtQtgkngE8
	EXnvO7cw1dyve0TOR5MZiz/BYZJMAfbQ4xxYqKppx1zpsjYfWIcWmNCD2168MjCSLfeLbneqzbA
	ZQmfnTMk3c7UwBnNWzxHGTwHORVIVmAiltPDScUjulvjfssqGrkILItyweDshRkVdKOyP8iyvTh
	MvUU66EeRQYvPzkJsMUX5qrs8cji2mR7xJZr99uXXciDyQqt0plWbP+KiGBC6OzD7cFNp1AC8HM
	0ReXVK5AYRgdL8Re9ug+8cEWAhvgC0mHrx8Xt4euqvwyQkADW0E=
X-Received: by 2002:a05:7300:cd91:b0:304:cc9c:35ae with SMTP id 5a478bee46e88-3077af324afmr11171105eec.4.1781014871352;
        Tue, 09 Jun 2026 07:21:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/11] font-adobe-utopia-100dpi: upgrade 1.0.4 -> 1.0.5
Date: Tue,  9 Jun 2026 07:20:57 -0700
Message-ID: <20260609142105.1439225-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
References: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127490

Upstream now ships the release as .tar.xz (no .tar.bz2), so set
SRC_URI_EXT accordingly. The COPYING license checksum is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...pia-100dpi_1.0.4.bb => font-adobe-utopia-100dpi_1.0.5.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-font/{font-adobe-utopia-100dpi_1.0.4.bb => font-adobe-utopia-100dpi_1.0.5.bb} (82%)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.5.bb
similarity index 82%
rename from meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
rename to meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.5.bb
index 7c43767d22..bf9089a982 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.5.bb
@@ -10,10 +10,11 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
 RDEPENDS:${PN}:class-native = "font-util-native"

-UPSTREAM_CHECK_REGEX = "font\-adobe\-utopia\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "font\-adobe\-utopia\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.xz"

 inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"

-SRC_URI[sha256sum] = "d16f5e3f227cc6dd07a160a71f443559682dbc35f1c056a5385085aaec4fada5"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "fb84ec297a906973548ca59b7c6daeaad21244bec5d3fb1e7c93df5ef43b024b"

