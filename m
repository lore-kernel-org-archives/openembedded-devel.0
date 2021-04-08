Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.227.1617899796107625785
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T5XzRuaF;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso2952550otp.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OAaJZOOfGGXggFEcV01PbL79ttVeyRUM6gA4BFdp1Ew=;
        b=T5XzRuaFW+GVlwVZ2+U50FypoCc1PTFjPfKuGetEZxZrE/pUrEkBgx9dzU9u4mJgrm
         g/VJ1e6bTjkJmb+EtNHDy85QPBnMDBSXM9dSlCYg2TLyb+xf94/VnWYiCDOpbpRwTygh
         UaHe6WvCXP9SGVY3BimUiGCrUWao+ORxt2UyG7dnSf6MwBzh9C9M727Hhr0ZKYOgFBDh
         hvcuaxQAg/rtws3BMGXjqTJuLA/wJQC+O0bhldE+HZr0pkSqgxoe67gzJbk7EWYeRirv
         IHyAZVopn3xn/Pv4T+bNqQDQn+8ueuzTL99iTSx3+dk5QaFxGCyvKZT7bdPS9sQn2PSq
         ImBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OAaJZOOfGGXggFEcV01PbL79ttVeyRUM6gA4BFdp1Ew=;
        b=hgcCQ+LL8h+hsOxpWDYf7F5m+SPPIfvs/ckoXdUfxkwLAd6etRqZ5E6FwGAC7biilx
         bBSAaQDwsWZVHZ+FaYLSAl362Ylhm9SChA6/VxWJELkGAyYPsRhMTwe+lqkqbQm07uFZ
         g0L/5EintXnbYM87gu6vt1y9TqwhmEx2eDcTrNtBVnH30zJBnlHhLvHhTKI6a1kR4GXr
         Y5jLnKPa/+ppsFU6XWCXJnzrdfFHJUZDTsJ2nUPn1maK4FJRpddqeB4WJpihWottlcXm
         6LUaabpyrXRMSqyrZlQK3kEa3Zr3SBFnh6SLBt1HEeW5I5jwihaIs3DuwFN153Uv4m5O
         OQLA==
X-Gm-Message-State: AOAM53248krz7WNZxMzr9izS/TVRJEbmIA4lEyA0Nj7Y+6QzP2qK89Vk
	VamPe7L4+JfFycULkrP1b2aQsRRNoEM=
X-Google-Smtp-Source: ABdhPJxux34fx9S1DdfZDdnUgaHXZ+yDZ8xSfQup/H9xOw37sT2uRksCNGykg1gQ3jI8k+l5sQHpaA==
X-Received: by 2002:a05:6830:114b:: with SMTP id x11mr8210273otq.249.1617899795220;
        Thu, 08 Apr 2021 09:36:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:34 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 24/64] libnet-ssleay-perl: add rdep on perl-module-autoloader
Date: Thu,  8 Apr 2021 09:35:31 -0700
Message-Id: <c9674d330e3416d2a10dd6ff85a67ac5f94fa9d8.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Awais Belal <Awais_Belal@mentor.com>

Without the autoloader module, doing a Net::SSLeay fails.
The Net::SSLeay package also does an

use AutoLoader;
Ref: https://github.com/rurban/Net-SSLeay/blob/master/lib/Net/SSLeay.pm#L26

so this is evident.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 56058fe5b9cb77033f095e8f78838eb466a506ad)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index 50ab5af3add..93a0687b2a3 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -19,6 +19,7 @@ RDEPENDS_${PN} += "\
     perl-module-extutils-makemaker \
     perl-module-mime-base64 \
     perl-module-socket \
+    perl-module-autoloader \
     zlib \
 "
 
-- 
2.17.1

