Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D00ACA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 19:02:55 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.23933.1758222168148439749
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 12:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cIRwwbsU;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d5fb5e34cso13983867b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 12:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758222167; x=1758826967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8prpf/thLsjDj78ogB0QcIV0jWC8J2VfXVQnbu6NgU=;
        b=cIRwwbsUd1X2opsEmCvfomHWx+1LgoSgp9vlcMMpuRZ6ETQgzn3xBTwI9VCawTYOB6
         2tXLcSITVwVPEqD+WjyDAEpN+JeWP+x9eKtTkv+k0we6WxXAiO2CbKiwr2y2/Dq5/3HR
         cOBzvS8xTjr4TwZVBm+jtd6pUOiM3x8JI0hjgOvGYxi0qTG+jMesFI16q/YXcqqVxZ4Z
         5gwkBuMqo2+LABrXQPUJ1Fbd8SwuZSq7vRAjgS5Ydj3o/Q3Khl3n5sWzOGo0LZykU3x6
         pgQiKNZm0lYjJPRh4bpYSekBcRi0TrL2/Y+9qaWietTCqhSqj6/VkImmjGUlwdH5K1ka
         UcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758222167; x=1758826967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8prpf/thLsjDj78ogB0QcIV0jWC8J2VfXVQnbu6NgU=;
        b=UYSvqzV9EislNQSAvJ2ahT8lVrLDUiKLq8vpAaSgFPCpFwcexNYwGNNj0N/uVWTPBW
         qW5gdxQ4b1Xuar6doUU3SsVxpTuXYRxDjluyGoI3JbrXFoi8KA1vRn0kiAAfA0bRqVw3
         dP5BG6agNNeddFRrtDVDBvUcpYl8Dnk2iO15fh465KCgshGTfIJoYG/eo9IChCn3cpHi
         lnBb5Cxj1Fe8/yJpdQehIIdkWw81sp0eZuCrLqM2PmUC6w6PYh7NVxh99lPFvRXDkPMt
         oMahXfVTS1syjS8wyHfelduyG7oNW9kDcDMK6/XXLL6IIu+FJbekSN/4LQgbf4FbWS/6
         EWFQ==
X-Gm-Message-State: AOJu0YxI1b6A+SsYxSA2AngdL/TeVHuHOEY1Aqa2Im0XwcI/lt3y+fFd
	I9rrl/Am89TZYdb2fnF+kFtV2RO5StLboMJSLZZTKhORvcSJRNsVcQ9f+T/4VcUk
X-Gm-Gg: ASbGnctDvCg89IkysyZDtQ6OdT/9xZt9V7uogPqoL3Oslg7lALhTH4+wXJ++jcVEwS/
	BU2a7RquUh/z53Hr+FtK5sYFhe0AobbK2e0SPwacCat7Hj2P3rgvz2cbG6VdHL2uzzeOhW6Jr7K
	nRrrVlzOqtn/HZgVSIs5w/y/52KDSC/7iBlyBG1uuw5ztMLNW7T8+cCVCFy6KdCwz2kMPs/BoYH
	RtNv3A3R+UFrRc0NbAy/pymVDHM+7GzWm6zIGUKC++MS+o6IDWMO1q4/7+xgdtVh90b0ODBT7kG
	UGjGXurCClDa+TsCP44lgL8gVSg7cT7jpisJMZuKgIOCvAr+6x8mgoAniXdGGHCvNqjanORnObg
	BJQ00Ty4uV0U+xXrweGpZ18FJvAO3L8yYRklkAf0nX8cdRqA=
X-Google-Smtp-Source: AGHT+IGatHHhmYcckhdNukP9cqGrivp1DwJ11k6G/WwRi1J0/QU5jrxFkWAimplaw7YR/Y0n07muIw==
X-Received: by 2002:a05:690c:46c5:b0:731:817b:4d73 with SMTP id 00721157ae682-73ccdc8d228mr7608917b3.14.1758222166527;
        Thu, 18 Sep 2025 12:02:46 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7397186ef9fsm8684447b3.43.2025.09.18.12.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 12:02:45 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 2/2] libhtml-tree-perl: upgrade 5.03 -> 5.04
Date: Thu, 18 Sep 2025 15:00:53 -0400
Message-ID: <20250918190053.143066-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918190053.143066-1-schonm@gmail.com>
References: <20250918190053.143066-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 19:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119583

License-Update: Still distributed under the same terms as Perl itself.

refresh patch.

5.04     2017--04-17
   Release by Jeff Fearn
    [FIXES]
    * Remove Distzilla to fix RT #120521 #89820
    * Add POD to htmltree RT #116367
    * Speed up is_inside method RT #113415
      - From Todd Rinaldo https://github.com/madsen/HTML-Tree/pull/5
    * Fix extra spaces being added to comments RT #94311
      - From Tomaz Solc
    * Don't needlessly escape characters in element content RT #93431
      - From Tomaz Solc

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libhtml/files/bin-htmltree-fix-shebang.patch          | 6 +++---
 ...ibhtml-tree-perl_5.03.bb => libhtml-tree-perl_5.04.bb} | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-tree-perl_5.03.bb => libhtml-tree-perl_5.04.bb} (77%)

diff --git a/meta-perl/recipes-perl/libhtml/files/bin-htmltree-fix-shebang.patch b/meta-perl/recipes-perl/libhtml/files/bin-htmltree-fix-shebang.patch
index 4266f059d7..19b2c23d55 100644
--- a/meta-perl/recipes-perl/libhtml/files/bin-htmltree-fix-shebang.patch
+++ b/meta-perl/recipes-perl/libhtml/files/bin-htmltree-fix-shebang.patch
@@ -17,9 +17,9 @@ index 8bf3db2..f9927e5 100755
 @@ -1,4 +1,4 @@
 -#!/usr/bin/perl
 +#!/usr/bin/env perl
- # Time-stamp: "2000-10-02 14:48:15 MDT"
- #
- # Parse the given HTML file(s) and dump the parse tree
+ 
+ use warnings;
+ use strict;
 -- 
 1.9.1
 
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.04.bb
similarity index 77%
rename from meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.04.bb
index 77737f666d..59bab0c748 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.04.bb
@@ -6,15 +6,15 @@ libwww-perl distribution, but are now unbundled in order to facilitate \
 a separate development track."
 SECTION = "libs"
 
-HOMEPAGE = "https://metacpan.org/release/CJM/HTML-Tree-5.03/source/README"
+HOMEPAGE = "https://metacpan.org/release/JFEARN/HTML-Tree-5.04/source/README"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3eb57a8958cae73cb65e7d0c26339242"
+LIC_FILES_CHKSUM = "file://README;beginline=74;endline=91;md5=260d31d31370658947ae050eef27aca9"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/J/JF/JFEARN/HTML-Tree-${PV}.tar.gz \
            file://bin-htmltree-fix-shebang.patch \
 "
-SRC_URI[sha256sum] = "7d6d73fca622aa74855a8b088faa39454a0f91b7af83c9ec0387f01eefc2148f"
+SRC_URI[sha256sum] = "1959ea2f7a9f1491903238d3a2cbef3a8e9aaaa75963f7114dbf54dca791b7be"
 
 S = "${UNPACKDIR}/HTML-Tree-${PV}"
 
-- 
2.43.0


