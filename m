Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC11C982CC
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 22:21:02 +0000 (UTC)
Received: from mail-pj2-f25.google.com (mail-pj2-f25.google.com [74.125.227.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20528.1789856457672228531
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 15:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LKqEq98h;
 spf=pass (domain: gmail.com, ip: 74.125.227.153, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f25.google.com with SMTP id d9443c01a7336-2dd4b43b20bso12526645ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856457; x=1790461257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QI8m74i82bopEzvUGX9S293qvY9PAols1FfF6NJ7ic8=;
        b=LKqEq98hMPvVwNfRu1d2TpNPXfp2uAx4KgpjjyqKjAS6eqlz5ORLBefiqD+PQApYd1
         KGZGryqmtphclMuAKYUm21bFN0T9eNhum05ewsTuzQ1AztMpbU+3aVuO5X+jNONj2Ye4
         cdBLUgusDdONjRPS68FYUkyXTRxKcqRkMYlrzZVEL3RXys29rYRslvwiB1rAeY0VySxB
         2VY1weFIdzBEJQ2Q4GCX4uTawRgcl8agSk9wYE5VmxAGejiSbLXHXgPbebq8I7RNY00c
         HPN7BrhnIkAwi1yhqyxXHodvFG7IKALp+UIh7m0iSic2HAjabr20OjjnB5FLQich9Lbe
         PTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856457; x=1790461257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QI8m74i82bopEzvUGX9S293qvY9PAols1FfF6NJ7ic8=;
        b=m11q1qUVhOu1riirHfrRz193/DOl/YV7+YG92v2pJIbwbo+OISgb5A7Vi/sZlR8w20
         UgpHMKY/1urp5cuPSyk9LcJajY1GheLNH4nCOVmmH4p5FO0rA2JY2dUz35z2yhVKbX7Z
         Jn3ItR+F9ZrocZbUkbLwq/trCiyQEOKSWV9W0CBf+8oIaNBAahEtWK1hJ7nEQ/wUsHwB
         1r0UpfmGKmZl7LSW3cCnwiIXHMu+ebj67LiaOnd0mOXuexDPpbEcaHGh09QMc0wrtPUM
         1ZM1xcYxTye8XXONkK7pPS+vyNAsNnPkdwSrJKZaw/ou27MgvecKR4+aAUaAqaDeaCEV
         MMtQ==
X-Gm-Message-State: AFuF++lqFn1p+cMttvyIA5+eDEmbx8j77D8RHHri9oOmJz/oAJU4itT0
	xaKGeBEUkhglNpcoVZW2ClhQI1loTT5aXceXNWEJVg2qM+gHSLFp0tPX/ARlhQ==
X-Gm-Gg: AYBFou1TBcJfL1blBc6bVttJWgXZVgz/zUwC1unziAzHE686gnF6VG9810hRWfaKq9u
	p2Ci3wEHx2V2eUigexHVix5bJLVDNyedoM5DB08BCa8LnO147IcUhbYrT9UVW1DfY0yAse0+dO3
	skZQfYV41O/nPsxidlIHalCw3ulPrRqcrV9vgb5Ps5Ic92Yk+eMCu55dXH3x0hgS9gxAm8M3R+i
	Etzg5AJK5Dk6VIm36n+BFgta6pSWSlIyzLXJD/8Vpkf/YNYbl1Kd1ZDZWxBeBOXPoklVEdhUl6G
	KTQzThiTnLOLajlF93dKYL3kOXM44di8HucFChjJZ+LLFqtZ0j0Hf7/tRa1pEyTnc1QzdC1v7l9
	TD7Udwsfhx8CfaxdmzN4djq9iJTbeCIq3z97OT2jzEeQpzt6WTFkLEaOsN0w2tQKtv/MH+mhtCS
	KeLD9ALp2cGe5+/w4mv65HQR3ZdEqFnEr/3t9ujl7RqFcgtVft9XkfhPY5Xz1APsbV01CmEf/k0
	3DWECaKfDsUCNvdmkVu/hizMMbyVnDuWMPtnedXyfiZAa/vgZtFY8ScJ/K+cPi5DHvLcGXvT1Q5
	ImIqF+gG285kYTC+HCtq84nyLcrUtpaV9kAEFwAF7qVWTvDin3NwHmObUmn5HmuHv6jbcMpJkPF
	VVWR2XSthKB33eqZKnupswbQfkN76/xMGkEOXG5F0mWFGFz2A3ZhhRThiv7vL8AlHVh8=
X-Received: by 2002:a17:903:2312:b0:2dd:b83b:fe1e with SMTP id d9443c01a7336-2ddb83c007cmr92756155ad.22.1789856457042;
        Sat, 19 Sep 2026 15:20:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm10494651eec.30.2026.09.19.15.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:20:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 6/7] libdata-hexdump-perl: add perl-module-parent to RDEPENDS
Date: Sat, 19 Sep 2026 15:20:43 -0700
Message-ID: <20260919222044.2143524-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
References: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 22:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130123

Data::HexDump uses parent.pm, which was not installed, so the module
failed to load and both ptests failed:

  Can't locate parent.pm in @INC

meta-perl-image-ptest-libdata-hexdump-perl on qemux86-64 now passes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb
index 82f2396f3b..b817d2cc33 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb
@@ -14,6 +14,7 @@ LICENSE = "Artistic-1.0"
 LIC_FILES_CHKSUM = "file://lib/Data/HexDump.pm;beginline=277;endline=279;md5=bf1cd9373f8d1f85fe091ee069a480e9"
 
 DEPENDS = "perl"
+RDEPENDS:${PN} += "perl-module-parent"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEILB/Data-HexDump-${PV}.tar.gz \
            file://run-ptest \

