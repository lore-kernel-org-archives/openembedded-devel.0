Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C042BC44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:59 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14763.1782634373209922968
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U61Mqzgp;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b9e755555so3465091eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634373; x=1783239173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgRU5uwqY1qtLgRpvlLZkpXSxbAiDHjmEBrmynKuUBQ=;
        b=U61Mqzgp1/3g1PSboJT192LIsMkupzhwwsFVvVZUrTR/me8ZRURIfCrPqwZXd0JWTw
         IAK3LYFyij69iPTrNjwY4No/5zdvSYZMCBDXvUYpvFFs4WGHYzhRZ2GYqUKzyoLjUIbh
         KklAHWjgNz/oGOXE2TUxL/lyXBsfaWSiWJts1a35Uzz1I5V7EHVGAIcqozS8GDNt/iGm
         918Cg2Jrtu8CqC/VxZX8p4PyI3ugmHGgynesnTrxDfLgb/Z0XQrm8c45FECUo33H2k0O
         fxT3vi/laTpvmsHxWBNexAToO46I1uORcNa0ASCyfognNDVVPDNZek/GAh/A+O/lFNBp
         7JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634373; x=1783239173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vgRU5uwqY1qtLgRpvlLZkpXSxbAiDHjmEBrmynKuUBQ=;
        b=PJuzHBRlPUS376Rosxn4dcz5+8NujEc51kE8BaA3SrLmd86xrSfrXYwYldRZqRFNba
         hyTBQGk8ndMYOfjiSVcNGK6G3mmKQY3C/1FGqw7tdspakkHrGoUFmA+UAvtEPxe7Wjxi
         u1rsDsAf8/lQCptfoN4IoaIqzM3PF+abn+wOkj36CwzWJwCIgQo+W+t+/VnMfENkCoa+
         BxLRLlD+8BIIoMp3jqik367Pl/s1PJodym5CGf+qrbuzPAuAVKq4ig/B0THOXVadekeK
         p33QSjh7SIqhxIPsXoOP9PUg9q+FTR95ZyG0mnbbrV0TacBneEeNXiMA+qzTVY64yxJ/
         Ve3A==
X-Gm-Message-State: AOJu0YxyIK9ERiR2WNAFkzmsTJX1RFbbcngx7NPxgd3l1+j/DcbLKwXT
	RYa01cQx7x3YtgSjyqAO5dO5pmqQm9HICRbpFHwHDtSVWivgfUJFfAM4B9CHB6mFof4jqQ==
X-Gm-Gg: AfdE7cmZjpNhf/+h/d9XiXWssD4Zo8YqO+pFXmo4ORzHJf7b0ytQ/tX70im2bqh5x4Y
	3jIUdPqNxTp6JHQhpVzWBdOuPEhfAJK48B4T8pCZ0c3FOUKhSLX4p281rJXPjCAmFMBYjuxxgUu
	sm+L6iFaHIxAycSayiiOQkb7QEzeJEPr2mh6/4OLspYUIwoMgBUktU76hKiDFmlj62QJK0Iz5sc
	mrp0HEIE3TlWTEmNrZxz7YkR60u0ypcIUu02cQiIQOwocyQtKeRRMvMktT4hnG27g4ZlAQQC+bQ
	eLHmlknoJnKzTF+awMlgvdKDIyA7XquLLYfaiFM4++8msCZHTAVlK6p4QdRDGm8BLxUCpwzdiM/
	9kWLg99OFKm3uEcFDG9g0z+lywWIAztNEohAe9kV1taFJDzbNjPpgcALU9RBtit9GAcU6a4iRDb
	S1Yxoa3ChF5w5e/5/LIiASER+pd8UvInKkl/hDpVioSFtOSiDl99hsLxPhKGEVctz7lUFzT61Z0
	4uJroNVUkk56PaDrO05fFgDlVR4F/BGpyj5pNkV11432M2hhn2on8jIJsge/xd1OgkGtaLXKnlb
	LjA+2fySrj4NoGAR40TMv5JDawbFwg==
X-Received: by 2002:a05:7300:5346:b0:30c:f84c:b299 with SMTP id 5a478bee46e88-30cf84cbe65mr4682159eec.24.1782634372570;
        Sun, 28 Jun 2026 01:12:52 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 095/128] libextutils-installpaths-perl: upgrade 0.012 -> 0.015
Date: Sun, 28 Jun 2026 01:10:46 -0700
Message-ID: <20260628081122.178348-95-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127905

License-Update: bundled GPL/Artistic license text reflowed; FSF postal address replaced with a URL (Perl licensing unchanged)

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...s-perl_0.012.bb => libextutils-installpaths-perl_0.015.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-installpaths-perl_0.012.bb => libextutils-installpaths-perl_0.015.bb} (82%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.015.bb
similarity index 82%
rename from meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.015.bb
index 13d5a31d0b..b6c3a7a73a 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.015.bb
@@ -6,10 +6,10 @@ SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/ExtUtils::InstallPaths"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b6fa54d873ce6bcf4809ea88bdf97769"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4109085ee02c4453f25d919938e72e96"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
-SRC_URI[sha256sum] = "84735e3037bab1fdffa3c2508567ad412a785c91599db3c12593a50a1dd434ed"
+SRC_URI[sha256sum] = "7d64eb2dfa87ead010cdf55c8a1bdfde50b7b5852d7cb8cf2304f55bea2eb007"
 
 S = "${UNPACKDIR}/ExtUtils-InstallPaths-${PV}"
 

