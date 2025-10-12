Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F9ECCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 19:04:23 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.24598.1760295861483506432
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Oct 2025 12:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F/fe0Aav;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d60504788so31942027b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760295860; x=1760900660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8S7EVpuMMxg+QxGzMIBmMRtYT5o4FPZsNe6NAbAVAM=;
        b=F/fe0AavXZuappWqQZ5YW0WgQvJPN6f9SCKo6q/bOfh/solveyG0k5BawTKc7rWwX3
         fKmwCW2VJ4g3QqMgLaPz62SgXbJeGfUND2+bqwejv2a1LLxC2m/di/Hsk3+GB3DqQyAn
         U0RWM84vVa2S0kRa9DONO34LhJqoqnPlVRMIkff/U+oaVZJFgDV/XzS/PZcRPNSOYlqW
         Cgz1QCfjH5AgesWPxEr8+TPLSVFkfNhqabkEB60NmQdP/OU+TwpC+7soEklZ3OzR42rB
         FZ9BrbUCNRs6LN/LlJfE09Ad6cQR9h3lXOGF8QXujbeHA2MRIa2R1HLO7ZYOaHn6K4OX
         JZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760295860; x=1760900660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8S7EVpuMMxg+QxGzMIBmMRtYT5o4FPZsNe6NAbAVAM=;
        b=Qv0Gml9eL9LtZV3fFUAL9k/0ieMG2HLThAtBTwHp28H3PoxR7eWkL89e9q0L3B97wC
         ZJ8wnrej+riWCp51xY2EiZ5I4RbORwkHYcYu3qce0+nayGLe83GvOp2Rt4No6Uj5P6D0
         QN3cLb6xmm/4xK7UQz6B7I2ANViEuJ83epaQ6J02fyOtvPZyMfAcBTdGPPKvV171+dVF
         u4WAzUPr1lDqy/OH421t0BO00/kc+gv6fzWDBApVkmLKoWvREDWaOC1O3fT8sasTADLo
         5ZfLsW85ktBRjLzrV+JcHbAknqRTPjsq9+oJ35Z9fHgVO7EP6awPoKhAQJacCJ14ucli
         LVnQ==
X-Gm-Message-State: AOJu0YzDUh5aaR60T0QrSuVOChnVd5yWok5MmdYMV3o3Pcx12lgWtqyH
	ICkOGkCSf4HUoOCBuDcaTGpgOMnoWyvOXTeiXNB1MvNmHaHUIBI6OkaZz69fNT5s
X-Gm-Gg: ASbGnctUYwAEnnNZIOcMdUL0Ba2zY4AfLOOow/IiEk+BZ010ZWcQezEa/pO/58a8Xs6
	22U9AhY1voVp2q0Mfdn3HRx+3Bzww+xPD/bH/myqI30BUWGD3eb/9mKgJ6Y2qNb10dxV67QtdNV
	ntPzRJq+zveZP/wTkwsEUvJzImriYzmmOOSI3wersR9PHwLnW0WfHfrQxhSrXpyfG/PTg+W20OS
	rlieyV43w++pUufYRDXwLYltxZlPMhVxp1bw3ATjXQqRbhLdCr3FdEzTSqOrf55inJmaFXanoCf
	oLuc8ncjL71CVnhlN1NslCozzp//kKk4tehxafQvkizeisyc8xfY7T9GwuQxDnAJhfJyNsxfzqu
	EzzRzBdmvLVtzJtvoPWGqjjvICwmLyX2DL59+ollipJHYLfzbhAXN+2Q5oqQWh0x+pWLdQnLakl
	Q=
X-Google-Smtp-Source: AGHT+IHs7AjL983PJPzyPcSdAdUF6BbdQeYKeYLbk+WQEkQ7whhQeep8rFP87kdPlmwVqC+P+VN2vA==
X-Received: by 2002:a05:690c:dcb:b0:734:c88d:4b30 with SMTP id 00721157ae682-780e170b0cbmr337264727b3.49.1760295860017;
        Sun, 12 Oct 2025 12:04:20 -0700 (PDT)
Received: from localhost.localdomain (71-208-12-94.ftmy.qwest.net. [71.208.12.94])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63cd95e462fsm3395937d50.25.2025.10.12.12.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:04:19 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libhtml-tree-perl: upgrade 5.04 -> 5.05
Date: Sun, 12 Oct 2025 15:04:10 -0400
Message-ID: <20251012190410.102003-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 19:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120522

License-Update: change offset because README file got longer.  Checksum is unchanged.

5.05      2017-04-26
    [FIXES]
    * Revert Dist::Zilla Removal
      - https://github.com/jfearn/HTML-Tree/issues/7
      - Vendor note: It should be simpler to compare 5.03 and 5.05
        than to compare 5.04 and 5.05, or 5.03 and 5.05.
      - Fixes RT#12230: Undeclared dep on Test::Fatal
        - https://rt.cpan.org/Ticket/Display.html?id=121230
    * Proper fix for '.' in @INC
      - https://rt.cpan.org/Ticket/Display.html?id=120521

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...ibhtml-tree-perl_5.04.bb => libhtml-tree-perl_5.05.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-tree-perl_5.04.bb => libhtml-tree-perl_5.05.bb} (78%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.04.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.05.bb
similarity index 78%
rename from meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.04.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.05.bb
index 59bab0c748..332eabb153 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.04.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.05.bb
@@ -6,15 +6,15 @@ libwww-perl distribution, but are now unbundled in order to facilitate \
 a separate development track."
 SECTION = "libs"
 
-HOMEPAGE = "https://metacpan.org/release/JFEARN/HTML-Tree-5.04/source/README"
+HOMEPAGE = "https://metacpan.org/release/KENTNL/HTML-Tree-5.05/source/README"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://README;beginline=74;endline=91;md5=260d31d31370658947ae050eef27aca9"
+LIC_FILES_CHKSUM = "file://README;beginline=88;endline=105;md5=260d31d31370658947ae050eef27aca9"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/J/JF/JFEARN/HTML-Tree-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/K/KE/KENTNL/HTML-Tree-${PV}.tar.gz \
            file://bin-htmltree-fix-shebang.patch \
 "
-SRC_URI[sha256sum] = "1959ea2f7a9f1491903238d3a2cbef3a8e9aaaa75963f7114dbf54dca791b7be"
+SRC_URI[sha256sum] = "9c0461e9058d4d1bf1dca353bb1266cf99c99c8adabd9d3ca97d2bc4a5e8bd0f"
 
 S = "${UNPACKDIR}/HTML-Tree-${PV}"
 
-- 
2.43.0


